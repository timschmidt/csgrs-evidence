from pathlib import Path
import hashlib,importlib.util,json,subprocess,sys,time
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls';checkout=r/'selected-polynomial-replay';record=c/'selected-polynomial-replay-baseline1';record.mkdir()
spec=importlib.util.spec_from_file_location('e',checkout/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot();e.save_json(record/'source-before.json',source);e.save_json(record/'files-before.json',files);(record/'candidate.patch').write_bytes(patch)
producer=json.loads((c/'selected-polynomial-bounds-qualification-final1/source-before.json').read_text());assert source==producer
rows=json.loads((c/'selected-polynomial-bounds-qualification-final1/results.json').read_text());assert all(row['exit_code']==0 and row['source_stable'] for row in rows)
assert any(row['name']=='solver-full' for row in rows)
text=(c/'selected-polynomial-replay-tests.rs').read_text().replace('"support/recursive_quadratic.rs"',json.dumps(str((checkout/'crates/hypersolve/tests/support/recursive_quadratic.rs').resolve())))
(record/'original.rs').write_text(text)
deps=r.parent/'hypercurve-selected-polynomial-bounds-admission/release/deps'
libs=[deps/'libhypersolve-3f0167be3776a772.rlib',deps/'libhyperreal-937ae1995734a09b.rlib',deps/'libhyperlimit-87796d4327564e41.rlib']
def hashes():return {str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in libs}
before=hashes();command=['rustc','+1.98.1','--edition=2024','--test',str(record/'original.rs'),'--crate-name','selected_polynomial_replay_baseline','-L','dependency='+str(deps)]
for name,path in zip(['hypersolve','hyperreal','hyperlimit'],libs):command+=['--extern',name+'='+str(path)]
command+=['-o',str(record/'original')];start=time.time()
with (record/'compile.log').open('w') as log:p=subprocess.run(command,cwd=checkout,stdout=log,stderr=subprocess.STDOUT)
after,af,_=e.source_snapshot();e.save_json(record/'source-after.json',after);e.save_json(record/'files-after.json',af)
result={'source':source,'source_stable':after==source,'command':command,'exit_code':p.returncode,'elapsed_seconds':time.time()-start,'library_sha256':before,'libraries_stable':before==hashes(),'compiled_producer_source':producer,'compiled_producer_checks':rows,'cargo_builds_started':0,'expected_missing_api':'SelectedPolynomialDefinition::from_values and replay','epoch':time.time()};e.save_json(record/'result.json',result)
assert result['source_stable'] and result['libraries_stable'];assert p.returncode!=0
log=(record/'compile.log').read_text();assert 'SelectedPolynomialDefinition' in log and 'unresolved import' in log
print(json.dumps({'exit_code':p.returncode,'source_stable':result['source_stable'],'libraries_stable':result['libraries_stable'],'log':log[-5000:]}))
