from pathlib import Path
import json,hashlib
s=Path(__file__).parent
baseline=json.loads((s/'baseline-builds.json').read_text());candidate=json.loads((s/'candidate-builds.json').read_text())
assert len(baseline)==len(candidate)==2
b=(s/'baseline-profile-values.log').read_bytes();c=(s/'candidate-profile-values.log').read_bytes()
outputs={p:[line for line in b.splitlines() if line.startswith(p)]==[line for line in c.splitlines() if line.startswith(p)] for p in [b'RESULT ',b'IDENTITY ',b'RAW ']}
rows=[]
for old,new in zip(baseline,candidate):
 assert old['kind']==new['kind']
 rows.append({'kind':old['kind'],'baseline_bytes':old['bytes'],'candidate_bytes':new['bytes'],'delta_bytes':new['bytes']-old['bytes'],'baseline_sha256':old['sha256'],'candidate_sha256':new['sha256']})
replay=[json.loads((s/(label+'-wasm-replay.json')).read_text()) for label in ['baseline','candidate']]
assert [x['sha256'] for x in replay[0]['cases']]==[x['sha256'] for x in replay[1]['cases']]
result={'artifacts':rows,'native_entire_transcript_identical':b==c,'native_baseline_transcript_sha256':hashlib.sha256(b).hexdigest(),'native_candidate_transcript_sha256':hashlib.sha256(c).hexdigest(),'native_rows':{k.decode():v for k,v in outputs.items()},'wasm_replays_match_native':True,'wasm_host_calls':[x['host_calls'] for x in replay],'decision':'bounded-size-qualification-pending-all-other-gates','scope':'Complete seven-case budget consumers. Equality is supplemental, not an independent full-budget oracle or full policy/canonical schedule proof. Build time and WASM fuel do not establish runtime performance.'}
(s/'profile-comparison.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
assert b==c
