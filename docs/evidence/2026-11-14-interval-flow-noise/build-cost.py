from pathlib import Path
import hashlib,json,os,shutil,subprocess,time
s=Path(__file__).parent;p=s/'cost-probe';b=Path('/mnt/development/.interval-refactor-build/flow-noise-cost'); saved=b/'qualified';saved.mkdir(exist_ok=True)
env=os.environ|{'CARGO_TARGET_DIR':str(b),'CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true'}
records=[]
for name,features in [('timing','noise'),('allocation','noise,allocation'),('boxes','')]:
 cmd=['cargo','+1.95.0','build','--release','--locked','--manifest-path',str(p/'Cargo.toml')]
 if features:cmd+=['--features',features]
 start=time.monotonic()
 with (s/(name+'-build.log')).open('wb') as f: result=subprocess.run(cmd,env=env,stdout=f,stderr=subprocess.STDOUT)
 assert result.returncode==0,name
 target=saved/name;shutil.copy2(b/'release/flow-noise-cost-probe',target)
 row={'name':name,'command':cmd,'returncode':result.returncode,'seconds':time.monotonic()-start,'binary':str(target),'bytes':target.stat().st_size,'sha256':hashlib.sha256(target.read_bytes()).hexdigest()}
 row['size']=subprocess.check_output(['size',str(target)],text=True)
 records.append(row);(s/'cost-builds.json').write_text(json.dumps(records,indent=2)+'\n');print(name+' built',flush=True)
 with (s/(name+'-smoke.log')).open('w') as f:
  for mode in (['boxes','noise'] if features else ['boxes']):
   for case,cells in [('constant',1),('shear',8),('shear',32),('shear',128)]:
    for temperature in ['cold','warm']:
     cmd=[str(target),mode,case,str(cells),temperature,'2']
     f.write('COMMAND '+repr(cmd)+'\n');f.flush()
     subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,check=True)
 print(name+' all smoke checks passed',flush=True)
(s/'cost-inputs.json').write_text(json.dumps({'source':json.loads((s/'SOURCE.json').read_text()),'files':{str(f.relative_to(p)):hashlib.sha256(f.read_bytes()).hexdigest() for f in p.iterdir() if f.is_file()},'rustc':subprocess.check_output(['rustc','+1.95.0','-Vv'],text=True)},indent=2)+'\n')
