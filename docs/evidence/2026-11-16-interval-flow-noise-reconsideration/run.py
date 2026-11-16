from pathlib import Path
import subprocess,os,json,time,sys
s=Path(__file__).parent;name=sys.argv[1];command=sys.argv[2:]
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/profile-typed-fraction/owner','CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'}
start=time.monotonic()
with (s/(name+'.log')).open('w') as out:p=subprocess.run(command,cwd='/mnt/development/interval-profile-static/csgrs',env=env,stdout=out,stderr=subprocess.STDOUT)
result={'command':command,'exit_code':p.returncode,'seconds':time.monotonic()-start};(s/(name+'.json')).write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result),flush=True);sys.exit(p.returncode)
