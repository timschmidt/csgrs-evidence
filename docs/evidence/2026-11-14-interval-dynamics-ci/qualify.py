from pathlib import Path
import json,re,tomllib,hashlib,subprocess,yaml
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-dynamics-ci');manifest=tomllib.loads((r/'crates/hyperdynamics/Cargo.toml').read_text());features=set(manifest['features']);result={}
workflow=yaml.safe_load((r/'.github/workflows/hyperdynamics.yml').read_text());expected_commands=[x['run'] for x in workflow['jobs']['quality']['steps'] if 'run' in x and x['name']!='Install Rust and feature driver']
for label in ['1_95_0','stable']:
 assert (s/f'{label}-driver.exit').read_text().strip()=='0'
 rows=json.loads((s/f'{label}-commands.json').read_text());assert len(rows)==9 and all(x['returncode']==0 for x in rows);assert [x['command'] for x in rows]==expected_commands
 feature_log=(s/f'{label}-04.log').read_text();commands=re.findall(r'^info: running `([^`]+)` on hyperdynamics \((\d+)/(\d+)\)',feature_log,re.M);assert len(commands)==18
 exercised=set()
 for command,_,_ in commands:
  match=re.search(r'--features (\S+)',command)
  if match:exercised.update(match.group(1).split(','))
 assert exercised==features, (features-exercised,exercised-features)
 suites={}
 for row in rows:
  log=(s/row['log']).read_text();counts=list(map(int,re.findall(r'test result: ok\. (\d+) passed;',log)))
  if counts:suites[row['name']]=dict(tests=sum(counts),suites=len(counts))
 for name in ['Test all targets and features','Test optimized library and integration suites']:
  assert suites[name]['tests']>0
  row=next(x for x in rows if x['name']==name);log=(s/row['log']).read_text()
  expected={p.stem for p in (r/'crates/hyperdynamics/tests').glob('*.rs')}
  seen=set(re.findall(r'Running tests/(\w+)\.rs',log));assert expected==seen,(expected-seen,seen-expected)
 assert suites['Test all targets and features']['tests']==suites['Test optimized library and integration suites']['tests']
 debug=(s/f'{label}-06.log').read_text();benches=set(re.findall(r'Running benches/(\w+)\.rs',debug));assert benches=={x['name'] for x in manifest['bench']};smoke=len(re.findall(r'^Success$',debug,re.M));assert smoke==29
 result[label]=dict(validation_steps=len(rows),feature_configurations=len(commands),individually_exercised_features=sorted(exercised),suites=suites,benchmark_targets=sorted(benches),benchmark_smoke_cases=smoke)
assert result['1_95_0']['suites']==result['stable']['suites']
assert (s/'zizmor.exit').read_text().strip()=='0';assert 'No findings to report' in (s/'zizmor.log').read_text()
result['zizmor']=dict(version='1.32.0',findings=0,mode='default offline; network-dependent audits unavailable')
(s/'QUALIFICATION.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
