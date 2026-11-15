from pathlib import Path
import subprocess,json,shutil,os,time
stage=Path(__file__).parent
binary=Path(json.loads((stage/'candidate-bench.json').read_text())['binary'])
records=[]
try:
 for sample,kind in enumerate(['baseline','final-candidate','final-candidate','baseline']):
  shutil.copyfile(stage/(kind+'-bench'),binary)
  target=stage/f'repeat-criterion-{sample}-{kind}'
  env=os.environ.copy();env['CRITERION_HOME']=str(target)
  cmd=['taskset','-c','0','setarch','x86_64','-R',str(binary),'--bench','--noplot','--warm-up-time','0.5','--measurement-time','1.0','--sample-size','20','hypersdf arithmetic cell lipschitz|hypersdf cell batch classification|hypersdf aabb cell interval']
  start=time.monotonic()
  with (stage/f'repeat-legacy-{sample}-{kind}.log').open('w') as log:r=subprocess.run(cmd,env=env,stdout=log,stderr=subprocess.STDOUT)
  record={'kind':kind,'sample':sample,'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-start,'criterion_home':str(target)}
  records.append(record);(stage/'repeat-legacy-timing.json').write_text(json.dumps(records,indent=2)+'\n');print(json.dumps(record),flush=True)
  assert r.returncode==0
finally:shutil.copyfile(stage/'final-candidate-bench',binary)
