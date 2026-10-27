from pathlib import Path
import hashlib,json,subprocess,time
r=Path(__file__).resolve().parent
artifacts=[json.loads(x) for x in (r/'circle-replay-prototype6-build.jsonl').read_text().splitlines()]
new=Path(next(f for a in artifacts if a.get('reason')=='compiler-artifact' and a['target']['name']=='hypercurve' for f in a['filenames'] if f.endswith('.rlib')))
parent=json.loads((r/'circle-replay-unchanged-t-baseline.json').read_text());old=Path(parent['library'])
assert hashlib.sha256(old.read_bytes()).hexdigest()==parent['library_sha256']
rows=[]
for label,lib,flags in [('replay',new,[])]:
 source=r/'circle-replay-fiber-center-probe.rs';binary=r/('circle-replay-fiber-center-'+label);command=['rustc','+1.98.1','--edition=2024','-C','opt-level=3',str(source),'--crate-name','circle_fiber_center','-L','dependency='+str(lib.parent),'--extern','hypercurve='+str(lib),'-o',str(binary)]
 with (r/('circle-replay-fiber-center-'+label+'-compile.log')).open('w') as log:subprocess.run(command,stdout=log,stderr=subprocess.STDOUT,check=True,timeout=120)
 start=time.time()
 with (r/('circle-replay-fiber-center-'+label+'.log')).open('w') as log:result=subprocess.run([str(binary),*flags],stdout=log,stderr=subprocess.STDOUT,timeout=120)
 rows.append({'label':label,'command':command,'run':[str(binary),*flags],'library_sha256':hashlib.sha256(lib.read_bytes()).hexdigest(),'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'exit_code':result.returncode,'elapsed_seconds':time.time()-start})
 (r/'circle-replay-fiber-center-results.json').write_text(json.dumps(rows,indent=2)+'\n');print(label,result.returncode,flush=True);print((r/('circle-replay-fiber-center-'+label+'.log')).read_text()[:4000],flush=True)
