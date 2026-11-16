from pathlib import Path
import subprocess,os,sys,json,time,shutil,hashlib
from artifact_sizes import native
s=Path(__file__).parent;r=Path(json.loads((s/'initial-state.json').read_text())['root']);label=sys.argv[1]
assert not (s/f'{label}-owner-artifacts.json').exists()
target=Path('/mnt/development/.interval-refactor-build/dyadic-quotient-current-owner-release');out=Path('/mnt/development/.interval-refactor-build/dyadic-quotient-current-owner-artifacts');out.mkdir(exist_ok=True)
env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'}
cmd=['cargo','+1.95.0','build','--locked','--release','-p','hyperinterval','--all-features','--examples','--message-format=json-render-diagnostics'];start=time.time()
with (s/f'{label}-owner-artifacts-build.jsonl').open('w') as stdout, (s/f'{label}-owner-artifacts-build.log').open('w') as stderr:
 p=subprocess.run(cmd,cwd=r,env=env,stdout=stdout,stderr=stderr,timeout=1800)
result={'head':subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip(),'status':subprocess.check_output(['git','status','--porcelain'],cwd=r,text=True),'command':cmd,'cwd':str(r),'elapsed':time.time()-start,'exit_code':p.returncode,'environment':{k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE']},'artifacts':[]}
if not p.returncode:
 for line in (s/f'{label}-owner-artifacts-build.jsonl').read_text().splitlines():
  try:row=json.loads(line)
  except json.JSONDecodeError:continue
  if row.get('reason')=='compiler-artifact' and row['target']['kind']==['example'] and row.get('executable'):
   name=row['target']['name'];dest=out/(label+'-'+name);shutil.copyfile(row['executable'],dest);dest.chmod(0o755);result['artifacts'].append({'name':name,'size':native(dest)})
 assert len(result['artifacts'])==15
(s/f'{label}-owner-artifacts.json').write_text(json.dumps(result,indent=2)+'\n');print(label,p.returncode,len(result['artifacts']),flush=True);sys.exit(p.returncode)
