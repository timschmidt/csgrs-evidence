from pathlib import Path
import gzip,hashlib,json,os,shutil,signal,subprocess,tarfile,time,tomllib
from artifact_sizes import native,wasm
s=Path(__file__).parent;old=Path('/tmp/interval-refactor/residual-certainty-admission')
r=Path('/mnt/development/interval-residual-certainty/csgrs');work=Path('/dev/shm/interval-residual-certainty-packaged-v2')
art=Path('/mnt/development/.interval-refactor-build/residual-certainty-artifacts');target=work/'target';packages=work/'packages';h=work/'consumer'
candidate='aad7409a5928e309812d9a5cc361d46313685266';watcher,parent=3416600,1621335
crates=['hyperreal','hyperinterval','hyperlattice-interval','hyperlattice','hyperlimit','hypersolve']
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def save(name,value):(s/name).write_text(json.dumps(value,indent=2)+'\n')
def state(pid,start):
 raw=Path(f'/proc/{pid}/stat').read_text();f=raw[raw.rfind(')')+2:].split();assert f[19]==start;return f[0]
assert state(parent,'38218939')=='T' and state(watcher,'45823480')=='S'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()==candidate
assert not subprocess.check_output(['git','status','--porcelain=v1'],cwd=r)
assert not work.exists() and not (s/'packaged-build-completion.json').exists()
work.mkdir();h.mkdir();target.mkdir();(work/'tmp').mkdir()
os.kill(watcher,signal.SIGSTOP);assert state(watcher,'45823480')=='T'
original_hold=json.loads(Path('/tmp/interval-refactor/residual-certainty-packaged/packaged-hold.json').read_text()); prior_elapsed=time.time()-original_hold['time']; assert prior_elapsed>=324; started=time.monotonic()-prior_elapsed;save('packaged-hold.json',dict(time=time.time(),parent=parent,watcher=watcher,budget_seconds=21600,original_campaign_started_unix=original_hold['time'],prior_elapsed_seconds=prior_elapsed,remaining_seconds=21600-prior_elapsed))
env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true','CARGO_TERM_COLOR':'never','TMPDIR':str(work/'tmp'),'HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
commands=[];rows=[];archive_rows=[];reference={};matched=workspace_matches=0
def run(name,cmd,cwd=r,budget=1800):
 assert time.monotonic()-started<21600
 raw=Path(f'/proc/{os.getpid()}/stat').read_text();f=raw[raw.rfind(')')+2:].split()
 save('packaged-active.json',dict(pid=os.getpid(),proc_starttime=f[19],name=name,command=cmd,cwd=str(cwd),budget_seconds=budget))
 t=time.monotonic()
 with (s/(name+'.log')).open('w') as out,(s/(name+'.stderr')).open('w') as err:
  p=subprocess.run(cmd,cwd=cwd,env=env,stdout=out,stderr=err,timeout=budget)
 result=dict(name=name,command=cmd,cwd=str(cwd),exit_code=p.returncode,seconds=time.monotonic()-t)
 commands.append(result);save('packaged-commands.json',commands);assert p.returncode==0,result
 print(name,'passed',flush=True);return result
def check(output,config,features,name,workspace):
 global matched,workspace_matches
 assert output.startswith('OUTPUT ') and '\nTRACE ' in output and output.endswith('\n')
 if output!=workspace:
  save('workspace-output-mismatch.json',dict(name=name,config=config,workspace=workspace,actual=output));raise AssertionError('Packaged/workspace report or trace mismatch')
 workspace_matches+=1;key=(features,*config['args'])
 if key in reference:
  if output!=reference[key]:
   save('package-output-mismatch.json',dict(name=name,config=config,expected=reference[key],actual=output));raise AssertionError('Full package-boundary output/trace mismatch')
  matched+=1
 else:reference[key]=output
def metadata(label,features,kind):
 name=f'packaged-{label}-{features or "default"}-{kind}-metadata'
 cmd=['cargo','+1.95.0','metadata','--offline','--locked','--format-version','1','--filter-platform','x86_64-unknown-linux-gnu' if kind=='native' else 'wasm32-unknown-unknown']
 if features:cmd+=['--features',features]
 run(name,cmd,h)
 data=json.loads((s/(name+'.log')).read_text());active={n['id'] for n in data['resolve']['nodes']};local=[]
 for package in data['packages']:
  path=Path(package['manifest_path']).resolve()
  if package['name']=='residual-certainty-consumer':assert path==h/'Cargo.toml';continue
  if package['name'].startswith('hyper') or package['source'] is None:
   assert path.is_relative_to(packages),('workspace or stale package fallback',package)
   assert package['name'] in crates and package['source'] is None
   assert package['version']==versions[package['name']]
   local.append(dict(name=package['name'],path=str(path),version=package['version'],active=package['id'] in active))
 assert {'hyperreal','hyperlattice','hyperlimit','hypersolve'} <= {p['name'] for p in local if p['active']}
 save(name+'-verified.json',dict(local=local,no_workspace_libraries=True,all_hyper_versions_match=True))
