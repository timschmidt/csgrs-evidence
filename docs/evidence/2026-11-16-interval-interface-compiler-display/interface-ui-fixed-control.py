from pathlib import Path
import hashlib,json,subprocess
s=Path(__file__).parent
prior=json.loads((s/'interface-fixed-control.json').read_text())
log=s/'runs/alumina-interface.ui-qualify.baseline-unit-build/output.log'
artifacts=[]
for line in log.read_text().splitlines():
 if line.startswith('{'):
  row=json.loads(line)
  if row.get('reason')=='compiler-artifact':artifacts.append(row)
root=[a for a in artifacts if a['target']['name']=='alumina_interface' and a.get('executable')]
assert len(root)==1 and root[0]['profile']['test']
checks=[]
for row in prior['repositories']:
 name=row['repository'];repo=Path('/mnt/development')/({'interface':'alumina-interface','firmware':'alumina-firmware'}.get(name,name))
 fixed=row['fixed_revision'];measured=row['measured_control_revision']
 def git(*args):return subprocess.check_output(['git','-C',str(repo),*args])
 changed=git('diff','--name-only',fixed,measured).decode().splitlines()
 assert changed==row['changed_files']
 affected=[]
 for path,expected in row['unchanged_non_test_source'].items():
  a=git('show',fixed+':'+path);b=git('show',measured+':'+path)
  prefix=a.split(b'#[cfg(test)]',1)[0].rstrip()
  assert prefix==b.split(b'#[cfg(test)]',1)[0].rstrip()
  assert hashlib.sha256(prefix).hexdigest()==expected['non_test_prefix_sha256']
  package_dir=Path(path).parts[:2]
  matching=[r for r in artifacts if str(Path(*package_dir)/'Cargo.toml') in r['manifest_path']]
  assert all(not r['profile']['test'] for r in matching)
  affected.append({'source':path,'compiled_dependency':bool(matching),'artifact_test_flags':[r['profile']['test'] for r in matching],'non_test_prefix_sha256':expected['non_test_prefix_sha256']})
 if name=='interface':
  assert not git('diff','--name-only',fixed,measured,'--','src','assets','Cargo.toml','Cargo.lock','build.rs','.cargo')
  assert any(a['compiled_dependency'] for a in affected)
 checks.append({'repository':name,'fixed_revision':fixed,'measured_control_revision':measured,'changed_files':changed,'affected_dependency_modules':affected})
result={'scope':'Equivalent completed control for the root alumina-interface release lib-test executable only; not the core lib-test executable and not a historical-head rebuild.','basis':'Root application/test sources and build inputs are unchanged between fixed and measured controls. All earlier implementation-file changes are in dependency cfg(test) modules, which Cargo excludes here. Other historical changes are documentation or separate integration tests.','normal_control_record_sha256':hashlib.sha256((s/'interface-fixed-control.json').read_bytes()).hexdigest(),'baseline_build_log_sha256':hashlib.sha256(log.read_bytes()).hexdigest(),'baseline_artifact':json.loads((s/'interface-ui-tests-baseline/report.json').read_text()),'root_test_target':root[0]['target'],'repositories':checks}
(s/'interface-ui-fixed-control.json').write_text(json.dumps(result,indent=2)+'\n')
print('Verified fixed-goal control equivalence for root UI lib-test executable; core lib-test account remains separate.')
