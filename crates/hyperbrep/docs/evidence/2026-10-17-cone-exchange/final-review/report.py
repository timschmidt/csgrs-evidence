"""Summarize final-source acceptance and every observed cost, including regressions."""
import hashlib
import json
from pathlib import Path
import re
import statistics
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes
from source_binding import admit

read = lambda p: json.loads((OUT/p).read_text())
write = lambda p,v: (OUT/p).write_text(json.dumps(v, indent=2)+'\n')
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
source = hashes()
attempts = read('attempts.json')
latest = lambda label: next(r for r in reversed(attempts) if r['label']==label)
drivers = read('qualification-drivers.json')
blocked = {'inherited-zero-factor-default','inherited-zero-factor-all-features'}
assert {label for d in drivers for label in d['executed'] if latest(label)['exit_code']} == blocked
assert read('finish-checks-driver.json')['passed']
labels = list(dict.fromkeys(label for d in drivers for label in d['executed']))
labels += ['benchmark-build','benchmarks','dependency-build','rounding-build','dependency-costs']
labels += ['rational-split-consumer','rational-split-clippy','rational-split-occt','continuation-build','preceding-frontier','prism-occt','torus-growth','frontier-extension','reconstruction-continuation']
labels += sorted({r['label'] for r in attempts if r['label'].startswith(('final-','cone-continuation-'))})
assert read('continuation-admission.json')['passed']
assert read('continuation-frontier.json')['counts']==dict(native_result=81)
commands = [latest(label) for label in labels]
bindings = {}
for row in commands:
    bindings[row['label']] = admit(row, source)
    assert row['exit_code'] == (101 if row['label'] in blocked else 0), row
    if row['label'] in blocked:
        assert 'assertion failed: FACTORS > 0' in (OUT/row['log']).read_text()
counts = {}
for row in commands:
    if row['command'][:2] == ['cargo','test'] and row['label'] not in blocked:
        matches = re.findall(r'^test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored;', (OUT/row['log']).read_text(), re.M)
        assert matches, row
        counts[row['label']] = dict(zip(['passed','failed','ignored'],[sum(int(m[i]) for m in matches) for i in range(3)]))
assert counts['native-debug'] == counts['native-release']
assert counts['native-debug']['passed']==552 and counts['native-minimal']['passed']==544
assert counts['dependency-libraries']==dict(passed=3525,failed=0,ignored=6)
assert counts['dependency-minimal-libraries']==dict(passed=3419,failed=0,ignored=1)
wasm = json.loads((OUT/latest('wasm-runtime')['log']).read_text())
assert wasm['probe_groups']==111 and wasm['imports']==0
assert read('benchmark-v1/receipt-admission.json')['passed']
assert not read('benchmark-v1/observed-receipt-migrations.json')
costs = [dict(corpus=p.name.removesuffix('-costs.json'), **row)
         for p in sorted((OUT/'benchmark-v1').glob('*-costs.json')) for row in json.loads(p.read_text())]
matched = [r for r in costs if 'ratio' in r]
new = [r for r in costs if 'ratio' not in r]
processes = read('benchmark-v1/commands.json')
assert len(matched)==175 and len(new)==1 and len(processes)==111
assert all(r['exit_code']==0 for r in processes)
allocations = []
for r in matched:
    a,b = r.get('baseline_allocation_per_iteration'),r.get('candidate_allocation_per_iteration')
    if a is not None and a!=b:
        allocations.append(dict(corpus=r['corpus'],case=r['case'],baseline=a,candidate=b,
            delta={k:b[k]-a[k] for k in a}, increases=any(b[k]>a[k] for k in a)))
exes = read('benchmark-v1/executables.json')
assert set(exes['candidate'])==set(exes['baseline'])|{'cone_exchange'}
sizes,resources = [],[]
for name,b in sorted(exes['candidate'].items()):
    a = exes['baseline'].get(name)
    for item in [b,*([a] if a else [])]:
        assert Path(item['path']).stat().st_size==item['bytes'] and sha(Path(item['path']))==item['sha256']
    if a: assert a['features']==b['features']
    sizes.append(dict(corpus=name,candidate_bytes=b['bytes'],**(dict(baseline_bytes=a['bytes'],delta_bytes=b['bytes']-a['bytes']) if a else {})))
    record = dict(corpus=name)
    for side in (['baseline','candidate'] if a else ['candidate']):
        rows = [read(f'benchmark-v1/{name}-{side}-{trial}-resources.json') for trial in range(1,4)]
        assert all(r['wait_status']==0 for r in rows)
        record[side] = {k:statistics.median(r[k] for r in rows) for k in ['max_rss_kib','user_seconds','system_seconds']}
    resources.append(record)
old = OUT.parent/'2026-10-17-cone-continuation'
preserved = []
for row in json.loads((old/'preserved-artifacts.json').read_text()):
    path = row['path']
    assert (OUT/path).read_bytes()==(old/path).read_bytes(), path
    preserved.append(dict(path=path,bytes=(OUT/path).stat().st_size,baseline_sha256=sha(old/path),candidate_sha256=sha(OUT/path),unchanged=True))
assert len(preserved)==61
write('preserved-artifacts.json',preserved)
baseline_wasm = json.loads((old/'qualification-summary.json').read_text())['wasm']
summary = dict(cases=176,matched_cases=175,new_cases=1,corpora=19,processes=111,
    unchanged_receipts=175,costs=costs,
    median_case_ratio=statistics.median(r['ratio'] for r in matched),maximum_case_ratio=max(r['ratio'] for r in matched),
    adverse_timing_rows=[r for r in matched if r['ratio']>1.10],changed_allocation_rows=allocations,
    increased_allocation_rows=[r for r in allocations if r['increases']],binary_sizes=sizes,process_resources=resources,
    wasm=dict(baseline=baseline_wasm,candidate=wasm,delta_bytes=wasm['wasm_bytes']-baseline_wasm['wasm_bytes'],same_probe_inventory=False),
    scope='Shared-host complete native harnesses, original iteration counts/materialization/cache states and three alternating process pairs. One new completed cone exchange workflow has absolute costs only. No simultaneous task builds/tests during timing. New public source maps retain additional provenance; shared graph/formula evaluation is extended for conical output, so consumer verification cost is included, not a pure-kernel timing. Allocator requests/RSS are not retained-heap guarantees; harness sizes are not package sizes. A median of case ratios is not an aggregate speedup. WASM adds eight groups and explicitly migrates original cone rejection fixtures; runtime totals are qualification, not matched cost.')
write('benchmark-summary.json',summary)
write('qualification-summary.json',dict(source=source,source_admissions=bindings,commands=commands,tests=counts,wasm=wasm,
    inherited_failures=[r for r in commands if r['label'] in blocked],exact_artifacts=61,
    limits=['Source-path native/WASM consumers, not a shipped package or actual JS binding.',
        'No full workspace/pre-push, MSRV, release, formal proof, coverage, runtime fuzz/ASan/lexicase or total-work/heap/cancellation admission.',
        'Inherited scalar failures remain open with the upstream owner; all 28 work packages remain open/in progress.']))
write('final-source.json',source)
print(json.dumps(dict(tests=counts,main_cases=len(costs),maximum_ratio=summary['maximum_case_ratio'],
    adverse_timing_rows=len(summary['adverse_timing_rows']),increased_allocation_rows=len(summary['increased_allocation_rows']),new_costs=new),indent=2))
