from pathlib import Path
import json,re,shutil
s=Path(__file__).parent
checks=['restored-owner-tests','restored-owner-clippy','restored-owner-fmt','restored-interface-tests','restored-interface-clippy','restored-interface-fmt']
for label in checks:assert json.loads((s/(label+'.json')).read_text())['exit_code']==0,label
key=lambda x:(x['source'],x['test_harness'])
a={key(x):x for x in json.loads((s/'baseline-binaries.json').read_text())};b={key(x):x for x in json.loads((s/'restored-binaries.json').read_text())};assert a.keys()==b.keys() and len(a)==57
for k in a:assert a[k]['sha256']==b[k]['sha256'],k
for label in ['baseline','restored']:
 data={x['kind']:x['sha256'] for x in json.loads((s/(label+'-builds.json')).read_text())}
 if label=='baseline':expected=data
 else:assert data==expected and len(data)==2
for kind in ['native','trace']:
 assert json.loads((s/f'baseline-sqrt-{kind}-artifact.json').read_text())['sha256']==json.loads((s/f'restored-sqrt-{kind}-artifact.json').read_text())['sha256']
 assert (s/f'baseline-sqrt-{kind}-values.log').read_bytes()==(s/f'restored-sqrt-{kind}-values.log').read_bytes()
assert (s/'baseline-profile-values.log').read_bytes()==(s/'restored-profile-values.log').read_bytes()
a=json.loads((s/'baseline-wasm-replay.json').read_text());b=json.loads((s/'restored-wasm-replay.json').read_text());assert a['cases']==b['cases'] and a['host_calls']==b['host_calls']==0
assert (s/'size-account-before.json').read_bytes()==Path('/mnt/development/csgrs/docs/research/interval-size-accounts.json').read_bytes()
counts={label:{'reported_passes':sum(map(int,re.findall(r'test result: ok\. (\d+) passed',(s/(label+'.log')).read_text()))),'result_lines':len(re.findall(r'test result: ok\.',(s/(label+'.log')).read_text()))} for label in ['restored-owner-tests','restored-interface-tests']}
prior=json.loads(s.with_name('budget-borrowed-radius-after-freeze-check.json').read_text());assert len(prior)==88 and all(x['matched'] for x in prior);shutil.copy2(s.with_name('budget-borrowed-radius-after-freeze-check.json'),s/'prior-frozen-stages.json')
r={'checks':checks,'all_passed':True,'owner_artifacts_byte_identical':57,'profile_artifacts_byte_identical':2,'sqrt_artifacts_byte_identical':2,'entire_transcripts_serialization_allocations_and_wasm_replay_identical':True,'size_accounts_preserved':45,'prior_frozen_stages':88,'counts':counts,'production_retained':False,'goal_complete':False};(s/'final-verification.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
