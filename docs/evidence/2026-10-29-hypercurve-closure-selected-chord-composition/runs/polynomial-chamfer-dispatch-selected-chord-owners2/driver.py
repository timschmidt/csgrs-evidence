from pathlib import Path
import argparse,hashlib,importlib.util,json,os,signal,subprocess,sys,time
sys.dont_write_bytecode=True
p=argparse.ArgumentParser();p.add_argument('--attempt',required=True);p.add_argument('--case',action='append');args=p.parse_args()
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'polynomial-chamfer-dispatch';record=c/('polynomial-chamfer-dispatch-'+args.attempt);record.mkdir()
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot();e.save_json(record/'source-before.json',source);e.save_json(record/'files-before.json',files);(record/'candidate.patch').write_bytes(patch);(record/'driver.py').write_bytes(Path(__file__).read_bytes());(record/'contract.json').write_bytes((c/'polynomial-chamfer-dispatch-contract.json').read_bytes())
(record/'selected-polynomial-refined-filter-contract.json').write_bytes((c/'selected-polynomial-refined-filter-contract.json').read_bytes())
(record/'selected-chord-displacement-field-contract.json').write_bytes((c/'selected-chord-displacement-field-contract.json').read_bytes())
env={**os.environ,'CARGO_NET_OFFLINE':'true','RUSTUP_TOOLCHAIN':'1.98.1','CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'1','CARGO_TARGET_DIR':str(r.parent/'hypercurve-polynomial-circle-center-relations-admission')};rows=[]
def run(name,command,timeout):
 assert e.source_snapshot()[0]==source
 started=time.time()
 with (record/(name+'.log')).open('w') as log:
  proc=subprocess.Popen(['/usr/bin/time','-v',*command],cwd=w,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  e.save_json(record/'active.json',{'pid':proc.pid,'name':name,'command':command,'epoch':started})
  try:code=proc.wait(timeout=timeout)
  except subprocess.TimeoutExpired:
   os.killpg(proc.pid,signal.SIGKILL);proc.wait();code='external_timeout'
 after,af,_=e.source_snapshot();row={'name':name,'command':command,'exit_code':code,'elapsed_seconds':time.time()-started,'external_timeout_seconds':timeout,'source_stable':after==source};rows.append(row);e.save_json(record/'results.json',rows);e.save_json(record/'source-after.json',after);e.save_json(record/'files-after.json',af);print(row,flush=True);assert after==source;return code
steps = [
 ('scalar-capture', ['cargo','test','--locked','--release','--all-features','-p','hypersolve','--test','selected_chamfer_enclosure','--','--nocapture','--test-threads=1'],180),
 ('chord-displacement', ['cargo','test','--locked','--release','--all-features','-p','hypercurve','--test','selected_chord_displacements','--','--nocapture','--test-threads=1'],900),
 ('native-witnesses', ['cargo','test','--locked','--release','--all-features','-p','hypersolve','--test','recursive_quadratic_witnesses','--test','recursive_quadratic_field_signs','--','--nocapture','--test-threads=1'],900),
 ('scalar-owners', ['cargo','test','--locked','--release','--all-features','-p','hypersolve','--test','selected_polynomial_bounds','--test','selected_polynomial_fields','--test','selected_polynomial_normalization','--test','selected_polynomial_replay','--test','selected_polynomial_joins','--test','selected_polynomial_join_retention','--test','selected_polynomial_root_discovery','--','--nocapture','--test-threads=1'],900),
]
for name,cmd,limit in steps: run(name,cmd,limit)
e.save_json(record/'complete.json',{'source':source,'all_passed':all(row['exit_code']==0 for row in rows),'groups':len(rows),'epoch':time.time()})
