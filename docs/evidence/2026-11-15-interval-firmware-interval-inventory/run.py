from pathlib import Path
import os,subprocess,time,json,sys
s=Path(__file__).parent;label=sys.argv[1];cmd=sys.argv[2:];env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/firmware-clock-counter','CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'};start=time.monotonic()
with (s/(label+'.log')).open('w') as out:p=subprocess.run(cmd,env=env,stdout=out,stderr=subprocess.STDOUT)
x={'command':cmd,'cwd':str(Path.cwd()),'exit_code':p.returncode,'seconds':time.monotonic()-start};(s/(label+'.json')).write_text(json.dumps(x,indent=2)+'\n');print(json.dumps(x));print((s/(label+'.log')).read_text()[-3000:] if p.returncode else '');sys.exit(p.returncode)
