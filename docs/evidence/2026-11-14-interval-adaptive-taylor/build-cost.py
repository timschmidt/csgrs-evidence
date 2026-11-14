from pathlib import Path
import subprocess,os,time,json,hashlib,shutil
s=Path(__file__).parent;root=Path('/mnt/development');art=root/'.interval-refactor-build/adaptive-taylor-artifacts';art.mkdir(exist_ok=True);rows=[]
for name,repo,package,features,bench in [
 ('base','csgrs-adaptive-taylor-base','hyperdynamics','taylor-evolution,reachability','taylor_evolution'),
 ('default','csgrs-adaptive-taylor','hyperdynamics','taylor-evolution,reachability','taylor_evolution'),
 ('enabled','csgrs-adaptive-taylor','hyperdynamics','taylor-evolution,reachability,adaptive-taylor','taylor_evolution'),
 ('new','csgrs-adaptive-taylor','hyperdynamics','adaptive-taylor,taylor-evolution','adaptive_taylor')]:
 env=os.environ|{'CARGO_TARGET_DIR':str(root/'.interval-refactor-build'/('adaptive-taylor-cost-base' if name == 'base' else 'adaptive-taylor-cost')),'CARGO_BUILD_JOBS':'3'}
 cmd=['cargo','+1.95.0','bench','--locked','-p',package,'--bench',bench,'--no-run','--message-format=json']
 if features:cmd+=['--features',features]
 start=time.monotonic()
 with (s/f'build-{name}.jsonl').open('w') as out,(s/f'build-{name}.log').open('w') as err:code=subprocess.run(cmd,cwd=root/repo,env=env,stdout=out,stderr=err).returncode
 assert code==0,(name,code)
 executable=[json.loads(line)['executable'] for line in (s/f'build-{name}.jsonl').read_text().splitlines() if json.loads(line).get('reason')=='compiler-artifact' and json.loads(line).get('executable') and json.loads(line)['target']['name']==bench];assert len(executable)==1
 dest=art/name;shutil.copy2(executable[0],dest);rows.append(dict(name=name,command=cmd,returncode=code,seconds=time.monotonic()-start,path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest()));(s/'cost-builds.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,code,flush=True)
