from pathlib import Path
import json,time,subprocess,os,signal,resource,shutil,hashlib
raw=Path(__file__).resolve().parent
root=Path('/tmp/csgrs-r19-trace')
record=raw/f'boundary-regressions-{time.time_ns()}';record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
def inventory():
 names=subprocess.check_output(['git','ls-files','--cached','--others','--exclude-standard'],cwd=root,text=True).splitlines()
 return {n:hashlib.sha256((root/n).read_bytes()).hexdigest() for n in names if (root/n).is_file() and (n.endswith('.rs') or Path(n).name in ['Cargo.toml','Cargo.lock','config.toml'])}
before=inventory();(record/'sources.json').write_text(json.dumps(before,indent=2)+'\n')
paths=['crates/hyperreal/src/computable/node/representation.rs','crates/hyperreal/src/computable/node/structural_analysis.rs','crates/hyperreal/src/computable/node/algebra.rs','crates/hyperreal/src/computable/node/shared_square_quotient.rs','crates/hyperreal/src/computable/node/imported_domain_tests.rs','crates/hyperreal/src/computable/node/shared_square_quotient_tests.rs','crates/hyperreal/tests/serde_cotangent_continuation.rs']
for path in paths:(record/Path(path).name).write_bytes((root/path).read_bytes())
env=os.environ.copy();env.update(CARGO_TARGET_DIR='/tmp/csgrs-r19-target',CARGO_BUILD_JOBS='1',CARGO_PROFILE_RELEASE_DEBUG='0',RUSTFLAGS='')
cmd=['cargo','test','--locked','--offline','--release','-p','hyperreal','--features','serde,cached-f64-approx','--lib','--test','serde_cotangent_continuation','--no-run','--message-format=json']
with (record/'build.stdout').open('x') as out,(record/'build.stderr').open('x') as err:r=subprocess.run(cmd,cwd=root,env=env,stdout=out,stderr=err,timeout=1200)
(record/'build.json').write_text(json.dumps({'command':cmd,'status':r.returncode},indent=2)+'\n');print('R19 BOUNDARY BUILD',r.returncode,record,flush=True)
if r.returncode:raise SystemExit(r.returncode)
artifacts=[o for line in (record/'build.stdout').read_text().splitlines() if (o:=json.loads(line)).get('reason')=='compiler-artifact' and o.get('executable')];assert len(artifacts)==2
rows=[]
def limits():
 resource.setrlimit(resource.RLIMIT_AS,(512<<20,512<<20));resource.setrlimit(resource.RLIMIT_CORE,(0,0));resource.setrlimit(resource.RLIMIT_FSIZE,(16<<20,16<<20))
for artifact in artifacts:
 name=artifact['target']['name'];binary=record/(name+'-binary');shutil.copy2(artifact['executable'],binary)
 for group in (['imported_domain_tests','shared_square_quotient_tests','trig_range_proof_tests'] if name=='hyperreal' else [name]):
  cmd=[str(binary)]+([group] if name=='hyperreal' else [])+['--nocapture','--test-threads=1']
  start=time.monotonic()
  with (record/(group+'.stdout')).open('x') as out,(record/(group+'.stderr')).open('x') as err:
   p=subprocess.Popen(cmd,cwd=root,stdout=out,stderr=err,preexec_fn=limits,start_new_session=True)
   try:status=p.wait(timeout=120)
   except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();status='timeout'
  rows.append({'name':group,'command':cmd,'status':status,'seconds':time.monotonic()-start,'binary_sha256':hashlib.sha256(binary.read_bytes()).hexdigest()})
  print('R19 BOUNDARY TEST',group,status,flush=True);print((record/(group+'.stdout')).read_text()[-3000:],flush=True);print((record/(group+'.stderr')).read_text()[-3000:],flush=True)
assert before==inventory()
result={'record':str(record),'passed':all(r['status']==0 for r in rows),'sources_unchanged':True}
(record/'results.json').write_text(json.dumps(rows,indent=2)+'\n');(raw/'latest-boundary-regressions.json').write_text(json.dumps(result,indent=2)+'\n')
