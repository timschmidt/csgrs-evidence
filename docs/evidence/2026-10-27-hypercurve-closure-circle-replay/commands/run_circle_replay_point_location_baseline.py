from pathlib import Path
import hashlib,json,subprocess,time
root=Path(__file__).resolve().parent
prior=json.loads((root/'circle-replay-unchanged-t-baseline.json').read_text());lib=Path(prior['library'])
assert hashlib.sha256(lib.read_bytes()).hexdigest()==prior['library_sha256']
source=root/'circle-replay-point-location-baseline.rs';binary=root/'circle-replay-point-location-baseline'
cmd=['rustc','+1.98.1','--edition=2024','-C','opt-level=3',str(source),'--crate-name','circle_point_baseline','-L','dependency='+str(lib.parent),'--extern','hypercurve='+str(lib),'-o',str(binary)]
with (root/'circle-replay-point-location-baseline-compile.log').open('w') as log:subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,check=True,timeout=120)
start=time.time()
with (root/'circle-replay-point-location-baseline.log').open('w') as log:r=subprocess.run([str(binary)],stdout=log,stderr=subprocess.STDOUT,timeout=120)
assert r.returncode==101
assert 'selected-circle incidence must consume a retained algebraic point' in (root/'circle-replay-point-location-baseline.log').read_text()
(root/'circle-replay-point-location-baseline.json').write_text(json.dumps({'parent_library':str(lib),'parent_library_sha256':prior['library_sha256'],'source_file':source.name,'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'compile_command':cmd,'run_command':[str(binary)],'exit_code':r.returncode,'elapsed_seconds':time.time()-start,'predates_circle_codec':True},indent=2)+'\n')
print((root/'circle-replay-point-location-baseline.log').read_text())
