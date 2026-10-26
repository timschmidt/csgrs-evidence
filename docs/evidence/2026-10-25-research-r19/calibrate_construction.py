from pathlib import Path
import hashlib,json,math,statistics,time
raw=Path(__file__).resolve().parent
record=Path(json.loads((raw/'latest-construction-baseline-check.json').read_text())['record'])
meta=json.loads((record/'metadata.json').read_text());assert meta['complete'] and meta['purpose']=='baseline-check'
batches={};medians={}
for kind in range(8):
    rows=[json.loads(line) for line in (record/'pair-00'/f'baseline-{kind}.jsonl').read_text().splitlines()]
    ns=statistics.median(r['ns']/r['iterations'] for r in rows if r['phase']=='warm');assert ns>0
    medians[str(kind)]=ns;batches[str(kind)]=min(4096,max(8,2**math.ceil(math.log2(2_000_000/ns))))
result={'created_ns':time.time_ns(),'record':str(record),'baseline_metadata_sha256':hashlib.sha256((record/'metadata.json').read_bytes()).hexdigest(),'baseline_medians_ns':medians,'batches':batches,'rule':'Baseline-only 2 ms target, power of two, min 8/max 4096; frozen before pilot.'}
assert not (raw/'construction-batches.json').exists()
(raw/'construction-batches.json').write_text(json.dumps(result,indent=2)+'\n')
assert not (raw/'construction-final-design.json').exists()
(raw/'construction-final-design.json').write_text(json.dumps({'created_ns':time.time_ns(),'pairs':30,'protected_metrics':24,'family_metrics':118,'batches':batches,'predeclared_before_pilot':True},indent=2)+'\n')
print('R19 CONSTRUCTION CALIBRATION FROZEN',flush=True)
