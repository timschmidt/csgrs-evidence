from pathlib import Path
import os,subprocess,time,json
s=Path(__file__).resolve().parent;env=os.environ.copy();env.update(CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/workspace-qualification',CARGO_BUILD_JOBS='12',CARGO_TERM_COLOR='never')
args=['cargo','+stable','test','--locked','-p','hyperdynamics','--all-features']
start=time.time()
with (s/'baseline-owner.log').open('w') as log:
 p=subprocess.run(args,cwd='/mnt/development/csgrs-flow-noise-evolution',env=env,stdout=log,stderr=subprocess.STDOUT,timeout=3600)
r=dict(command=args,exit_code=p.returncode,elapsed_seconds=time.time()-start,source_revision='2bf1c6481f68ea7cdb0c696f768c22264deaa36a',pending_extraction_applied=False)
(s/'baseline-owner.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r),flush=True)
