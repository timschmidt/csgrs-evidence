from pathlib import Path
import subprocess,os,shutil,json,hashlib
out=Path('/tmp/csgrs-r06-field-schedules-traces');out.mkdir()
env={**os.environ,'CCACHE_DISABLE':'1','CARGO_INCREMENTAL':'0','CARGO_BUILD_JOBS':'2','CARGO_TARGET_DIR':'/tmp/csgrs-r06-native-cost-target'}
for v in ['baseline','candidate']:
 cmd=['cargo','build','--offline','--locked','--release','--manifest-path','/tmp/csgrs-r06-field-cost-'+v+'/Cargo.toml','--features','trace','--bin','trace']
 with (out/(v+'-build.log')).open('w') as log:subprocess.run(cmd,env=env,stdout=log,stderr=subprocess.STDOUT,check=True)
 shutil.copy2('/tmp/csgrs-r06-native-cost-target/release/trace',out/(v+'.bin'))
 for case in ['rational3','swapped3','singular3','pivot_free2','pivot_free3','pivot_free4','bezout2','bezout3','bezout4']:
  with (out/(v+'-'+case+'.json')).open('w') as log:subprocess.run([str(out/(v+'.bin')),case],stdout=log,check=True)
for case in ['rational3','swapped3','singular3','pivot_free2','pivot_free3','pivot_free4','bezout2','bezout3','bezout4']:
 a=json.loads((out/('baseline-'+case+'.json')).read_text());b=json.loads((out/('candidate-'+case+'.json')).read_text());assert a==b,(case,a,b)
print('All six exact outcome, dispatch and rational-stat snapshots match.',flush=True)
