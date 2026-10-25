from pathlib import Path
import hashlib,json,os,shutil,subprocess,time,signal
p=Path(__file__).resolve().parent
for v in ['baseline','candidate']:
 d=p/('probe-'+v); target=p/('target-'+v)
 env=dict(os.environ,CARGO_TARGET_DIR=str(target))
 cmd=['cargo','build','--offline','--locked','--release'];start=time.time()
 with (p/(v+'-build.log')).open('w') as log:
  proc=subprocess.Popen(cmd,cwd=d,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  try: code=proc.wait(timeout=900)
  except subprocess.TimeoutExpired: os.killpg(proc.pid,signal.SIGKILL);proc.wait();code='timeout'
 record={'command':cmd,'cwd':str(d),'target':str(target),'code':code,'seconds':time.time()-start}
 if code==0:
  binary=p/(v+'-probe');shutil.copy2(target/'release/research_tangent_probe',binary)
  record.update(binary_sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),binary_bytes=binary.stat().st_size,size=subprocess.check_output(['size','-A',str(binary)],text=True),compiler=subprocess.check_output(['rustc','-Vv'],text=True))
 (p/(v+'-build.json')).write_text(json.dumps(record,indent=2)+'\n');print(v,code,flush=True)
 if code!=0:raise SystemExit(1)
