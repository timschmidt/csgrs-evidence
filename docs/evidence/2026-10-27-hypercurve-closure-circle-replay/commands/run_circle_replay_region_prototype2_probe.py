from pathlib import Path
import hashlib,json,subprocess,time
root=Path(__file__).resolve().parent
lib=Path('/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-circle-replay-admission/release/deps/libhypercurve-aea14b5efa8be1b7.rlib');prior={'library_sha256':hashlib.sha256(lib.read_bytes()).hexdigest()}
source=root/'circle-replay-region-probe.rs';binary=root/'circle-replay-region-prototype2-probe'
cmd=['rustc','+1.98.1','--edition=2024','-C','opt-level=3',str(source),'--crate-name','circle_region_prototype2_probe','-L','dependency='+str(lib.parent),'--extern','hypercurve='+str(lib),'-o',str(binary)]
with (root/'circle-replay-region-prototype2-probe-compile.log').open('w') as log:subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,check=True,timeout=120)
start=time.time()
with (root/'circle-replay-region-prototype2-probe.log').open('w') as log:
 try:r=subprocess.run([str(binary),'--replay'],stdout=log,stderr=subprocess.STDOUT,timeout=120);code=r.returncode
 except subprocess.TimeoutExpired:code='external_timeout'
(root/'circle-replay-region-prototype2-probe.json').write_text(json.dumps({'parent_library':str(lib),'parent_library_sha256':prior['library_sha256'],'source_file':source.name,'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'compile_command':cmd,'run_command':[str(binary),'--replay'],'exit_code':code,'elapsed_seconds':time.time()-start,'external_timeout_seconds':120},indent=2)+'\n')
print((root/'circle-replay-region-prototype2-probe.log').read_text());print('parent region probe',code)
