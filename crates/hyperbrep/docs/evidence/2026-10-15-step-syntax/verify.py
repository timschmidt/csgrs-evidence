"""Verify this source snapshot and the bounded claims of the STEP syntax increment."""
from pathlib import Path
import json,hashlib,re,statistics,importlib.util,sys
out=Path(__file__).resolve().parent;root=out.parents[4]
manifest=json.loads((out/'manifest.json').read_text())
for kind,base in [('source_sha256',root),('artifact_sha256',out)]:
 for name,expected in manifest[kind].items():
  assert hashlib.sha256((base/name).read_bytes()).hexdigest()==expected,(kind,name)
ledger=json.loads((root/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json').read_text())
assert ledger['increments'][-1]['id']=='step-syntax'
assert len(ledger['work_packages'])==28 and not ledger['complete'] and all(p['status']!='complete' for p in ledger['work_packages'])
assert next(p for p in ledger['work_packages'] if p['id']=='WP14a')['status']=='in-progress'
commands=json.loads((out/'commands.json').read_text())
for name in ['io-tests','io-release-tests','io-clippy','io-docs','io-wasm','wasm-probe-build','wasm-execution','initial-brep-tests','fmt','final-tests','final-clippy','final-fmt','diff-check']:
 matches=[c for c in commands if c['name']==name];assert matches and matches[-1]['exit_code']==0,name
for name,total in [('io-tests',13),('io-release-tests',13),('final-tests',13),('initial-brep-tests',317)]:
 values=re.findall(r'test result: ok[.] (\d+) passed;', (out/(name+'.log')).read_text());assert sum(map(int,values))==total,(name,values)
before=json.loads((out/'lexical-regressions-before-fix.json').read_text());assert before['exit_code']==101
before_log=(out/'lexical-regressions-before-fix.log').read_text()
assert 'test result: FAILED. 9 passed; 3 failed;' in before_log
for name in ['duplicate_ids_and_id_overflow_fail_without_sparse_allocation','malformed_delimiters_numbers_and_typed_values_are_rejected','strings_binary_and_logical_spellings_survive_deterministic_writing']:
 assert f'test {name} ... FAILED' in before_log
controls=json.loads((out/'controls.json').read_text());assert len(controls)==4
for control in controls:
 assert control['exit_code']==101 and control['restored_sha256']==manifest['source_sha256'][control['source']]
 log=(out/'controls'/(control['name']+'.log')).read_text();assert 'test result: FAILED' in log and control['expected_failure'] in log
wasm=json.loads((out/'wasm-execution.log').read_text());assert wasm['probe_groups']==7 and wasm['imports']==0
module=Path('/tmp/hyperbrep-review-target/wasm32-unknown-unknown/release/hyperbrep_step_wasm_probe.wasm')
if module.exists():assert hashlib.sha256(module.read_bytes()).hexdigest()==wasm['wasm_sha256']
review=(out/'parser-review/results.log').read_text()
assert review.count('ruststep=true step_p21=true')==4
assert review.count('ruststep_panics=true step_p21_panics=true')==2
for expected in ['ruststep=9.00719925474099200e15 step_p21=9.00719925474099200e15','ruststep=inf step_p21=inf','ruststep=0.00000000000000000e0 step_p21=0.00000000000000000e0']:
 assert expected in review,expected
audit=json.loads((out/'dependency-audit.json').read_text());assert audit['changed_sources']==[] and audit['existing_locked_packages_unchanged']
assert [p['name'] for p in audit['added_package']]==['hyperbrep-io']
spec=importlib.util.spec_from_file_location('receipt',root/'crates/hyperbrep/tools/benchmark_receipt.py');m=importlib.util.module_from_spec(spec);sys.modules[spec.name]=m;spec.loader.exec_module(m)
expected=m.expected_cases((root/'crates/hyperbrep-io/benches/part21.rs').read_text());assert len(expected)==4
commands=json.loads((out/'benchmark-commands.json').read_text());assert len(commands)==6 and all(c['exit_code']==0 for c in commands)
rows={side:[m.read_receipt((out/f'{side}-{i}.log').read_text(),expected) for i in range(1,4)] for side in ['baseline','candidate']}
for side in rows:
 for trial in rows[side]:m.compare(rows['baseline'][0],trial)
comparison=json.loads((out/'costs.json').read_text());assert len(comparison)==4
for index,case in enumerate(expected):
 b=statistics.median(r[index].per_iteration_ns for r in rows['baseline']);c=statistics.median(r[index].per_iteration_ns for r in rows['candidate'])
 assert comparison[index]==dict(case=case,iterations=rows['candidate'][0][index].iterations,checksum=rows['candidate'][0][index].checksum,baseline_median_ns=b,candidate_median_ns=c,ratio=c/b)
 assert c/b<=1.1
expected_allocations={'baseline':[(21,4682),(20078,18508330),(64,5857866),(0,0)],'candidate':[(15,4202),(74,16908010),(58,5857386),(0,0)]}
for side,allocations in expected_allocations.items():
 for i in range(1,4):
  actual=re.findall(r'allocation_metadata name=(\S+): calls=(\d+) requested_bytes=(\d+)',(out/f'{side}-{i}.log').read_text());assert len(actual)==4
  for row,(name,calls,amount),(expected_calls,expected_bytes) in zip(rows[side][i-1],actual,allocations,strict=True):
   assert name==row.name and int(calls)==row.iterations*expected_calls and int(amount)==row.iterations*expected_bytes
# Preserve and independently recompute the earlier matched observations as historical data.
prior=out/'pre-lexical-review'
prior_rows={side:[m.read_receipt((prior/f'{side}-{i}.log').read_text(),expected) for i in range(1,4)] for side in ['baseline','candidate']}
for side in prior_rows:
 for trial in prior_rows[side]:m.compare(rows['baseline'][0],trial)
prior_costs=json.loads((prior/'costs.json').read_text())
for index,case in enumerate(expected):
 b=statistics.median(r[index].per_iteration_ns for r in prior_rows['baseline']);c=statistics.median(r[index].per_iteration_ns for r in prior_rows['candidate'])
 assert prior_costs[index]['case']==case and prior_costs[index]['baseline_median_ns']==b and prior_costs[index]['candidate_median_ns']==c and prior_costs[index]['ratio']==c/b
# Original unpaired prototype observations remain separate and preserve the same receipts.
for i in range(1,4):
 original=m.read_receipt((out/f'per-record-frames/part21-{i}.log').read_text(),expected);m.compare(rows['baseline'][0],original)
links=0
docs=[root/'readme.md',root/'crates/hyperbrep/README.md',out/'README.md']
docs += list((root/'crates/hyperbrep-io').glob('*.md')) + list((root/'crates/hyperbrep-io/docs').glob('*.md'))
docs += [root/'crates/hyperbrep/docs'/name for name in ['ARCHITECTURE.md','SUPPORT_MATRIX.md','REPOSITORY_AUDIT.md']]
for path in docs:
 for link in re.findall(r'\]\(([^)]+)\)',path.read_text()):
  if link.startswith(('http:','https:','#','mailto:')):continue
  target=link.split('#')[0]
  if target:assert (path.parent/target).resolve().exists(),(path,link);links+=1
print(json.dumps(dict(sources_verified=len(manifest['source_sha256']),artifacts_verified=len(manifest['artifact_sha256']),relative_links_resolve=links,native_parser_tests=12,doctests=1,restored_faults=4,lexical_regressions=3,matched_cost_cohorts=4,wasm_probe_groups=wasm['probe_groups'],work_packages=28,completed_work_packages=0),indent=2))
