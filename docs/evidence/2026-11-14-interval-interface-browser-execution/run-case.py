from pathlib import Path
import subprocess,json,os,time,sys
p=Path(__file__).parent
mode=sys.argv[1];name='cached-'+mode
assert mode in ('single','reattach','repeat','confirm-recovery')
assert not (p/(name+'-run.json')).exists()
env=dict(os.environ,RUSTUP_TOOLCHAIN='1.95.0',CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/clock-migration-interface',CARGO_BUILD_JOBS='3',CARGO_NET_OFFLINE='true')
cmd=['node','tests/browser/read-cached-job-result.mjs','9224',mode];t=time.monotonic()
r=subprocess.run(cmd,cwd='/mnt/development/alumina-interface-browser-execution',env=env,stdout=(p/(name+'.json')).open('w'),stderr=(p/(name+'-driver.log')).open('w'))
m={'command':cmd,'returncode':r.returncode,'seconds':time.monotonic()-t};(p/(name+'-run.json')).write_text(json.dumps(m,indent=2)+'\n');print(m)
sys.exit(r.returncode)