def consumer(label,revision,features,kind):
 name=f'packaged-{label}-{features or "default"}-{kind}';metadata(label,features,kind)
 cmd=['cargo','+1.95.0','build','--release','--locked','--offline']+(['--bin','residual-certainty-consumer'] if kind=='native' else ['--lib','--target','wasm32-unknown-unknown'])
 if features:cmd+=['--features',features]
 row=run(name+'-build',cmd,h);row.update(label=label,revision=revision,features=features,kind=kind);rows.append(row);save('packaged-builds.json',rows)
 source=target/'consumer'/('release/residual-certainty-consumer' if kind=='native' else 'wasm32-unknown-unknown/release/residual_certainty_consumer.wasm')
 dest=art/('v2-'+name+('.wasm' if kind=='wasm' else ''));assert not dest.exists();shutil.copy2(source,dest)
 row['artifact']=(native if kind=='native' else wasm)(dest);row['lock_sha256']=sha(h/'Cargo.lock');row['sources']={p.name:sha(p) for p in h.iterdir() if p.is_file()}
 prior=f'portable-{label}-{features or "default"}-{kind}';configs=json.loads((old/(prior+'-configs.json')).read_text());save(name+'-configs.json',configs)
 stream=gzip.open(old/(prior+'-controls.jsonl.gz'),'rt') if kind=='native' else (old/(prior+'-controls.jsonl')).open()
 results=[]
 if kind=='native':
  with stream,gzip.open(s/(name+'-controls.jsonl.gz'),'wt') as out:
   for config,line in zip(configs,stream,strict=True):
    assert time.monotonic()-started<21600
    baseline=json.loads(line);assert baseline['config']==config
    p=subprocess.run([str(dest),*[str(x) for x in config['args']]],capture_output=True,text=True,timeout=60)
    record=dict(config=config,output=p.stdout,stderr=p.stderr,exit_code=p.returncode);out.write(json.dumps(record)+'\n');assert p.returncode==0,(name,record)
    check(p.stdout,config,features,name,baseline['output']);results.append(dict(config=config,output_sha256=hashlib.sha256(p.stdout.encode()).hexdigest()))
 else:
  with (s/(name+'-controls.jsonl')).open('w') as out,(s/(name+'-controls.stderr')).open('w') as err:
   p=subprocess.run(['node',str(h/'invoke.cjs'),str(dest),str(s/(name+'-configs.json'))],stdout=out,stderr=err,timeout=600)
  row['functional_exit_code']=p.returncode;save('packaged-builds.json',rows);assert p.returncode==0,(name,(s/(name+'-controls.stderr')).read_text())
  with stream,(s/(name+'-controls.jsonl')).open() as actual:
   for config,line,prior_line in zip(configs,actual,stream,strict=True):
    baseline=json.loads(prior_line);record=json.loads(line);assert config==record['config']==baseline['config'] and record['imports']==[]
    check(record['output'],config,features,name,baseline['output']);results.append(dict(config=config,output_sha256=hashlib.sha256(record['output'].encode()).hexdigest(),memory={k:record[k] for k in ['before','materialized','after']}))
 row.update(functional_exit_code=0,control_count=len(results),controls=results);save('packaged-builds.json',rows);print(name,len(results),'full controls passed',flush=True)
