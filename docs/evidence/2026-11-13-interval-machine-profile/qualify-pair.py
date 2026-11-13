from pathlib import Path
import subprocess,json,os,time,hashlib,shutil
p=Path(__file__).parent;pair=Path('/mnt/development/interval-machine-profile');rows=json.loads((p/'CANDIDATE.json').read_text());records=[];bins=Path('/tmp/interval-refactor/machine-profile-binaries');bins.mkdir(exist_ok=True)
def run(name,cwd,cmd,target=None):
 env=os.environ.copy()
 if target:env['CARGO_TARGET_DIR']=target
 start=time.monotonic()
 with (p/(name+'.log')).open('w') as f:q=subprocess.run(cmd,cwd=cwd,env=env,stdout=f,stderr=subprocess.STDOUT)
 records.append(dict(name=name,cwd=str(cwd),command=cmd,target=target,returncode=q.returncode,seconds=time.monotonic()-start));(p/'pair-qualification.json').write_text(json.dumps(records,indent=2)+'\n');print(name,q.returncode,flush=True);assert q.returncode==0
try:
 for variant in ['baseline','candidate']:
  for row in rows:
   root=pair/row['repo'];name=row['path'];data=subprocess.check_output(['git','show','HEAD:'+name],cwd=root) if variant=='baseline' else (p/'candidate-source'/row['repo']/name).read_bytes();(root/name).write_bytes(data)
  run(variant+'-core',pair/'alumina-interface',['cargo','+1.95.0','test','--locked','-p','alumina-interface-core'],'/tmp/interval-refactor/machine-profile-interface-target')
  q=p/'profile-probe'
  if variant=='baseline':run('probe-lock',q,['cargo','+1.95.0','metadata','--offline','--format-version','1','--no-deps'])
  run(variant+'-profile-build',q,['cargo','+1.95.0','build','--release','--locked','--offline'],'/tmp/interval-refactor/machine-profile-cost-target')
  source=Path('/tmp/interval-refactor/machine-profile-cost-target/release/machine-profile-probe');dest=bins/(variant+'-profile');shutil.copy2(source,dest)
  run(variant+'-profile-values',q,[str(dest)])
  record=dict(bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest(),source=variant);(p/(variant+'-profile-binary.json')).write_text(json.dumps(record,indent=2)+'\n')
  m=pair/'csgrs/crates/hyperinterval/conformance/alumina-measurements'
  run(variant+'-measurement-build',m,['cargo','+1.95.0','build','--release','--locked','--offline','--features','probes','--bins'],'/tmp/interval-refactor/machine-profile-measurement-target')
  for name in ['probe','cost']:
   source=Path('/tmp/interval-refactor/machine-profile-measurement-target/release')/name;dest=bins/(variant+'-measurement-'+name);shutil.copy2(source,dest)
   (p/(variant+'-measurement-'+name+'-binary.json')).write_text(json.dumps(dict(bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest()),indent=2)+'\n')
  run(variant+'-measurement-values',m,[str(bins/(variant+'-measurement-probe'))])
finally:
 for row in rows:
  data=(p/'candidate-source'/row['repo']/row['path']).read_bytes();(pair/row['repo']/row['path']).write_bytes(data);assert hashlib.sha256(data).hexdigest()==row['sha256']
print('candidate sources restored',flush=True)
