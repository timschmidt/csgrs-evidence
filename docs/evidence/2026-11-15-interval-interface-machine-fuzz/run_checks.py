import os,subprocess,time,json,sys
from pathlib import Path
s=Path(__file__).parent;name=sys.argv[1];cmd=sys.argv[2:];env=os.environ.copy();env['CARGO_BUILD_JOBS']='12';env['PATH']='/tmp/interval-refactor/tools/bin:'+env['PATH'];env['CARGO_NET_OFFLINE']='true';env['CARGO_TARGET_DIR']='/mnt/development/.interval-refactor-build/interface-machine-fuzz';start=time.monotonic()
with (s/(name+'.log')).open('w') as out:r=subprocess.run(cmd,env=env,stdout=out,stderr=subprocess.STDOUT)
record={'command':cmd,'cwd':os.getcwd(),'exit_code':r.returncode,'seconds':time.monotonic()-start};(s/(name+'.json')).write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record));print((s/(name+'.log')).read_text()[-5000:] if r.returncode else '');sys.exit(r.returncode)
