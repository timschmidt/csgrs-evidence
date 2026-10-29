from pathlib import Path
import argparse,os,subprocess,json,time,sys,importlib.util,signal
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-polynomial-points'
p=argparse.ArgumentParser();p.add_argument('--attempt',required=True);p.add_argument('--case',action='append');args=p.parse_args()
record=c/('selected-polynomial-points-'+args.attempt);record.mkdir()
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
before,files,patch=e.source_snapshot();e.save_json(record/'source-before.json',before);e.save_json(record/'files-before.json',files);(record/'candidate.patch').write_bytes(patch);(record/'driver.py').write_bytes(Path(__file__).read_bytes())
target=r.parent/'hypercurve-selected-circle-points-admission'
env={**os.environ,'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'2','RUSTUP_TOOLCHAIN':'1.98.1','RUST_TEST_THREADS':'1'}
rows=[]
def run(name,command,timeout):
 start=time.time()
 with (record/(name+'.log')).open('w') as out:
  process=subprocess.Popen(command,cwd=w,env=env,stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
  e.save_json(record/'active.json',{'name':name,'pid':process.pid,'command':command,'epoch':start})
  try:code=process.wait(timeout=timeout)
  except subprocess.TimeoutExpired:
   os.killpg(process.pid,signal.SIGKILL);process.wait();code='external_timeout'
 after,af,_=e.source_snapshot();row={'name':name,'command':command,'exit_code':code,'elapsed_seconds':time.time()-start,'external_timeout_seconds':timeout,'source_stable':before==after};rows.append(row);e.save_json(record/'results.json',rows);e.save_json(record/'source-after.json',after);e.save_json(record/'files-after.json',af);print(row,flush=True);assert before==after
 return code
command=['cargo','test','--locked','--release','-p','hypercurve','--all-features','--test','selected_polynomial_points','--no-run','--message-format=json']
if run('compile',command,3600)!=0:sys.exit(1)
artifacts=[]
for row in (record/'compile.log').read_text().splitlines():
 try:artifacts.append(json.loads(row))
 except json.JSONDecodeError:pass
binary=next(row['executable'] for row in artifacts if row.get('reason')=='compiler-artifact' and row['target']['name']=='selected_polynomial_points' and row.get('executable'))
cases=args.case or ['independent_polynomial_point_sources_satisfy_original_equations','independent_polynomial_point_queries_compose_and_replay','independent_polynomial_point_zero_divisor_stays_invalid','independent_equal_selections_and_original_denominators_compose','selected_query_parameters_feed_affine_and_rational_evaluation','mixed_algebraic_base_and_independent_fiber_keep_original_relations','joint_query_replay_rejects_a_zero_original_guard','independent_query_budget_refusal_does_not_poison_retry','joint_point_native_replay_in_fresh_process_then_further_queries']
for name in cases:run(name,[binary,name,'--exact','--nocapture'],300)
e.save_json(record/'complete.json',{'source':before,'all_passed':all(row['exit_code']==0 for row in rows),'groups':len(rows),'settings':{k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','RUSTUP_TOOLCHAIN','RUST_TEST_THREADS']},'epoch':time.time()})
