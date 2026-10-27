from pathlib import Path
import hashlib,importlib.util,json,subprocess,sys,time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-point-replay')
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py');evidence=importlib.util.module_from_spec(spec);spec.loader.exec_module(evidence)
source,files,_=evidence.source_snapshot()
assert source==json.loads((root/'point-replay-fork.json').read_text())['source']
previous=json.loads((root/'chord-replay-prototype5-files-before.json').read_text())
for name,mode,digest in previous:
 if name.startswith('crates/hypercurve/src/') or name in ['Cargo.toml','Cargo.lock','rust-toolchain.toml','crates/hypercurve/Cargo.toml']:
  assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
prior=json.loads((root/'circle-replay-next-baseline.json').read_text());lib=Path(prior['library']);libhash=hashlib.sha256(lib.read_bytes()).hexdigest();assert libhash==prior['library_sha256']
filename=root/'point-replay-next-baseline.rs';binary=root/'point-replay-next-baseline'
command=['rustc','+1.98.1','--edition=2024','-C','opt-level=3',str(filename),'--crate-name','point_replay_next_baseline','-L','dependency='+str(lib.parent),'--extern','hypercurve='+str(lib),'-o',str(binary)]
with (root/'point-replay-next-baseline-compile.log').open('w') as out:subprocess.run(command,stdout=out,stderr=subprocess.STDOUT,check=True,timeout=120)
started=time.time()
with (root/'point-replay-next-baseline.log').open('w') as out:r=subprocess.run([str(binary)],stdout=out,stderr=subprocess.STDOUT,timeout=120)
assert r.returncode==101
assert 'the retained line piece must replay its selected supporting-line intersection endpoint' in (root/'point-replay-next-baseline.log').read_text()
assert evidence.source_snapshot()[0]==source and hashlib.sha256(lib.read_bytes()).hexdigest()==libhash
record={'source':source,'library':str(lib),'library_sha256':libhash,'matching_prototype5_implementation_bytes':True,'source_file':str(filename),'source_sha256':hashlib.sha256(filename.read_bytes()).hexdigest(),'compile_command':command,'run_command':[str(binary)],'binary_sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'exit_code':r.returncode,'elapsed_seconds':time.time()-started,'source_stable':True,'parent_qualification_still_running':True}
(root/'point-replay-next-baseline.json').write_text(json.dumps(record,indent=2)+'\n');print((root/'point-replay-next-baseline.log').read_text())
