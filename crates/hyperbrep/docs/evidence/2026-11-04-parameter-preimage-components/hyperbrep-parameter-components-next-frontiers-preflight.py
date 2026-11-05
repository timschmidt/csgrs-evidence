from pathlib import Path
import subprocess,json,hashlib,time
prefix='/tmp/hyperbrep-parameter-components-next-frontiers-preflight'
receipts=json.loads(Path('/tmp/hyperbrep-parameter-components-final-validation.json').read_text())
assert len(receipts)>=8 and all(r['status']==0 and r['source_unchanged'] for r in receipts), 'wait for terminal native Cargo consumers'
def dependency(meta,name):
 expected=next(d[3] for d in meta['deps'] if d[1]==name);found=[]
 for p in Path('target/debug/.fingerprint').glob(name+'-*/lib-'+name):
  lib=Path('target/debug/deps/lib'+p.parent.name+'.rlib')
  if lib.exists() and int.from_bytes(bytes.fromhex(p.read_text()),'little')==expected:found.append((lib,json.loads(p.with_suffix('.json').read_text())))
 assert len(found)==1,found
 return found[0]
meta=json.loads(Path('target/debug/.fingerprint/hyperbrep-8890edd528543e42/lib-hyperbrep.json').read_text())
brep=Path('target/debug/deps/libhyperbrep-8890edd528543e42.rlib');curve,curve_meta=dependency(meta,'hypercurve');solve,_=dependency(curve_meta,'hypersolve')
cmd=['rustc','-D','warnings','--edition=2024','--crate-name','component_frontiers',prefix+'.rs','--extern','hyperbrep='+str(brep),'--extern','hypercurve='+str(curve),'--extern','hypersolve='+str(solve),'-L','dependency=target/debug/deps','-o',prefix+'-bin']
start=time.time()
with open(prefix+'-compile.log','w') as f:r=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT)
if r.returncode:
 print(Path(prefix+'-compile.log').read_text());raise SystemExit(r.returncode)
with open(prefix+'.log','w') as f:run=subprocess.run([prefix+'-bin'],stdout=f,stderr=subprocess.STDOUT)
info={'compile_command':cmd,'compile_status':r.returncode,'run_command':[prefix+'-bin'],'run_status':run.returncode,'seconds':time.time()-start,'source_sha256':hashlib.sha256(Path(prefix+'.rs').read_bytes()).hexdigest(),'library_sha256':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [brep,curve,solve]},'outcomes':[{'case':'native UV spline in an identity tensor','exact_expectation':'[0,1/3] union {1}','outcome':'UnsupportedParameterLocation; spatial result carrier cannot publish proper continuous/mixed loci'},{'case':'selected nonrational y=sqrt(x) branch with canceled x-1/2 map guard','exact_expectation':'[0,1/2) union (1/2,1]','outcome':'Unsupported; selected implicit branch punctures still lack a complete interval census'}],'completion':False,'scope':'Preserved exact frontiers, not geometric completions. Source controls/knots, graph defining relation and original denominator independently specify the expected loci.'}
Path(prefix+'.json').write_text(json.dumps(info,indent=2)+'\n');print(Path(prefix+'.log').read_text());assert run.returncode==0
