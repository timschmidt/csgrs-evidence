"""Verify the recorded snapshot, semantic probes and benchmark receipts without rebuilding."""
import hashlib,importlib.util,json,re,statistics,sys
from pathlib import Path
root=Path('/mnt/development/csgrs');out=Path(__file__).resolve().parent
manifest=json.loads((out/'manifest.json').read_text())
for key,base in [('sources',root),('artifacts',out)]:
    for entry in manifest[key]:
        p=base/entry['path'];assert p.stat().st_size==entry['bytes'],p
        assert hashlib.sha256(p.read_bytes()).hexdigest()==entry['sha256'],p
commands=json.loads((out/'commands.json').read_text())
assert len(commands)==8 and all(x['exit_code']==0 for x in commands)
for label,total in [('native-debug',348),('io-release',31)]:
    log=(out/(label+'.log')).read_text();assert sum(map(int,re.findall(r'test result: ok\. (\d+) passed',log)))==total
wasm=json.loads((out/'wasm-runtime.json').read_text());assert wasm['probe_groups']==9 and wasm['imports']==0
oracle=json.loads((out/'occt-read.json').read_text());assert len(oracle['fixtures'])==4
for row in oracle['fixtures']:
    assert row['valid'] and row['roots']==row['transferred']==1
    assert hashlib.sha256((root/row['fixture']).read_bytes()).hexdigest()==row['sha256']
    assert abs(row['volume_default_mm3']-row['expected_mm3'])<1e-10
controls=json.loads((out/'controls/results.json').read_text());assert len(controls)==5
assert all(x['rejected_at_runtime'] and x['source_restored'] and x['exit_code']!=0 for x in controls)
assert json.loads((out/'text-regression-before-fix.json').read_text())['failed_at_runtime']
spec=importlib.util.spec_from_file_location('receipt',root/'crates/hyperbrep/tools/benchmark_receipt.py');m=importlib.util.module_from_spec(spec);sys.modules[spec.name]=m;spec.loader.exec_module(m)
expected=m.expected_cases((root/'crates/hyperbrep-io/benches/faceted.rs').read_text());assert len(expected)==7
rows=[];facts=None
for trial in range(1,4):
    log=(out/f'faceted-{trial}.log').read_text();parsed=m.read_receipt(log,expected);rows.append(parsed);m.compare(rows[0],parsed)
    current=[line for line in log.splitlines() if line.startswith('fixture ')]
    if facts is None:facts=current
    assert current==facts
costs=json.loads((out/'faceted-costs.json').read_text());assert len(costs)==7
for i,cost in enumerate(costs):
    assert cost['case']==expected[i] and cost['median_ns']==statistics.median(x[i].per_iteration_ns for x in rows)
syntax=m.expected_cases((root/'crates/hyperbrep-io/benches/part21.rs').read_text());sides={}
for kind in ['baseline','candidate']:
    sides[kind]=[m.read_receipt((out/f'syntax-{kind}-{trial}.log').read_text(),syntax) for trial in range(1,4)]
    for row in sides[kind]:m.compare(sides['baseline'][0],row)
ratios=json.loads((out/'syntax-costs.json').read_text());assert len(ratios)==4
for i,row in enumerate(ratios):
    b=statistics.median(x[i].elapsed_ns/x[i].iterations for x in sides['baseline']);c=statistics.median(x[i].elapsed_ns/x[i].iterations for x in sides['candidate'])
    assert row['baseline_median_ns']==b and row['candidate_median_ns']==c and row['ratio']==c/b
    assert row['ratio']<=1.1,row
# Controls for the receipt checker, using recorded immutable input.
log=(out/'faceted-1.log').read_text();lines=log.splitlines(True);first=next(line for line in lines if line.startswith('step/box:'))
mutations=[log.replace(first,''),log+first,log.replace('checksum=3406000','checksum=3406001',1)]
for bad in mutations:
    try:m.compare(rows[0],m.read_receipt(bad,expected))
    except ValueError:pass
    else:raise AssertionError('receipt mutation accepted')
ledger=json.loads((root/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json').read_text())
assert not ledger['complete'] and len(ledger['work_packages'])==28 and all(x['status']!='complete' for x in ledger['work_packages'])
assert any(x['id']=='step-faceted' for x in ledger['increments'])
result=dict(sources=len(manifest['sources']),artifacts=len(manifest['artifacts']),native_results=348,release_io_results=31,wasm_groups=9,independent_fixtures=4,implementation_faults=5,standards_regressions=1,receipt_checker_controls=3,faceted_receipts=21,syntax_receipts=24,all_work_package_gates_open=True)
(out/'verification.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
