from pathlib import Path
import subprocess,os,json,shutil,hashlib,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-voxel-affine-enclosures')
def git(*args):return subprocess.check_output(['git','-C',str(r),*args])
paths=git('diff','--name-only').decode().splitlines();saved={p:(r/p).read_bytes() for p in paths}
(s/'candidate.patch').write_bytes(git('diff','--binary'))
for p,data in saved.items():
 q=s/'candidate-source'/p;q.parent.mkdir(parents=True,exist_ok=True);q.write_bytes(data)
for p in git('ls-files','--others','--exclude-standard').decode().splitlines():
 q=s/'candidate-source'/p;q.parent.mkdir(parents=True,exist_ok=True);q.write_bytes((r/p).read_bytes())
legacy=r/'crates/hypervoxel/examples/affine_legacy_cost.rs';native=r/'crates/hypervoxel/examples/affine_native_cost.rs'
legacy.write_bytes((s/'legacy-cost.rs').read_bytes())
env=os.environ.copy();env['CARGO_BUILD_JOBS']='12';env['CARGO_TARGET_DIR']='/mnt/development/.interval-refactor-build/voxel-affine-enclosures-msrv'
def build(name,example):
 cmd=['cargo','+1.95.0','build','--release','--locked','--manifest-path','crates/hypervoxel/Cargo.toml','-p','hypervoxel','--all-features','--example',example,'--message-format=json']
 start=time.monotonic()
 with (s/(name+'.log')).open('w') as out:result=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=subprocess.STDOUT)
 assert result.returncode==0,name
 artifacts=[]
 for line in (s/(name+'.log')).read_text().splitlines():
  if line.startswith('{'):
   row=json.loads(line)
   if row.get('reason')=='compiler-artifact' and row.get('target',{}).get('name')==example and row.get('executable'):artifacts.append(row)
 assert len(artifacts)==1 and not artifacts[0]['fresh'],artifacts
 exe=Path(artifacts[0]['executable']);shutil.copyfile(exe,s/name);(s/name).chmod(0o755)
 record={'command':cmd,'cwd':str(r),'exit_code':result.returncode,'seconds':time.monotonic()-start,'binary':str(exe),'bytes':exe.stat().st_size,'sha256':hashlib.sha256(exe.read_bytes()).hexdigest(),'fresh':False}
 (s/(name+'.json')).write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record),flush=True)
try:
 for p in paths:(r/p).write_bytes(git('show','HEAD:'+p))
 build('baseline-legacy','affine_legacy_cost')
 for p,data in saved.items():(r/p).write_bytes(data)
 build('candidate-legacy','affine_legacy_cost')
 native.write_bytes((s/'native-cost.rs').read_bytes())
 build('candidate-native','affine_native_cost')
finally:
 for p,data in saved.items():(r/p).write_bytes(data)
 legacy.unlink(missing_ok=True);native.unlink(missing_ok=True)
