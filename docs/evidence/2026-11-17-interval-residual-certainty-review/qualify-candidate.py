from pathlib import Path
import hashlib,json,os,signal,subprocess,time,shutil
s=Path(__file__).parent;q=s.parent/'coordinated-ci';root=Path('/mnt/development/interval-residual-certainty/csgrs');watcher=3416600;parent=1621335;out=s/'candidate';out.mkdir(exist_ok=False)
def state(pid,start):
 raw=Path(f'/proc/{pid}/stat').read_text();f=raw[raw.rfind(')')+2:].split();assert f[19]==start;return f[0]
def save(name,data):(out/name).write_text(json.dumps(data,indent=2)+'\n')
assert state(parent,'38218939')=='T' and state(watcher,'45823480')=='S'
os.kill(watcher,signal.SIGSTOP);assert state(watcher,'45823480')=='T'
save('build-hold.json',dict(time=time.time(),watcher=watcher,parent=parent,scope='Bounded isolated correctness qualification; no runtime measurement. Resume existing observer in finally.'))
started=time.monotonic();rows=[];target=Path('/mnt/development/.interval-refactor-build/alpha-proof-stack');env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
def run(name,cmd,cwd,expected=0,budget=900):
 start=time.monotonic()
 with (out/(name+'.log')).open('w') as f:p=subprocess.run(cmd,cwd=cwd,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=budget)
 row=dict(name=name,command=cmd,cwd=str(cwd),exit_code=p.returncode,expected_exit_code=expected,seconds=time.monotonic()-start,budget_seconds=budget);rows.append(row);save('commands.json',rows);print(name,p.returncode,flush=True);assert p.returncode==expected,row
try:
 run('fmt',['cargo','+1.95.0','fmt','--all'],root)
 base=out/'baseline-harness';shutil.copytree(s/'harness',base)
 with (base/'Cargo.toml').open('a') as f:f.write('\n[[test]]\nname = "residual_certainty"\npath = "/mnt/development/interval-residual-certainty/csgrs/crates/hypersolve/tests/residual_certainty.rs"\n')
 run('baseline-new-regressions',['cargo','+1.95.0','test','--release','--locked','--offline','--test','residual_certainty','--','--nocapture'],base,expected=101)
 harness=out/'harness';shutil.copytree(base,harness)
 manifest=harness/'Cargo.toml';manifest.write_text(manifest.read_text().replace('/mnt/development/csgrs/crates/','/mnt/development/interval-residual-certainty/csgrs/crates/'))
 run('candidate-public-build',['cargo','+1.95.0','build','--release','--locked','--offline'],harness)
 binary=Path('/mnt/development/.interval-refactor-build/residual-certainty-artifacts/candidate');shutil.copy2(target/'release/residual-certainty-review',binary)
 save('artifact.json',dict(path=str(binary),sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),source_base='4192d8c726d3333a31cb7eddc30cc0d464d61411',source_patch_sha256=hashlib.sha256(subprocess.check_output(['git','diff','HEAD'],cwd=root)).hexdigest()))
 for case in range(8):
  for name in ['control','witness']:run(f'{case}-{name}',[str(binary),name,str(case)],out,budget=120)
 for case in range(8):
  assert (s/f'{case}-control.log').read_bytes()==(out/f'{case}-control.log').read_bytes(),'Exact control output changed'
  for name in ['control','witness']:
   old=[x for x in (s/f'{case}-{name}.log').read_text().splitlines() if x.startswith('TRACE ')];new=[x for x in (out/f'{case}-{name}.log').read_text().splitlines() if x.startswith('TRACE ')];assert old==new and old,'Predicate trace changed'
 save('trace-equivalence.json',dict(exact_controls=8,public_cases=16,policy_pairs=32,all_exact_control_stdout_identical=True,all_nonempty_trace_rows_identical=True))
 run('candidate-new-regressions',['cargo','+1.95.0','test','--release','--locked','--offline','--test','residual_certainty'],harness)
 run('owner-all-features',['cargo','+1.95.0','test','--locked','--release','-p','hypersolve','--all-features','--lib','--tests'],root,budget=1800)
 run('owner-clippy',['cargo','+1.95.0','clippy','--locked','-p','hypersolve','--all-features','--all-targets','--','-D','warnings'],root)
 run('owner-no-default',['cargo','+1.95.0','test','--locked','--release','-p','hypersolve','--no-default-features','--lib','--test','smoke','--test','residual_certainty'],root,budget=1800)
 run('fmt-check',['cargo','+1.95.0','fmt','--all','--','--check'],root)
 run('diff-check',['git','diff','--check','HEAD'],root)
 save('completion.json',dict(terminal=True,exit_code=0,seconds=time.monotonic()-started,production_admitted=False,remaining='Downstream, runtime, size/lifetime, public-package and cumulative composition qualification. No memory account adopted.'))
finally:
 assert state(parent,'38218939')=='T' and state(watcher,'45823480')=='T'
 os.kill(watcher,signal.SIGCONT);save('build-hold-released.json',dict(time=time.time(),watcher=watcher,seconds=time.monotonic()-started,action='Resume same observer; original6h horizon and cumulative queue budgets retained'))
