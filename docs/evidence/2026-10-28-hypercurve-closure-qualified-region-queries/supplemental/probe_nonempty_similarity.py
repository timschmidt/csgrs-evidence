from pathlib import Path
import hashlib
import importlib.util
import json
import subprocess
import sys
import time

sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls';checkout=r/'qualified-region-queries'
record=c/'qualified-nonempty-similarity-baseline1';record.mkdir()
spec=importlib.util.spec_from_file_location('e',checkout/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
before,files,patch=e.source_snapshot();attribution=json.loads((c/'qualified-region-query-resource-final5/attribution.json').read_text());assert before==attribution['source']
library=Path(attribution['library']);assert hashlib.sha256(library.read_bytes()).hexdigest()==attribution['library_sha256']
artifacts=[json.loads(x) for x in (c/'qualified-region-query-resource-final5/build.jsonl').read_text().splitlines()]
solver=Path(next(f for x in artifacts if x.get('reason')=='compiler-artifact' and x['target']['name']=='hypersolve' for f in x['filenames'] if f.endswith('.rlib')))
e.save_json(record/'source-before.json',before);e.save_json(record/'files-before.json',files);(record/'candidate.patch').write_bytes(patch)
test=record/'original.rs';test.write_bytes((checkout/'crates/hypercurve/tests/qualified_region_queries.rs').read_bytes()+(c/'qualified-nonempty-similarity-probe.rs').read_bytes());binary=record/'original';rows=[]
for name,cmd in [('compile',['rustc','+1.98.1','--edition=2024','--test','--cfg','feature="svg"','-C','opt-level=3',str(test),'--crate-name','nonempty_similarity_probe','-L','dependency='+str(library.parent),'-L','dependency='+str(solver.parent),'--extern','hypercurve='+str(library),'--extern','hypersolve='+str(solver),'-o',str(binary)]),('nonempty-similarity',[str(binary),'qualified_nonempty_similarity_output_retains_source_topology_receipt','--exact','--nocapture'])]:
    started=time.time()
    with (record/(name+'.log')).open('w') as log:p=subprocess.run(cmd,cwd=checkout,stdout=log,stderr=subprocess.STDOUT,timeout=120)
    after,af,_=e.source_snapshot();row={'name':name,'command':cmd,'exit_code':p.returncode,'elapsed_seconds':time.time()-started,'source_stable':before==after};rows.append(row);e.save_json(record/'results.json',rows);e.save_json(record/'source-after.json',after);e.save_json(record/'files-after.json',af);assert row['source_stable'];print(row,flush=True)
    if name=='compile':assert p.returncode==0
assert hashlib.sha256(library.read_bytes()).hexdigest()==attribution['library_sha256']
e.save_json(record/'attribution.json',{**attribution,'solver':str(solver),'solver_sha256':hashlib.sha256(solver.read_bytes()).hexdigest(),'test_sha256':hashlib.sha256(test.read_bytes()).hexdigest(),'cargo_builds_started':0,'note':'Read-only use of source-attributed library artifacts; the active qualification target is not mutated.'})
