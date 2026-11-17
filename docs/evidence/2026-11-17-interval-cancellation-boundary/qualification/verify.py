from pathlib import Path
import hashlib,json,re,subprocess
s=Path(__file__).parent;r=Path('/dev/shm/interval-cancellation-boundary/csgrs');base='4a04dd9744bfecb578963b42fa3bffef5b7062b5'
read=lambda n:json.loads((s/n).read_text());sha=lambda b:hashlib.sha256(b).hexdigest()
for name in ['completion.json','downstream-completion.json','integration-completion.json','wasm-completion.json']:assert read(name)['exit_code']==0,name
assert read('wasm-completion.json')['seconds_since_original_start']<1800
assert 'result: Ok(7)' in (s/'witness.log').read_text()
assert '3 passed; 5 failed;' in (s/'baseline-tests.log').read_text()
assert 'kind: Cancellation' in (s/'candidate-witness.log').read_text()
expected={
 'owner-no-default.log':[642], 'owner-all-features.log':[645],
 'curve-cancellation-tests.log':[1,7], 'owner-integration.log':[16,10],
}
for name,counts in expected.items():
 raw=(s/name).read_text();actual=[int(v) for v in re.findall(r'test result: ok\. (\d+) passed; 0 failed; 0 ignored;',raw)];assert actual==counts,(name,actual)
commands=read('commands.json')+read('downstream-commands.json')+read('wasm-commands.json')
for c in commands:
 assert c['exit_code']==0 and not c['timed_out'];raw=(s/(c['name']+'.log')).read_bytes();assert sha(raw)==c['log_sha256'];assert not any(line.startswith((b'warning:',b'warning[')) for line in raw.splitlines()),c['name']
for path,name in [('crates/hypersolve/src/work_budget/tests.rs','original-tests.rs'),('crates/hypercurve/tests/work_budget.rs','original-curve-tests.rs')]:
 original=subprocess.check_output(['git','show',base+':'+path],cwd=r);assert original==(s/name).read_bytes();assert (r/path).read_bytes().startswith(original)
expected_paths={'crates/hypersolve/src/work_budget.rs','crates/hypersolve/src/work_budget/tests.rs','crates/hypercurve/src/policy.rs','crates/hypercurve/tests/work_budget.rs','docs/MIGRATIONS.md'}
changed=set(subprocess.check_output(['git','diff','--name-only',base],cwd=r,text=True).splitlines());assert changed==expected_paths
strip_docs=lambda text:'\n'.join(line for line in text.splitlines() if line.strip() and not line.lstrip().startswith(('///','//!')))
original=subprocess.check_output(['git','show',base+':crates/hypersolve/src/work_budget.rs'],cwd=r,text=True)
old='    enter(budget, Some(cancellation.clone()), None, operation)'
new='''    enter(budget, Some(cancellation.clone()), None, || {
        let value = operation();
        let _ = exhaustion();
        value
    })'''
assert original.count(old)==1
assert strip_docs(original.replace(old,new))==strip_docs((r/'crates/hypersolve/src/work_budget.rs').read_text())
original=subprocess.check_output(['git','show',base+':crates/hypercurve/src/policy.rs'],cwd=r,text=True)
assert strip_docs(original)==strip_docs((r/'crates/hypercurve/src/policy.rs').read_text())
for label in ['baseline','candidate']:
 h=s/(label+'-wasm');assert (h/'lib.rs').read_bytes()==(s/'wasm-witness.rs').read_bytes()
 actual=[json.loads(line) for line in (s/(label+'-wasm-invoke.log')).read_text().splitlines()];assert [x['case'] for x in actual]==[0,1,2]
 assert [x['expected_trap'] for x in actual]==([False,True,True] if label=='baseline' else [False,False,False])
for images in [list(read('images.json').values()),read('wasm-images.json')]:
 for a in images:assert sha(Path(a['path']).read_bytes())==a['sha256']
patch=subprocess.check_output(['git','diff','--binary',base],cwd=r);(s/'candidate.patch').write_bytes(patch)
files={p:sha((r/p).read_bytes()) for p in sorted(changed)}
result=dict(base=base,patch_sha256=sha(patch),source_files=files,candidate_test_invocations=1321,baseline_owner_controls_passed=3,baseline_new_contract_failures=5,baseline_native_witness_failure=True,baseline_wasm_successes=1,baseline_wasm_expected_traps=2,candidate_native_witness_pass=True,candidate_wasm_successes=3,original_assertions_unchanged=True,owner_strict_all_target_all_feature_clippy=True,direct_curve_strict_all_feature_clippy=True,strict_owner_and_curve_docs=True,formatting=True,production_change_scope='One final exhaustion check in with_cancellable_budget; ordinary with_budget and Hypercurve adapter code unchanged.',admitted=False)
(s/'verification.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items() if k!='source_files'},indent=2))
