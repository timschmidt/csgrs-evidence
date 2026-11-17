from pathlib import Path
import gzip, hashlib, json, os, shutil, signal, subprocess, time
from artifact_sizes import native, wasm
s=Path(__file__).parent; h=s/'consumer'; r=Path('/mnt/development/interval-solver-five-repair/csgrs')
target=Path('/dev/shm/interval-solver-five-repair'); art=Path('/dev/shm/interval-five-repair-portable-artifacts')
boundaries=json.loads(Path('/tmp/interval-refactor/solver-five-repair-resources/boundaries.json').read_text())
candidate=boundaries[-1][1]; started=time.monotonic(); rows=[]; refs={}; matched=0; successes=0; failures=0
save=lambda n,d:(s/n).write_text(json.dumps(d,indent=2)+'\n')
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'}
def parent_held():
 raw=Path('/proc/1621335/stat').read_text(); f=raw[raw.rfind(')')+2:].split(); assert f[19]=='38218939' and f[0]=='T'
def guard():
 parent_held(); assert time.monotonic()-started<7200
 assert shutil.disk_usage('/mnt/development').free>=20*1024**3
 sizes=[p.stat().st_size for p in s.rglob('*') if p.is_file()]
 assert sum(sizes)<640*1024**2
 assert sum(p.stat().st_size for p in s.rglob('*.gz'))<512*1024**2

def run(name,cmd,budget=1200,expected=0,cwd=h):
 guard(); budget=min(budget,7200-(time.monotonic()-started)); t=time.monotonic(); out=s/(name+'.log'); timed=False
 save('active.json',dict(pid=os.getpid(),name=name,command=cmd,started=time.time(),budget=budget))
 with out.open('wb') as f:
  p=subprocess.Popen(cmd,cwd=cwd,env=env,stdout=f,stderr=subprocess.STDOUT,start_new_session=True)
  try:p.wait(timeout=budget)
  except subprocess.TimeoutExpired:
   timed=True; os.killpg(p.pid,signal.SIGKILL);p.wait()
 raw=out.read_bytes()
 with gzip.open(str(out)+'.gz','wb') as f:f.write(raw)
 out.unlink()
 result=dict(name=name,command=cmd,cwd=str(cwd),exit_code=p.returncode,seconds=time.monotonic()-t,timeout=timed,log_sha256=hashlib.sha256(raw).hexdigest())
 save(name+'-result.json',result)
 assert not timed and p.returncode==expected,(name,p.returncode)
 return result

def configs(label,features):
 return [dict(args=[case,policy,record,reuse,warm],expected_failure=label=='reproduction' and case==6)
 for case in range(7 if 'added' in features else 4) for policy in range(2)
 for record in (range(2) if 'trace' in features else range(1)) for reuse in range(2) for warm in range(2)]

def compare(config,output,features,name):
 global matched
 assert output.startswith('OUTPUT ') and '\nTRACE ' in output and output.endswith('\n')
 key=(features,*config['args'])
 if key in refs:
  if refs[key][1]!=output:
   save('mismatch.json',dict(config=config,features=features,reference=refs[key],name=name,actual=output)); raise AssertionError('Full output/trace mismatch: '+name)
  matched+=1
 else:refs[key]=(name,output)

