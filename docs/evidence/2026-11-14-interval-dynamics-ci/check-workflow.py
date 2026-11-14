from pathlib import Path
import yaml,tomllib,json,subprocess,re,hashlib
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-dynamics-ci')
w=yaml.safe_load((r/'.github/workflows/hyperdynamics.yml').read_text());events=w[True];seen={}
def visit(p):
 p=p.resolve();m=tomllib.loads(p.read_text());name=m['package']['name']
 if name in seen:return
 seen[name]=p.parent.relative_to(r).as_posix()+'/**'
 for row in m.get('dependencies',{}).values():
  if isinstance(row,dict) and 'path' in row:visit(p.parent/row['path']/'Cargo.toml')
visit(r/'crates/hyperdynamics/Cargo.toml')
for event in ['push','pull_request']:
 paths=events[event]['paths'];assert all(x in paths for x in seen.values()),(event,seen);assert all(x in paths for x in ['.cargo/**','Cargo.toml','Cargo.lock','.github/workflows/hyperdynamics.yml'])
assert 'merge_group' in events
assert w['permissions']=={'contents':'read'}
assert w['jobs']['quality']['strategy']['matrix']['rust']==['1.95.0','stable']
base=json.loads((s/'BASELINE.json').read_text())['csgrs']['head']
old=subprocess.check_output(['git','show',base+':.github/workflows/workspace.yml'],cwd=r).decode();oldw=yaml.safe_load(old);matrix=oldw['jobs']['test']['strategy']['matrix'];assert 'hyperdynamics' not in matrix['crate'];assert not any(x.get('crate')=='hyperdynamics' for x in matrix['include'])
assert subprocess.run(['git','grep','-q','hyperdynamics',base,'--','.github/workflows'],cwd=r).returncode==1
log=(s/'baseline-default.log').read_text();counts=re.findall(r'test result: ok\. (\d+) passed;',log);assert counts and all(int(x)==0 for x in counts);assert (s/'baseline-default.exit').read_text().strip()=='0'
result=dict(base=base,default_run_suites=len(counts),default_run_tests=sum(map(int,counts)),baseline_dedicated_workflow=False,triggered_local_dependency_packages=seen,toolchains=['1.95.0','stable'],merge_group=True,read_only_permissions=True)
(s/'workflow-contract.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
