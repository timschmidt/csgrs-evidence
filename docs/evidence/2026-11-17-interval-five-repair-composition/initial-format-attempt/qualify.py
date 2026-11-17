from pathlib import Path
import hashlib,json,os,shutil,signal,subprocess,time
s=Path(__file__).parent;r=Path('/mnt/development/interval-solver-five-repair/csgrs');target=Path('/dev/shm/interval-solver-five-repair');artifacts=Path('/dev/shm/interval-five-repair-artifacts')
started=time.monotonic();deadline=started+7200;rows=[];held=False
base='f65589b44e1a010de75f8129b371ecbf503cc052';repair='aad7409a5928e309812d9a5cc361d46313685266'
env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
def save(name,value):(s/name).write_text(json.dumps(value,indent=2)+'\n')
def git(*args):return subprocess.check_output(['git','-C',str(r),*args])
def state(pid,start):
 raw=Path(f'/proc/{pid}/stat').read_text();f=raw[raw.rfind(')')+2:].split();assert f[19]==start;return f[0]
def run(name,cmd,cwd=r,expected=0,budget=1800,override=None):
 assert state(3416600,'45823480')=='T' and state(1621335,'38218939')=='T'
 assert shutil.disk_usage(r).free>=20*1024**3
 left=deadline-time.monotonic();assert left>0
 start=time.monotonic();effective=min(budget,left)
 raw=Path(f'/proc/{os.getpid()}/stat').read_text();f=raw[raw.rfind(')')+2:].split()
 save('active.json',dict(pid=os.getpid(),proc_starttime=f[19],name=name,command=cmd,started_unix=time.time(),budget_seconds=effective,revision=git('rev-parse','HEAD').decode().strip()))
 e=env.copy()
 if override:
  for k,v in override.items():
   if v is None:e.pop(k,None)
   else:e[k]=v
 timed_out=False
 with (s/(name+'.log')).open('w') as log:
  p=subprocess.Popen(cmd,cwd=cwd,env=e,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  try:code=p.wait(timeout=effective)
  except subprocess.TimeoutExpired:
   timed_out=True;os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
 row=dict(name=name,command=cmd,cwd=str(cwd),exit_code=code,expected_exit_code=expected,seconds=time.monotonic()-start,budget_seconds=effective,timed_out=timed_out)
 rows.append(row);save('commands.json',rows);print(name,code,flush=True)
 assert code==expected,row
 return (s/(name+'.log')).read_text()
def trace(label):
 out=run(label+'-trace-build',['cargo','+1.95.0','bench','--locked','--offline','-p','hypersolve','--all-features','--bench','dispatch_trace','--no-run','--message-format=json'])
 images=[]
 for line in out.splitlines():
  if line.startswith('{'):
   item=json.loads(line)
   if item.get('reason')=='compiler-artifact' and item.get('target',{}).get('name')=='dispatch_trace' and item.get('executable'):images.append(item['executable'])
 assert len(images)==1
 path=artifacts/(label+'-dispatch');shutil.copy2(images[0],path)
 save(label+'-dispatch-artifact.json',dict(path=str(path),sha256=hashlib.sha256(path.read_bytes()).hexdigest(),revision=git('rev-parse','HEAD').decode().strip()))
 d=s/(label+'-trace');d.mkdir();run(label+'-trace-run',[str(path)],cwd=d,override={'HYPERSOLVE_SKIP_BENCHMARK_REPORTS':None})
 assert (d/'dispatch_trace.md').is_file()
def residual_public(label):
 h=s/'residual-public';run(label+'-residual-public-build',['cargo','+1.95.0','build','--locked','--offline','--release'],cwd=h)
 binary=artifacts/(label+'-residual-public');shutil.copy2(target/'release/residual-certainty-review',binary)
 save(label+'-residual-public-artifact.json',dict(path=str(binary),sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),revision=git('rev-parse','HEAD').decode().strip()))
 for case in range(8):
  for mode in ['control','witness']:
   out=run(f'{label}-residual-{case}-{mode}',[str(binary),mode,str(case)],cwd=s,expected=101 if label=='baseline' and mode=='witness' else 0,budget=60)
   if label=='baseline' and mode=='witness':assert 'approximate or unknown evidence must not count as an exact residual certificate' in out
   assert len([l for l in out.splitlines() if l.startswith('TRACE ')])==2
