from pathlib import Path
import hashlib,json,os,resource,shutil,signal,subprocess,time
raw=Path(__file__).resolve().parent;record=raw/('existing-api-replay-'+str(time.time_ns()));record.mkdir()
binary=record/'replay-binary';shutil.copy2('/tmp/csgrs-r16-replay-target/release/research_fiber_replay',binary)
source=raw/'capture-1792955821709292761/filleted_boolean_miter_erosion_completes/fiber-000048.json'
meta={'binary_sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'binary_bytes':binary.stat().st_size,'fixture_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'checkout':'/tmp/csgrs-r16-trace','owner_source_sha256':hashlib.sha256(Path('/tmp/csgrs-r16-trace/crates/hypersolve/src/algebraic_fiber.rs').read_bytes()).hexdigest(),'diagnostic_helper_sha256':hashlib.sha256(Path('/tmp/csgrs-r16-trace/crates/hypersolve/src/algebraic_fiber/r16_trace.rs').read_bytes()).hexdigest(),'scope':'Existing reduction API; original algorithm. Diagnostic allocator is linked but count/stage scopes are inactive. Single observation, not a native speed claim. All fixtures exactly rational and independently verified.'}
(record/'metadata.json').write_text(json.dumps(meta,indent=2)+'\n');(record/'driver.py').write_bytes(Path(__file__).read_bytes());(record/'main.rs').write_bytes((raw/'replay-probe/main.rs').read_bytes());(record/'Cargo.lock').write_bytes((raw/'replay-probe/Cargo.lock').read_bytes())
rows=[]
for control in ['zero','plus-one','zero-denominator']:
 cmd=[str(binary),str(source),control];start=time.time()
 def limit():resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3))
 with (record/(control+'.stdout')).open('w') as stdout,(record/(control+'.stderr')).open('w') as stderr:
  p=subprocess.Popen(cmd,stdout=stdout,stderr=stderr,preexec_fn=limit,start_new_session=True)
  try:status=p.wait(timeout=120)
  except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();status='timeout'
 row={'control':control,'command':cmd,'status':status,'elapsed_seconds':time.time()-start,'timeout_seconds':120,'address_space_bytes':8*1024**3};rows.append(row);(record/'commands.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(row),flush=True)
(record/'completion.json').write_text(json.dumps({'all_pass':all(r['status']==0 for r in rows)},indent=2)+'\n');print('REPLAY COMPLETE',record,flush=True)
