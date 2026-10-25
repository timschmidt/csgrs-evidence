from pathlib import Path
import subprocess,os,time,json,hashlib,tomllib
p=Path(__file__).resolve().parent
flags=' '.join('--remap-path-prefix='+str(root)+'=/source' for root in ['/tmp/csgrs-r04-priority-baseline','/tmp/csgrs-r04-proof-search'])+' '+' '.join('--remap-path-prefix='+str(p/v)+'=/probe' for v in ['baseline','candidate'])
for variant in ['baseline','candidate']:
 env=os.environ.copy();env['CARGO_TARGET_DIR']=str(p/('target-'+variant));env['RUSTFLAGS']=flags
 commands=[['cargo','metadata','--offline','--format-version','1','--manifest-path',str(p/variant/'Cargo.toml')],['cargo','build','--locked','--offline','--release','--manifest-path',str(p/variant/'Cargo.toml')]]
 for i,cmd in enumerate(commands):
  start=time.time()
  with (p/(variant+'-build-'+str(i)+'.log')).open('w') as log:r=subprocess.run(cmd,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=600)
  (p/(variant+'-build-'+str(i)+'.json')).write_text(json.dumps({'command':cmd,'target':env['CARGO_TARGET_DIR'],'rustflags':flags,'code':r.returncode,'seconds':time.time()-start})+'\n')
  if r.returncode:print((p/(variant+'-build-'+str(i)+'.log')).read_text()[-5000:]);raise SystemExit(1)
  if i==0:
   def packages(path):return {(x['name'],x['version'],x.get('checksum')) for x in tomllib.loads(path.read_text())['package'] if x.get('source')}
   changed=packages(p/variant/'Cargo.lock')-packages(Path('/home/tim/Documents/GitHub/workspace/csgrs/Cargo.lock'))
   (p/(variant+'-dependency-comparison.json')).write_text(json.dumps(sorted(changed),indent=2)+'\n')
   assert not changed,changed
 artifact=Path(env['CARGO_TARGET_DIR'])/'release/tri-proof-probe';(p/(variant+'-probe')).write_bytes(artifact.read_bytes());(p/(variant+'-probe')).chmod(0o755)
 (p/(variant+'-size.txt')).write_text(subprocess.check_output(['size','-A',str(artifact)],text=True))
 (p/(variant+'-binary.json')).write_text(json.dumps({'sha256':hashlib.sha256(artifact.read_bytes()).hexdigest(),'bytes':artifact.stat().st_size,'compiler':subprocess.check_output(['rustc','-Vv'],text=True)})+'\n')
 print(variant,'built',flush=True)
