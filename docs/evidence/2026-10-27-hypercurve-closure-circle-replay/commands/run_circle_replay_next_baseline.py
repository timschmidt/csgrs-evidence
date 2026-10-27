from pathlib import Path
import hashlib,importlib.util,json,os,signal,subprocess,sys,time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-chord-replay')
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py');evidence=importlib.util.module_from_spec(spec);spec.loader.exec_module(evidence)
source,files,patch=evidence.source_snapshot()
lib=Path('/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-chord-replay-admission/release/deps/libhypercurve-aea14b5efa8be1b7.rlib');libhash=hashlib.sha256(lib.read_bytes()).hexdigest()
filename=root/'circle-replay-next-baseline.rs';binary=root/'circle-replay-next-baseline'
command=['rustc','+1.98.1','--edition=2024','-C','opt-level=3',str(filename),'--crate-name','circle_replay_next_baseline','-L','dependency='+str(lib.parent),'--extern','hypercurve='+str(lib),'-o',str(binary)]
with (root/'circle-replay-next-baseline-compile.log').open('w') as out:subprocess.run(command,stdout=out,stderr=subprocess.STDOUT,check=True,timeout=120)
started=time.time()
with (root/'circle-replay-next-baseline.log').open('w') as out:
 p=subprocess.Popen([str(binary)],stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
 try:code=p.wait(timeout=120)
 except subprocess.TimeoutExpired:
  os.killpg(p.pid,signal.SIGKILL);p.wait();code='external_timeout'
assert hashlib.sha256(lib.read_bytes()).hexdigest()==libhash
assert evidence.source_snapshot()[0]==source
record={'source':source,'source_files':files,'library':str(lib),'library_sha256':libhash,'build':'chord-replay-prototype5-build.jsonl; frozen uncommitted S candidate over committedR','command':command,'source_sha256':hashlib.sha256(filename.read_bytes()).hexdigest(),'binary_sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'exit_code':code,'elapsed_seconds':time.time()-started,'external_timeout_seconds':120,'source_stable':True}
evidence.save_json(root/'circle-replay-next-baseline.json',record)
print(json.dumps({k:record[k] for k in ['exit_code','elapsed_seconds','source_stable']}))
