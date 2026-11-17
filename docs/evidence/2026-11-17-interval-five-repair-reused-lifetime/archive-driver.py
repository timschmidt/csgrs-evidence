from pathlib import Path
import gzip,hashlib,importlib.util,io,json,os,shutil,signal,subprocess,tarfile,time
base=Path('/tmp/interval-refactor');s=base/'solver-five-repair-reused-lifetime';r=Path('/mnt/development/csgrs');e=Path('/mnt/development/csgrs-evidence')
record='docs/evidence/2026-11-17-interval-five-repair-reused-lifetime';dest=e/record;previous='dbf779db93c6765fcdf1c349ab1f9330be864c3e';ram=Path('/dev/shm/interval-five-reused-lifetime-archive')
def save(p,v):p.write_text(json.dumps(v,indent=2)+'\n')
def sha(b):return hashlib.sha256(b).hexdigest()
def git(*args):return subprocess.check_output(['git','-C',str(e),*args])
def state(pid,start):
 raw=Path(f'/proc/{pid}/stat').read_text();f=raw[raw.rfind(')')+2:].split();assert f[19]==start;return f[0]
v=json.loads((s/'verification.json').read_text());assert v['successful_histories']==726 and v['cycles']==23232 and not v['admitted']
assert git('rev-parse','HEAD').decode().strip()==previous and not git('status','--porcelain=v1') and not dest.exists() and not ram.exists()
assert state(1621335,'38218939')=='T'
watcher_alive=Path('/proc/3416600/stat').exists() and state(3416600,'45823480') not in ['Z','X']
if watcher_alive:
 assert state(3416600,'45823480')=='S';os.kill(3416600,signal.SIGSTOP)
