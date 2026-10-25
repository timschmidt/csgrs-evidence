from pathlib import Path
import hashlib,json,os,resource,signal,subprocess,time
raw=Path(__file__).resolve().parent;root=Path('/tmp/csgrs-r16-trace');record=raw/('capture-'+str(time.time_ns()));record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
env=os.environ.copy();env.update(CARGO_TARGET_DIR='/tmp/csgrs-r16-trace-target',CCACHE_DIR='/tmp/csgrs-r16-trace-ccache',CCACHE_TEMPDIR='/tmp/csgrs-r16-trace-ccache/tmp',CARGO_BUILD_JOBS='2',PROPTEST_RNG_SEED='20261025');Path(env['CCACHE_TEMPDIR']).mkdir(parents=True,exist_ok=True)
names=subprocess.check_output(['git','ls-files','--cached','--others','--exclude-standard'],cwd=root,text=True).splitlines();names=[n for n in names if (root/n).is_file() and (n.endswith('.rs') or Path(n).name in ['Cargo.toml','Cargo.lock','config.toml'])]
inventory=lambda:{n:hashlib.sha256((root/n).read_bytes()).hexdigest() for n in names}
before=inventory();(record/'sources-before.json').write_text(json.dumps(before,indent=2)+'\n')
(record/'environment.json').write_text(json.dumps({'rustc':subprocess.check_output(['rustc','-Vv'],text=True),'env':{k:env[k] for k in ['CARGO_TARGET_DIR','CCACHE_DIR','CCACHE_TEMPDIR','CARGO_BUILD_JOBS','PROPTEST_RNG_SEED']},'scope':'counting-allocator/stage diagnostic only, external 300s/8GiB containment; original tests unchanged; no performance comparison'},indent=2)+'\n')
cmd=['cargo','test','--locked','--offline','--release','-p','hypercurve','--all-features','--test','hypercurve_composed_workloads','--test','hypercurve_open_path_compositions','--no-run','--message-format=json']
start=time.time();print('R16 BUILD',record,flush=True)
with (record/'build.stdout').open('w') as stdout,(record/'build.stderr').open('w') as stderr:
 p=subprocess.Popen(cmd,cwd=root,env=env,stdout=stdout,stderr=stderr,start_new_session=True)
 try:status=p.wait(timeout=1800)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();status='timeout'
(record/'build.json').write_text(json.dumps({'cmd':cmd,'status':status,'seconds':time.time()-start},indent=2)+'\n');assert status==0,status
binaries={}
for line in (record/'build.stdout').read_text().splitlines():
 try:row=json.loads(line)
 except json.JSONDecodeError:continue
 if row.get('reason')=='compiler-artifact' and row.get('executable'):
  name=row['target']['name'];original=Path(row['executable']);target=record/(name+'-binary');target.write_bytes(original.read_bytes());target.chmod(0o755)
  binaries[name]={'path':str(target),'original':str(original),'bytes':target.stat().st_size,'sha256':hashlib.sha256(target.read_bytes()).hexdigest()}
(record/'binaries.json').write_text(json.dumps(binaries,indent=2)+'\n')
print('R16 BUILD PASS',flush=True)
results=[]
for binary,test in [('hypercurve_composed_workloads','filleted_boolean_miter_erosion_completes'),('hypercurve_open_path_compositions','stroke_fillet_stroke_of_a_cubic_arc_path_completes')]:
 case=record/test;case.mkdir();env['R16_CAPTURE_DIR']=str(case)
 cmd=[binaries[binary]['path'],test,'--ignored','--exact','--test-threads=1','--nocapture'];start=time.monotonic();samples=[]
 (case/'command.json').write_text(json.dumps({'cmd':cmd,'timeout_seconds':300,'address_space_bytes':8*1024**3,'epoch':time.time()},indent=2)+'\n')
 def limits():resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3))
 print('R16 RUN',test,flush=True)
 with (case/'stdout').open('w') as stdout,(case/'stderr').open('w') as stderr:
  p=subprocess.Popen(cmd,cwd=root,env=env,stdout=stdout,stderr=stderr,preexec_fn=limits,start_new_session=True)
  while p.poll() is None:
   elapsed=time.monotonic()-start
   if elapsed>=300:os.killpg(p.pid,signal.SIGKILL);p.wait();status='timeout';break
   try:
    values={line.split(':',1)[0]:line.split(':',1)[1].strip() for line in Path(f'/proc/{p.pid}/status').read_text().splitlines() if ':' in line}
    samples.append({'seconds':elapsed,'VmRSS':values.get('VmRSS'),'VmHWM':values.get('VmHWM'),'VmSize':values.get('VmSize')})
   except FileNotFoundError:pass
   try:p.wait(timeout=1)
   except subprocess.TimeoutExpired:pass
  else:status=p.returncode
 (case/'resource-samples.json').write_text(json.dumps(samples,indent=2)+'\n')
 result={'test':test,'status':status,'seconds':time.monotonic()-start,'captured_fibers':len(list(case.glob('fiber-*.json'))),'scope':'external timeout is censored, not typed exhaustion or completion; allocation/time diagnostics are instrumented'}
 (case/'result.json').write_text(json.dumps(result,indent=2)+'\n');results.append(result)
 print('R16 RESULT',json.dumps(result),flush=True)
after=inventory();assert before==after;(record/'sources-after.json').write_text(json.dumps(after,indent=2)+'\n')
(record/'completion.json').write_text(json.dumps({'sources_unchanged':True,'results':results},indent=2)+'\n')
print('R16 CAPTURE COMPLETE',record,flush=True)
