from pathlib import Path
import os,subprocess,shutil,tomllib,json
root=Path('/home/tim/Documents/GitHub/workspace/csgrs');key=lambda p:(p['name'],p['version'],p.get('source'))
locked=set(map(key,tomllib.loads((root/'Cargo.lock').read_text())['package']))
env={**os.environ,'CCACHE_DISABLE':'1','CARGO_INCREMENTAL':'0','CARGO_BUILD_JOBS':'2','CARGO_TARGET_DIR':'/tmp/csgrs-r06-native-cost-target'}
for v in ['baseline','candidate']:
 app=Path('/tmp/csgrs-r06-field-cost-'+v)
 actual=set(map(key,tomllib.loads((app/'Cargo.lock').read_text())['package']))
 assert actual-locked=={('csgrs-r06-field-cost','0.0.0',None)},actual-locked
 command=['cargo','build','--offline','--locked','--release','--manifest-path',str(app/'Cargo.toml'),'--bin','csgrs-r06-field-cost']
 with open('/tmp/csgrs-r06-field-cost-'+v+'-final-build.log','w') as log:subprocess.run(command,env=env,stdout=log,stderr=subprocess.STDOUT,check=True)
 shutil.copyfile('/tmp/csgrs-r06-native-cost-target/release/csgrs-r06-field-cost','/tmp/csgrs-r06-field-'+v+'.bin')
 Path('/tmp/csgrs-r06-field-'+v+'.bin').chmod(0o700)
 print(v,'built',flush=True)
