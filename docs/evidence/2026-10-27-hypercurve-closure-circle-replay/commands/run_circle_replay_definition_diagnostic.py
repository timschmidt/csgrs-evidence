from pathlib import Path
import hashlib,importlib.util,json,subprocess,sys,time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-circle-replay')
prefix='circle-replay-definition-diagnostic'
assert not (root/(prefix+'.json')).exists()
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py');evidence=importlib.util.module_from_spec(spec);spec.loader.exec_module(evidence)
source,_,_=evidence.source_snapshot()
assert source==json.loads((root/'point-replay-final-source-before.json').read_text())
prior=json.loads((root/'point-replay-current-frontier.json').read_text());lib=Path(prior['library'])
assert hashlib.sha256(lib.read_bytes()).hexdigest()==prior['library_sha256']
binary=root/prefix
cmd=['rustc','+1.98.1','--edition=2024','-C','opt-level=3',str(root/(prefix+'.rs')),'--crate-name','circle_replay_definition_diagnostic','-L','dependency='+str(lib.parent),'--extern','hypercurve='+str(lib),'-o',str(binary)]
with (root/(prefix+'-compile.log')).open('w') as log:subprocess.run(cmd,cwd=checkout,stdout=log,stderr=subprocess.STDOUT,check=True,timeout=120)
start=time.time()
with (root/(prefix+'.log')).open('w') as log:r=subprocess.run([str(binary)],cwd=checkout,stdout=log,stderr=subprocess.STDOUT,timeout=120)
assert r.returncode==101
assert evidence.source_snapshot()[0]==source
log=(root/(prefix+'.log')).read_text()
print(log[:400])
for needle in ['frame:', 'start: Exact(', 'end: Exact(', 'end: Mapped(', 'SelectedChordNormalContact', 'certified_tangent_endpoints:', 'Represented(', 'ChordNormal(', 'Rational(']:
 pos=log.find(needle);print(needle,log[pos:pos+240] if pos>=0 else 'not in bounded diagnostic')
evidence.save_json(root/(prefix+'.json'),{'source':source,'source_file':prefix+'.rs','source_sha256':hashlib.sha256((root/(prefix+'.rs')).read_bytes()).hexdigest(),'compile_command':cmd,'run_command':[str(binary)],'exit_code':r.returncode,'elapsed_seconds':time.time()-start,'library':str(lib),'library_sha256':prior['library_sha256'],'source_stable':True,'debug_limit_bytes_per_value':32000,'recorded_epoch':time.time()})
