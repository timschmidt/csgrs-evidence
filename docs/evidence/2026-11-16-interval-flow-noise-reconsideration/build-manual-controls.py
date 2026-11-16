from pathlib import Path
import os,subprocess,json,shutil,time,hashlib,sys
s=Path(__file__).resolve().parent;label=sys.argv[1];env=os.environ.copy();env.update(CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/profile-typed-fraction/owner',CARGO_BUILD_JOBS='16',CARGO_TERM_COLOR='never')
rows=[]
for variant,features in [('time','noise'),('allocation','noise,allocation')]:
 args=['cargo','+1.95.0','build','--locked','--release','--manifest-path',str(s/'cost-probe/Cargo.toml'),'--features',features];start=time.time()
 with (s/(label+'-'+variant+'-build.log')).open('w') as log:r=subprocess.run(args,env=env,stdout=log,stderr=subprocess.STDOUT)
 row=dict(command=args,exit_code=r.returncode,elapsed_seconds=time.time()-start)
 if not r.returncode:
  source=Path(env['CARGO_TARGET_DIR'])/'release/flow-noise-cost-probe';dst=Path('/mnt/development/.interval-refactor-build')/('noise-reconsideration-'+label+'-'+variant);shutil.copy2(source,dst);row.update(path=str(dst),bytes=dst.stat().st_size,sha256=hashlib.file_digest(dst.open('rb'),'sha256').hexdigest())
 rows.append(row);(s/(label+'-control-builds.json')).write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(row),flush=True)
 if r.returncode:break
