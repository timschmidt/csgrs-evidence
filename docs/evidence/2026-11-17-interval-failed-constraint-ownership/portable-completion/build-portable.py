from pathlib import Path
import gzip,hashlib,json,os,shutil,signal,subprocess,time
from artifact_sizes import native,wasm
s=Path(__file__).parent;h=s/'portable';r=Path('/mnt/development/interval-residual-certainty/csgrs')
target=Path('/mnt/development/.interval-refactor-build/alpha-proof-stack');art=Path('/mnt/development/.interval-refactor-build/residual-certainty-artifacts')
candidate='aad7409a5928e309812d9a5cc361d46313685266';watcher,parent=3416600,1621335
def save(name,data):(s/name).write_text(json.dumps(data,indent=2)+'\n')
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def state(pid,start):
 raw=Path(f'/proc/{pid}/stat').read_text();f=raw[raw.rfind(')')+2:].split();assert f[19]==start;return f[0]
assert state(parent,'38218939')=='T' and state(watcher,'45823480')=='S'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()==candidate
assert not subprocess.check_output(['git','status','--porcelain=v1'],cwd=r)
assert not (s/'portable-build-completion.json').exists()
os.kill(watcher,signal.SIGSTOP);assert state(watcher,'45823480')=='T'
started=time.monotonic();save('portable-build-hold.json',dict(time=time.time(),parent=parent,watcher=watcher,total_budget_seconds=21600))
env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'}
cases=json.loads((s/'corpus.json').read_text())['cases'];rows=[];reference={};matched=0
def run(name,cmd,budget=1800):
 assert time.monotonic()-started<21600
 t=time.monotonic();raw=Path(f'/proc/{os.getpid()}/stat').read_text();fields=raw[raw.rfind(')')+2:].split()
 save('portable-build-active.json',dict(pid=os.getpid(),proc_starttime=fields[19],name=name,command=cmd,budget_seconds=budget))
 with (s/(name+'.log')).open('w') as f:p=subprocess.run(cmd,cwd=h,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=budget)
 result=dict(name=name,command=cmd,cwd=str(h),exit_code=p.returncode,seconds=time.monotonic()-t)
 assert p.returncode==0,result
 return result
def configs(label,features):
 result=[]
 for c in cases:
  if c['added'] and label not in ['pilot','candidate']:continue
  for policy in c['policies']:
   for recording in ([0,1] if features else [0]):
    for reuse in [0,1]:
     for warm in [0,1]:result.append(dict(case=c['case'],policy=policy,recording=recording,reuse=reuse,warm=warm,added=c['added'],args=[c['case'],int(policy=='approx'),recording,reuse,warm]))
 return result
def check_output(config,output,features,name):
 global matched
 assert output.startswith('OUTPUT ') and '\nTRACE ' in output and output.endswith('\n')
 key=(features,*config['args'])
 if key in reference:
  if reference[key]['output']!=output:
   save('portable-output-mismatch.json',dict(config=config,features=features,reference=reference[key],name=name,actual=output))
   raise AssertionError(('Full output/trace mismatch',name,config))
  matched+=1
 else:reference[key]=dict(name=name,output=output)
