from pathlib import Path
import subprocess,os,sys,json,time
s=Path(__file__).parent;r=Path(json.loads((s/'initial.json').read_text())['root']);label=sys.argv[1];cmd=['cargo','+1.95.0','test','--locked','--manifest-path','crates/hypervoxel/Cargo.toml','-p','hypervoxel','--all-features','--test','field_envelope_admission','--test','field_path_batch'];env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/voxel-envelope-state-tests','CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'}
assert not (s/(label+'-tests.json')).exists();start=time.time()
with (s/(label+'-tests.log')).open('w') as log:code=subprocess.run(cmd,cwd=r,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=1200).returncode
(s/(label+'-tests.json')).write_text(json.dumps({'command':cmd,'cwd':str(r),'exit_code':code,'elapsed':time.time()-start,'head':subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()},indent=2)+'\n');print(label,code,flush=True);sys.exit(code)
