from pathlib import Path
import hashlib, importlib.util, json, os, subprocess, sys, time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-parallel-replay')
prefix='chord-replay-committed-r'
assert not (root/(prefix+'-baseline.json')).exists()
expected='2eb55c5dd5a17dd7b9fb5731ea02b0ac62b38431'
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py')
evidence=importlib.util.module_from_spec(spec);spec.loader.exec_module(evidence)
source,files,patch=evidence.source_snapshot()
assert source['revision']==expected and not patch and not source['untracked_inputs']
qualified=json.loads((root/'parallel-replay-final-files-before.json').read_text())
receipts={'crates/hypercurve/FUTURE_WORK.md','docs/evidence-archive.md','docs/evidence-archive.tsv'}
for name,mode,digest in qualified:
 if name not in receipts and mode in ['file','executable']:
  assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
previous=json.loads((root/'chord-replay-next-baseline.json').read_text())
lib=Path(previous['library']);libhash=hashlib.sha256(lib.read_bytes()).hexdigest()
assert libhash==previous['library_sha256']
records=[]
for label,filename,expected_exit,marker in [
 ('parallel-control','parallel-replay-next-baseline.rs',0,None),
 ('selected-chord','chord-replay-next-baseline.rs',101,'exact generated chords must retain their selected endpoints and support through replay'),
 ('projection-cache','chord-replay-projection-baseline.rs',101,'exact queries must not alter deterministic finite serialization')]:
 name=prefix+'-'+label
 binary=root/name
 command=['rustc','+1.98.1','--edition=2024','-C','opt-level=3',str(root/filename),'--crate-name',name.replace('-','_'),'-L','dependency='+str(lib.parent),'--extern','hypercurve='+str(lib),'-o',str(binary)]
 with (root/(name+'-compile.log')).open('w') as out:
  subprocess.run(command,cwd=checkout,stdout=out,stderr=subprocess.STDOUT,check=True,timeout=120)
 started=time.time()
 with (root/(name+'.log')).open('w') as out:
  completed=subprocess.run([str(binary)],cwd=checkout,stdout=out,stderr=subprocess.STDOUT,timeout=120)
 row={'label':label,'compile_command':command,'run_command':[str(binary)],'source_file':filename,'source_sha256':hashlib.sha256((root/filename).read_bytes()).hexdigest(),'binary_sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'exit_code':completed.returncode,'expected_exit_code':expected_exit,'elapsed_seconds':time.time()-started}
 assert completed.returncode==expected_exit,row
 if marker:assert marker in (root/(name+'.log')).read_text()
 records.append(row)
 assert evidence.source_snapshot()[0]==source
result={'source':source,'qualified_non_receipt_bytes_match':True,'qualified_build':'parallel-replay-final-full-suite.log','library':str(lib),'library_sha256':libhash,'records':records,'source_stable':True,'recorded_epoch':time.time()}
evidence.save_json(root/(prefix+'-baseline.json'),result)
evidence.save_json(root/(prefix+'-source-files.json'),files)
print(json.dumps({'revision':expected,'records':[{k:r[k] for k in ['label','exit_code','expected_exit_code']} for r in records],'source_stable':True}))