def build(label,revision,features,kind):
 name=f'portable-{label}-{features or "default"}-{kind}';cmd=['cargo','+1.95.0','build','--release','--offline','--locked']
 cmd+=['--bin','residual-certainty-consumer'] if kind=='native' else ['--lib','--target','wasm32-unknown-unknown']
 if features:cmd+=['--features',features]
 row=run(name+'-build',cmd);row.update(label=label,revision=revision,features=features,kind=kind);rows.append(row);save('portable-builds.json',rows)
 source=target/('release/residual-certainty-consumer' if kind=='native' else 'wasm32-unknown-unknown/release/residual_certainty_consumer.wasm')
 dest=art/(name+('.wasm' if kind=='wasm' else ''));assert not dest.exists();shutil.copy2(source,dest)
 row['artifact']=(native if kind=='native' else wasm)(dest);row['lock_sha256']=sha(h/'Cargo.lock');row['sources']={p.name:sha(p) for p in h.iterdir() if p.is_file()}
 for n,origin in [('fixture.rs',s/'resource-harness/fixture.rs'),('operation.rs',s/'lifetime/operation.rs')]:assert sha(h/n)==sha(origin)
 matrix=configs(label,features);path=s/(name+'-configs.json');save(path.name,matrix);results=[]
 if kind=='native':
  with gzip.open(s/(name+'-controls.jsonl.gz'),'wt') as stream:
   for config in matrix:
    assert time.monotonic()-started<21600
    p=subprocess.run([str(dest),*[str(x) for x in config['args']]],capture_output=True,text=True,timeout=60)
    record=dict(config=config,output=p.stdout,stderr=p.stderr,exit_code=p.returncode);stream.write(json.dumps(record)+'\n');assert p.returncode==0,(name,record)
    check_output(config,p.stdout,features,name);results.append(dict(config=config,output_sha256=hashlib.sha256(p.stdout.encode()).hexdigest()))
 else:
  stdout=s/(name+'-controls.jsonl');stderr=s/(name+'-controls.stderr')
  with stdout.open('w') as out,stderr.open('w') as err:
   p=subprocess.run(['node',str(h/'invoke.cjs'),str(dest),str(path)],stdout=out,stderr=err,timeout=600)
  row['functional_exit_code']=p.returncode;save('portable-builds.json',rows);assert p.returncode==0,(name,stderr.read_text())
  with stdout.open() as stream:
   for config,line in zip(matrix,stream,strict=True):
    record=json.loads(line);assert record['config']==config and record['imports']==[];check_output(config,record['output'],features,name)
    results.append(dict(config=config,output_sha256=hashlib.sha256(record['output'].encode()).hexdigest(),memory={k:record[k] for k in ['before','materialized','after']}))
 row.update(functional_exit_code=0,controls=results,control_count=len(results));save('portable-builds.json',rows)
 print(name,len(results),'full controls passed',flush=True)
try:
 run('portable-lock',['cargo','+1.95.0','generate-lockfile','--offline'])
 run('portable-format',['cargo','+1.95.0','fmt'])
 for kind in ['native','wasm']:build('pilot',candidate,'trace',kind)
 for label,revision in [('fixed','c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb'),('current','4192d8c726d3333a31cb7eddc30cc0d464d61411'),('candidate',candidate)]:
  subprocess.run(['git','checkout','--detach',revision],cwd=r,check=True,capture_output=True)
  for features in ['', 'trace']:
   for kind in ['native','wasm']:build(label,revision,features,kind)
 checks=[]
 for features in ['', 'trace']:
  for kind in ['native','wasm']:
   cmd=['cargo','+1.95.0','clippy','--locked','--offline']+(['--all-targets'] if kind=='native' else ['--lib','--target','wasm32-unknown-unknown'])
   if features:cmd+=['--features',features]
   cmd+=['--','-D','warnings'];checks.append(run(f'portable-{features or "default"}-{kind}-clippy',cmd))
 checks.append(run('portable-format-check',['cargo','+1.95.0','fmt','--','--check']));save('portable-final-checks.json',checks)
 save('portable-build-completion.json',dict(terminal=True,exit_code=0,artifacts=len(rows),full_output_trace_matches=matched,distinct_configurations=len(reference),controls=sum(r['control_count'] for r in rows),seconds=time.monotonic()-started,admitted=False))
except BaseException as e:
 save('portable-build-completion.json',dict(terminal=True,exit_code=1,error=repr(e),artifacts=len(rows),full_output_trace_matches=matched,seconds=time.monotonic()-started));raise
finally:
 subprocess.run(['git','checkout','interval-residual-certainty'],cwd=r,check=True,capture_output=True)
 assert state(parent,'38218939')=='T' and state(watcher,'45823480')=='T'
 os.kill(watcher,signal.SIGCONT);save('portable-build-hold-released.json',dict(time=time.time(),watcher=watcher,seconds=time.monotonic()-started))
