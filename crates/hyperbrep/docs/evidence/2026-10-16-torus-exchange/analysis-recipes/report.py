"""Summarize all completed checks and raw costs; do not choose retention here."""
import hashlib,json,re,statistics,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,hashes
from dependency_binding import admit_final_source
read=lambda p:json.loads((OUT/p).read_text())
write=lambda p,v:(OUT/p).write_text(json.dumps(v,indent=2)+'\n')
source=hashes(); attempts=read('attempts.json')
latest=lambda label:[r for r in attempts if r['label']==label][-1]
labels=['native-debug','native-release','native-minimal','native-clippy','native-minimal-clippy','rustdoc','analytic-example','faceted-example','advanced-example','supplied-example','circular-example','similarity-example','torus-example','torus-occt','occt-reader','fuzz-check','wasm-build','wasm-runtime','fmt','diff-check','diagnostic-build','preceding-frontier','prism-occt','benchmark-build','benchmark-receipt-review']
labels += [f'final-{f}-{r}' for f in ['cylinder','cone','torus'] for r in ['identity','diagonal','rational']]
labels += sorted({r['label'] for r in attempts if r['label'].startswith('final-prism-')})
labels += ['dependency-candidate', 'dependency-candidate-build', 'dependency-costs',
           'dependency-clippy', 'dependency-minimal-clippy', 'dependency-rustdoc',
           'scalar-all-features', 'scalar-minimal', 'dependency-scalar-minimal-library',
           'torus-growth-build', 'torus-growth']
labels += ['frontier-extension-build', 'frontier-extension']
labels += ['receipt-baseline-build', 'receipt-candidate-build', 'receipt-baseline-emit',
           'receipt-candidate-emit', 'receipt-archive-equality']
qualification=[latest(label) for label in labels]
source_admissions={}
for row in qualification:
 assert row['exit_code']==0 and row['source_unchanged'],row
 if read(row['source'])!=source:
  source_admissions[row['label']]=admit_final_source(row,source)
counts={}
for label in ['native-debug','native-release','native-minimal']:
 groups=re.findall(r'^test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored;', (OUT/latest(label)['log']).read_text(),re.M)
 counts[label]=dict(zip(['passed','failed','ignored'],[sum(int(x[i]) for x in groups) for i in range(3)]))
 assert counts[label]['passed']>=508 and counts[label]['failed']==counts[label]['ignored']==0
assert counts['native-debug']==counts['native-release']
assert read('continuation-input-admission.json')['passed']
assert not read('benchmark-v1/receipt-admission.json')['passed']
assert latest('benchmarks')['exit_code']==1 and latest('benchmarks')['source_unchanged']
assert read(latest('benchmarks')['source'])==source
migrations=read('benchmark-v1/observed-receipt-migrations.json')
assert len(migrations)==5
assert read('receipt-review.json')['passed']
assert read('approved-receipt-migrations.json')['migrations']==migrations
assert read('receipt-artifact-binding.json')['passed']
assert read('benchmark-v1/source.json')==source
assert read('growth-summary.json')['source']==source
assert len(read('growth-summary.json')['rows'])==5
costs=[dict(corpus=p.name.removesuffix('-costs.json'),**r) for p in sorted((OUT/'benchmark-v1').glob('*-costs.json')) for r in json.loads(p.read_text())]
commands=read('benchmark-v1/commands.json')
matched=[r for r in costs if 'ratio' in r];new=[r for r in costs if 'ratio' not in r]
assert len(matched)==167 and len(new)==3 and len(commands)==105
assert all(r['exit_code']==0 for r in commands)
allocations=[]
for row in matched:
 a,b=row.get('baseline_allocation_per_iteration'),row.get('candidate_allocation_per_iteration')
 if a is not None and a!=b:allocations.append(dict(corpus=row['corpus'],case=row['case'],baseline=a,candidate=b,delta={k:b[k]-a[k] for k in a},increases=any(b[k]>a[k] for k in a)))
exes=read('benchmark-v1/executables.json');sizes=[];resources=[]
assert set(exes['candidate'])==set(exes['baseline'])|{'torus_exchange'}
for name,a in sorted(exes['baseline'].items()):
 b=exes['candidate'][name];assert a['features']==b['features']
 for exe in [a,b]:
  data=Path(exe['path']).read_bytes();assert len(data)==exe['bytes'] and hashlib.sha256(data).hexdigest()==exe['sha256']
 sizes.append(dict(corpus=name,baseline_bytes=a['bytes'],candidate_bytes=b['bytes'],delta_bytes=b['bytes']-a['bytes']))
 item=dict(corpus=name)
 for side in ['baseline','candidate']:
  rows=[read(f'benchmark-v1/{name}-{side}-{trial}-resources.json') for trial in range(1,4)]
  assert all(r['wait_status']==0 for r in rows)
  item[side]={field:statistics.median(r[field] for r in rows) for field in ['max_rss_kib','user_seconds','system_seconds']}
 resources.append(item)
wasm=json.loads((OUT/latest('wasm-runtime')['log']).read_text());assert wasm['probe_groups']==90 and wasm['imports']==0
baseline_wasm=read('baseline-wasm.json')
summary=dict(cases=170,matched_cases=167,new_cases=3,corpora=18,processes=105,exact_receipts_preserved=False,unchanged_receipts=162,reviewed_receipt_migrations=5,all_receipts_accounted_for=True,receipt_review='receipt-review.json',costs=costs,median_case_ratio=statistics.median(r['ratio'] for r in matched),maximum_case_ratio=max(r['ratio'] for r in matched),adverse_timing_rows=[r for r in matched if r['ratio']>1.10],changed_allocation_rows=allocations,increased_allocation_rows=[r for r in allocations if r['increases']],binary_sizes=sizes,process_resources=resources,wasm=dict(baseline=baseline_wasm,candidate=wasm,delta_bytes=wasm['wasm_bytes']-baseline_wasm['bytes']),scope='Original 17 workloads and their exact assertions, iteration counts, materialization and cache states; three alternating pairs per corpus. 162 old receipts are unchanged; five have separately reviewed exact representation migrations. The original no-migration gate remains failed. New torus cases have absolute costs only. Shared host, CPU 0; no simultaneous builds/tests. Cumulative allocator requests and per-process RSS are not retained-heap bounds. Harness sizes are not package sizes. The WASM probe adds groups. Median of case ratios is not aggregate speedup.')
write('benchmark-summary.json',summary)
write('qualification-summary.json',dict(source=source,source_admissions=source_admissions,commands=qualification,original_failed_receipt_gate=latest('benchmarks'),receipt_review='receipt-review.json',tests=counts,wasm=wasm,continuation=read('continuation-frontier.json')['counts'],prisms=read('prism-frontier.json')['counts'],exact_artifacts=dict(step=len(read('preserved-step-artifacts.json')),prism=len(read('preserved-prism-artifacts.json'))),limitations=['Inherited external-crate failures are not claimed repaired.','The original no-migration receipt gate remains failed; five exact representation migrations have a separate explicit review.','No package, MSRV, actual C/Python/JS binding, coverage, formal proof, ASan, runtime fuzz, lexicase or full pre-push admission.','All 28 work packages remain open or in progress; no push.']))
write('final-source.json',source)
print(json.dumps(dict(tests=counts,cases=len(costs),processes=len(commands),median_case_ratio=summary['median_case_ratio'],maximum_case_ratio=summary['maximum_case_ratio'],adverse_timing_rows=len(summary['adverse_timing_rows']),changed_allocation_rows=len(allocations),increased_allocation_rows=len(summary['increased_allocation_rows'])),indent=2))
