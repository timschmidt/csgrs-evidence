from pathlib import Path
import subprocess,json,re,hashlib
s=Path(__file__).parent;rows=[]
for version in ['1.88.0','1.95.0']:
 a=json.loads((s/f'baseline-{version}-artifact.json').read_text());b=json.loads((s/f'restored-{version}-artifact.json').read_text());assert a['sha256']==b['sha256']
 for label in ['candidate','retained','final','restored']:assert (s/f'baseline-{version}-values.log').read_bytes()==(s/f'{label}-{version}-values.log').read_bytes()
 rows.append({'artifact':f'native-{version}','baseline_sha256':a['sha256'],'restored_sha256':b['sha256'],'byte_identical':True,'all_candidate_and_restored_fields_match':True})
a=json.loads((s/'baseline-wasm-artifact.json').read_text());b=json.loads((s/'restored-wasm-artifact.json').read_text());assert a['sha256']==b['sha256']
wa=json.loads((s/'baseline-wasm-replay.json').read_text());wb=json.loads((s/'restored-wasm-replay.json').read_text());assert wa['cases']==wb['cases']
for label in ['candidate','retained','final']:
 wc=json.loads((s/f'{label}-wasm-replay.json').read_text());assert len(wc['cases'])==len(wa['cases'])==4108;assert all(x['fields']==y['fields'] for x,y in zip(wa['cases'],wc['cases']));assert wc['host_calls']==0
rows.append({'artifact':'wasm','baseline_sha256':a['sha256'],'restored_sha256':b['sha256'],'byte_identical':True,'restored_fields_and_fuel_match':True})
a=json.loads((s/'baseline-unit-artifacts.json').read_text());b=json.loads((s/'restored-unit-artifacts.json').read_text())
for x,y in zip(a,b):
 assert x['name']==y['name'] and x['sha256']==y['sha256'];rows.append({'artifact':x['name'],'baseline_sha256':x['sha256'],'restored_sha256':y['sha256'],'byte_identical':True})
checks={}
for label in ['restored-firmware-tests','restored-clippy','restored-unit-release','restored-fmt']:
 d=json.loads((s/(label+'.json')).read_text());assert d['exit_code']==0;counts=re.findall(r'test result: ok\. (\d+) passed;', (s/(label+'.log')).read_text());checks[label]={'exit_code':0,'passing_tests':sum(map(int,counts)),'result_lines':len(counts)}
assert checks['restored-firmware-tests']['passing_tests']==602
root=Path('/mnt/development/csgrs');before=json.loads((s/'size-account-before.json').read_text());after=json.loads((root/'docs/research/interval-size-accounts.json').read_text());assert before==after
firmware=Path('/mnt/development/interval-profile-static/alumina-firmware');assert not subprocess.check_output(['git','status','--porcelain'],cwd=firmware)
r={'artifacts':rows,'checks':checks,'firmware_head':subprocess.check_output(['git','rev-parse','HEAD'],cwd=firmware,text=True).strip(),'clean':True,'size_accounts_preserved':len(after['artifacts'] if 'artifacts' in after else after['accounts']),'production_retained':False,'tests_retained':False}
(s/'restoration.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
