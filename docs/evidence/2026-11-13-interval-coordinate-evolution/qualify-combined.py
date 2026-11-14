from pathlib import Path
import subprocess,os,time,json
s=Path('/tmp/interval-refactor/coordinate-evolution');root='/mnt/development/csgrs'
env=dict(os.environ,CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/dynamics-replay-inline',CARGO_BUILD_JOBS='4',HYPERREAL_SKIP_BENCHMARK_REPORTS='1')
base=['cargo','+1.95.0']; commands=[
('combined-owner',base+['test','--locked','-p','hyperdynamics','--all-features','--all-targets']),
('combined-routing',base+['test','--locked','-p','hyperpath','--features','dispatch-trace','--lib','routing::']),
('combined-axis',base+['test','--locked','-p','hyperpath','--features','dispatch-trace','--test','axis_projection_migration']),
('combined-clippy',base+['clippy','--locked','-p','hyperdynamics','--all-features','--all-targets','--','-D','warnings']),
('combined-format',base+['fmt','--all','--','--check']),
('combined-diff',['git','diff','--check'])]
rows=[]
for name,cmd in commands:
 start=time.monotonic()
 with (s/f'{name}.log').open('w') as out:
  result=subprocess.run(cmd,cwd=root,env=dict(env,RUSTDOCFLAGS='-D warnings') if name=='docs' else env,stdout=out,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,returncode=result.returncode,seconds=time.monotonic()-start));(s/'combined-qualification.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,result.returncode,flush=True)
 if result.returncode:break
