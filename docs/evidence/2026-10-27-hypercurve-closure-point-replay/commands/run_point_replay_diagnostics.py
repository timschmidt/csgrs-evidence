from pathlib import Path
import hashlib,importlib.util,json,subprocess,sys,time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-point-replay')
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py');evidence=importlib.util.module_from_spec(spec);spec.loader.exec_module(evidence)
source,files,_=evidence.source_snapshot()
assert source==json.loads((root/'point-replay-prototype2-source-after.json').read_text())
artifacts=[json.loads(line) for line in (root/'point-replay-prototype2-build.jsonl').read_text().splitlines()]
libs={x['target']['name']:next((p for p in x.get('filenames',[]) if p.endswith('.rlib')),None) for x in artifacts if x.get('reason')=='compiler-artifact'}
for name in ['point-replay-descendant-diagnostic','point-replay-positive-path-diagnostic']:
 filename=root/(name+'.rs');binary=root/name
 lib=Path(libs['hypercurve']); hashes={n:hashlib.sha256(Path(libs[n]).read_bytes()).hexdigest() for n in ['hypercurve','hypersolve']}
 command=['rustc','+1.98.1','--edition=2024','-C','opt-level=3',str(filename),'--crate-name',name.replace('-','_'),'-L','dependency='+str(lib.parent),'--extern','hypercurve='+str(lib),'--extern','hypersolve='+libs['hypersolve'],'-o',str(binary)]
 with (root/(name+'-compile.log')).open('w') as out: subprocess.run(command,stdout=out,stderr=subprocess.STDOUT,check=True,timeout=120)
 started=time.time()
 with (root/(name+'.log')).open('w') as out: r=subprocess.run([str(binary)],stdout=out,stderr=subprocess.STDOUT,timeout=120)
 assert r.returncode==0
 assert evidence.source_snapshot()[0]==source
 record={'source':source,'libraries':{n:libs[n] for n in hashes},'library_sha256':hashes,'source_file':str(filename),'source_sha256':hashlib.sha256(filename.read_bytes()).hexdigest(),'compile_command':command,'run_command':[str(binary)],'binary_sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'exit_code':r.returncode,'elapsed_seconds':time.time()-started,'source_stable':True}
 (root/(name+'.json')).write_text(json.dumps(record,indent=2)+'\n');print((root/(name+'.log')).read_text())
