"""Summarize actual merged-source checks without upgrading failed workflows."""
import hashlib
import json
from collections import Counter
from pathlib import Path
import re
import shutil
import subprocess
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes

read = lambda name: json.loads((OUT/name).read_text())
source = hashes()
qualification = read('qualification-driver.json')
supplement = read('supplement-driver.json')
assert qualification['source'] == supplement['source'] == source
assert not qualification['failures'] and supplement['complete']
attempts = read('attempts.json')
latest = {row['label']:row for row in attempts}
counts = {}
for label in ['native-release','native-minimal','curve-release','stroke-debug']:
    row=latest[label]
    assert row['exit_code']==0
    log=(OUT/row['log']).read_text()
    sections=[tuple(map(int,group)) for group in re.findall(
        r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored; (\d+) measured; (\d+) filtered out',log)]
    assert sections and all(group[1]==0 for group in sections)
    counts[label]=dict(passed=sum(group[0] for group in sections),
        ignored=sum(group[2] for group in sections),sections=len(sections),log=row['log'])
assert counts['native-release']['passed']==552
assert counts['native-minimal']['passed']==544
assert counts['stroke-debug']['passed']==10
baseline=read('baseline-consumer-outcomes.json')
candidate=read('candidate-consumer-outcomes.json')
assert [(r['case'],r['outcome']) for r in baseline['rows']]==[(r['case'],r['outcome']) for r in candidate['rows']]
assert [r['outcome'] for r in candidate['rows']]==['certified','certified','unsupported_measurement','unsupported_measurement']
assert all(row['unchanged'] for row in read('consumer-artifact-comparison.json'))
frontier=read('continuation-frontier.json')
assert len(frontier['rows'])==81 and not frontier['changes']
assert all(row['outcome']=='native_result' for row in frontier['rows'])
assert len(read('preserved-artifacts.json'))==61 and all(r['unchanged'] for r in read('preserved-artifacts.json'))
assert len(read('preserved-cone-artifacts.json'))==10
prisms=[]
for row in attempts:
    if not row['label'].startswith('final-prism-'):continue
    data=(OUT/row['log']).read_text()
    error=re.search(r'^error=(.*)$',data,re.M)
    item=dict(fixture=re.search(r'^fixture=(.*)$',data,re.M).group(1),log=row['log'],
        outcome='unsupported' if error else 'native_result')
    if error:
        item['error']=error.group(1)
    else:
        assert 'replay=Ok(' in data
        item['bodies']=int(re.search(r'^bodies=(\d+)$',data,re.M).group(1))
        size=re.search(r'^step_bytes=(\d+)$',data,re.M)
        if size:
            item.update(step='exported',step_bytes=int(size.group(1)))
        elif item['bodies']==0:
            item['step']='canonical_empty'
        else:
            rejected=re.search(r'^step_error=(.*)$',data,re.M)
            assert rejected,row
            item.update(step='unsupported',step_error=rejected.group(1))
    prisms.append(item)
assert len(prisms)==24
prism_counts=dict(Counter(row['outcome'] for row in prisms))
assert prism_counts==dict(native_result=18,unsupported=6)
old_prisms=json.loads((OUT.parent/'2026-10-17-cone-exchange/prism-frontier.json').read_text())
assert sorted(prisms,key=lambda row:row['fixture'])==sorted(old_prisms['rows'],key=lambda row:row['fixture'])
(OUT/'prism-frontier.json').write_text(json.dumps(dict(rows=prisms,counts=prism_counts,
    scope='All 24 original native and exchange outcomes retained. Six unsupported native controls and one nonrational STEP export remain separate from completed exchange.'),indent=2)+'\n')
wasm_row=latest['wasm-runtime']
wasm_log=(OUT/wasm_row['log']).read_text()
assert wasm_row['exit_code']==0
wasm_project=Path('/tmp/hyperbrep-cone-exchange-wasm-probe')
# The retained runner checks every group and requires a self-contained module.
# Inspect its actual receipt, and keep the stdout and binary too.
wasm_receipt=json.loads(wasm_log[wasm_log.index('{'):])
assert wasm_receipt['probe_groups']==111 and wasm_receipt['imports']==0
module=Path('/tmp/hyperbrep-review-target/wasm32-unknown-unknown/release/hyperbrep_cone_exchange_wasm_probe.wasm')
if not module.exists():
    modules=list(module.parent.glob('*.wasm'))
    raise AssertionError([str(p) for p in modules])
frozen=Path('/tmp/hyperbrep-stroke-integration-final.wasm')
assert not frozen.exists()
shutil.copy2(module,frozen)
wasm=dict(path=str(frozen),bytes=frozen.stat().st_size,sha256=hashlib.sha256(frozen.read_bytes()).hexdigest(),log=wasm_row['log'])
assert wasm['sha256']==wasm_receipt['wasm_sha256']
(OUT/'candidate-wasm-binary.json').write_text(json.dumps(wasm,indent=2)+'\n')
inherited=[latest[name] for name in ['inherited-scalar-default','inherited-scalar-all-features']]
assert all(r['exit_code']==101 for r in inherited)
tooling_failures=supplement['tooling_failures_preserved']
assert [r['exit_code'] for r in tooling_failures]==[127,1]
ordinary_failures=[r for r in attempts if r['exit_code'] and r not in inherited and r not in tooling_failures]
assert all('consumer' in r['label'] or 'stroke-Round' in r['label'] or ('resources-' in r['label'] and 'Round' in r['label']) for r in ordinary_failures)
summary=dict(source=source,tests=counts,qualification=qualification['executed'],
    consumer=dict(rows=[{k:r[k] for k in ['case','exit_code','outcome']} for r in candidate['rows']],
        original_driver_completed=False,complete_workflows=2,preserved_unsupported_workflows=2,
        unchanged_artifacts=4,scope='Original four-case path contract remains incomplete; per-case execution retains failures instead of stopping at the first round input.'),
    preserved_native_diagnostics=81,preserved_prism_diagnostics=24,prism_counts=prism_counts,
    preserved_step_artifacts=71,wasm=dict(groups=111,imports=0,binary=wasm),
    inherited_failures=inherited,consumer_failed_attempts=ordinary_failures,tooling_failures=tooling_failures,
    independent_reader_logs=[latest[name]['log'] for name in ['cone-occt','torus-occt','occt-reader','prism-occt']],
    resources='resource-observations.json',
    scope='Merged-source BREP integration qualification only. All inherited and newly exposed blockers remain visible. No new production BREP algorithm is introduced. Complete package/pre-push/work-package admission remains open.')
(OUT/'qualification-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
(OUT/'final-source.json').write_text(json.dumps(source,indent=2)+'\n')
print(json.dumps(dict(tests=counts,wasm_groups=111,diagnostics=81,step_artifacts=71,consumer=summary['consumer']),indent=2),flush=True)