try:
 assert not (s/'completion.json').exists() and git('rev-parse','HEAD').decode().strip()==base
 assert state(3416600,'45823480')=='S' and state(1621335,'38218939')=='T'
 os.kill(3416600,signal.SIGSTOP);held=True
 for _ in range(20):
  if state(3416600,'45823480')=='T':break
  time.sleep(.05)
 assert state(3416600,'45823480')=='T'
 save('hold.json',dict(started_unix=time.time(),watcher_pid=3416600,watcher_start='45823480',parent_pid=1621335,parent_start='38218939',horizon_reset=False))
 artifacts.mkdir(exist_ok=False)
 run('baseline-format',['cargo','+1.95.0','fmt','--all','--','--check'],budget=120)
 text=run('baseline-residual-regressions',['cargo','+1.95.0','test','--locked','--offline','--release','-p','hypersolve','--all-features','--test','residual_certainty','--','--nocapture'],expected=101)
 assert '0 passed; 4 failed;' in text
 text=run('baseline-composition-witness',['cargo','+1.95.0','test','--locked','--offline','--release','-p','hypersolve','--all-features','--lib','solver_contract_tests::numerical_proposal_domain_and_alpha_reports_preserve_their_distinct_claims','--','--exact','--nocapture'],expected=101)
 assert '0 passed; 1 failed;' in text and 'assertion failed: row.status.is_unknown()' in text
 trace('baseline');residual_public('baseline')
 # Restore only the two task-owned test edits before applying the reviewed patch.
 (r/'crates/hypersolve/tests/residual_certainty.rs').unlink()
 (r/'crates/hypersolve/src/solver_contract_tests.rs').write_bytes(git('show',base+':crates/hypersolve/src/solver_contract_tests.rs'))
 assert not git('status','--porcelain=v1')
 run('compose-reviewed-repair',['git','cherry-pick','-x',repair],budget=120)
 sources={}
 for path in ['crates/hypersolve/src/certification.rs','crates/hypersolve/src/failed_constraints.rs','crates/hypersolve/tests/residual_certainty.rs']:
  data=(r/path).read_bytes();assert data==git('show',repair+':'+path);sources[path]=hashlib.sha256(data).hexdigest()
 save('residual-source-equivalence.json',sources)
 run('apply-composition-witness',['git','apply',str(s/'composition-test.patch')],budget=120)
 run('candidate-format',['cargo','+1.95.0','fmt','--all','--','--check'],budget=120)
 run('candidate-whitespace',['git','diff','--check'],budget=120)
 run('stage-composition-witness',['git','add','crates/hypersolve/src/solver_contract_tests.rs'],budget=120)
 run('commit-composition-witness',['git','commit','-m','test(hypersolve): preserve residual certainty in composed solver chain'],budget=120)
 save('candidate.json',dict(revision=git('rev-parse','HEAD').decode().strip(),baseline=base,residual_repair=repair,admitted=False))
 commands=[
 ('owner-all-features',['cargo','+1.95.0','test','--locked','--offline','--release','-p','hypersolve','--all-features','--lib','--tests']),
 ('owner-no-default',['cargo','+1.95.0','test','--locked','--offline','--release','-p','hypersolve','--no-default-features','--lib','--test','smoke','--test','residual_certainty']),
 ('clippy-all-features',['cargo','+1.95.0','clippy','--locked','--offline','-p','hypersolve','--all-features','--all-targets','--','-D','warnings']),
 ('clippy-no-default',['cargo','+1.95.0','clippy','--locked','--offline','-p','hypersolve','--no-default-features','--all-targets','--','-D','warnings']),
 ('owner-doctests',['cargo','+1.95.0','test','--locked','--offline','-p','hypersolve','--all-features','--doc']),
 ('owner-docs',['cargo','+1.95.0','doc','--locked','--offline','-p','hypersolve','--all-features','--no-deps']),
 ]
 for name,cmd in commands:run(name,cmd,override={'RUSTDOCFLAGS':'-D warnings'} if name=='owner-docs' else None)
 out=run('public-witnesses',['cargo','+1.95.0','test','--release','--offline','--locked','--lib','--','--nocapture'],cwd=s/'public-witnesses');assert '36 passed; 0 failed;' in out
 trace('candidate');residual_public('candidate')
 assert (s/'baseline-trace/dispatch_trace.md').read_bytes()==(s/'candidate-trace/dispatch_trace.md').read_bytes()
 assert (s/'baseline-trace-run.log').read_bytes()==(s/'candidate-trace-run.log').read_bytes()
 for case in range(8):
  assert (s/f'baseline-residual-{case}-control.log').read_bytes()==(s/f'candidate-residual-{case}-control.log').read_bytes()
  for mode in ['control','witness']:
   old=[l for l in (s/f'baseline-residual-{case}-{mode}.log').read_text().splitlines() if l.startswith('TRACE ')];new=[l for l in (s/f'candidate-residual-{case}-{mode}.log').read_text().splitlines() if l.startswith('TRACE ')];assert old==new and len(old)==2
 save('trace-equivalence.json',dict(owner_full_report_equal=True,owner_full_stdout_equal=True,residual_cases=16,residual_policy_rows=32,exact_control_full_stdout_equal=True,residual_predicate_trace_equal=True))
 for package in ['hyperpath','hyperdynamics']:run(package,['cargo','+1.95.0','test','--locked','--offline','--release','-p',package,'--all-features','--lib','--tests'])
 for label in ['public-witnesses','residual-public']:run(label+'-clippy',['cargo','+1.95.0','clippy','--locked','--offline','--all-targets','--','-D','warnings'],cwd=s/label)
 run('final-format',['cargo','+1.95.0','fmt','--all','--','--check'],budget=120)
 run('final-whitespace',['git','diff','--check',base+'..HEAD'],budget=120)
 assert not git('status','--porcelain=v1')
 assert time.monotonic()<=deadline
 save('completion.json',dict(terminal=True,exit_code=0,seconds=time.monotonic()-started,commands=len(rows),candidate=git('rev-parse','HEAD').decode().strip(),admitted=False,timing_claim=False))
except BaseException as e:
 save('completion.json',dict(terminal=True,exit_code=1,error=repr(e),seconds=time.monotonic()-started,commands=len(rows),candidate=git('rev-parse','HEAD').decode().strip(),admitted=False));raise
finally:
 if held:
  assert state(3416600,'45823480')=='T' and state(1621335,'38218939')=='T'
  os.kill(3416600,signal.SIGCONT)
  save('release.json',dict(time_unix=time.time(),watcher_state=state(3416600,'45823480'),horizon_reset=False))
