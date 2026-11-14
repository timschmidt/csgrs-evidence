from pathlib import Path
import subprocess,os,time,json
s=Path('/tmp/interval-refactor/predicate-filters');root='/mnt/development/csgrs-predicate-filters'
env=dict(os.environ,CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/sdf-primitives',CARGO_BUILD_JOBS='4',HYPERREAL_SKIP_BENCHMARK_REPORTS='1')
base=['cargo','+1.95.0']; commands=[
('owner',base+['test','--locked','-p','hyperlimit','--all-features']),
('clippy',base+['clippy','--locked','-p','hyperlimit','--all-features','--all-targets','--','-D','warnings']),
('docs',base+['doc','--locked','-p','hyperlimit','--all-features','--no-deps']),
('wasm',base+['check','--locked','-p','hyperlimit','--all-features','--target','wasm32-unknown-unknown']),
('default',base+['test','--locked','-p','hyperlimit','--no-default-features']),
('format',base+['fmt','--all','--','--check']),
('diff',['git','diff','--check'])]
rows=[]
for name,cmd in commands:
 start=time.monotonic()
 with (s/f'{name}.log').open('w') as out:
  result=subprocess.run(cmd,cwd=root,env=dict(env,RUSTDOCFLAGS='-D warnings') if name=='docs' else env,stdout=out,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,returncode=result.returncode,seconds=time.monotonic()-start));(s/'qualification.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,result.returncode,flush=True)
 if result.returncode:break
