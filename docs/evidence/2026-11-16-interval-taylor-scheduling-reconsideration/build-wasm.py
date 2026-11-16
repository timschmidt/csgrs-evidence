from pathlib import Path
import subprocess,os,sys,shutil,time,json
s=Path(__file__).parent;label=sys.argv[1];manifest=s/'wasm-probe/Cargo.toml'
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/taylor-scheduling-reconsideration/wasm','CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'}
if not (manifest.parent/'Cargo.lock').exists():subprocess.run(['cargo','+1.95.0','generate-lockfile','--offline','--manifest-path',str(manifest)],env=env,check=True)
command=['cargo','+1.95.0','build','--locked','--release','--target','wasm32-unknown-unknown','--manifest-path',str(manifest)];start=time.monotonic()
with (s/(label+'-wasm-build.log')).open('w') as out:p=subprocess.run(command,env=env,stdout=out,stderr=subprocess.STDOUT)
(s/(label+'-wasm-build.json')).write_text(json.dumps({'command':command,'exit_code':p.returncode,'seconds':time.monotonic()-start},indent=2)+'\n');assert p.returncode==0
shutil.copy2(Path(env['CARGO_TARGET_DIR'])/'wasm32-unknown-unknown/release/coefficients_wasm_probe.wasm',Path('/mnt/development/.interval-refactor-build/taylor-scheduling-reconsideration/artifacts')/(label+'-coefficients.wasm'))
