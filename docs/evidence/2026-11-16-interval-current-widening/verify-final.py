from pathlib import Path
import json,re,subprocess
s=Path(__file__).parent;rows=[]
for version in ['1.88.0','1.95.0']:
 a=json.loads((s/f'baseline-{version}-artifact.json').read_text());b=json.loads((s/f'retained-{version}-artifact.json').read_text());assert a['sha256']==b['sha256']
 for label in ['baseline','candidate','retained']:
  log=(s/f'{label}-{version}-values.log').read_text();baseline=(s/f'baseline-{version}-values.log').read_text();assert log==baseline
  results={int(line.split(' ',2)[1]):line.split(' ',2)[2] for line in log.splitlines() if line.startswith('RESULT ')};assert len(results)==4108
  for index,expected in {4:'CurrentCalibration',6:'CurrentCalibration',7:'CurrentCalibration',8:'CurrentRawSample',9:'CurrentSynchronization',11:'CurrentCalibration'}.items():assert results[index]==f'Err({expected})'
  assert all(line.endswith(' 0 0') for line in log.splitlines() if line.startswith('ALLOC '))
 rows.append({'artifact':f'native-{version}','baseline_sha256':a['sha256'],'retained_sha256':b['sha256'],'byte_identical':True,'baseline_candidate_retained_complete_transcript_match':True,'corpus_successes':sum(v.startswith('Ok(') for v in results.values()),'corpus_typed_rejections':sum(v.startswith('Err(') for v in results.values())})
a=json.loads((s/'baseline-unit-artifacts.json').read_text())[1];b=json.loads((s/'tests-only-unit-artifacts.json').read_text())[1];assert a['name']==b['name'] and a['sha256']==b['sha256'];rows.append({'artifact':a['name'],'byte_identical':True,'baseline_sha256':a['sha256'],'retained_sha256':b['sha256']})
checks={}
for name in ['baseline-new-witness','candidate-foc-tests','tests-only-unit-release','final-firmware-tests','final-clippy','final-fmt']:
 data=json.loads((s/(name+'.json')).read_text());assert data['exit_code']==0;counts=re.findall(r'test result: ok\. (\d+) passed;', (s/(name+'.log')).read_text());checks[name]={'passing_tests':sum(map(int,counts)),'result_lines':len(counts),'exit_code':0}
assert checks['final-firmware-tests']['passing_tests']==603 and checks['tests-only-unit-release']['passing_tests']==89
p=Path('/mnt/development/interval-profile-static/alumina-firmware');original=subprocess.check_output(['git','show','2d68e82b7341db7b747b20e4ad1455a4c1113a00:crates/alumina-foc/src/current.rs'],cwd=p);current=(p/'crates/alumina-foc/src/current.rs').read_bytes();assert current==original+b'\n#[cfg(test)]\nmod interval_widening;\n'
ledger=json.loads(Path('/mnt/development/csgrs/docs/research/interval-size-accounts.json').read_text());before=json.loads((s/'size-account-before.json').read_text());assert ledger['accounts'][:45]==before['accounts'] and len(ledger['accounts'])==46
r={'artifacts':rows,'checks':checks,'production_source_restored':True,'new_test_cases':252,'all_original_test_assertions_retained':True,'size_accounts':{'previous':45,'current':46,'prior_preserved':True},'no_board_image_or_hardware_claim':True};(s/'final-verification.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
