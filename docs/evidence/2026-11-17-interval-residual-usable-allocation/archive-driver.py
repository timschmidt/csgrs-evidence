from pathlib import Path
import gzip,hashlib,importlib.util,json,os,shutil,signal,subprocess,time
base=Path('/tmp/interval-refactor');s=base/'residual-usable-allocation-attribution';r=Path('/mnt/development/csgrs');e=Path('/mnt/development/csgrs-evidence')
record='docs/evidence/2026-11-17-interval-residual-usable-allocation';dest=e/record
previous='1da0eebf99e52060d5f08dd1f7c80cf8e28def6d'
def save(p,v):p.write_text(json.dumps(v,indent=2)+'\n')
def sha(data):return hashlib.sha256(data).hexdigest()
def git(*args):return subprocess.check_output(['git','-C',str(e),*args])
def state(pid,start):
 raw=Path(f'/proc/{pid}/stat').read_text();f=raw[raw.rfind(')')+2:].split();assert f[19]==start;return f[0]
assert json.loads((s/'verification.json').read_text())['reconciled_epochs']==219
assert json.loads((s/'completion.json').read_text())['exit_code']==0
assert git('rev-parse','HEAD').decode().strip()==previous and not git('status','--porcelain=v1')
assert not dest.exists()
assert state(3416600,'45823480')=='S' and state(1621335,'38218939')=='T'
os.kill(3416600,signal.SIGSTOP)
try:
 for _ in range(20):
  if state(3416600,'45823480')=='T':break
  time.sleep(.05)
 assert state(3416600,'45823480')=='T' and state(1621335,'38218939')=='T'
 save(base/'residual-usable-archive-hold.json',dict(time=time.time(),watcher_pid=3416600,watcher_start='45823480',parent_pid=1621335,parent_start='38218939',horizon_reset=False))
 total=sum(p.stat().st_size for p in s.rglob('*') if p.is_file());assert shutil.disk_usage(e).free-3*total-20*1024**2>=20*1024**3
 dest.mkdir(parents=True)
 origins=[]
 for p in sorted(s.rglob('*')):
  if not p.is_file() or '__pycache__' in p.parts:continue
  raw=p.read_bytes();relative=Path('diagnostic')/p.relative_to(s);encoding='identity';stored=raw
  if p.suffix in ['.log','.txt','.so']:
   relative=relative.with_name(relative.name+'.gz');encoding='gzip';stored=gzip.compress(raw,compresslevel=6,mtime=0);assert gzip.decompress(stored)==raw
  out=dest/relative;out.parent.mkdir(parents=True,exist_ok=True);out.write_bytes(stored)
  origins.append(dict(source=str(p),source_bytes=len(raw),source_sha256=sha(raw),source_mode=oct(p.stat().st_mode & 0o777),destination=relative.as_posix(),encoding=encoding,stored_bytes=len(stored),stored_sha256=sha(stored)))
 save(dest/'origins.json',origins)
 shutil.copy2(Path(__file__),dest/'archive-driver.py')
 (dest/'README.md').write_text('''# Residual-certainty allocator usable-byte attribution

Primary documentation baseline b22dfbbc763fe937e5132bc042ce864eec656a75;
unaccepted candidate aad7409a5928e309812d9a5cc361d46313685266;
fixed c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb and measured current
4192d8c726d3333a31cb7eddc30cc0d464d61411. Original final images are already
preserved in resource evidence commit d62cded53e3df97f5c77ada6a040df93cda848c0.

This finite diagnostic uses their original no-feature binaries: case 24,
STRICT, passive trace, cold rebuilt input. Fixed and current images have
identical bytes. All 146 processes preserve complete output and trace records.
Seventy-three instrumented processes reconcile 219 operation/output-drop/input-
drop epochs against the binaries' original counters. All 6,312-event operation
request sequences agree; 73 event ordinals exhibit usable-byte variation.
Every operation has 2,910 allocations, 2,809 deallocations, 593 reallocations,
193,309 requested traffic bytes, 14,100 requested peak and 9,088 requested live
bytes. Same requested allocation sizes can receive different allocator usable
sizes. Plain processes also reproduce varying usable bytes on each binary.

PROTOCOL.md precedes execution. The process-local interposer reads the original
measurement flag, delegates to glibc and records events without changing image
bytes or global allocator/ASLR settings. analyze.py performs per-process checks;
verify.py separately reconstructs the raw events, request sequences, matching
ordinals and total differences. Instrumentation may perturb layout: these are
attribution results, not unchanged resource costs, runtime evidence or a general
allocator model. Requested free sizes are not inferred from usable sizes.

All original failures and charges remain. No cap revision, account acceptance,
production adoption, source inventory change or completion of the broader goal
is claimed. The quiet watcher was restored after each finite hold, preserving
its original horizon. Archive-release and commit receipts live outside this
frozen snapshot in the parent stage. No push.

All command-output and shared-object bytes are losslessly gzip encoded;
origins.json records original and stored hashes, sizes and modes. Decode before
replaying, preserving relative names. Source stages are now frozen.
''')
 subprocess.run(['git','-C',str(e),'add','--sparse','--',record],check=True)
 subprocess.run(['git','-C',str(e),'diff','--cached','--check'],check=True)
 changed=git('diff','--cached','--name-only').decode().splitlines();assert all(p.startswith(record+'/') for p in changed) and not git('diff','--name-only')
 # Use the repository's manifest implementation restricted to this new record;
 # prove earlier paths unchanged rather than rereading the entire archive.
 spec=importlib.util.spec_from_file_location('archive_manifest',r/'scripts/evidence_archive.py');module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
 module.ROOTS={record:False}
 tree=git('write-tree').decode().strip();manifest=module.manifest(str(e),tree);assert len(manifest)==2
 entries=list(module.tree_entries(str(e),tree));digests=module.blob_digests(str(e),sorted({oid for _,_,oid in entries}))
 for path,kind,oid in entries:
  data=(e/path).read_bytes();assert kind=='-' and digests[oid]==(sha(data),len(data))
 for origin in origins:
  stored=(dest/origin['destination']).read_bytes();raw=gzip.decompress(stored) if origin['encoding']=='gzip' else stored
  assert sha(raw)==origin['source_sha256'] and len(raw)==origin['source_bytes']
 subprocess.run(['git','-C',str(e),'commit','-m','Archive residual-certainty usable-allocation attribution'],check=True,stdout=subprocess.PIPE)
 revision=git('rev-parse','HEAD').decode().strip();assert not git('status','--porcelain=v1')
 assert git('diff','--name-only',previous,revision).decode().splitlines()==changed
 assert module.manifest(str(e),revision)==manifest
 _,count,size,digest=manifest[1].split('\t')
 result=dict(previous_revision=previous,revision=revision,record=record,row=manifest[1],files=int(count),bytes=int(size),sha256=digest,previous_archive_paths_unchanged=True,all_scoped_git_blobs_verified=True,source_stage_frozen=True)
 save(base/'residual-usable-archive.json',result);print(json.dumps(result,indent=2))
finally:
 assert state(3416600,'45823480')=='T' and state(1621335,'38218939')=='T'
 os.kill(3416600,signal.SIGCONT)
 save(base/'residual-usable-archive-release.json',dict(time=time.time(),watcher_state=state(3416600,'45823480'),horizon_reset=False))
