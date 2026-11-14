from pathlib import Path
import subprocess,os,time,json,hashlib,shutil
s=Path(__file__).parent;root=Path('/mnt/development');art=root/'.interval-refactor-build/physics-flow-artifacts';art.mkdir(exist_ok=True);rows=[]
for name,repo,package,features,bench in [
 ('physics-base','csgrs-physics-flow-base','hyperphysics',None,'mass_properties'),
 ('physics-default','csgrs-physics-flow','hyperphysics',None,'mass_properties'),
 ('physics-enabled','csgrs-physics-flow','hyperphysics','certified-flow','mass_properties'),
 ('new','csgrs-physics-flow','hyperphysics','certified-flow','certified_flow'),
 ('dynamics-base','csgrs-physics-flow-base','hyperdynamics','taylor-evolution,reachability','taylor_evolution'),
 ('dynamics-candidate','csgrs-physics-flow','hyperdynamics','taylor-evolution,reachability','taylor_evolution')]:
 env=os.environ|{'CARGO_TARGET_DIR':str(root/'.interval-refactor-build'/('physics-flow-cost-base' if name.endswith('-base') else 'physics-flow-cost')),'CARGO_BUILD_JOBS':'3'}
 cmd=['cargo','+1.95.0','bench','--locked','-p',package,'--bench',bench,'--no-run','--message-format=json']
 if features:cmd+=['--features',features]
 start=time.monotonic()
 with (s/f'build-{name}.jsonl').open('w') as out,(s/f'build-{name}.log').open('w') as err:code=subprocess.run(cmd,cwd=root/repo,env=env,stdout=out,stderr=err).returncode
 assert code==0,(name,code)
 executable=[json.loads(line)['executable'] for line in (s/f'build-{name}.jsonl').read_text().splitlines() if json.loads(line).get('reason')=='compiler-artifact' and json.loads(line).get('executable') and json.loads(line)['target']['name']==bench];assert len(executable)==1
 dest=art/name;shutil.copy2(executable[0],dest);rows.append(dict(name=name,command=cmd,returncode=code,seconds=time.monotonic()-start,path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest()));(s/'cost-builds.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,code,flush=True)
