from pathlib import Path
import argparse,hashlib,importlib.util,json,os,signal,subprocess,sys,time
sys.dont_write_bytecode=True
parser=argparse.ArgumentParser();parser.add_argument('--attempt',required=True);args=parser.parse_args()
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'polynomial-svg-replay';record=c/('polynomial-svg-replay-'+args.attempt);record.mkdir()
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot();e.save_json(record/'source-before.json',source);e.save_json(record/'files-before.json',files);(record/'candidate.patch').write_bytes(patch);(record/'driver.py').write_bytes(Path(__file__).read_bytes());(record/'contract.json').write_bytes((c/'polynomial-svg-replay-contract.json').read_bytes())
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_NET_OFFLINE':'true','CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'1','CARGO_TARGET_DIR':str(r.parent/'hypercurve-polynomial-chamfer-admission')};rows=[]
def run(name,command,timeout):
 assert e.source_snapshot()[0]==source
 started=time.time()
 with (record/(name+'.log')).open('w') as log:
  child=subprocess.Popen(['/usr/bin/time','-v',*command],cwd=w,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True);e.save_json(record/'active.json',{'pid':child.pid,'name':name,'command':command,'epoch':started})
  try:code=child.wait(timeout=timeout)
  except subprocess.TimeoutExpired:os.killpg(child.pid,signal.SIGKILL);child.wait();code='external_timeout'
 after,af,_=e.source_snapshot();row={'name':name,'command':command,'exit_code':code,'elapsed_seconds':time.time()-started,'external_timeout_seconds':timeout,'source_stable':after==source};rows.append(row);e.save_json(record/'results.json',rows);e.save_json(record/'source-after.json',after);e.save_json(record/'files-after.json',af);assert after==source;print(row,flush=True);return code
code=run('build',['cargo','test','--locked','--release','--all-features','-p','hypercurve','--lib','--test','polynomial_projection','--test','polynomial_chamfer_corners','--test','polynomial_region_admission','--no-run','--message-format=json'],1800)
if code:e.save_json(record/'complete.json',{'source':source,'all_passed':False,'groups':len(rows),'epoch':time.time()});raise SystemExit(1)
artifacts=[]
for line in (record/'build.log').read_text().splitlines():
 try:artifacts.append(json.loads(line))
 except json.JSONDecodeError:pass
binaries={name:Path(next(v['executable'] for v in artifacts if v.get('reason')=='compiler-artifact' and v['target']['name']==name and v.get('executable'))) for name in ['polynomial_projection','polynomial_chamfer_corners','polynomial_region_admission','hypercurve']}
digests={k:hashlib.sha256(v.read_bytes()).hexdigest() for k,v in binaries.items()};e.save_json(record/'attribution.json',{'source':source,'binaries':{k:str(v) for k,v in binaries.items()},'binary_sha256':digests,'settings':{k:env[k] for k in ['RUSTUP_TOOLCHAIN','CARGO_BUILD_JOBS','RUST_TEST_THREADS','CARGO_TARGET_DIR']}})
for test in ['independent_field_chord_publishes_nonzero_parallel_line_overlap','nonrepresented_chord_and_retained_rational_arc_share_the_fillet_kernel','pair_native_boolean_analytic_corner_publishes_a_third_generation_fillet']:
 run(test,[str(binaries['hypercurve']),'bezier_region::tests::'+test,'--exact','--nocapture'],180)
test='polynomial_region_zero_offset_keeps_sources_and_remaining_gaps_are_typed';run(test,[str(binaries['polynomial_region_admission']),test,'--exact','--nocapture'],180)
listing=subprocess.check_output([str(binaries['polynomial_projection']),'--list'],text=True);tests=[line.removesuffix(': test') for line in listing.splitlines() if line.endswith(': test')];assert len(tests)>=2
for test in tests:run(test,[str(binaries['polynomial_projection']),test,'--exact','--nocapture'],180)
test='polynomial_chamfer_replays_in_a_fresh_process_and_reuses_selected_cuts';run(test,[str(binaries['polynomial_chamfer_corners']),test,'--exact','--nocapture'],180)
test='trimmed_polynomial_svg_replays_without_an_untrimmed_viewport';run(test,[str(binaries['polynomial_chamfer_corners']),test,'--exact','--nocapture'],180)
run('codec-validation',[str(binaries['hypercurve']),'svg::exact::graph::polynomial::tests','--nocapture','--test-threads=1'],180)
assert all(hashlib.sha256(v.read_bytes()).hexdigest()==digests[k] for k,v in binaries.items())
e.save_json(record/'complete.json',{'source':source,'all_passed':all(x['exit_code']==0 for x in rows),'groups':len(rows),'epoch':time.time()})