def build(label,revision,features,kind):
 global successes,failures
 name=f'{label}-{features.replace(",","-") or "default"}-{kind}'
 cmd=['cargo','+1.95.0','build','--release','--offline','--locked']
 cmd+=['--bin','solver-five-portable'] if kind=='native' else ['--lib','--target','wasm32-unknown-unknown']
 if features:cmd+=['--features',features]
 row=run(name+'-build',cmd);row.update(label=label,revision=revision,features=features,kind=kind);rows.append(row);save('builds.json',rows)
 source=target/('release/solver-five-portable' if kind=='native' else 'wasm32-unknown-unknown/release/solver_five_portable.wasm')
 dest=art/(name+('.wasm' if kind=='wasm' else '')); assert not dest.exists();shutil.copy2(source,dest)
 row['artifact']=(native if kind=='native' else wasm)(dest)
 if kind=='native':
  listing=subprocess.check_output(['objdump','-h',str(dest)],text=True);lines=listing.splitlines();allocated=executable=0
  for i,line in enumerate(lines[:-1]):
   parts=line.split()
   if len(parts)>=7 and parts[0].isdigit():
    flags=lines[i+1];n=int(parts[2],16)
    if 'ALLOC' in flags:allocated+=n
    if 'CODE' in flags:executable+=n
  row['artifact'].update(allocated=allocated,executable=executable)
  with gzip.open(s/(name+'-objdump.txt.gz'),'wt') as f:f.write(listing)
 row['sources']={p.name:sha(p) for p in h.iterdir() if p.is_file()};save('builds.json',rows)
 matrix=configs(label,features);save(name+'-configs.json',matrix);observations=[]
 if kind=='native':
  with gzip.open(s/(name+'-controls.jsonl.gz'),'wt') as stream:
   for config in matrix:
    guard(); t=time.monotonic()
    p=subprocess.run([str(dest),*map(str,config['args'])],capture_output=True,text=True,timeout=min(60,7200-(t-started)))
    record=dict(config=config,output=p.stdout,stderr=p.stderr,exit_code=p.returncode);stream.write(json.dumps(record)+'\n');stream.flush()
    if config['expected_failure']:
     assert p.returncode==101 and 'qualified ball receipt must remain unresolved' in p.stderr,(name,config,p.returncode);failures+=1
    else:
     assert p.returncode==0,(name,config,p.returncode);compare(config,p.stdout,features,name);successes+=1
    observations.append(dict(config=config,exit_code=p.returncode,output_sha256=hashlib.sha256(p.stdout.encode()).hexdigest()))
 else:
  run(name+'-controls',['node',str(h/'invoke.cjs'),str(dest),str(s/(name+'-configs.json'))],600)
  with gzip.open(s/(name+'-controls.log.gz'),'rt') as stream:
   for config,line in zip(matrix,stream,strict=True):
    record=json.loads(line);assert record['config']==config and record['imports']==[]
    if config['expected_failure']:assert record['expected_trap'];failures+=1
    else:
     assert not record['expected_trap'];compare(config,record['output'],features,name);successes+=1
    observations.append({k:v for k,v in record.items() if k!='output'})
 row.update(control_count=len(observations),controls=observations);save('builds.json',rows)
 print(name,'controls',len(observations),'successes',successes,'expected failures',failures,flush=True)

assert not (s/'completion.json').exists();parent_held()
assert shutil.disk_usage(s).free>=1024**3
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()==candidate
assert not subprocess.check_output(['git','status','--porcelain=v1'],cwd=r)
assert sha(h/'fixture.rs')==json.loads((s/'provenance.json').read_text())['fixture_sha256']
assert sha(h/'operation.rs')==json.loads((s/'provenance.json').read_text())['operation_slice_sha256']
art.mkdir();save('environment.json',dict(started=time.time(),boundaries=boundaries,environment={k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE']},driver_sha256=sha(__file__)))
try:
 run('format',['cargo','+1.95.0','fmt'])
 for label,revision,features in [('reproduction',boundaries[-2][1],'trace,added')]+[(label,rev,f) for label,rev in boundaries for f in ['', 'trace']]+[('five-added',candidate,f) for f in ['added','trace,added']]:
  subprocess.run(['git','checkout','--detach',revision],cwd=r,check=True,capture_output=True)
  for kind in ['native','wasm']:build(label,revision,features,kind)
 checks=[]
 for features in ['', 'trace','added','trace,added']:
  for kind in ['native','wasm']:
   cmd=['cargo','+1.95.0','clippy','--offline','--locked']+(['--all-targets'] if kind=='native' else ['--lib','--target','wasm32-unknown-unknown'])
   if features:cmd+=['--features',features]
   cmd+=['--','-D','warnings'];checks.append(run(f'clippy-{features.replace(",","-") or "default"}-{kind}',cmd))
 checks.append(run('format-check',['cargo','+1.95.0','fmt','--','--check']));save('checks.json',checks)
 assert len(rows)==38 and successes==2064 and failures==32,(len(rows),successes,failures)
 save('completion.json',dict(exit_code=0,images=len(rows),successes=successes,expected_failures=failures,full_matches=matched,seconds=time.monotonic()-started,admitted=False))
except BaseException as e:
 save('completion.json',dict(exit_code=1,error=repr(e),images=len(rows),successes=successes,expected_failures=failures,full_matches=matched,seconds=time.monotonic()-started,admitted=False));raise
finally:
 subprocess.run(['git','checkout','interval-solver-five-repair'],cwd=r,check=True,capture_output=True)
 assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()==candidate
 assert not subprocess.check_output(['git','status','--porcelain=v1'],cwd=r)
 parent_held();save('restored.json',dict(revision=candidate,parent_held=True,time=time.time()))
 (s/'active.json').unlink(missing_ok=True)
