from pathlib import Path
import subprocess,os,shutil,json,time
rows=[];env={**os.environ,'CCACHE_DISABLE':'1','CARGO_INCREMENTAL':'0','CARGO_BUILD_JOBS':'2','CARGO_TARGET_DIR':'/tmp/csgrs-r06-native-cost-target'}
for variant in ['baseline','candidate']:
 started=time.time();cmd=['cargo','build','--offline','--locked','--release','--manifest-path','/tmp/csgrs-r30-cost-'+variant+'/Cargo.toml']
 with open('/tmp/csgrs-r30-cost-'+variant+'-accepted-build.log','w') as log:r=subprocess.run(cmd,env=env,stdout=log,stderr=subprocess.STDOUT)
 rows.append({'variant':variant,'command':cmd,'exit_code':r.returncode,'elapsed':time.time()-started});Path('/tmp/csgrs-r30-cost-build-accepted-results.json').write_text(json.dumps(rows,indent=2)+'\n')
 if r.returncode:raise SystemExit(r.returncode)
 shutil.copy2('/tmp/csgrs-r06-native-cost-target/release/csgrs-r30-cost','/tmp/csgrs-r30-'+variant+'.bin')
 print(variant,'built',flush=True)
