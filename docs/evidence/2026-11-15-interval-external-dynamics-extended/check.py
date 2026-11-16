from pathlib import Path
import subprocess,time,json,sys,os
s=Path(__file__).parent;label=sys.argv[1];cmd=sys.argv[2:];t=time.monotonic()
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/external-dynamics','CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true','RUSTDOCFLAGS':'-D warnings','PYTHONDONTWRITEBYTECODE':'1'}
with (s/(label+'.log')).open('w') as f:p=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,env=env)
r={'command':cmd,'cwd':os.getcwd(),'exit_code':p.returncode,'seconds':time.monotonic()-t};(s/(label+'.json')).write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r));print((s/(label+'.log')).read_text()[-3000:]);sys.exit(p.returncode)
