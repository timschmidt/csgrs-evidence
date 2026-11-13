from pathlib import Path
import subprocess,json,os,time,re,shutil,hashlib
p=Path(__file__).parent;root=Path('/mnt/development/csgrs-machine-profile-costs');env=os.environ.copy();env['RUSTUP_TOOLCHAIN']='1.95.0';env['CARGO_TARGET_DIR']='/tmp/interval-refactor/machine-profile-regression-target';records=[]
paths=['crates/hyperreal/src/rational/arithmetic/construction.rs','crates/hyperinterval/src/rational.rs']
def run(name,cmd):
 start=time.monotonic()
 with p.joinpath(name+'.log').open('w') as f:q=subprocess.run(cmd,cwd=root,env=env,stdout=f,stderr=subprocess.STDOUT)
 records.append(dict(name=name,command=cmd,cwd=str(root),environment={'RUSTUP_TOOLCHAIN':env['RUSTUP_TOOLCHAIN'],'CARGO_TARGET_DIR':env['CARGO_TARGET_DIR']},returncode=q.returncode,seconds=time.monotonic()-start));p.joinpath('regression-builds.json').write_text(json.dumps(records,indent=2)+'\n');print(name,q.returncode,flush=True);assert q.returncode==0
try:
 for variant in ['baseline','candidate']:
  for name in paths:
   data=subprocess.check_output(['git','show','HEAD:'+name],cwd=root) if variant=='baseline' else p.joinpath('final-source/csgrs',name).read_bytes();root.joinpath(name).write_bytes(data)
  run(variant+'-successive-build',['python3','scripts/successive-operations.py','build','--output',str(p/(variant+'-successive-build'))])
  run(variant+'-borrowed-build',['cargo','bench','--locked','-p','hyperreal','--bench','borrowed_ops','--no-run'])
  s=p.joinpath(variant+'-borrowed-build.log').read_text();m=re.search(r'Executable benches/borrowed_ops.rs \(([^)]+)\)',s);assert m,s
  src=Path(m[1]);dest=Path('/tmp/interval-refactor/machine-profile-binaries')/('unsigned-'+variant+'-borrowed');shutil.copy2(src,dest)
  p.joinpath(variant+'-borrowed-binary.json').write_text(json.dumps(dict(path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest()),indent=2)+'\n')
finally:
 for name in paths:root.joinpath(name).write_bytes(p.joinpath('final-source/csgrs',name).read_bytes())
 print('regression worktree contains typed candidate code',flush=True)
