import subprocess,json,time,os
from pathlib import Path
out=Path('/tmp/interval-refactor/authored-center-radius')
base=['test','--locked','-p','hyperlattice-interval','--test','centered','--test','centered_replay','--test','centered_no_alloc']
commands=[
(['cargo','+1.88.0',*base,'--no-default-features','--features','fixed,float-enclosure,dyadic,serde'],{}),
(['cargo','+1.95.0',*base,'--all-features'],{}),
(['cargo','+1.95.0',*base,'--all-features','--release'],{}),
(['cargo','+stable',*base,'--all-features'],{}),
(['cargo','+1.95.0','clippy','--locked','-p','hyperlattice-interval','--all-features','--all-targets','--','-D','warnings'],{}),
(['cargo','+nightly',*base,'--all-features','--target','x86_64-unknown-linux-gnu'],dict(RUSTFLAGS='-Zsanitizer=address',CARGO_TARGET_DIR='/tmp/interval-refactor/authored-center-radius-asan')),
(['cargo','+1.95.0',*base,'--all-features','--message-format=json'],dict(RUSTFLAGS='-Cinstrument-coverage',LLVM_PROFILE_FILE='/tmp/interval-refactor/authored-center-radius-profiles/%p-%m.profraw',CARGO_TARGET_DIR='/tmp/interval-refactor/authored-center-radius-coverage')),
]
rows=[]
for i,(cmd,env) in enumerate(commands):
 start=time.monotonic()
 with (out/f'focused-{i:02}.log').open('w') as f:p=subprocess.run(cmd,env=os.environ|env,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(command=cmd,environment=env,exit=p.returncode,seconds=time.monotonic()-start,log=f'focused-{i:02}.log'))
 (out/'focused-checks.json').write_text(json.dumps(rows,indent=2)+'\n')
 print(i,p.returncode,flush=True)
 if p.returncode:break
