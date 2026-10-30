from pathlib import Path
import hashlib, importlib.util, json, os, signal, subprocess, sys, time
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'polynomial-svg-replay'
record=c/'polynomial-svg-replay-unary-regressions-candidate9';record.mkdir()
spec=importlib.util.spec_from_file_location('source',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot();e.save_json(record/'source-before.json',source);e.save_json(record/'files-before.json',files);(record/'candidate.patch').write_bytes(patch);(record/'driver.py').write_bytes(Path(__file__).read_bytes())
assert source==json.loads((c/'polynomial-svg-replay-qualification-final5/source-before.json').read_text())
binary=r.parent/'hypercurve-polynomial-chamfer-admission/release/deps/hypercurve-923df5481342af44'
digest=hashlib.sha256(binary.read_bytes()).hexdigest();e.save_json(record/'attribution.json',{'binary':str(binary),'binary_sha256':digest,'source':source,'qualification_build':'polynomial-svg-replay-qualification-final5/curve-owners.log'})
rows=[]
for name in ['independent_field_chord_publishes_nonzero_parallel_line_overlap','nonrepresented_chord_and_retained_rational_arc_share_the_fillet_kernel','pair_native_boolean_analytic_corner_publishes_a_third_generation_fillet']:
 command=[str(binary),'bezier_region::tests::'+name,'--exact','--nocapture'];started=time.time()
 with (record/(name+'.log')).open('w') as log:
  child=subprocess.Popen(['/usr/bin/time','-v',*command],cwd=w,env={**os.environ,'RUST_TEST_THREADS':'1'},stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  e.save_json(record/'active.json',{'pid':child.pid,'command':command,'epoch':started})
  try:code=child.wait(timeout=180)
  except subprocess.TimeoutExpired:os.killpg(child.pid,signal.SIGKILL);child.wait();code='external_timeout'
 after,af,_=e.source_snapshot();assert after==source
 row={'name':name,'command':command,'exit_code':code,'elapsed_seconds':time.time()-started,'external_timeout_seconds':180,'source_stable':True};rows.append(row);e.save_json(record/'results.json',rows);print(row,flush=True)
assert hashlib.sha256(binary.read_bytes()).hexdigest()==digest
e.save_json(record/'source-after.json',after);e.save_json(record/'files-after.json',af);e.save_json(record/'complete.json',{'source':source,'all_passed':all(x['exit_code']==0 for x in rows),'groups':len(rows),'epoch':time.time()})
