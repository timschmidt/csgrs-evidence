import json,os,pathlib,signal,subprocess,time
stage=pathlib.Path(__file__).resolve().parent
args=['/mnt/development/.interval-refactor-build/workspace-qualification/release/deps/hyperdrc-2b8adcdf8c14e2aa','--exact','zz_complex_project_performance_tests::kicad_board_completes_smoke_check_suite','--nocapture','--test-threads=1']
env=os.environ.copy()
env.update(CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/workspace-qualification',CARGO_BUILD_JOBS='3',CARGO_TERM_COLOR='never')
assert 'HYPERSOLVE_MIN_PRODUCTION_LINE_COVERAGE' not in env
start=time.time()
record=dict(command=args,cwd='/mnt/development/csgrs-workspace-qualification/crates/hyperdrc',limit_seconds=600,started_unix=start,concurrent_workspace_validation=True)
with (stage/'drc-smoke-repro.log').open('w') as log:
 proc=subprocess.Popen(args,cwd=record['cwd'],env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
 record.update(pid=proc.pid,proc_starttime=pathlib.Path('/proc/'+str(proc.pid)+'/stat').read_text().split()[21])
 (stage/'drc-smoke-active.json').write_text(json.dumps(record,indent=2)+'\n')
 print('START DRC smoke reproduction PID '+str(proc.pid),flush=True)
 try:
  record['exit_code']=proc.wait(timeout=record['limit_seconds'])
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
(stage/'drc-smoke-repro-result.json').write_text(json.dumps(record,indent=2)+'\n')
(stage/'drc-smoke-active.json').unlink()
print(json.dumps(record),flush=True)
