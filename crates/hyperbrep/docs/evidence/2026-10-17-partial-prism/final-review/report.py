"""Summarize qualified source, original full-size outcomes and complete consumers."""
from collections import Counter
import hashlib
import json
from pathlib import Path
import re
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ROOT,hashes
read=lambda name:json.loads((OUT/name).read_text())
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
source=hashes()
old=OUT.parent/'2026-10-17-region-extrusion'
q=read('qualification-driver.json')
assert q['source']==source and not q['failures']
assert read('finish-checks.json')['passed']
attempts=read('attempts.json');latest={row['label']:row for row in attempts}
assert all(row['source_unchanged'] for row in attempts)
counts={}
for label,expected in [('native-release',573),('native-minimal',565),('axial-debug',8),('axial-geometry-debug',3),('axial-cover-debug',2)]:
    row=latest[label];assert row['exit_code']==0
    sections=[tuple(map(int,group)) for group in re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored; (\d+) measured; (\d+) filtered out',(OUT/row['log']).read_text())]
    assert sections and all(group[1]==0 for group in sections)
    counts[label]=dict(passed=sum(x[0] for x in sections),ignored=sum(x[2] for x in sections),sections=len(sections),log=row['log'])
    assert counts[label]['passed']==expected,(label,counts[label])
wasm=json.loads((OUT/latest['wasm-runtime']['log']).read_text())
assert wasm['probe_groups']==127 and wasm['imports']==0
assert sha(Path(read('wasm-binary.json')['path']))==wasm['wasm_sha256']
assert read('consumer-final.json')['source']==source and len(read('consumer-final.json')['rows'])==4
assert all(row['exit_code']==0 for row in read('consumer-final.json')['rows'])
assert read('components-admission.json')['source']==source
assert read('old-path-control.json')['preserved']
assert read('continuation-frontier.json')['counts']==dict(native_result=81)
assert not read('continuation-frontier.json')['changes']
assert len(read('preserved-artifacts.json'))==61
preserved=[]
for folder in ['cone-exports','region-exports','component-exports']:
    for prior in sorted((old/folder).glob('*')):
        current=OUT/folder/prior.name
        assert prior.read_bytes()==current.read_bytes(),str(current)
        preserved.append(dict(path=str(current.relative_to(OUT)),baseline=str(prior.relative_to(ROOT)),sha256=sha(current),bytes=current.stat().st_size))
assert len(preserved)==22
(OUT/'preserved-additional-artifacts.json').write_text(json.dumps(preserved,indent=2)+'\n')
def prism(row):
    data=(OUT/row['log']).read_text()
    error=re.search(r'^error=(.*)$',data,re.M)
    item=dict(fixture=re.search(r'^fixture=(.*)$',data,re.M).group(1),log=row['log'],outcome='unsupported' if error else 'native_result')
    if error:item['error']=error.group(1)
    else:
        assert 'replay=Ok(' in data
        item['bodies']=int(re.search(r'^bodies=(\d+)$',data,re.M).group(1))
        size=re.search(r'^step_bytes=(\d+)$',data,re.M)
        if size:item.update(step='exported',step_bytes=int(size.group(1)))
        elif item['bodies']==0:item['step']='canonical_empty'
        else:
            rejected=re.search(r'^step_error=(.*)$',data,re.M);assert rejected
            item.update(step='unsupported',step_error=rejected.group(1))
    return item
before={r['fixture']:r for r in json.loads((old/'prism-frontier.json').read_text())['rows']}
prisms=[prism(r) for label,r in latest.items() if label.startswith('final-prism-')]
assert len(prisms)==24 and set(before)=={r['fixture'] for r in prisms}
changes=[]
for row in prisms:
    prior=before[row['fixture']]
    if prior['outcome']=='native_result':assert {k:v for k,v in prior.items() if k!='log'}=={k:v for k,v in row.items() if k!='log'}
    if prior['outcome']!=row['outcome']:changes.append(dict(fixture=row['fixture'],before=prior['outcome'],after=row['outcome']))
assert len(changes)==2
assert Counter(r['outcome'] for r in prisms)==dict(native_result=20,unsupported=4)
(OUT/'prism-frontier.json').write_text(json.dumps(dict(rows=prisms,counts=dict(Counter(r['outcome'] for r in prisms)),changes=changes,scope='All 24 original full-size cases retained. Touching/disjoint differences complete with separate independent tests. Three partial-depth differences and covering reversed difference remain unsupported; one preceding native result still has an unencodable STEP vertex.'),indent=2)+'\n')
outputs=[dict(path=str(p.relative_to(OUT)),sha256=sha(p),bytes=p.stat().st_size) for p in sorted((OUT/'final-artifacts').glob('*'))]
assert len(outputs)==8
(OUT/'new-artifacts.json').write_text(json.dumps(outputs,indent=2)+'\n')
cost=read('cost-summary.json');assert cost['source']==source
assert cost['preserved_cases']==180 and cost['new_cases']==4 and cost['receipt_admitted']
summary=dict(source=source,tests=counts,qualification=q['executed'],new_complete_workflows=4,
    preserved_native_diagnostics=81,prism_counts=dict(native_result=20,unsupported=4),original_prism_cases=24,
    preserved_step_artifacts=71,preserved_region_native_step_artifacts=12,new_native_step_artifacts=8,
    wasm=dict(groups=127,imports=0,binary=read('wasm-binary.json')),
    failures=[r for r in attempts if r['exit_code']],
    inherited_upstream_failures=json.loads((old/'qualification-summary.json').read_text())['inherited_upstream_failures'],
    independent_reader_logs=[latest[n]['log'] for n in ['axial-occt','components-occt','occt-cones','torus-occt','occt-read','prism-occt']],
    costs='cost-summary.json',scope='Native axial whole-image correspondence, coplanar convex cover admission and complete prism-cap profile extraction. Four touching/disjoint transformed STEP/native workflows complete. Genuine partial-depth shells, source-qualification delivery, total-work/heap/cancellation, package/MSRV/bindings, full pre-push and all work-package completion gates remain open.')
(OUT/'qualification-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
(OUT/'final-source.json').write_text(json.dumps(source,indent=2)+'\n')
print(json.dumps(dict(tests=counts,wasm_groups=127,complete_workflows=4,prism_counts=summary['prism_counts'],failures=len(summary['failures'])),indent=2),flush=True)
