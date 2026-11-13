from pathlib import Path
import subprocess,time,json,os
out=Path('/tmp/interval-refactor/dynamics-feed-join');env=os.environ.copy();env['RUSTFLAGS']='-Zsanitizer=address';env['CARGO_TARGET_DIR']='/tmp/interval-refactor/authored-center-radius-asan'
commands=[['cargo','+nightly','test','--locked','--target','x86_64-unknown-linux-gnu','-p','hyperdynamics','--all-features','--test','feed_join_admission'],['cargo','+nightly','test','--locked','--target','x86_64-unknown-linux-gnu','-p','hyperpath','--all-features','--lib','routing::feed_join_migration']]
rows=[]
for i,c in enumerate(commands):
 start=time.monotonic()
 with (out/f'asan-{i}.log').open('w') as f:r=subprocess.run(c,env=env,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(command=c,environment={k:env[k] for k in ['RUSTFLAGS','CARGO_TARGET_DIR']},exit=r.returncode,seconds=time.monotonic()-start));(out/'asan.json').write_text(json.dumps(rows,indent=2)+'\n');print(i,r.returncode,flush=True)
 if r.returncode:break
