"""Summarize the qualified feature, retained outcomes and complete artifacts."""
from collections import Counter
import hashlib
import json
from pathlib import Path
import re
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes

read=lambda name:json.loads((OUT/name).read_text())
sha=lambda path:hashlib.sha256(path.read_bytes()).hexdigest()
source=hashes()
OLD=OUT.parent/'2026-10-17-stroke-upstream-integration'
qualification=read('qualification-driver.json')
assert qualification['source']==source and not qualification['failures']
assert read('finish-checks.json')['passed']
attempts=read('attempts.json')
assert all(row['source_unchanged'] for row in attempts)
latest={row['label']:row for row in attempts}
counts={}
for label,expected in [('native-release',560),('native-minimal',552),('region-debug',8)]:
    row=latest[label]
    assert row['exit_code']==0
    sections=[tuple(map(int,group)) for group in re.findall(
        r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored; (\d+) measured; (\d+) filtered out',
        (OUT/row['log']).read_text())]
    assert sections and all(group[1]==0 for group in sections)
    counts[label]=dict(passed=sum(group[0] for group in sections),ignored=sum(group[2] for group in sections),sections=len(sections),log=row['log'])
    assert counts[label]['passed']==expected,(label,counts[label])
wasm=json.loads((OUT/latest['wasm-runtime']['log']).read_text())
assert wasm['probe_groups']==119 and wasm['imports']==0
assert sha(Path(read('wasm-binary.json')['path']))==wasm['wasm_sha256']
assert read('consumer-final.json')['source']==source
assert len(read('consumer-final.json')['rows'])==4
assert all(row['exit_code']==0 for row in read('consumer-final.json')['rows'])
assert read('components-admission.json')['source']==source
assert read('components-admission.json')['complete_workflows']==2
assert read('old-path-control.json')['source']==source and read('old-path-control.json')['preserved']
assert [row['outcome'] for row in read('old-path-control.json')['rows']]==['certified','certified','unsupported_measurement','unsupported_measurement']
assert read('continuation-admission.json')['source']==source
assert read('continuation-frontier.json')['counts']==dict(native_result=81)
assert read('continuation-frontier.json')['changes']==[]
assert len(read('preserved-artifacts.json'))==61
cones=[]
for old in sorted((OLD/'cone-exports').glob('*.step')):
    current=OUT/'cone-exports'/old.name
    assert old.read_bytes()==current.read_bytes()
    cones.append(dict(path=str(current.relative_to(OUT)),baseline=str(old.relative_to(ROOT)),sha256=sha(current),bytes=current.stat().st_size))
assert len(cones)==10
(OUT/'preserved-cone-artifacts.json').write_text(json.dumps(cones,indent=2)+'\n')
prisms=[]
for row in attempts:
    if not row['label'].startswith('final-prism-'):continue
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
            rejected=re.search(r'^step_error=(.*)$',data,re.M)
            assert rejected,row
            item.update(step='unsupported',step_error=rejected.group(1))
    prisms.append(item)
old_prisms=json.loads((OLD/'prism-frontier.json').read_text())
assert len(prisms)==24
assert sorted(prisms,key=lambda row:row['fixture'])==sorted(old_prisms['rows'],key=lambda row:row['fixture'])
(OUT/'prism-frontier.json').write_text(json.dumps(dict(rows=prisms,counts=dict(Counter(row['outcome'] for row in prisms)),
    scope='All 24 original outcomes retained, including six unsupported native cases and one unencodable STEP result.'),indent=2)+'\n')
outputs=[]
for path in sorted((OUT/'region-exports').glob('*')):
    assert path.read_bytes()==(OUT/'final-artifacts'/path.name).read_bytes()==(OUT/'v1-artifacts'/path.name).read_bytes()
    outputs.append(dict(path=str(path.relative_to(OUT)),sha256=sha(path),bytes=path.stat().st_size,
        agrees_with=['final-artifacts/'+path.name,'v1-artifacts/'+path.name]))
assert len(outputs)==8
for path in sorted((OUT/'component-exports').glob('*')):
    outputs.append(dict(path=str(path.relative_to(OUT)),sha256=sha(path),bytes=path.stat().st_size))
assert len(outputs)==12
(OUT/'new-artifacts.json').write_text(json.dumps(outputs,indent=2)+'\n')
failures=[row for row in attempts if row['exit_code']]
for row in failures:
    log=(OUT/row['log']).read_text()
    if row['label']=='missing-public-api':assert row['exit_code']==101 and 'E0425' in log
    elif row['label']=='region-native-v1':assert row['exit_code']==101 and 'could not compile' in log
    elif row['label']=='occt-cones' and row['attempt']==1:assert row['exit_code']==1 and 'IndexError: list index out of range' in log
    else:
        assert row['label'].startswith(('old-path-Round','cost-old-path-')) and 'Round' in row['label']
        assert row['exit_code']==101 and 'Geometry(UnsupportedMeasurement)' in log
assert read('resource-observations.json')['source']==source
for label in ['components-clippy','components-occt','region-occt','occt-cones','torus-occt','occt-read','prism-occt']:
    assert latest[label]['exit_code']==0
inherited=json.loads((OLD/'qualification-summary.json').read_text())['inherited_failures']
summary=dict(source=source,tests=counts,qualification=qualification['executed'],
    additional_checks=[latest[name] for name in ['components-clippy','components-occt']],
    new_complete_workflows=dict(stroke=4,multiple_components=2),
    old_path=dict(complete_workflows=2,unsupported_measurements=2,unchanged_artifacts=4,original_four_case_contract_complete=False),
    preserved_native_diagnostics=81,preserved_prism_diagnostics=24,preserved_step_artifacts=71,
    new_artifacts=12,wasm=dict(groups=119,imports=0,binary=read('wasm-binary.json')),
    failures=failures,inherited_upstream_failures=dict(record=str((OLD/'qualification-summary.json').relative_to(ROOT)),
        cases=inherited,scope='Reproduced on baseline e2b integration source; scalar and all dependency source bytes remain unchanged by this feature. Not rerun or repaired here.'),
    independent_reader_logs=[latest[name]['log'] for name in ['components-occt','region-occt','occt-cones','torus-occt','occt-read','prism-occt']],
    resources='resource-observations.json',
    scope='Public strict normalized-region extrusion and six completed exact STEP/modeling workflows. General rational path area, broader Boolean/geometry domains, source-qualification delivery, total-work/heap/cancellation, package/MSRV/bindings, full pre-push and work-package gates remain open.')
(OUT/'qualification-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
(OUT/'final-source.json').write_text(json.dumps(source,indent=2)+'\n')
print(json.dumps(dict(tests=counts,complete_workflows=6,wasm_groups=119,preserved_step_artifacts=71,retained_failed_attempts=len(failures)),indent=2),flush=True)
