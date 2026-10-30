from pathlib import Path
import hashlib,importlib.util,json,os,signal,subprocess,sys,time
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'polynomial-chamfer-dispatch';record=c/'polynomial-chamfer-dispatch-normalized-stack1';record.mkdir()
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot();e.save_json(record/'source-before.json',source);e.save_json(record/'files-before.json',files);(record/'candidate.patch').write_bytes(patch);(record/'driver.py').write_bytes(Path(__file__).read_bytes())
previous=c/'polynomial-chamfer-dispatch-normalized-stage1';attribution=json.loads((previous/'attribution.json').read_text());assert attribution['source']==source;binary=Path(attribution['binary']);assert hashlib.sha256(binary.read_bytes()).hexdigest()==attribution['binary_sha256']
command=[str(binary),'polynomial_chamfer_consumes_its_generated_chord_in_a_second_edit','--exact','--nocapture'];env={**os.environ,'RUST_TEST_THREADS':'1','HYPERSOLVE_STAGE_DIAGNOSTIC':'1','HYPERCURVE_CAPTURE_COEFFICIENTS':str(record)}
started=time.monotonic();samples=[]
with (record/'trace.log').open('w') as log:
 proc=subprocess.Popen(command,cwd=w,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True);e.save_json(record/'active.json',{'pid':proc.pid,'command':command,'epoch':time.time(),'diagnostic_only':True})
 for at in [60,120]:
  while proc.poll() is None and time.monotonic()-started<at:time.sleep(1)
  if proc.poll() is not None:break
  stack_command=['gdb','--batch','-ex','set pagination off','-ex','thread apply all bt 35','-p',str(proc.pid)]
  with (record/('stack-'+str(at)+'.log')).open('w') as stack:
   try:
    result=subprocess.run(stack_command,stdout=stack,stderr=subprocess.STDOUT,timeout=20);status=result.returncode
   except subprocess.TimeoutExpired:status='external_timeout'
  samples.append({'at_seconds':at,'command':stack_command,'status':status});e.save_json(record/'stack-results.json',samples)
 while proc.poll() is None and time.monotonic()-started<180:time.sleep(1)
 if proc.poll() is None:os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='external_timeout'
 else:status=proc.returncode
source_after,after_files,_=e.source_snapshot();assert source_after==source and hashlib.sha256(binary.read_bytes()).hexdigest()==attribution['binary_sha256'];e.save_json(record/'source-after.json',source_after);e.save_json(record/'files-after.json',after_files);e.save_json(record/'complete.json',{'exit_code':status,'source':source,'elapsed_seconds':time.monotonic()-started,'external_timeout_seconds':180,'diagnostic_only':True,'not_a_timing_sample':'Debugger attachment pauses the process; this run cannot qualify original acceptance or performance.'})
