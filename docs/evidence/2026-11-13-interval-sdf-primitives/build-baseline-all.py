from pathlib import Path
import subprocess,json,hashlib,shutil,os,time
s=Path('/tmp/interval-refactor/sdf-primitives');root=Path('/mnt/development/csgrs-sdf-primitives');art=Path('/mnt/development/.interval-refactor-build/sdf-primitives-artifacts');art.mkdir(exist_ok=True)
tracked=subprocess.check_output(['git','diff','--name-only'],cwd=root,text=True).splitlines();saved={p:(root/p).read_bytes() for p in tracked}
env=dict(os.environ,CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/sdf-primitives',CARGO_BUILD_JOBS='4');rows=[]
def build(label,cmd,target,cwd=root,environment=env):
 start=time.monotonic()
 with (s/f'{label}-build.jsonl').open('w') as out,(s/f'{label}-build.log').open('w') as err:
  r=subprocess.run(cmd,cwd=cwd,env=environment,stdout=out,stderr=err)
 row=dict(name=label,command=cmd,cwd=str(cwd),target_dir=environment['CARGO_TARGET_DIR'],returncode=r.returncode,seconds=time.monotonic()-start)
 if r.returncode==0:
  messages=[json.loads(l) for l in (s/f'{label}-build.jsonl').read_text().splitlines() if l.startswith('{')]
  paths=[m['executable'] for m in messages if m.get('reason')=='compiler-artifact' and m.get('target',{}).get('name')==target and m.get('executable')];assert len(paths)==1
  dest=art/label;shutil.copy2(paths[0],dest);row.update(path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest())
 rows.append(row);(s/'baseline-all-builds.json').write_text(json.dumps(rows,indent=2)+'\n');print(label,r.returncode,flush=True);assert r.returncode==0
baseline='03d28081d4f5f9e21cb1cce1f0dce4cbc2b6f050'
try:
 for p in tracked:(root/p).write_bytes(subprocess.check_output(['git','show',baseline+':'+p],cwd=root))
 build('baseline-all-legacy',['cargo','+1.95.0','build','--offline','--release','--bin','sdf-enclosure-probe','--message-format=json'],'sdf-enclosure-probe',s/'probe',dict(env,CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/sdf-primitives-probe'))
finally:
 for p,data in saved.items():(root/p).write_bytes(data)
