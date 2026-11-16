from pathlib import Path
import subprocess,sys,os,json,time,shutil,hashlib
s=Path(__file__).parent;r=Path(json.loads((s/'initial.json').read_text())['root']);label=sys.argv[1];p=s/'probe';target=Path('/mnt/development/.interval-refactor-build/voxel-envelope-state');art=Path('/mnt/development/.interval-refactor-build/voxel-envelope-state-artifacts');art.mkdir(exist_ok=True)
assert not (s/(label+'-build.json')).exists()
env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'};cmd=['cargo','+1.95.0','build','--locked','--release','--manifest-path',str(p/'Cargo.toml')];start=time.time()
with (s/(label+'-build.log')).open('w') as log:pcode=subprocess.run(cmd,cwd=r,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=1200).returncode
record={'command':cmd,'cwd':str(r),'head':subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip(),'patch_sha256':hashlib.sha256(subprocess.check_output(['git','diff'],cwd=r)).hexdigest(),'source_sha256':hashlib.sha256((r/'crates/hypervoxel/src/field.rs').read_bytes()).hexdigest(),'environment':{k:env.get(k) for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE','RUSTFLAGS','CARGO_ENCODED_RUSTFLAGS']},'elapsed':time.time()-start,'exit_code':pcode}
if pcode==0:
 binary=art/label;shutil.copyfile(target/'release/voxel-envelope-resources',binary);binary.chmod(0o755);record.update(binary=str(binary),sha256=hashlib.sha256(binary.read_bytes()).hexdigest())
(s/(label+'-build.json')).write_text(json.dumps(record,indent=2)+'\n');print(label,pcode,flush=True);sys.exit(pcode)
