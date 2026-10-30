from pathlib import Path
import hashlib, importlib.util, json, os, signal, subprocess, sys, time
sys.dont_write_bytecode=True
r=Path('/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-closure-work');c=r/'controls';w=r/'polynomial-chamfer-dispatch'
d=c/'polynomial-algebraic-chamfer-pairs-diagnostic1';d.mkdir()
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
before,files,patch=e.source_snapshot();e.save_json(d/'source-before.json',before);e.save_json(d/'files-before.json',files);(d/'candidate.patch').write_bytes(patch);(d/'driver.py').write_bytes(Path(__file__).read_bytes())
prior=c/'polynomial-operation-frontier-selected-equal-generator-fix2'
assert before==json.loads((prior/'source-before.json').read_text())
records=[json.loads(x) for x in (prior/'build.jsonl').read_text().splitlines()]
libs={name:Path(next(f for row in records if row.get('reason')=='compiler-artifact' and row['target']['name']==name for f in row['filenames'] if f.endswith('.rlib'))) for name in ['hypercurve','hypersolve']}
digests={name:hashlib.sha256(p.read_bytes()).hexdigest() for name,p in libs.items()}
(d/'original.rs').write_bytes((prior/'original.rs').read_bytes()+(c/'polynomial_algebraic_chamfer_pair_diagnostic.rs').read_bytes())
binary=d/'original'
command=['rustc','+1.98.1','--edition=2024','--test','--cfg','feature="svg"','-C','opt-level=3',str(d/'original.rs'),'--crate-name','polynomial_chamfer_pairs','-o',str(binary)]
for name,p in libs.items():command.extend(['-L','dependency='+str(p.parent),'--extern',name+'='+str(p)])
rows=[]
for name,cmd in [('compile',command),('pairs',[str(binary),'polynomial_algebraic_chamfer_pair_diagnostic','--exact','--nocapture'])]:
 start=time.time()
 with (d/(name+'.log')).open('w') as log:
  p=subprocess.Popen(['/usr/bin/time','-v',*cmd],cwd=w,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  e.save_json(d/'active.json',{'pid':p.pid,'name':name,'command':cmd,'epoch':start})
  try:code=p.wait(timeout=120)
  except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code='external_timeout'
 rows.append({'name':name,'command':cmd,'exit_code':code,'elapsed_seconds':time.time()-start,'external_timeout_seconds':120})
 e.save_json(d/'results.json',rows)
 if name=='compile':assert code==0
after,_,_=e.source_snapshot();assert before==after
assert digests=={name:hashlib.sha256(p.read_bytes()).hexdigest() for name,p in libs.items()}
e.save_json(d/'complete.json',{'source':before,'source_stable':True,'libraries':{name:{'path':str(p),'sha256':digests[name]} for name,p in libs.items()},'outcomes':rows,'diagnostic_only':True,'epoch':time.time()})
