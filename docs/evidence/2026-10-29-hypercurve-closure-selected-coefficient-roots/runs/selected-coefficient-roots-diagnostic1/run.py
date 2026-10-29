import subprocess,time,pathlib,os,signal,json
r=pathlib.Path(__file__).resolve().parent
start=time.time()
with (r/'test.log').open('w') as log:
 p=subprocess.Popen(['/usr/bin/time','-v',str(r/'diagnostic'),'--nocapture'],stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
 (r/'active.json').write_text(json.dumps({'pid':p.pid,'epoch':start}))
 try:code=p.wait(timeout=240)
 except subprocess.TimeoutExpired:
  os.killpg(p.pid,signal.SIGKILL);p.wait();code='external_timeout'
(r/'complete.json').write_text(json.dumps({'exit_code':code,'elapsed_seconds':time.time()-start,'external_timeout_seconds':240},indent=2)+'\n')
