from pathlib import Path
import json,re,shutil
s=Path(__file__).parent
checks=['restored-interval-tests','restored-owner-clippy','restored-owner-fmt','restored-interface-tests','restored-interface-clippy','restored-interface-fmt']
for label in checks:assert json.loads((s/(label+'.json')).read_text())['exit_code']==0,label
key=lambda x:(x['source'],x['test_harness'])
a={key(x):x for x in json.loads((s/'baseline-binaries.json').read_text())};b={key(x):x for x in json.loads((s/'restored-binaries.json').read_text())};assert a.keys()==b.keys() and len(a)==41
for k in a:assert a[k]['sha256']==b[k]['sha256'],k
for label in ['baseline','restored']:
 data=json.loads((s/(label+'-builds.json')).read_text());data={x['kind']:x['sha256'] for x in data}
 if label=='baseline':expected=data
 else:assert data==expected and len(data)==2
assert json.loads((s/'baseline-trace-build.json').read_text())['sha256']==json.loads((s/'restored-trace-build.json').read_text())['sha256']
for suffix in ['profile-values.log','trace-values.log']:assert (s/('baseline-'+suffix)).read_bytes()==(s/('restored-'+suffix)).read_bytes()
a=json.loads((s/'baseline-wasm-replay.json').read_text());b=json.loads((s/'restored-wasm-replay.json').read_text());assert a['cases']==b['cases'] and a['host_calls']==b['host_calls']==0
assert (s/'size-account-before.json').read_bytes()==Path('/mnt/development/csgrs/docs/research/interval-size-accounts.json').read_bytes()
counts={label:{'reported_passes':sum(map(int,re.findall(r'test result: ok\. (\d+) passed',(s/(label+'.log')).read_text()))),'result_lines':len(re.findall(r'test result: ok\.',(s/(label+'.log')).read_text()))} for label in ['restored-interval-tests','restored-interface-tests']}
prior=json.loads(s.with_name('budget-radius-composition-after-freeze-check.json').read_text());assert len(prior)==87 and all(x['matched'] for x in prior);shutil.copy2(s.with_name('budget-radius-composition-after-freeze-check.json'),s/'prior-frozen-stages.json')
r={'checks':checks,'all_passed':True,'owner_artifacts_byte_identical':41,'profile_artifacts_byte_identical':2,'trace_artifact_byte_identical':True,'native_trace_serialization_allocations_and_wasm_replay_identical':True,'size_accounts_preserved':45,'prior_frozen_stages':87,'counts':counts,'production_retained':False,'goal_complete':False};(s/'final-verification.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
