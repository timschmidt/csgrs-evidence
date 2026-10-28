from pathlib import Path
import importlib.util,json,os,re,signal,subprocess,sys,time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent;checkout=Path('/tmp/hypercurve-closure-circle-differentials');prefix='circle-differentials-prototype7'
assert not (root/(prefix+'-results.json')).exists()
focus=json.loads((root/'circle-differentials-bounds-prototype4-results.json').read_text())
assert len(focus)==3 and all(row['exit_code']==0 and row['source_stable'] for row in focus)
runtime=re.findall(r'finished in ([0-9.]+)s', (root/'circle-differentials-bounds-prototype4-selected_circle_derivative_points_replay_before_another_exact_split.log').read_text())
assert runtime and float(runtime[-1]) <= 300, ('Original fresh-process case must meet its prepared300second fixture envelope before qualification', runtime)
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot();e.save_json(root/(prefix+'-source-before.json'),source);e.save_json(root/(prefix+'-files-before.json'),files);(root/(prefix+'.patch')).write_bytes(patch)
for name in source['untracked_inputs']:
 p=root/(prefix+'-inputs')/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes((checkout/name).read_bytes())
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_TARGET_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-circle-differentials-admission','CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'1','CCACHE_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache','CCACHE_TEMPDIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache/tmp'}
rows=[]
def run(name,cmd,timeout,json_output=False):
 assert e.source_snapshot()[0]==source
 start=time.time()
 with (root/(prefix+'-'+name+('.jsonl' if json_output else '.log'))).open('w') as out,(root/(prefix+'-'+name+'-stderr.log')).open('w') as err:
  process=subprocess.Popen(cmd,cwd=checkout,env=env,stdout=out,stderr=err,start_new_session=True)
  try:code=process.wait(timeout=timeout)
  except subprocess.TimeoutExpired:os.killpg(process.pid,signal.SIGKILL);process.wait();code='external_timeout'
 after,after_files,_=e.source_snapshot();row={'name':name,'command':cmd,'exit_code':code,'elapsed_seconds':time.time()-start,'source_stable':source==after,'external_timeout_seconds':timeout};rows.append(row)
 e.save_json(root/(prefix+'-results.json'),rows);e.save_json(root/(prefix+'-source-after.json'),after);e.save_json(root/(prefix+'-files-after.json'),after_files);print(row,flush=True);assert row['source_stable'];return code
base=['cargo','test','--locked','--release','--all-features','-p','hypercurve']
assert run('bounds-budget-consumer',base+['--test','fiber_point_incidence','retained_point_bounds_retry_after_actual_exhaustion_without_cached_failure','--','--exact','--nocapture'],1800)==0
run('full-point-circle-target',base+['--test','fiber_point_incidence','--','--nocapture'],3600)
run('private-policy',base+['--lib','bezier_offset::cusp_semicircle::incident_point::tests','--','--nocapture'],1800)
targets=['rational_point_forms','point_affine_forms','polynomial_point_order','polynomial_point_locations','hypercurve_circle_predicates','hypercurve_curve_point','point_equality_contract','svg_circle_replay','svg_point_replay','svg_chord_replay','svg_parallel_replay','svg_selected_replay','hypercurve_derivative_completeness','hypercurve_bezier_evaluation','selected_fiber_images']
cmd=base+['--no-fail-fast']
for target in targets:cmd+=['--test',target]
run('existing-point-circle-and-differential',cmd,3600)
run('native-differential-unit-tests',base+['--lib','derivative','--','--nocapture'],1800)
assert all(row['exit_code']==0 for row in rows)
print('PROTOTYPE PASSED',flush=True)
