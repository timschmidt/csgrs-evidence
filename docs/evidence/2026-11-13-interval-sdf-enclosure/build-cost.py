from pathlib import Path
import subprocess,json,hashlib,shutil,os,time
s=Path('/tmp/interval-refactor/sdf-enclosure');root=Path('/mnt/development/csgrs-sdf-enclosure');art=Path('/mnt/development/.interval-refactor-build/sdf-enclosure-artifacts');art.mkdir(exist_ok=True)
tracked=subprocess.check_output(['git','diff','--name-only'],cwd=root,text=True).splitlines();saved={p:(root/p).read_bytes() for p in tracked}
env=dict(os.environ,CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/sdf-enclosure',CARGO_BUILD_JOBS='4');rows=[]
def build(label,cmd,target,cwd=root,environment=env):
 start=time.monotonic()
 with (s/f'{label}-build.jsonl').open('w') as out,(s/f'{label}-build.log').open('w') as err:
  r=subprocess.run(cmd,cwd=cwd,env=environment,stdout=out,stderr=err)
 row=dict(name=label,command=cmd,cwd=str(cwd),target_dir=environment['CARGO_TARGET_DIR'],returncode=r.returncode,seconds=time.monotonic()-start)
 if r.returncode==0:
  messages=[json.loads(l) for l in (s/f'{label}-build.jsonl').read_text().splitlines() if l.startswith('{')]
  paths=[m['executable'] for m in messages if m.get('reason')=='compiler-artifact' and m.get('target',{}).get('name')==target and m.get('executable')];assert len(paths)==1
  dest=art/label;shutil.copy2(paths[0],dest);row.update(path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest())
 rows.append(row);(s/'builds.json').write_text(json.dumps(rows,indent=2)+'\n');print(label,r.returncode,flush=True);assert r.returncode==0
cmd=['cargo','+1.95.0','bench','--locked','-p','hypersdf','--bench','classification','--no-run','--message-format=json']
try:
 for p in tracked:(root/p).write_bytes(subprocess.check_output(['git','show','HEAD:'+p],cwd=root))
 build('baseline-default',cmd,'classification')
finally:
 for p,data in saved.items():(root/p).write_bytes(data)
for row in json.loads((s/'final-source.json').read_text()):assert hashlib.sha256((root/row['path']).read_bytes()).hexdigest()==row['sha256']
build('candidate-default',cmd,'classification')
(s/'default-artifact-comparison.json').write_text(json.dumps({'byte_identical':(art/'baseline-default').read_bytes()==(art/'candidate-default').read_bytes(),'baseline_bytes':rows[0]['bytes'],'candidate_bytes':rows[1]['bytes']},indent=2)+'\n')
build('consumer-probe',['cargo','+1.95.0','build','--release','--message-format=json'],'sdf-enclosure-probe',s/'probe',dict(env,CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/sdf-enclosure-probe'))
