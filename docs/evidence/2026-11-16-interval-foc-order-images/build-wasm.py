from pathlib import Path
import subprocess,os,json,time,hashlib,shutil,sys
s=Path(__file__).parent;label=sys.argv[1];target=Path('/mnt/development/.interval-refactor-build/foc-order-images/probe-1.88.0');art=target.parent/'artifacts';cmd=['cargo','+1.88.0','build','--locked','--offline','--release','--lib','--target','wasm32-unknown-unknown','--manifest-path',str(s/'probe/Cargo.toml')];start=time.monotonic();env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'}
with (s/(label+'-wasm-build.log')).open('w') as out:p=subprocess.run(cmd,cwd='/mnt/development/csgrs',env=env,stdout=out,stderr=subprocess.STDOUT)
r={'command':cmd,'cwd':'/mnt/development/csgrs','exit_code':p.returncode,'seconds':time.monotonic()-start};assert p.returncode==0
exe=art/(label+'-foc.wasm');shutil.copy2(target/'wasm32-unknown-unknown/release/foc_order_probe.wasm',exe);r.update(path=str(exe),bytes=exe.stat().st_size,sha256=hashlib.sha256(exe.read_bytes()).hexdigest());(s/(label+'-wasm-artifact.json')).write_text(json.dumps(r,indent=2)+'\n')
with (s/(label+'-wasm-replay.json')).open('w') as out:subprocess.run(['/tmp/interval-refactor/tools/bin/python',str(s/'wasm-replay.py'),str(exe),str(s/(label+'-1.88.0-values.log'))],stdout=out,check=True)
print(label,'wasm',r['bytes'])
