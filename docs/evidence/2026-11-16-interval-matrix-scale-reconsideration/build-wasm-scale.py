from pathlib import Path
import subprocess,os,sys,shutil,json,time
s=Path(__file__).parent;p=s/'wasm-scale-probe';label=sys.argv[1]
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/matrix-scale-wasm-probe','CARGO_BUILD_JOBS':'8','CARGO_NET_OFFLINE':'true'}
cmd=['cargo','+1.95.0','build','--release','--manifest-path',str(p/'Cargo.toml'),'--target','wasm32-unknown-unknown']
if label=='candidate':cmd+=['--locked','--features','shared']
start=time.monotonic()
with (s/(label+'-wasm-scale-build.log')).open('w') as out:r=subprocess.run(cmd,env=env,stdout=out,stderr=subprocess.STDOUT)
(s/(label+'-wasm-scale-build.json')).write_text(json.dumps({'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-start},indent=2)+'\n')
if r.returncode:print((s/(label+'-wasm-scale-build.log')).read_text()[-1500:]);sys.exit(r.returncode)
shutil.copy2(Path(env['CARGO_TARGET_DIR'])/'wasm32-unknown-unknown/release/matrix_scale_wasm.wasm',Path('/mnt/development/.interval-refactor-build/matrix-scale-reconsideration/artifacts')/(label+'-matrix-scale.wasm'))
print(label,'wasm scale built')
