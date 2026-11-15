from pathlib import Path
import subprocess,json,shutil,os,time,hashlib
stage=Path(__file__).parent
repo=Path('/mnt/development/csgrs-sdf-voxel-enclosures')
def git(*args):return subprocess.check_output(['git','-C',str(repo),*args])
tracked=git('diff','--name-only').decode().splitlines();new=git('ls-files','--others','--exclude-standard').decode().splitlines()
assert all(p.startswith('crates/hypersdf/') for p in tracked+new)
snapshot=stage/'candidate-source';snapshot.mkdir()
for name in tracked+new:
 p=snapshot/name;p.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(repo/name,p)
patch=git('diff','--binary');(stage/'candidate.patch').write_bytes(patch)
env=os.environ.copy();env['CARGO_BUILD_JOBS']='12';env['CARGO_TARGET_DIR']='/mnt/development/.interval-refactor-build/sdf-voxel-enclosures-msrv'
cmd=['cargo','+1.95.0','bench','--locked','-p','hypersdf','--all-features','--bench','classification','--no-run','--message-format=json']
def build(kind):
 start=time.monotonic()
 with (stage/(kind+'-bench-build.jsonl')).open('w') as output,(stage/(kind+'-bench-build.log')).open('w') as errors:
  r=subprocess.run(cmd,cwd=repo,env=env,stdout=output,stderr=errors)
 assert r.returncode==0,kind
 records=[json.loads(line) for line in (stage/(kind+'-bench-build.jsonl')).read_text().splitlines() if line.startswith('{')]
 artifact=next(row for row in records if row.get('reason')=='compiler-artifact' and row.get('target',{}).get('name')=='classification' and row.get('executable'))
 binary=Path(artifact['executable']);shutil.copy2(binary,stage/(kind+'-bench'))
 record={'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-start,'binary':str(binary),'bytes':binary.stat().st_size,'sha256':hashlib.sha256(binary.read_bytes()).hexdigest()}
 (stage/(kind+'-bench.json')).write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record),flush=True)
try:
 git('restore','--source=HEAD','--worktree','--',*tracked)
 for name in new:(repo/name).unlink()
 build('baseline')
finally:
 for name in tracked+new:
  p=repo/name;p.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(snapshot/name,p)
 assert git('diff','--binary')==patch
build('candidate')
