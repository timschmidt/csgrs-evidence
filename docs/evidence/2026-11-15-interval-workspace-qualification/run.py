import json,os,pathlib,signal,subprocess,time
stage=pathlib.Path(__file__).resolve().parent
cwd='/mnt/development/csgrs-workspace-qualification'
env=os.environ.copy()
env.update(CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/workspace-qualification',CARGO_BUILD_JOBS='3',CARGO_TERM_COLOR='never')
commands=[('workspace-check',['cargo','+stable','check','--locked','--workspace','--all-targets'],5400,cwd),('workspace-fmt',['cargo','+stable','fmt','--all','--','--check'],600,cwd)]
for crate in ['hyperlimit','hyperpack','hyperevolution','hypersdf','hyperparts','hypercircuit','hyperpath','hyperphysics','hyperbrep','hyperdrc']:
 commands.append((crate+'-tests',['cargo','+stable','test','--locked','-p',crate]+(['--release'] if crate=='hyperdrc' else []),5400 if crate in ['hyperbrep','hyperdrc'] else 1800,cwd))
commands.extend([('hypervoxel-fmt',['cargo','+stable','fmt','--all','--check'],600,cwd+'/crates/hypervoxel'),('hypervoxel-tests',['cargo','+stable','test','--locked'],1800,cwd+'/crates/hypervoxel')])
(stage/'commands.json').write_text(json.dumps(commands,indent=2)+'\n')
results=[]
for name,args,limit,work in commands:
 start=time.time()
 record=dict(name=name,command=args,cwd=work,limit_seconds=limit,started_unix=start)
 with (stage/(name+'.log')).open('w') as log:
  proc=subprocess.Popen(args,cwd=work,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  record.update(pid=proc.pid,proc_starttime=pathlib.Path('/proc/'+str(proc.pid)+'/stat').read_text().split()[21])
  (stage/'active.json').write_text(json.dumps(record,indent=2)+'\n')
  print('START '+name+' PID '+str(proc.pid),flush=True)
  try:
   record['exit_code']=proc.wait(timeout=limit)
   record['deadline_reached']=False
  except subprocess.TimeoutExpired:
   record['deadline_reached']=True
   os.killpg(proc.pid,signal.SIGTERM)
   try: proc.wait(timeout=10)
   except subprocess.TimeoutExpired:
    os.killpg(proc.pid,signal.SIGKILL)
    proc.wait()
   record['exit_code']=proc.returncode
 record['elapsed_seconds']=time.time()-start
 results.append(record)
 (stage/'results.json').write_text(json.dumps(results,indent=2)+'\n')
 print('END '+name+' exit='+str(record['exit_code'])+' seconds='+str(round(record['elapsed_seconds'],2)),flush=True)
 if name=='workspace-check' and record['exit_code']!=0: break
(stage/'active.json').unlink()
(stage/'completed.json').write_text(json.dumps(dict(results=len(results),all_passed=all(r['exit_code']==0 and not r['deadline_reached'] for r in results),finished_unix=time.time()),indent=2)+'\n')
