import subprocess,sys,os,json,time
from pathlib import Path
s=Path(__file__).parent
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/matrix-scale-portable','CARGO_BUILD_JOBS':'12','CARGO_NET_OFFLINE':'true'}
checks=[('msrv-tests',['cargo','+1.88.0','test','--locked','-p','hyperlattice-interval','--no-default-features','--features','fixed,dyadic,float-enclosure,serde']),('msrv-clippy',['cargo','+1.88.0','clippy','--locked','-p','hyperlattice-interval','--all-targets','--no-default-features','--features','fixed,dyadic,float-enclosure,serde','--','-D','warnings'])]
for rust in ['1.88.0','1.95.0']:
 for target in ['thumbv7em-none-eabihf','wasm32-unknown-unknown']:
  for features in ['fixed,float-enclosure,serde','dyadic,serde']:
   checks.append((rust+'-'+target+'-'+features.replace(',','-'),['cargo','+'+rust,'check','--locked','-p','hyperlattice-interval','--no-default-features','--target',target,'--features',features]))
for label,cmd in checks:
 start=time.monotonic()
 with (s/(label+'.log')).open('w') as out:r=subprocess.run(cmd,env=env,stdout=out,stderr=subprocess.STDOUT)
 result={'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-start,'target_dir':env['CARGO_TARGET_DIR']}
 (s/(label+'.json')).write_text(json.dumps(result,indent=2)+'\n');print(label,r.returncode,flush=True)
 if r.returncode:print((s/(label+'.log')).read_text()[-2000:]);sys.exit(r.returncode)
