import os,subprocess,time,json,sys
from pathlib import Path
s=Path(__file__).parent;label=sys.argv[1];cmd=sys.argv[2:];start=time.monotonic()
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/interval-coverage-closure-tests','CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'}
with (s/(label+'.log')).open('w') as out:p=subprocess.run(cmd,env=env,stdout=out,stderr=subprocess.STDOUT)
r={'command':cmd,'cwd':os.getcwd(),'exit_code':p.returncode,'seconds':time.monotonic()-start};(s/(label+'.json')).write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r));print((s/(label+'.log')).read_text()[-4000:] if p.returncode else '');sys.exit(p.returncode)
