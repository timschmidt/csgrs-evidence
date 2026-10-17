"""Summarize source-qualified outcomes, preserved inputs and representation changes."""
from collections import Counter
import hashlib,json,re,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ROOT,hashes
read=lambda n:json.loads((OUT/n).read_text())
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
source=hashes();OLD=OUT.parent/'2026-10-17-partial-prism'
q=read('qualification-driver.json');assert q['source']==source and not q['failures']
assert read('finish-checks.json')['passed'] and read('finish-checks.json')['source']==source
attempts=read('attempts.json');latest={r['label']:r for r in attempts}
assert all(r['source_unchanged'] for r in attempts)
counts={}
for label,expected in [('native-release',600),('native-minimal',592),('axial-debug',26),('axial-proof-debug',5),('axial-chart-debug',2)]:
 row=latest[label];text=(OUT/row['log']).read_text()
 groups=[tuple(map(int,g)) for g in re.findall(r'test result: (?:ok|FAILED)\. (\d+) passed; (\d+) failed; (\d+) ignored; (\d+) measured; (\d+) filtered out',text)]
 counts[label]=dict(passed=sum(g[0] for g in groups),failed=sum(g[1] for g in groups),ignored=sum(g[2] for g in groups),exit_code=row['exit_code'],log=row['log'])
 if label in q['upstream_debug_blocked']:
  assert row['exit_code'] and 'FACTORS > 0' in text
 else:
  assert row['exit_code']==0 and counts[label]['passed']==expected and counts[label]['failed']==0,(label,counts[label])
wasm=json.loads((OUT/latest['wasm-runtime']['log']).read_text());assert wasm['probe_groups']==138 and wasm['imports']==0
assert sha(Path(read('wasm-binary.json')['path']))==wasm['wasm_sha256']
for name,total in [('consumer-admission.json',8),('previous-axial-admission.json',4),('components-admission.json',2)]:
 item=read(name);assert item['source']==source and item['complete_workflows']==total
assert read('old-path-control.json')['preserved']
frontier=read('continuation-frontier.json');assert frontier['counts']==dict(native_result=81) and not frontier['changes']
# Every preceding output is accounted for, including the previous increment's
# added region/component and touching/disjoint native/STEP artifacts.
artifacts=[]
old_manifest=json.loads((OLD/'manifest.json').read_text())
for folder in ['exports','faceted-exports','advanced-exports','scaled-exports','torus-exports','cone-exports','final-prism-artifacts','region-exports','component-exports','final-artifacts','old-path-artifacts','growth-artifacts','frontier-extension-artifacts','reconstruction-candidate-artifacts','cone-candidate-artifacts']:
 prior=sorted(p for p in (OLD/folder).rglob('*') if p.is_file());assert prior,folder
 candidate_folder='previous-axial-exports' if folder=='final-artifacts' else folder
 for a in prior:
  assert sha(a)==old_manifest['evidence_files'][str(a.relative_to(OLD))]
  b=OUT/candidate_folder/a.relative_to(OLD/folder);assert b.is_file(),b
  artifacts.append(dict(path=str(b.relative_to(OUT)),baseline=str(a.relative_to(ROOT)),baseline_sha256=sha(a),candidate_sha256=sha(b),baseline_bytes=a.stat().st_size,candidate_bytes=b.stat().st_size,unchanged=a.read_bytes()==b.read_bytes()))
(OUT/'artifact-comparison.json').write_text(json.dumps(dict(rows=artifacts,counts=dict(Counter('unchanged' if r['unchanged'] else 'migrated' for r in artifacts)),scope='All preceding final consumer artifacts retained; semantic assertions and independent readers are separate. Carrier changes are an intentional greenfield representation migration.'),indent=2)+'\n')
def prism(row):
 text=(OUT/row['log']).read_text();error=re.search(r'^error=(.*)$',text,re.M)
 item=dict(fixture=re.search(r'^fixture=(.*)$',text,re.M).group(1),log=row['log'],outcome='unsupported' if error else 'native_result')
 if error:item['error']=error.group(1)
 else:
  assert 'replay=Ok(' in text
  item['bodies']=int(re.search(r'^bodies=(\d+)$',text,re.M).group(1))
  size=re.search(r'^step_bytes=(\d+)$',text,re.M)
  if size:item.update(step='exported',step_bytes=int(size.group(1)))
  elif item['bodies']==0:item['step']='canonical_empty'
  else:
   rejected=re.search(r'^step_error=(.*)$',text,re.M);assert rejected
   item.update(step='unsupported',step_error=rejected.group(1))
 return item
