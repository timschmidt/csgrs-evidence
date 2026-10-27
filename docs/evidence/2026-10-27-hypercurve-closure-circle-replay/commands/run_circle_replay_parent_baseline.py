from pathlib import Path
import hashlib,importlib.util,json,subprocess,sys,time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-circle-replay')
prefix='circle-replay-unchanged-t-baseline'
assert not (root/(prefix+'.json')).exists()
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py');evidence=importlib.util.module_from_spec(spec);spec.loader.exec_module(evidence)
source,_,_=evidence.source_snapshot()
assert source==json.loads((root/'point-replay-final-source-before.json').read_text())
artifacts=[json.loads(line) for line in (root/'point-replay-prototype5-build.jsonl').read_text().splitlines()]
lib=Path(next(filename for item in artifacts if item.get('reason')=='compiler-artifact' and item['target']['name']=='hypercurve' for filename in item['filenames'] if filename.endswith('.rlib')))
libhash=hashlib.sha256(lib.read_bytes()).hexdigest()
rows=[]
for label,filename,expected in [('line','point-replay-next-baseline.rs',0),('circle','circle-replay-next-baseline.rs',101)]:
 binary=root/(prefix+'-'+label)
 command=['rustc','+1.98.1','--edition=2024','-C','opt-level=3',str(root/filename),'--crate-name','circle_replay_parent_'+label,'-L','dependency='+str(lib.parent),'--extern','hypercurve='+str(lib),'-o',str(binary)]
 with (root/(prefix+'-'+label+'-compile.log')).open('w') as out: subprocess.run(command,cwd=checkout,stdout=out,stderr=subprocess.STDOUT,check=True,timeout=120)
 started=time.time()
 with (root/(prefix+'-'+label+'.log')).open('w') as out:r=subprocess.run([str(binary)],cwd=checkout,stdout=out,stderr=subprocess.STDOUT,timeout=120)
 assert r.returncode==expected
 if label=='circle':assert 'exact SVG metadata does not encode this generated curve definition' in (root/(prefix+'-'+label+'.log')).read_text()
 assert evidence.source_snapshot()[0]==source and hashlib.sha256(lib.read_bytes()).hexdigest()==libhash
 rows.append({'label':label,'source_file':filename,'source_sha256':hashlib.sha256((root/filename).read_bytes()).hexdigest(),'compile_command':command,'run_command':[str(binary)],'binary_sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'elapsed_seconds':time.time()-started,'exit_code':r.returncode,'expected_exit':expected})
 print(label,r.returncode,flush=True)
evidence.save_json(root/(prefix+'.json'),{'source':source,'library':str(lib),'library_sha256':libhash,'rows':rows,'source_stable':True,'interpretation':'Original selected fillet line now exports successfully. Original complete selected circular fillet still fails its unchanged positive assertion, with Unsupported generated curve definition. This is an implementation gap, not completion or resource exhaustion.','recorded_epoch':time.time()})
