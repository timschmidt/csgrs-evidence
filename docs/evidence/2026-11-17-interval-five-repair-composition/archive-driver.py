from pathlib import Path
import gzip,hashlib,importlib.util,json,os,shutil,signal,subprocess,time
base=Path('/tmp/interval-refactor');s=base/'solver-five-repair-composition';old=base/'solver-five-repair-composition-attempt-01'
r=Path('/mnt/development/csgrs');e=Path('/mnt/development/csgrs-evidence');record='docs/evidence/2026-11-17-interval-five-repair-composition';dest=e/record
previous='d2842b8b326d916d541a670ada9a604ab9453e9a'
def save(p,v):p.write_text(json.dumps(v,indent=2)+'\n')
def sha(data):return hashlib.sha256(data).hexdigest()
def git(*args):return subprocess.check_output(['git','-C',str(e),*args])
def state(pid,start):
 raw=Path(f'/proc/{pid}/stat').read_text();f=raw[raw.rfind(')')+2:].split();assert f[19]==start;return f[0]
verification=json.loads((s/'verification.json').read_text());assert verification['baseline_failed_regressions']==4 and not verification['admitted']
assert json.loads((s/'completion.json').read_text())['exit_code']==0
assert git('rev-parse','HEAD').decode().strip()==previous and not git('status','--porcelain=v1') and not dest.exists()
assert state(3416600,'45823480')=='S' and state(1621335,'38218939')=='T'
os.kill(3416600,signal.SIGSTOP)
try:
 for _ in range(20):
  if state(3416600,'45823480')=='T':break
  time.sleep(.05)
 assert state(3416600,'45823480')=='T' and state(1621335,'38218939')=='T'
 save(base/'five-repair-archive-hold.json',dict(time=time.time(),watcher_pid=3416600,watcher_start='45823480',parent_pid=1621335,parent_start='38218939',horizon_reset=False))
 sources=[]
 for label,root in [('qualification',s),('initial-format-attempt',old)]:
  for p in sorted(root.rglob('*')):
   if p.is_file() and '__pycache__' not in p.parts:sources.append((p,Path(label)/p.relative_to(root)))
 for p in sorted(s.glob('*-artifact.json')):
  a=json.loads(p.read_text());image=Path(a['path']);assert sha(image.read_bytes())==a['sha256'];sources.append((image,Path('final-observers')/image.name))
 total=sum(p.stat().st_size for p,_ in sources);assert shutil.disk_usage(e).free-3*total-20*1024**2>=20*1024**3
 dest.mkdir(parents=True);origins=[]
 for source,relative in sources:
  raw=source.read_bytes();encoding='identity';stored=raw
  if source.suffix in ['.log','.txt','.patch'] or relative.parts[0]=='final-observers' or source.name=='dispatch_trace.md':
   relative=relative.with_name(relative.name+'.gz');encoding='gzip';stored=gzip.compress(raw,compresslevel=6,mtime=0);assert gzip.decompress(stored)==raw
  out=dest/relative;assert not out.exists();out.parent.mkdir(parents=True,exist_ok=True);out.write_bytes(stored)
  origins.append(dict(source=str(source),source_bytes=len(raw),source_sha256=sha(raw),source_mode=oct(source.stat().st_mode&0o777),destination=relative.as_posix(),encoding=encoding,stored_bytes=len(stored),stored_sha256=sha(stored)))
 save(dest/'origins.json',origins);shutil.copy2(Path(__file__),dest/'archive-driver.py')
 (dest/'README.md').write_text('''# Five-repair solver composition: functional qualification

Primary documentation baseline 1debdd7ec0aac45b7c4796305b389dedd7ed87fe.
Unaccepted isolated candidate 4a04dd9744bfecb578963b42fa3bffef5b7062b5 composes
four-repair f65589b44e1a010de75f8129b371ecbf503cc052 with residual-certainty
repair aad7409a5928e309812d9a5cc361d46313685266. The original three residual
source/test files are byte-identical; the existing four-repair composition
witness gains assertions without removing any existing assertion or input.

Baseline reproduction includes all four unchanged residual regressions, the
new composition witness and eight public residual witnesses. Their expected
failures are preserved. The candidate completes owning-crate all-feature tests,
no-default library/smoke/residual tests, both strict all-target Clippy configs,
doctests, strict docs, all 36 original four-repair public witnesses, the residual
public corpus and Hyperpath/Hyperdynamics affected tests. Ignored tests remain
explicit in verification.json, not counted as completed cases. Full owning
trace reports/stdout and all 32 public residual policy traces agree with the
fresh four-repair baseline; eight exact-control full outputs also agree.

The original line-wrap-only Rustfmt rejection is retained under
initial-format-attempt. The retry preserves every assertion and the original
total elapsed deadline. PROTOCOL.md precedes both attempts. The verified
original quiet watcher is resumed without resetting its finite horizon; no
queued revision/artifact or unrelated process is modified. Terminal source,
commands, raw outcomes, source checksums and independent verification are in
qualification. Source stages are frozen after this snapshot.

The four final observer executables are preserved losslessly in final-observers.
Other command outputs are also losslessly gzip encoded where indicated;
origins.json records original/stored hashes, bytes and modes. Decode before
replaying. Candidate source commits remain on the isolated local branch.
No third-party registry archive is redistributed.

This is functional composition evidence, not source admission, a memory/size
account, quiet runtime, full repository validation or package-release proof.
Every prior positive charge and cap failure remains; fresh final combined
resource, artifact, runtime, successive and distribution qualification remains
required. The fifteen-phase interval refactor goal stays active. No push.
''')
 subprocess.run(['git','-C',str(e),'add','--sparse','--',record],check=True)
 subprocess.run(['git','-C',str(e),'diff','--cached','--check'],check=True)
 changed=git('diff','--cached','--name-only').decode().splitlines();assert changed and all(p.startswith(record+'/') for p in changed) and not git('diff','--name-only')
 spec=importlib.util.spec_from_file_location('archive_manifest',r/'scripts/evidence_archive.py');module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);module.ROOTS={record:False}
 tree=git('write-tree').decode().strip();manifest=module.manifest(str(e),tree);assert len(manifest)==2
 entries=list(module.tree_entries(str(e),tree));digests=module.blob_digests(str(e),sorted({oid for _,_,oid in entries}))
 for path,kind,oid in entries:
  data=(e/path).read_bytes();assert kind=='-' and digests[oid]==(sha(data),len(data))
 for o in origins:
  data=(dest/o['destination']).read_bytes();raw=gzip.decompress(data) if o['encoding']=='gzip' else data
  assert sha(raw)==o['source_sha256'] and len(raw)==o['source_bytes']
 subprocess.run(['git','-C',str(e),'commit','-m','Archive five-repair solver composition qualification'],check=True,stdout=subprocess.PIPE)
 revision=git('rev-parse','HEAD').decode().strip();assert not git('status','--porcelain=v1')
 assert git('diff','--name-only',previous,revision).decode().splitlines()==changed and module.manifest(str(e),revision)==manifest
 _,count,size,digest=manifest[1].split('\t')
 result=dict(previous_revision=previous,revision=revision,record=record,row=manifest[1],files=int(count),bytes=int(size),sha256=digest,previous_archive_paths_unchanged=True,all_scoped_git_blobs_verified=True,source_stages_frozen=True)
 save(base/'five-repair-archive.json',result);print(json.dumps(result,indent=2))
finally:
 assert state(3416600,'45823480')=='T' and state(1621335,'38218939')=='T'
 os.kill(3416600,signal.SIGCONT);save(base/'five-repair-archive-release.json',dict(time=time.time(),watcher_state=state(3416600,'45823480'),horizon_reset=False))
