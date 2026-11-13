from pathlib import Path
import subprocess,json,time,hashlib,shutil,os
p=Path(__file__).parent;r=Path('/mnt/development/csgrs-dynamics-adapters');q=p/'owner-probe';bins=Path('/tmp/interval-refactor/dynamics-adapters-binaries')
assert len(json.loads((p/'builds.json').read_text()))==3
paths=subprocess.check_output(['git','diff','--cached','--name-only'],cwd=r,text=True).splitlines();assert len(paths)==41
candidate={x:subprocess.check_output(['git','show',':'+x],cwd=r) for x in paths}
inline={x:(r/x).read_bytes() for x in paths}
assert subprocess.check_output(['git','diff','--binary'],cwd=r)==(p/'adapter.patch').read_bytes()
rows=[]
try:
 for variant in ['baseline','candidate','inline-adapters']:
  for name in paths:
   if variant=='baseline':
    v=subprocess.run(['git','show','HEAD:'+name],cwd=r,capture_output=True);data=v.stdout if v.returncode==0 else None
   else:data=(candidate if variant=='candidate' else inline)[name]
   f=r/name
   if data is None:f.unlink(missing_ok=True)
   else:f.parent.mkdir(parents=True,exist_ok=True);f.write_bytes(data)
  cmd=['cargo','+1.95.0','build','--release','--offline','--manifest-path',str(q/'Cargo.toml'),'--target-dir','/tmp/interval-refactor/dynamics-adapters-observer-target'];start=time.monotonic()
  with (p/('observer-'+variant+'-build.log')).open('w') as log:run=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT)
  row=dict(variant=variant,command=cmd,returncode=run.returncode,seconds=time.monotonic()-start);rows.append(row);(p/'observer-builds.json').write_text(json.dumps(rows,indent=2)+'\n');assert run.returncode==0
  src=Path('/tmp/interval-refactor/dynamics-adapters-observer-target/release/dynamics-owner-probe');dest=bins/('observer-'+variant);shutil.copy2(src,dest);row.update(sha256=hashlib.sha256(dest.read_bytes()).hexdigest(),bytes=dest.stat().st_size)
  with (p/('observer-'+variant+'.log')).open('w') as log:run=subprocess.run([str(dest)],stdout=log,stderr=subprocess.STDOUT,timeout=180)
  row['observation_returncode']=run.returncode;(p/'observer-builds.json').write_text(json.dumps(rows,indent=2)+'\n');assert run.returncode==0
  (p/('observer-'+variant+'-Cargo.lock')).write_bytes((q/'Cargo.lock').read_bytes());print(variant,'observed',flush=True)
finally:
 for name,data in inline.items():
  f=r/name;f.parent.mkdir(parents=True,exist_ok=True);f.write_bytes(data)
assert subprocess.check_output(['git','diff','--binary'],cwd=r)==(p/'adapter.patch').read_bytes()
results={}
for variant in ['baseline','candidate','inline-adapters']:
 lines=(p/('observer-'+variant+'.log')).read_text().splitlines();results[variant]=dict(results=[x for x in lines if x.startswith('RESULT|')],allocations=[x for x in lines if x.startswith('| ')])
assert len(results['baseline']['results'])==194
summary={}
for variant in ['candidate','inline-adapters']:
 summary[variant]={k:results['baseline'][k]==results[variant][k] for k in ['results','allocations']};assert all(summary[variant].values())
(p/'observer-comparison.json').write_text(json.dumps(dict(cases=194,comparison=summary,scope='Full Debug differential results and warmed completed-result/drop allocation observations; not independent geometric proof or wire serialization.'),indent=2)+'\n')
