from pathlib import Path
import json,subprocess,os,time,sys
s=Path(__file__).parent;r=Path('/mnt/development/interval-jacobian-context/csgrs');label=sys.argv[1];cmd=sys.argv[2:];env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/dyadic-quotient-current','CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'};start=time.time()
patch=subprocess.check_output(['git','diff','--binary'],cwd=r);(s/(label+'.patch')).write_bytes(patch)
with (s/(label+'.log')).open('w') as log:
 try:code=subprocess.run(cmd,cwd=r,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=1800).returncode
 except subprocess.TimeoutExpired:code=124
(s/(label+'.json')).write_text(json.dumps({'command':cmd,'cwd':str(r),'exit_code':code,'elapsed':time.time()-start,'environment':{k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE']}},indent=2)+'\n');print(label,code);print((s/(label+'.log')).read_text()[-4000:])
