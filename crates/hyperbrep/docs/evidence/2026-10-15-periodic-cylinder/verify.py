"""Recompute source identities, correctness totals, receipts and reported costs."""
import hashlib, importlib.util, json, re, statistics, subprocess, sys
from pathlib import Path
root=Path('/mnt/development/csgrs');out=Path(__file__).resolve().parent
manifest=json.loads((out/'manifest.json').read_text())
for key,base in [('sources',root),('artifacts',out)]:
    for entry in manifest[key]:
        p=base/entry['path'];assert p.stat().st_size==entry['bytes'],p
        assert hashlib.sha256(p.read_bytes()).hexdigest()==entry['sha256'],p
audit=json.loads((out/'dependency-audit.json').read_text())
subprocess.run(['git','diff','--exit-code',audit['baseline'],'--',*audit['unchanged_paths']],cwd=root,check=True,stdout=subprocess.DEVNULL)
assert not subprocess.check_output(['git','ls-files','--others','--exclude-standard','--',*audit['unchanged_paths']],cwd=root,text=True)
commands=json.loads((out/'commands.json').read_text());assert len(commands)==9 and all(x['exit_code']==0 for x in commands)
for label in ['native-debug','native-release']:
    log=(out/(label+'.log')).read_text();assert sum(map(int,re.findall(r'test result: ok\. (\d+) passed',log)))==366
wasm=json.loads((out/'wasm-runtime.json').read_text());assert wasm['probe_groups']==5 and wasm['imports']==0
controls=json.loads((out/'controls/results.json').read_text());assert len(controls)==3
assert all(x['rejected_at_runtime'] and x['source_restored'] and x['exit_code']!=0 for x in controls)
for row in controls:
    name='cylinder.rs' if row['name']=='restore-quarter-grid' else 'rectangular_cover.rs'
    assert hashlib.sha256((root/'crates/hyperbrep/src/topology/validation'/name).read_bytes()).hexdigest()==row['source_sha256']
research=json.loads((out/'research/fixture-audit.json').read_text())
assert research['source_sha256']==hashlib.sha256((out/'research/occt-cylinder.step').read_bytes()).hexdigest()
assert research['side_faces']==1 and len(research['vertices'])==2 and all(not x['exactly_incident'] for x in research['vertices'])
spec=importlib.util.spec_from_file_location('receipt',root/'crates/hyperbrep/tools/benchmark_receipt.py');m=importlib.util.module_from_spec(spec);sys.modules[spec.name]=m;spec.loader.exec_module(m)
commands=json.loads((out/'benchmark-commands.json').read_text());assert len(commands)==9 and all(x['exit_code']==0 for x in commands)
def receipts(prefix,source):
    expected=m.expected_cases((root/'crates/hyperbrep/benches'/source).read_text());rows=[];facts=None;allocations=[]
    for trial in range(1,4):
        log=(out/f'{prefix}-{trial}.log').read_text();parsed=m.read_receipt(log,expected);rows.append(parsed);m.compare(rows[0],parsed)
        current=[line for line in log.splitlines() if line.startswith('fixture ')]
        if facts is None:facts=current
        assert current==facts
        allocations.append({name:(int(calls),int(size)) for name,calls,size in re.findall(r'allocation_metadata name=(\S+): calls=(\d+) requested_bytes=(\d+)',log)})
    return rows,facts,allocations
b,_,_=receipts('baseline','kernel.rs');c,_,_=receipts('kernel','kernel.rs');assert len(b[0])==66
for row in c:m.compare(b[0],row)
ratios=json.loads((out/'kernel-costs.json').read_text());assert len(ratios)==66
for i,cost in enumerate(ratios):
    bv=statistics.median(x[i].elapsed_ns/x[i].iterations for x in b);cv=statistics.median(x[i].elapsed_ns/x[i].iterations for x in c)
    assert cost['case']==b[0][i].name and cost['baseline_median_ns']==bv and cost['candidate_median_ns']==cv and cost['ratio']==cv/bv
rows,facts,allocs=receipts('periodic','periodic_cylinder.rs');assert len(rows[0])==6
costs=json.loads((out/'periodic-costs.json').read_text());assert len(costs)==6
for i,cost in enumerate(costs):
    assert cost['case']==rows[0][i].name and cost['checksum']==rows[0][i].checksum
    assert cost['median_ns']==statistics.median(x[i].elapsed_ns/x[i].iterations for x in rows)
    assert cost['allocation_calls_per_iteration']==statistics.median(a[cost['case']][0]/rows[n][i].iterations for n,a in enumerate(allocs))
    assert cost['requested_bytes_per_iteration']==statistics.median(a[cost['case']][1]/rows[n][i].iterations for n,a in enumerate(allocs))
assert costs[0]['allocation_calls_per_iteration']==costs[1]['allocation_calls_per_iteration']==2
assert costs[0]['requested_bytes_per_iteration']==223936 and costs[1]['requested_bytes_per_iteration']==2239936
log=(out/'kernel-1.log').read_text();first=next(line for line in log.splitlines(True) if line.startswith('planar_kernel/cuboid_build_measure_classify:'))
expected=m.expected_cases((root/'crates/hyperbrep/benches/kernel.rs').read_text())
for bad in [log.replace(first,''),log+first,log.replace(first,first.replace('checksum=1000','checksum=1001'))]:
    assert bad!=log
    try:m.compare(c[0],m.read_receipt(bad,expected))
    except ValueError:pass
    else:raise AssertionError('receipt mutation accepted')
ledger=json.loads((root/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json').read_text())
assert not ledger['complete'] and len(ledger['work_packages'])==28 and all(x['status']!='complete' for x in ledger['work_packages'])
assert any(x['id']=='periodic-cylinder' for x in ledger['increments'])
result=dict(sources=len(manifest['sources']),artifacts=len(manifest['artifacts']),native_debug_results=366,native_release_results=366,wasm_groups=5,implementation_faults=3,receipt_checker_controls=3,kernel_receipts=396,new_cost_receipts=18,kernel_ratio_median=statistics.median(r['ratio'] for r in ratios),kernel_ratio_max=max(r['ratio'] for r in ratios),kernel_cases_over_ten_percent=[r['case'] for r in ratios if r['ratio']>1.1],historical_archive_timing_gate='open',all_work_package_gates_open=True)
(out/'verification.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