try:
 if watcher_alive:
  for _ in range(20):
   if state(3416600,'45823480')=='T':break
   time.sleep(.05)
  assert state(3416600,'45823480')=='T'
 else:
  assert time.time()>=1794913575.322521+21600
  terminal=json.loads((base/'coordinated-ci/external-recurrence-watch/result.json').read_text())
  assert terminal['terminal'] and terminal['reason'].startswith('observation horizon reached')
  save(base/'five-reused-lifetime-watcher-terminal.json',terminal)
 save(base/'five-reused-lifetime-archive-hold.json',dict(time=time.time(),watcher_pid=3416600,watcher_start='45823480',parent_pid=1621335,parent_start='38218939',horizon_reset=False))
 sources=[]
 for label,root in [('qualification',s)]:
  for p in sorted(root.rglob('*')):
   if p.is_file() and '__pycache__' not in p.parts:sources.append((p,Path(label)/p.relative_to(root)))
 terminal_path=base/'five-reused-lifetime-watcher-terminal.json'
 if terminal_path.exists():sources.append((terminal_path,Path('watcher-terminal.json')))
 for row in json.loads((s/'builds.json').read_text()):
  for a in [row['size']]:
   p=Path(a['path']);assert sha(p.read_bytes())==a['sha256'];sources.append((p,Path('final-images')/p.name))
 ram.mkdir();origins=[]
 # Preserve exact compressed logs in a second lossless container, reducing
 # repeated output storage without dropping any byte or source observation.
 packed=[(p,rel) for p,rel in sources if p.suffix=='.gz'];sources=[(p,rel) for p,rel in sources if p.suffix!='.gz']
 bundle=ram.with_name(ram.name+'-observations.tar.gz');members=[]
 with bundle.open('wb') as raw_file,gzip.GzipFile(fileobj=raw_file,filename='',mode='wb',compresslevel=6,mtime=0) as compressed,tarfile.open(fileobj=compressed,mode='w|',format=tarfile.USTAR_FORMAT) as archive:
  for source,relative in packed:
   raw=source.read_bytes();item=tarfile.TarInfo(relative.as_posix());item.size=len(raw);item.mode=0o644;item.mtime=0;archive.addfile(item,io.BytesIO(raw));members.append(dict(source=str(source),member=relative.as_posix(),bytes=len(raw),sha256=sha(raw),source_mode=oct(source.stat().st_mode&0o777)))
 with tarfile.open(bundle,'r:gz') as archive:
  entries=archive.getmembers();assert len(entries)==len(members)
  for item,member in zip(entries,members):
   raw=archive.extractfile(item).read();assert item.name==member['member'] and sha(raw)==member['sha256'] and len(raw)==member['bytes'] and raw==Path(member['source']).read_bytes()
 member_file=ram.with_name(ram.name+'-members.json');save(member_file,members)
 sources.extend([(bundle,Path('compressed-observations.tar.gz')),(member_file,Path('compressed-observation-members.json'))])
 for source,relative in sources:
  raw=source.read_bytes();stored=raw;encoding='identity'
  if source.suffix in ['.log','.txt','.patch'] or (len(raw)>16384 and source.suffix!='.gz') or relative.parts[0]=='final-images':
   relative=relative.with_name(relative.name+'.gz');encoding='gzip';stored=gzip.compress(raw,compresslevel=6,mtime=0);assert gzip.decompress(stored)==raw
  out=ram/relative;assert not out.exists();out.parent.mkdir(parents=True,exist_ok=True);out.write_bytes(stored)
  origins.append(dict(source=str(source),source_bytes=len(raw),source_sha256=sha(raw),source_mode=oct(source.stat().st_mode&0o777),destination=relative.as_posix(),encoding=encoding,stored_bytes=len(stored),stored_sha256=sha(stored)))
 save(ram/'origins.json',origins);shutil.copyfile(Path(__file__),ram/'archive-driver.py')
 (ram/'README.md').write_text('''# Five-repair reused-input complete lifetime

Unaccepted source 4a04dd9744bfecb578963b42fa3bffef5b7062b5; primary baseline
319838755b96d288ae22d3624cd1a155631b0065. This additional observer owns one
input from measured construction through 32 operations and final destruction.
The unchanged fixture validates every returned report and receipt; input
generation is checked after every operation. Every cycle retains full output
and trace text. Cold outputs match the frozen original resource controls.

The four-repair source reproduces four expected qualified-receipt failures.
All 726 successful histories and 23,232 cycles are retained, including 24
successful reproduction controls and three processes per final configuration.
Complete histories are compared within 66 feature/policy/recording domains.
Negative/censored footprints and retention after cycle two remain explicit
failures. Input-held payload and post-input-destruction persistent state have
distinct prospective limits; construction and teardown get no extra allowance.
Original fixed denominators, positive charges, earlier workloads and failed
caps remain unchanged. Added workloads never use incorrect baseline outcomes.

All raw observations, commands, numerical accounts, image section/symbol data
and independent verification are in qualification. The 19 observer executables
are preserved losslessly, including the reproduction image. origins.json gives
source/stored byte counts, hashes and modes. compressed-observations.tar.gz
preserves the original compressed logs/listings byte-for-byte; its member
inventory records their source hashes and modes. Decode the container and then
individual gzip entries before replay. No observation is summarized away.
Earlier referenced cold controls remain in the immutable preceding records.
No third-party package archive is redistributed. Stages are frozen after this
snapshot, and all earlier archive paths/index rows remain unchanged.

The isolated checkout is restored. The original quiet watcher is resumed without
resetting its finite horizon; if it has already expired, it is not restarted.
Queued artifacts, other candidate worktrees and unrelated jobs are unchanged.
No source, memory or size account is admitted. These finite geometry payload
measurements exclude evidence-only validation/formatting; they do not establish
process RSS, allocator-arena use, deployment fit, quiet runtime or general
resource/cancellation completeness. The fifteen-phase goal stays active. No push.
''')
 total=sum(p.stat().st_size for p in ram.rglob('*') if p.is_file());assert shutil.disk_usage(e).free-2*total-20*1024**2>=20*1024**3
 shutil.copytree(ram,dest)
 subprocess.run(['git','-C',str(e),'add','--sparse','--',record],check=True);subprocess.run(['git','-C',str(e),'diff','--cached','--check'],check=True)
 changed=git('diff','--cached','--name-only').decode().splitlines();assert changed and all(p.startswith(record+'/') for p in changed) and not git('diff','--name-only')
 spec=importlib.util.spec_from_file_location('archive_manifest',r/'scripts/evidence_archive.py');module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);module.ROOTS={record:False}
 tree=git('write-tree').decode().strip();manifest=module.manifest(str(e),tree);assert len(manifest)==2
 entries=list(module.tree_entries(str(e),tree));digests=module.blob_digests(str(e),sorted({oid for _,_,oid in entries}))
 for path,kind,oid in entries:
  data=(e/path).read_bytes();assert kind=='-' and digests[oid]==(sha(data),len(data))
 for o in origins:
  data=(dest/o['destination']).read_bytes();raw=gzip.decompress(data) if o['encoding']=='gzip' else data
  assert sha(raw)==o['source_sha256'] and len(raw)==o['source_bytes'] and sha(data)==o['stored_sha256']
 subprocess.run(['git','-C',str(e),'commit','-m','Archive reused-input solver lifetime qualification'],check=True,stdout=subprocess.PIPE)
 revision=git('rev-parse','HEAD').decode().strip();assert not git('status','--porcelain=v1') and git('diff','--name-only',previous,revision).decode().splitlines()==changed and module.manifest(str(e),revision)==manifest
 _,count,size,digest=manifest[1].split('\t');result=dict(previous_revision=previous,revision=revision,record=record,row=manifest[1],files=int(count),bytes=int(size),sha256=digest,previous_archive_paths_unchanged=True,all_scoped_git_blobs_verified=True,source_stages_frozen=True)
 save(base/'five-reused-lifetime-archive.json',result);print(json.dumps(result,indent=2))
finally:
 assert state(1621335,'38218939')=='T'
 if watcher_alive:
  assert state(3416600,'45823480')=='T';os.kill(3416600,signal.SIGCONT)
 save(base/'five-reused-lifetime-archive-release.json',dict(time=time.time(),watcher_resumed=watcher_alive,horizon_reset=False))