before={r['fixture']:r for r in json.loads((OLD/'prism-frontier.json').read_text())['rows']}
prisms=[prism(r) for label,r in latest.items() if label.startswith('final-prism-')]
assert len(prisms)==24 and set(before)=={r['fixture'] for r in prisms}
changes=[];migrations=[]
for row in prisms:
 prior=before[row['fixture']]
 if prior['outcome']=='native_result':
  assert (row['outcome'],row['bodies'],row['step'])==(prior['outcome'],prior['bodies'],prior['step']),(prior,row)
  if {k:v for k,v in row.items() if k!='log'}!={k:v for k,v in prior.items() if k!='log'}:migrations.append(dict(before=prior,after=row))
 if prior['outcome']!=row['outcome']:changes.append(dict(fixture=row['fixture'],before=prior['outcome'],after=row['outcome']))
assert len(changes)==4 and Counter(r['outcome'] for r in prisms)==dict(native_result=24)
(OUT/'prism-frontier.json').write_text(json.dumps(dict(rows=prisms,counts=dict(Counter(r['outcome'] for r in prisms)),changes=changes,representation_changes=migrations,scope='All 24 original full-size inputs retained. All now return native results; the four partial-shell cases have separate exact continuation acceptance. One preceding diagonal result still has an unencodable STEP vertex.'),indent=2)+'\n')
outputs=[dict(path=str(p.relative_to(OUT)),sha256=sha(p),bytes=p.stat().st_size) for p in sorted((OUT/'final-artifacts').glob('*'))];assert len(outputs)==16
(OUT/'new-artifacts.json').write_text(json.dumps(outputs,indent=2)+'\n')
if '--frontier-only' in sys.argv:
 print(json.dumps(dict(prism_counts=dict(Counter(r['outcome'] for r in prisms)),artifacts=len(artifacts),artifact_counts=dict(Counter('unchanged' if r['unchanged'] else 'migrated' for r in artifacts))),indent=2))
 raise SystemExit(0)
cost=read('cost-summary.json');assert cost['source']==source and (cost['preserved_cases'],cost['new_cases'],cost['commands'])==(184,8,129)
summary=dict(source=source,tests=counts,qualification=q['executed'],upstream_debug_blocked=q['upstream_debug_blocked'],new_complete_workflows=8,additional_native_workflow_groups=3,preserved_native_diagnostics=81,prism_counts=dict(native_result=24),original_prism_cases=24,preceding_artifact_counts=dict(Counter('unchanged' if r['unchanged'] else 'migrated' for r in artifacts)),new_native_step_artifacts=16,wasm=dict(groups=138,imports=0,binary=read('wasm-binary.json')),failures=[r for r in attempts if r['exit_code']],inherited_upstream_failures=json.loads((OLD/'qualification-summary.json').read_text())['inherited_upstream_failures'],independent_reader_invalid_shapes=[r['file'] for r in read('prism-occt.json')['fixtures'] if not r['valid']],independent_reader_diagnostics='occt-thin-comparison.json',independent_reader_logs=[latest[n]['log'] for n in ['axial-shell-occt','previous-axial-occt','components-occt','occt-cones','torus-occt','occt-read','prism-occt']],costs='cost-summary.json',scope='Exact axial plane/cylinder shell admission and continued native/STEP consumption. Intentional native/STEP carrier migration. General geometry, source qualification, internal total-work/heap/cancellation bounds, package/MSRV/bindings, full pre-push and all work-package completion gates remain open.')
(OUT/'qualification-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
(OUT/'final-source.json').write_text(json.dumps(source,indent=2)+'\n')
print(json.dumps({k:v for k,v in summary.items() if k in ['tests','upstream_debug_blocked','new_complete_workflows','prism_counts','preceding_artifact_counts']},indent=2),flush=True)
