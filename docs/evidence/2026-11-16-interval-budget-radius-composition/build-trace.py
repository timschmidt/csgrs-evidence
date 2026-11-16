from pathlib import Path
import os,subprocess,json,time,hashlib,shutil,sys
s=Path(__file__).parent;label=sys.argv[1];target=Path('/mnt/development/.interval-refactor-build/budget-radius-composition/trace');artifact=target.parent/'artifacts';artifact.mkdir(parents=True,exist_ok=True)
cmd=['cargo','+1.95.0','build','--locked','--release','--manifest-path',str(s/'trace-probe/Cargo.toml')];start=time.monotonic()
with (s/(label+'-trace-build.log')).open('w') as out:p=subprocess.run(cmd,cwd='/mnt/development/csgrs',env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'},stdout=out,stderr=subprocess.STDOUT)
assert p.returncode==0
exe=artifact/(label+'-machine-budget-trace');shutil.copy2(target/'release/machine-budget-trace',exe)
with (s/(label+'-trace-values.log')).open('w') as out:p=subprocess.run([str(exe)],stdout=out,stderr=subprocess.STDOUT)
assert p.returncode==0
(s/(label+'-trace-build.json')).write_text(json.dumps({'command':cmd,'cwd':'/mnt/development/csgrs','seconds':time.monotonic()-start,'exit_code':0,'artifact':str(exe),'sha256':hashlib.sha256(exe.read_bytes()).hexdigest(),'bytes':exe.stat().st_size},indent=2)+'\n');print(label,'trace saved',flush=True)
