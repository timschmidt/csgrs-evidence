from pathlib import Path
import gzip,hashlib,json,os,shutil,signal,subprocess,tarfile,time,tomllib
from artifact_sizes import native,wasm
s=Path(__file__).parent;work=Path('/dev/shm/interval-five-repair-packaged');r=work/'source';h=work/'consumer';target=work/'target';packages=work/'packages';art=work/'final-images';old=s.parent/'solver-five-repair-portable';candidate='4a04dd9744bfecb578963b42fa3bffef5b7062b5'
crates=['hyperreal','hyperinterval','hyperlattice-interval','hyperlattice','hyperlimit','hypersolve'];started=time.monotonic();commands=[];rows=[];archives=[]
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
save=lambda n,d:(s/n).write_text(json.dumps(d,indent=2)+'\n')
env=os.environ|{'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true','CARGO_TERM_COLOR':'never','TMPDIR':str(work/'tmp'),'HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
def guard():
 f=Path('/proc/1621335/stat').read_text().rsplit(')',1)[1].split();assert f[0]=='T' and f[19]=='38218939'
 assert time.monotonic()-started<7200 and shutil.disk_usage('/mnt/development').free>=20*1024**3
 assert sum(p.stat().st_size for p in s.rglob('*') if p.is_file())<640*1024**2
 assert sum(p.stat().st_size for p in s.rglob('*.gz'))<512*1024**2

def run(name,cmd,cwd=r,budget=1200):
 guard();budget=min(budget,7200-(time.monotonic()-started));t=time.monotonic();timed=False
 save('active.json',dict(pid=os.getpid(),name=name,command=cmd,cwd=str(cwd),budget=budget,started=time.time()))
 paths=[s/(name+'.stdout'),s/(name+'.stderr')]
 with paths[0].open('wb') as out,paths[1].open('wb') as err:
  p=subprocess.Popen(cmd,cwd=cwd,env=env,stdout=out,stderr=err,start_new_session=True)
  try:p.wait(timeout=budget)
  except subprocess.TimeoutExpired:timed=True;os.killpg(p.pid,signal.SIGKILL);p.wait()
 logs=[]
 for path in paths:
  raw=path.read_bytes();dest=Path(str(path)+'.gz')
  with gzip.open(dest,'wb') as f:f.write(raw)
  logs.append(dict(path=dest.name,raw_bytes=len(raw),raw_sha256=hashlib.sha256(raw).hexdigest()));path.unlink()
 row=dict(name=name,command=cmd,cwd=str(cwd),exit_code=p.returncode,timeout=timed,seconds=time.monotonic()-t,logs=logs)
 commands.append(row);save('commands.json',commands);assert not timed and p.returncode==0,(name,p.returncode)
 print(name,'passed',flush=True);return row

def metadata(features,kind):
 name=f'{features.replace(",","-") or "default"}-{kind}-metadata';cmd=['cargo','+1.95.0','metadata','--locked','--offline','--format-version','1','--filter-platform','x86_64-unknown-linux-gnu' if kind=='native' else 'wasm32-unknown-unknown']
 if features:cmd+=['--features',features]
 run(name,cmd,h);data=json.loads(gzip.decompress((s/(name+'.stdout.gz')).read_bytes()));active={n['id'] for n in data['resolve']['nodes']};local=[]
 for p in data['packages']:
  path=Path(p['manifest_path']).resolve()
  if p['name']=='solver-five-portable':assert path==h/'Cargo.toml';continue
  if p['source'] is None or p['name'].startswith('hyper'):
   assert path.is_relative_to(packages) and p['name'] in crates and p['source'] is None
   assert p['version']==versions[p['name']];local.append(dict(name=p['name'],path=str(path),version=p['version'],active=p['id'] in active))
 assert sorted(p['name'] for p in local if p['active'])==['hyperlattice','hyperlimit','hyperreal','hypersolve']
 save(name+'-verified.json',dict(local=local,no_workspace_libraries=True,versions_match=True))

def build(features,kind):
 name=f'{features.replace(",","-") or "default"}-{kind}';metadata(features,kind)
 cmd=['cargo','+1.95.0','build','--release','--locked','--offline']+(['--bin','solver-five-portable'] if kind=='native' else ['--lib','--target','wasm32-unknown-unknown'])
 if features:cmd+=['--features',features]
 row=run(name+'-build',cmd,h);row.update(features=features,kind=kind,revision=candidate);rows.append(row);save('builds.json',rows)
 source=target/'consumer'/('release/solver-five-portable' if kind=='native' else 'wasm32-unknown-unknown/release/solver_five_portable.wasm');dest=art/(name+('.wasm' if kind=='wasm' else ''));assert not dest.exists();shutil.copy2(source,dest)
 a=(native if kind=='native' else wasm)(dest)
 if kind=='native':
  listing=subprocess.check_output(['objdump','-h',str(dest)],text=True);lines=listing.splitlines();allocated=executable=0
  for i,line in enumerate(lines[:-1]):
   parts=line.split()
   if len(parts)>=7 and parts[0].isdigit():
    n=int(parts[2],16)
    if 'ALLOC' in lines[i+1]:allocated+=n
    if 'CODE' in lines[i+1]:executable+=n
  a.update(allocated=allocated,executable=executable)
  with gzip.open(s/(name+'-objdump.txt.gz'),'wt') as f:f.write(listing)
 row['artifact']=a;row['sources']={p.name:sha(p) for p in h.iterdir() if p.is_file()};save('builds.json',rows)
 configs=[dict(args=[case,policy,record,reuse,warm],expected_failure=False) for case in range(7 if 'added' in features else 4) for policy in range(2) for record in (range(2) if 'trace' in features else range(1)) for reuse in range(2) for warm in range(2)]
 save(name+'-configs.json',configs);count=0
 if kind=='native':
  with gzip.open(s/(name+'-controls.jsonl.gz'),'wt') as stream:
   for config in configs:
    guard();timed=False
    try:
     p=subprocess.run([str(dest),*map(str,config['args'])],capture_output=True,text=True,timeout=min(60,7200-(time.monotonic()-started)))
     result=dict(config=config,output=p.stdout,stderr=p.stderr,exit_code=p.returncode,timeout=False)
    except subprocess.TimeoutExpired as error:
     result=dict(config=config,output=(error.stdout or b'').decode(),stderr=(error.stderr or b'').decode(),exit_code=None,timeout=True);timed=True
    stream.write(json.dumps(result)+'\n');stream.flush();assert not timed and result['exit_code']==0,(name,config,result['exit_code']);count+=1
 else:
  run(name+'-controls',['node',str(h/'invoke.cjs'),str(dest),str(s/(name+'-configs.json'))],h,600)
  with gzip.open(s/(name+'-controls.stdout.gz'),'rt') as stream:
   for config,line in zip(configs,stream,strict=True):
    result=json.loads(line);assert result['config']==config and result['imports']==[] and not result['expected_trap'];count+=1
 row['control_count']=count;save('builds.json',rows);print(name,count,'controls passed',flush=True)

assert not (s/'completion.json').exists() and not (s/'archives').exists();guard();assert shutil.disk_usage(s).free>=1024**3
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()==candidate and not subprocess.check_output(['git','status','--porcelain=v1'],cwd=r)
for path in [work/'tmp',art,packages,target]:path.mkdir()
save('environment.json',dict(started=time.time(),revision=candidate,work=str(work),driver_sha256=sha(__file__),toolchain='1.95.0',jobs=6,timeout_seconds=7200))
try:
 run('package-cache-control',['bash','scripts/test-release-package-cache.sh','+1.95.0'])
 versions={n:tomllib.loads((r/'crates'/n/'Cargo.toml').read_text())['package']['version'] for n in crates}
 run('prepare-home',['bash','-c','source scripts/release-package-cache.sh; prepare_release_package_home "$1"','package-home',str(work/'cargo-home')]);env['CARGO_HOME']=str(work/'cargo-home')
 run('verified-packages',['cargo','+1.95.0','package','--locked','--offline',*[x for n in crates for x in ['-p',n]]])
 (s/'archives').mkdir()
 for n in crates:
  origin=target/'package'/f'{n}-{versions[n]}.crate';dest=s/'archives'/origin.name;shutil.copy2(origin,dest)
  with tarfile.open(origin) as tar:
   prefix=f'{n}-{versions[n]}/';assert all(m.name.startswith(prefix) and m.isfile() for m in tar.getmembers());tar.extractall(packages,filter='data')
  unpacked=packages/f'{n}-{versions[n]}';vcs=json.loads((unpacked/'.cargo_vcs_info.json').read_text());assert vcs['git']['sha1']==candidate and not vcs['git'].get('dirty',False)
  files=[]
  for f in sorted(unpacked.rglob('*')):
   if not f.is_file():continue
   rel=f.relative_to(unpacked).as_posix()
   if rel in ['Cargo.toml','Cargo.lock','.cargo_vcs_info.json']:continue
   original=(r/'crates'/n/('Cargo.toml' if rel=='Cargo.toml.orig' else rel)).resolve();assert original.is_relative_to(r)
   expected=subprocess.check_output(['git','show',candidate+':'+original.relative_to(r).as_posix()],cwd=r);assert f.read_bytes()==expected,(n,rel)
   files.append(dict(path=rel,sha256=sha(f),bytes=f.stat().st_size))
  assert any(f['path']=='src/lib.rs' for f in files)
  archives.append(dict(name=n,version=versions[n],revision=candidate,path=str(dest),bytes=dest.stat().st_size,sha256=sha(dest),vcs=vcs,source_files=files));save('package-archives.json',archives)
 manifest=(old/'consumer/Cargo.toml').read_text()
 for n in ['hypersolve','hyperreal','hyperlimit']:
  before=f'path = "/mnt/development/interval-solver-five-repair/csgrs/crates/{n}"';assert before in manifest;manifest=manifest.replace(before,f'version = "={versions[n]}"')
 manifest+='\n[patch.crates-io]\n'+''.join(f'{n} = {{ path = "../packages/{n}-{versions[n]}" }}\n' for n in ['hyperreal','hyperlattice','hyperlimit','hypersolve'])
 (h/'Cargo.toml').write_text(manifest);env['CARGO_TARGET_DIR']=str(target/'consumer')
 run('consumer-lock',['cargo','+1.95.0','generate-lockfile','--offline'],h)
 for features in ['', 'trace','added','trace,added']:
  for kind in ['native','wasm']:build(features,kind)
 checks=[]
 for features in ['', 'trace','added','trace,added']:
  for kind in ['native','wasm']:
   cmd=['cargo','+1.95.0','clippy','--locked','--offline']+(['--all-targets'] if kind=='native' else ['--lib','--target','wasm32-unknown-unknown'])
   if features:cmd+=['--features',features]
   cmd+=['--','-D','warnings'];checks.append(run(f'clippy-{features.replace(",","-") or "default"}-{kind}',cmd,h))
 checks.append(run('format-check',['cargo','+1.95.0','fmt','--','--check'],h));save('checks.json',checks)
 shutil.copytree(h,s/'consumer');assert len(rows)==8 and sum(r['control_count'] for r in rows)==528
 save('completion.json',dict(exit_code=0,images=8,controls=528,archives=6,seconds=time.monotonic()-started,workspace_output_comparison_pending=True,admitted=False))
except BaseException as e:
 save('completion.json',dict(exit_code=1,error=repr(e),images=len(rows),archives=len(archives),seconds=time.monotonic()-started,admitted=False));raise
finally:
 assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()==candidate and not subprocess.check_output(['git','status','--porcelain=v1'],cwd=r)
 save('source-after.json',dict(revision=candidate,clean=True));(s/'active.json').unlink(missing_ok=True)
