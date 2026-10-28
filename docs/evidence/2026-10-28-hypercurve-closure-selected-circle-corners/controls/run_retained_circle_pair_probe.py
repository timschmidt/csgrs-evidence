from pathlib import Path
import json,subprocess,hashlib,time,sys
r=Path(__file__).resolve().parents[1];dst=r/'controls'/sys.argv[1];dst.mkdir();test=dst/'probe.rs'
test.write_bytes((r/'selected-circle-corners/crates/hypercurve/tests/fiber_point_incidence.rs').read_bytes()+(r/'controls/retained-circle-pair-tests.rs').read_bytes());results=[]
for name,record in [('circle-line-contacts','corners-recovered-baseline2'),('selected-circle-corners',sys.argv[2] if len(sys.argv)>2 else 'corners-recovered-fix12')]:
 vals=[json.loads(x) for x in (r/'controls'/record/'build.jsonl').read_text().splitlines()]
 def lib(pkg):return Path(next(f for x in reversed(vals) if x.get('reason')=='compiler-artifact' and x['target']['name']==pkg for f in x['filenames'] if f.endswith('.rlib')))
 curve,solver=lib('hypercurve'),lib('hypersolve');binary=dst/name;before=hashlib.sha256(curve.read_bytes()).hexdigest()
 attribution=json.loads((r/'controls'/record/'attribution.json').read_text());assert before==attribution['library_sha256']
 command=['rustc','+1.98.1','--edition=2024','--test','--cfg','feature="svg"','-C','opt-level=3',str(test),'--crate-name','selected_circle_pair_probe','-L','dependency='+str(curve.parent),'-L','dependency='+str(solver.parent),'--extern','hypercurve='+str(curve),'--extern','hypersolve='+str(solver),'-o',str(binary)]
 with (dst/(name+'-build.log')).open('w') as f:code=subprocess.call(command,stdout=f,stderr=subprocess.STDOUT)
 assert before==hashlib.sha256(curve.read_bytes()).hexdigest()
 results.append({'name':name+'-build','command':command,'exit_code':code,'lib_sha256':before,'source_record':record,'test_sha256':hashlib.sha256(test.read_bytes()).hexdigest()})
 if code==0:
  cmd=[str(binary),'selected_circle_shared_center','--nocapture'];started=time.time()
  with (dst/(name+'-test.log')).open('w') as f:
   try:code=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,timeout=120).returncode
   except subprocess.TimeoutExpired:code='external_timeout'
  results.append({'name':name+'-tests','command':cmd,'exit_code':code,'elapsed_seconds':time.time()-started})
 print(results[-1],flush=True);(dst/'results.json').write_text(json.dumps(results,indent=2)+'\n')
