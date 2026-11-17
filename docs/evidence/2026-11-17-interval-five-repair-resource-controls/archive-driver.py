from pathlib import Path
import gzip,hashlib,importlib.util,json,os,shutil,signal,subprocess,time
base=Path('/tmp/interval-refactor');s=base/'solver-five-repair-resources';old=s.with_name(s.name+'-attempt-01');r=Path('/mnt/development/csgrs');e=Path('/mnt/development/csgrs-evidence')
record='docs/evidence/2026-11-17-interval-five-repair-resource-controls';dest=e/record;previous='db6870e1c3109c4e540d084e3f34039dc412158f';ram=Path('/dev/shm/interval-five-resource-controls-archive')
def save(p,v):p.write_text(json.dumps(v,indent=2)+'\n')
def sha(b):return hashlib.sha256(b).hexdigest()
def git(*args):return subprocess.check_output(['git','-C',str(e),*args])
def state(pid,start):
 raw=Path(f'/proc/{pid}/stat').read_text();f=raw[raw.rfind(')')+2:].split();assert f[19]==start;return f[0]
v=json.loads((s/'verification.json').read_text());assert v['successful_controls']==516 and len(v['failed_growth_metrics'])==10 and not v['admitted']
assert git('rev-parse','HEAD').decode().strip()==previous and not git('status','--porcelain=v1') and not dest.exists() and not ram.exists()
assert state(3416600,'45823480')=='S' and state(1621335,'38218939')=='T';os.kill(3416600,signal.SIGSTOP)
try:
 for _ in range(20):
  if state(3416600,'45823480')=='T':break
  time.sleep(.05)
 assert state(3416600,'45823480')=='T'
 save(base/'five-resource-controls-archive-hold.json',dict(time=time.time(),watcher_pid=3416600,watcher_start='45823480',parent_pid=1621335,parent_start='38218939',horizon_reset=False))
 sources=[]
 for label,root in [('qualification',s),('initial-collector-attempt',old)]:
  for p in sorted(root.rglob('*')):
   if p.is_file() and '__pycache__' not in p.parts:sources.append((p,Path(label)/p.relative_to(root)))
 for row in json.loads((s/'builds.json').read_text()):
  for a in row['artifacts'].values():
   p=Path(a['path']);assert sha(p.read_bytes())==a['sha256'];sources.append((p,Path('final-images')/p.name))
 ram.mkdir();origins=[]
 for source,relative in sources:
  raw=source.read_bytes();stored=raw;encoding='identity'
  if source.suffix in ['.log','.txt','.patch'] or relative.parts[0]=='final-images':
   relative=relative.with_name(relative.name+'.gz');encoding='gzip';stored=gzip.compress(raw,compresslevel=6,mtime=0);assert gzip.decompress(stored)==raw
  out=ram/relative;assert not out.exists();out.parent.mkdir(parents=True,exist_ok=True);out.write_bytes(stored)
  origins.append(dict(source=str(source),source_bytes=len(raw),source_sha256=sha(raw),source_mode=oct(source.stat().st_mode&0o777),destination=relative.as_posix(),encoding=encoding,stored_bytes=len(stored),stored_sha256=sha(stored)))
 save(ram/'origins.json',origins);shutil.copyfile(Path(__file__),ram/'archive-driver.py')
 (ram/'README.md').write_text('''# Five-repair complete-consumer resource controls

Unaccepted isolated source 4a04dd9744bfecb578963b42fa3bffef5b7062b5; primary
baseline 0088d10b54e7601a5216501175f8f3956d9970c8. The additional consumer
preserves every original chain assertion and input, then consumes residual-ball
certification through failure diagnostics. Original five monitor/runner files
are unchanged. The original four-repair source reproduces eight expected
qualified-receipt failures. No incorrect outcome supplies a cost denominator.

Nineteen builds produce 38 final resource/lifetime images, including two
reproduction images. All 516 successful controls preserve complete outputs and
traces within 132 declared configurations. Four strict all-target Clippy
configurations and formatting pass. The initial collector incorrectly mixed
feature configurations; its full attempt and successful controls are preserved.
The corrected collector keeps full output/trace comparison within configurations
and the original total deadline. No fixture or assertion is relaxed.

All initial native size caps and image headroom pass. The 258 whole-owned
32-cycle control histories complete 8,256 cycles. Initial lifetime absolute
totals and persistent-state limits pass; no additional tracked persistent
payload grows after cycle two. Ten cumulative growth metrics in four active
trace configurations fail their initial caps. Raw signed observations and every
positive source-boundary charge remain. This is one control history per source
configuration, not the pending repeated-process/stack resource campaign, reused
input lifetime qualification, quiet timing or deployment/RSS proof.

verification.json independently reconstructs cycles and cumulative charges,
checks original source/monitor bytes, image hashes, ELF section flags and symbol
sizes, complete outputs, expected failures and the original elapsed deadline.
The independent ELF parser initially omitted lowercase OS-specific flags;
its corrected parser includes the original 16-byte init array. No measurement
or cap changed. Both parser versions and the correction record are preserved.

Thirty-five old residual-owner executable paths now resolve through symlinks
to RAM copies to preserve the development-volume storage guard. Original bytes,
modes and immutable prior Git archives are verified. qualification contains the
relocation map and recovery script. RAM is volatile; the script can recover
missing RAM copies from the referenced Git archive. Missing-copy recovery has
not itself been exercised. No queued artifact is relocated or changed.

All 38 new executable bytes and raw outputs are retained losslessly. origins.json
records original/stored hashes, byte counts and modes; gzip entries must be
decoded before replay. No third-party package archive is redistributed. Source
stages are frozen after this snapshot. Previous records and charges remain.
No implementation, size account or memory exception is admitted; all remaining
runtime, package/WASM, resource/cancellation and release checks stay open.
The fifteen-phase goal remains active. No push.
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
 subprocess.run(['git','-C',str(e),'commit','-m','Archive combined solver resource controls and open growth charges'],check=True,stdout=subprocess.PIPE)
 revision=git('rev-parse','HEAD').decode().strip();assert not git('status','--porcelain=v1') and git('diff','--name-only',previous,revision).decode().splitlines()==changed and module.manifest(str(e),revision)==manifest
 _,count,size,digest=manifest[1].split('\t');result=dict(previous_revision=previous,revision=revision,record=record,row=manifest[1],files=int(count),bytes=int(size),sha256=digest,previous_archive_paths_unchanged=True,all_scoped_git_blobs_verified=True,source_stages_frozen=True)
 save(base/'five-resource-controls-archive.json',result);print(json.dumps(result,indent=2))
finally:
 assert state(3416600,'45823480')=='T' and state(1621335,'38218939')=='T';os.kill(3416600,signal.SIGCONT)
 save(base/'five-resource-controls-archive-release.json',dict(time=time.time(),watcher_state=state(3416600,'45823480'),horizon_reset=False))
