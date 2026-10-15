"""Verify recorded source, result, cost and gate evidence without rebuilding."""
import hashlib,importlib.util,json,re,statistics,subprocess,sys
from pathlib import Path
root=Path('/mnt/development/csgrs');out=Path(__file__).resolve().parent
manifest=json.loads((out/'manifest.json').read_text())
for key,base in [('sources',root),('artifacts',out)]:
    for entry in manifest[key]:
        p=base/entry['path'];assert p.stat().st_size==entry['bytes'],p
        assert hashlib.sha256(p.read_bytes()).hexdigest()==entry['sha256'],p
audit=json.loads((out/'dependency-audit.json').read_text())
subprocess.run(['git','diff','--exit-code',audit['baseline'],'--',*audit['core_paths_unchanged']],cwd=root,check=True,stdout=subprocess.DEVNULL)
assert not subprocess.check_output(['git','ls-files','--others','--exclude-standard','--',*audit['core_paths_unchanged']],cwd=root,text=True)
commands=json.loads((out/'commands.json').read_text());assert len(commands)==10 and all(x['exit_code']==0 for x in commands)
for label,total in [('native-debug',359),('io-release',42)]:
    log=(out/(label+'.log')).read_text();assert sum(map(int,re.findall(r'test result: ok\. (\d+) passed',log)))==total
wasm=json.loads((out/'wasm-runtime.json').read_text());assert wasm['probe_groups']==5 and wasm['imports']==0
oracle=json.loads((out/'occt-read.json').read_text());assert len(oracle['fixtures'])==7
for row in oracle['fixtures']:
    assert row['valid'] and row['roots']==row['transferred']==1
    assert hashlib.sha256((out/'exports'/(row['name']+'.step')).read_bytes()).hexdigest()==row['sha256']
    assert abs(row['volume_default_mm3']-row['expected_mm3'])<1e-8
controls=json.loads((out/'controls/results.json').read_text());assert len(controls)==6
assert all(x['rejected_at_runtime'] and x['source_restored'] and x['exit_code']!=0 for x in controls)
spec=importlib.util.spec_from_file_location('receipt',root/'crates/hyperbrep/tools/benchmark_receipt.py');m=importlib.util.module_from_spec(spec);sys.modules[spec.name]=m;spec.loader.exec_module(m)
bench_commands=json.loads((out/'benchmark-commands.json').read_text());assert len(bench_commands)==9 and all(x['exit_code']==0 for x in bench_commands)
def receipts(prefix,source):
    expected=m.expected_cases((root/'crates/hyperbrep-io/benches'/source).read_text());rows=[];facts=None;allocations=[]
    for trial in range(1,4):
        log=(out/f'{prefix}-{trial}.log').read_text();parsed=m.read_receipt(log,expected);rows.append(parsed);m.compare(rows[0],parsed)
        current=[line for line in log.splitlines() if line.startswith('fixture ')]
        if facts is None:facts=current
        assert current==facts
        allocations.append({name:(int(calls),int(size)) for name,calls,size in re.findall(r'allocation_metadata name=(\S+): calls=(\d+) requested_bytes=(\d+)',log)})
    return rows,facts,allocations
exports,facts,allocs=receipts('export','export.rs');assert len(exports[0])==6
for i,cost in enumerate(json.loads((out/'export-costs.json').read_text())):
    assert cost['case']==exports[0][i].name and cost['checksum']==exports[0][i].checksum
    assert cost['median_ns']==statistics.median(x[i].elapsed_ns/x[i].iterations for x in exports)
    assert cost['allocation_calls_per_iteration']==statistics.median(a[cost['case']][0]/exports[n][i].iterations for n,a in enumerate(allocs))
    assert cost['requested_bytes_per_iteration']==statistics.median(a[cost['case']][1]/exports[n][i].iterations for n,a in enumerate(allocs))
b,bf,ba=receipts('import-baseline','faceted.rs');c,cf,ca=receipts('import-faceted','faceted.rs');assert len(b[0])==7 and bf==cf and ba==ca
for row in c:m.compare(b[0],row)
for i,cost in enumerate(json.loads((out/'import-costs.json').read_text())):
    bv=statistics.median(x[i].elapsed_ns/x[i].iterations for x in b);cv=statistics.median(x[i].elapsed_ns/x[i].iterations for x in c)
    assert cost['baseline_median_ns']==bv and cost['candidate_median_ns']==cv and cost['ratio']==cv/bv
    assert cost['ratio']<=1.1,cost
log=(out/'export-1.log').read_text();first=next(line for line in log.splitlines(True) if line.startswith('export/box:'))
expected=m.expected_cases((root/'crates/hyperbrep-io/benches/export.rs').read_text())
for bad in [log.replace(first,''),log+first,log.replace('checksum=2965000','checksum=2965001',1)]:
    try:m.compare(exports[0],m.read_receipt(bad,expected))
    except ValueError:pass
    else:raise AssertionError('receipt mutation accepted')
ledger=json.loads((root/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json').read_text())
assert not ledger['complete'] and len(ledger['work_packages'])==28 and all(x['status']!='complete' for x in ledger['work_packages'])
assert any(x['id']=='step-export' for x in ledger['increments'])
result=dict(sources=len(manifest['sources']),artifacts=len(manifest['artifacts']),native_results=359,release_io_results=42,wasm_groups=5,independent_exports=7,implementation_faults=6,receipt_checker_controls=3,export_receipts=18,import_receipts=42,all_work_package_gates_open=True)
(out/'verification.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
