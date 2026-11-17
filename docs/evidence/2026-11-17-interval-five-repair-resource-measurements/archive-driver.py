from pathlib import Path
import gzip,hashlib,importlib.util,io,json,os,shutil,signal,subprocess,tarfile,time
base=Path('/tmp/interval-refactor');s=base/'solver-five-repair-measurements';r=Path('/mnt/development/csgrs');e=Path('/mnt/development/csgrs-evidence');ram=Path('/dev/shm/interval-five-resource-measurements-archive')
record='docs/evidence/2026-11-17-interval-five-repair-resource-measurements';dest=e/record;previous='b2dde626edd2ca1a4b4e5030192c3108d345b32a'
def save(p,v):p.write_text(json.dumps(v,indent=2)+'\n')
def sha(b):return hashlib.sha256(b).hexdigest()
def git(*args):return subprocess.check_output(['git','-C',str(e),*args])
def state(pid,start):
 raw=Path(f'/proc/{pid}/stat').read_text();f=raw[raw.rfind(')')+2:].split();assert f[19]==start;return f[0]
v=json.loads((s/'verification.json').read_text());assert v['processes']==12600 and not v['admitted'];assert json.loads((s/'completion.json').read_text())['exit_code']==0
assert git('rev-parse','HEAD').decode().strip()==previous and not git('status','--porcelain=v1') and not dest.exists() and not ram.exists()
assert state(3416600,'45823480')=='S' and state(1621335,'38218939')=='T';os.kill(3416600,signal.SIGSTOP)
try:
 for _ in range(20):
  if state(3416600,'45823480')=='T':break
  time.sleep(.05)
 assert state(3416600,'45823480')=='T';save(base/'five-resource-measurements-archive-hold.json',dict(time=time.time(),watcher_pid=3416600,watcher_start='45823480',parent_pid=1621335,parent_start='38218939',horizon_reset=False))
 ram.mkdir();origins=[];members=[]
 with (ram/'observations.tar.gz').open('wb') as raw_file,gzip.GzipFile(fileobj=raw_file,filename='',mode='wb',compresslevel=6,mtime=0) as compressed,tarfile.open(fileobj=compressed,mode='w|',format=tarfile.USTAR_FORMAT) as archive:
  for p in sorted((s/'logs').iterdir()):
   raw=p.read_bytes();name='logs/'+p.name;item=tarfile.TarInfo(name);item.size=len(raw);item.mode=0o644;item.mtime=0;archive.addfile(item,io.BytesIO(raw));members.append(dict(source=str(p),member=name,bytes=len(raw),sha256=sha(raw),source_mode=oct(p.stat().st_mode&0o777)))
 assert len(members)==12600
 with tarfile.open(ram/'observations.tar.gz','r:gz') as archive:
  entries=archive.getmembers();assert len(entries)==len(members)
  for item,expected in zip(entries,members):
   assert item.name==expected['member'];raw=archive.extractfile(item).read();assert len(raw)==expected['bytes'] and sha(raw)==expected['sha256'] and raw==Path(expected['source']).read_bytes()
 sources=[(p,Path('qualification')/p.relative_to(s)) for p in sorted(s.rglob('*')) if p.is_file() and 'logs' not in p.relative_to(s).parts and '__pycache__' not in p.parts]
 sources.append((base/'five-resource-measurements-driver.log',Path('driver.log')))
 for source,relative in sources:
  raw=source.read_bytes();stored=raw;encoding='identity'
  if source.suffix in ['.log','.jsonl'] or len(raw)>16384:
   relative=relative.with_name(relative.name+'.gz');encoding='gzip';stored=gzip.compress(raw,compresslevel=6,mtime=0)
  out=ram/relative;out.parent.mkdir(parents=True,exist_ok=True);out.write_bytes(stored)
  origins.append(dict(source=str(source),source_bytes=len(raw),source_sha256=sha(raw),source_mode=oct(source.stat().st_mode&0o777),destination=relative.as_posix(),encoding=encoding,stored_bytes=len(stored),stored_sha256=sha(stored)))
 save(ram/'origins.json',dict(files=origins,observation_bundle=dict(destination='observations.tar.gz',bytes=(ram/'observations.tar.gz').stat().st_size,sha256=sha((ram/'observations.tar.gz').read_bytes()),members=members)))
 builds=json.loads((base/'solver-five-repair-resources/builds.json').read_text());image_origins=json.loads((e/'docs/evidence/2026-11-17-interval-five-repair-resource-controls/origins.json').read_text());references=[]
 for b in builds:
  if b['reproduction_only']:continue
  a=b['artifacts']['resource'];entry=next(o for o in image_origins if o['source']==a['path']);path='docs/evidence/2026-11-17-interval-five-repair-resource-controls/'+entry['destination'];raw=gzip.decompress(git('show',previous+':'+path));assert sha(raw)==a['sha256'] and raw==Path(a['path']).read_bytes()
  references.append(dict(label=b['label'],features=b['features'],source_revision=b['revision'],archive_revision=previous,archive_path=path,bytes=len(raw),sha256=sha(raw)))
 save(ram/'image-references.json',references);shutil.copyfile(Path(__file__),ram/'archive-driver.py')
 (ram/'README.md').write_text('''# Five-repair repeated resource measurements

Unaccepted source 4a04dd9744bfecb578963b42fa3bffef5b7062b5; primary baseline
6dc3dc9da327984a2fce13819279374e3a1cef2f. This additional complete consumer
preserves the frozen fixture and monitors. All 12,600 planned independent
processes complete under the declared finite process/output/deadline protocol.
The original 211 matching cold controls, including the successful control from
the first collector attempt, remain supplementary observations. Complete output
and trace text is compared, with every source boundary and configuration kept.

The measured ordinary/stress envelopes and all original-cap failures are in
qualification/summary.json.gz and verification.json. No cap or baseline is
changed. All earlier standalone, four-repair and ten five-repair whole-owned
lifetime growth failures/charges remain separate and unchanged. Signed epoch
post-drop deltas are not whole-owned persistent footprints. Reused-input
whole-owned lifetime, quiet runtime, distribution and resource-contract proof
remain open. Payload/stack observations do not establish allocator-arena/RSS or
firmware fit; stack headroom includes the full reserved 2 MiB mapping.

The unchanged 18 executable images are referenced by immutable prior Git paths
and hashes in image-references.json, with decoded byte equality checked again.
observations.tar.gz preserves all 12,600 individually gzip-encoded raw logs;
origins.json inventories every member's exact source bytes, hash and mode.
Other records are preserved directly or gzip encoded as indicated. Decode the
container and individual members before replay; no log is summarized away.
No third-party package archive is redistributed. Earlier evidence paths and
index rows remain unchanged. Source stages are frozen after this snapshot.

The initial analysis hit its external 300-second limit. Its source and failure
are retained under analysis-attempt-01. The retry changes repeated log scans
to one newline pass; parser equivalence covers 63 formats and independent
verification checks every raw observation and all charges. No measurement is
rerun, cap changed or output normalized. The same 300-second retry limit holds.

The original quiet watcher resumes without a horizon reset; queued commands,
artifacts and unrelated jobs remain untouched. No source, memory or size account
is admitted, no quiet runtime claim is made, and no push occurs. The full
fifteen-phase interval refactor goal remains active.
''')
 total=sum(p.stat().st_size for p in ram.rglob('*') if p.is_file());assert shutil.disk_usage(e).free-2*total-20*1024**2>=20*1024**3;shutil.copytree(ram,dest)
 subprocess.run(['git','-C',str(e),'add','--sparse','--',record],check=True);subprocess.run(['git','-C',str(e),'diff','--cached','--check'],check=True)
 changed=git('diff','--cached','--name-only').decode().splitlines();assert changed and all(p.startswith(record+'/') for p in changed) and not git('diff','--name-only')
 spec=importlib.util.spec_from_file_location('archive_manifest',r/'scripts/evidence_archive.py');module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);module.ROOTS={record:False};tree=git('write-tree').decode().strip();manifest=module.manifest(str(e),tree);assert len(manifest)==2
 entries=list(module.tree_entries(str(e),tree));digests=module.blob_digests(str(e),sorted({oid for _,_,oid in entries}))
 for path,kind,oid in entries:
  data=(e/path).read_bytes();assert kind=='-' and digests[oid]==(sha(data),len(data))
 for o in origins:
  data=(dest/o['destination']).read_bytes();raw=gzip.decompress(data) if o['encoding']=='gzip' else data;assert sha(raw)==o['source_sha256'] and len(raw)==o['source_bytes'] and sha(data)==o['stored_sha256']
 subprocess.run(['git','-C',str(e),'commit','-m','Archive repeated combined solver resource and stack measurements'],check=True,stdout=subprocess.PIPE)
 revision=git('rev-parse','HEAD').decode().strip();assert not git('status','--porcelain=v1') and git('diff','--name-only',previous,revision).decode().splitlines()==changed and module.manifest(str(e),revision)==manifest
 _,count,size,digest=manifest[1].split('\t');result=dict(previous_revision=previous,revision=revision,record=record,row=manifest[1],files=int(count),bytes=int(size),sha256=digest,previous_archive_paths_unchanged=True,all_scoped_git_blobs_verified=True,source_stages_frozen=True,observation_members=len(members),referenced_images=len(references))
 save(base/'five-resource-measurements-archive.json',result);print(json.dumps(result,indent=2))
finally:
 assert state(3416600,'45823480')=='T' and state(1621335,'38218939')=='T';os.kill(3416600,signal.SIGCONT);save(base/'five-resource-measurements-archive-release.json',dict(time=time.time(),watcher_state=state(3416600,'45823480'),horizon_reset=False))