try:
 run('package-cache-control',['bash','scripts/test-release-package-cache.sh','+1.95.0'])
 versions={n:tomllib.loads((r/'crates'/n/'Cargo.toml').read_text())['package']['version'] for n in crates}
 for name in ['fixture.rs','operation.rs','lib.rs','main.rs','invoke.cjs']:shutil.copy2(old/'portable'/name,h/name)
 manifest=(old/'portable/Cargo.toml').read_text()
 for n in ['hypersolve','hyperreal','hyperlimit']:
  before=f'path = "{r}/crates/{n}"';assert before in manifest;manifest=manifest.replace(before,f'version = "={versions[n]}"')
 manifest+='\n[patch.crates-io]\n'+''.join(f'{n} = {{ path = "../packages/{n}-{versions[n]}" }}\n' for n in ['hyperreal','hyperlattice','hyperlimit','hypersolve'])
 (h/'Cargo.toml').write_text(manifest);save('consumer-source-equivalence.json',{n:dict(original=sha(old/'portable'/n),copy=sha(h/n)) for n in ['fixture.rs','operation.rs','lib.rs','main.rs','invoke.cjs']})
 for label,revision in [('fixed','c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb'),('current','4192d8c726d3333a31cb7eddc30cc0d464d61411'),('candidate',candidate)]:
  subprocess.run(['git','checkout','--detach',revision],cwd=r,check=True,capture_output=True);assert not subprocess.check_output(['git','status','--porcelain=v1'],cwd=r)
  assert versions=={n:tomllib.loads((r/'crates'/n/'Cargo.toml').read_text())['package']['version'] for n in crates}
  env.pop('CARGO_HOME',None);env['CARGO_TARGET_DIR']=str(target)
  run(label+'-prepare-home',['bash','-c','source scripts/release-package-cache.sh; prepare_release_package_home "$1"','package-home',str(work/('cargo-home-'+label))])
  env['CARGO_HOME']=str(work/('cargo-home-'+label))
  run(label+'-clear-owned-builds',['bash','-c','source scripts/release-package-cache.sh; clear_release_package_builds "$@"','package-clear',str(target),*crates])
  package_target=target/'package'
  if package_target.exists():shutil.rmtree(package_target)
  run(label+'-verified-packages',['cargo','+1.95.0','package','--locked','--offline',*[x for n in crates for x in ['-p',n]]])
  if packages.exists():shutil.rmtree(packages)
  packages.mkdir();archive_dir=s/'archives'/label;archive_dir.mkdir(parents=True)
  for n in crates:
   path=package_target/f'{n}-{versions[n]}.crate';assert path.is_file();dest=archive_dir/path.name;shutil.copy2(path,dest)
   with tarfile.open(path) as tar:
    expected_prefix=f'{n}-{versions[n]}/';assert all(m.name.startswith(expected_prefix) for m in tar.getmembers());tar.extractall(packages,filter='data')
   unpacked=packages/f'{n}-{versions[n]}';vcs=json.loads((unpacked/'.cargo_vcs_info.json').read_text());assert vcs['git']['sha1']==revision and not vcs['git'].get('dirty',False)
   checked=[]
   for f in unpacked.rglob('*'):
    if not f.is_file():continue
    relative=f.relative_to(unpacked).as_posix()
    if relative in ['Cargo.toml','Cargo.lock','.cargo_vcs_info.json']:continue
    original=r/'crates'/n/('Cargo.toml' if relative=='Cargo.toml.orig' else relative);resolved=original.resolve();assert resolved.is_relative_to(r)
    expected=subprocess.check_output(['git','show',revision+':'+resolved.relative_to(r).as_posix()],cwd=r)
    assert f.read_bytes()==expected,(n,relative,'archive source differs from Git')
    checked.append(dict(path=relative,sha256=sha(f)))
   assert any(v['path']=='src/lib.rs' for v in checked)
   archive_rows.append(dict(label=label,revision=revision,name=n,version=versions[n],path=str(dest),sha256=sha(dest),bytes=dest.stat().st_size,vcs=vcs,source_files=checked))
  save('package-archives.json',archive_rows)
  env['CARGO_TARGET_DIR']=str(target/'consumer')
  if (h/'Cargo.lock').exists():(h/'Cargo.lock').unlink()
  run(label+'-consumer-lock',['cargo','+1.95.0','generate-lockfile','--offline'],h)
  for features in ['', 'trace']:
   for kind in ['native','wasm']:consumer(label,revision,features,kind)
 checks=[]
 for features in ['', 'trace']:
  for kind in ['native','wasm']:
   cmd=['cargo','+1.95.0','clippy','--locked','--offline']+(['--all-targets'] if kind=='native' else ['--lib','--target','wasm32-unknown-unknown'])
   if features:cmd+=['--features',features]
   cmd+=['--','-D','warnings'];checks.append(run(f'packaged-{features or "default"}-{kind}-clippy',cmd,h))
 checks.append(run('packaged-format-check',['cargo','+1.95.0','fmt','--','--check'],h));save('packaged-final-checks.json',checks)
 snapshot=s/'consumer';shutil.copytree(h,snapshot)
 save('packaged-build-completion.json',dict(terminal=True,exit_code=0,artifacts=len(rows),archives=len(archive_rows),controls=sum(v['control_count'] for v in rows),full_output_trace_matches=matched,workspace_output_trace_matches=workspace_matches,distinct_configurations=len(reference),seconds=time.monotonic()-started,admitted=False))
except BaseException as e:
 save('packaged-build-completion.json',dict(terminal=True,exit_code=1,error=repr(e),artifacts=len(rows),archives=len(archive_rows),full_output_trace_matches=matched,workspace_output_trace_matches=workspace_matches,seconds=time.monotonic()-started));raise
finally:
 subprocess.run(['git','checkout','interval-residual-certainty'],cwd=r,check=True,capture_output=True)
 assert state(parent,'38218939')=='T' and state(watcher,'45823480')=='T'
 os.kill(watcher,signal.SIGCONT);save('packaged-hold-released.json',dict(time=time.time(),watcher=watcher,seconds=time.monotonic()-started))
