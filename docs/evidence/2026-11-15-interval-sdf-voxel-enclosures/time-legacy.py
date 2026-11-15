from pathlib import Path
import subprocess,json,shutil,os,time
stage=Path(__file__).parent
binary=Path(json.loads((stage/'candidate-bench.json').read_text())['binary'])
records=[]
try:
 for sample,kind in enumerate(['baseline','candidate','candidate','baseline']):
  shutil.copyfile(stage/(kind+'-bench'),binary)
  target=stage/f'criterion-{sample}-{kind}'
  env=os.environ.copy();env['CRITERION_HOME']=str(target)
  cmd=['taskset','-c','0','setarch','x86_64','-R',str(binary),'--bench','--noplot','--warm-up-time','0.2','--measurement-time','0.5','--sample-size','10']
  start=time.monotonic()
  with (stage/f'legacy-{sample}-{kind}.log').open('w') as log:r=subprocess.run(cmd,env=env,stdout=log,stderr=subprocess.STDOUT)
  record={'kind':kind,'sample':sample,'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-start,'criterion_home':str(target)}
  records.append(record);(stage/'legacy-timing.json').write_text(json.dumps(records,indent=2)+'\n');print(json.dumps(record),flush=True)
  assert r.returncode==0
finally:shutil.copyfile(stage/'candidate-bench',binary)
