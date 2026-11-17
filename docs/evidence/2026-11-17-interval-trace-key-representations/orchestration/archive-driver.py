from pathlib import Path
import gzip,hashlib,importlib.util,json,shutil,subprocess,time
r=Path('/tmp/interval-refactor');out=Path('/dev/shm/trace-key-representation-evidence');e=Path('/mnt/development/csgrs-evidence');main=Path('/mnt/development/csgrs');record='docs/evidence/2026-11-17-interval-trace-key-representations';dest=e/record;sha=lambda b:hashlib.sha256(b).hexdigest();load=lambda p:json.loads(Path(p).read_text());git=lambda *a:subprocess.check_output(['git','-C',str(e),*a]);start=time.monotonic();before=git('rev-parse','HEAD').decode().strip()
stages=['trace-canonical-table-pilot','trace-canonical-capacity-pilot','trace-canonical-runtime-screen','trace-borrowed-key-pilot','trace-borrowed-key-shared-input','trace-borrowed-key-shared-input-corrected','trace-borrowed-key-shared-input-formatted'];successful=[x for x in stages if x not in ['trace-borrowed-key-shared-input','trace-borrowed-key-shared-input-corrected']]
assert not out.exists() and not dest.exists() and not git('status','--porcelain=v1')
for name in successful:
 s=r/name;assert load(s/'completion.json')['exit_code']==load(s/'independent-verification-command.json')['exit_code']==0
for name in stages:
 s=r/name;done=load(s/'completion.json');assert done['exit_code'] in [0,1]
 if name not in successful:assert done['controls']==0 and done['exit_code']==1
for correction in ['trace-borrowed-key-shared-input-corrected','trace-borrowed-key-shared-input-formatted']:
 c=load(r/correction/'correction.json')
 for root,hashes in c.get('prior_stage_hashes',{}).items():
  for name,digest in hashes.items():assert sha((Path(root)/name).read_bytes())==digest
 if 'original_stage_hashes' in c:
  for name,digest in c['original_stage_hashes'].items():assert sha((Path(c['prior_stage'])/name).read_bytes())==digest
f=Path('/proc/1621335/stat').read_text().rsplit(')',1)[1].split();assert f[0]=='T' and f[19]=='38218939' and not Path('/proc/3416600').exists()
for pid in [231921,240245,254447,259293,267507,269363,270197]:assert not Path(f'/proc/{pid}').exists()
out.mkdir();origins=[]
def copy(p,name,compress=False):
 raw=p.read_bytes();stored=gzip.compress(raw,mtime=0) if compress else raw;q=out/name;q.parent.mkdir(parents=True,exist_ok=True);q.write_bytes(stored);origins.append(dict(source=str(p),path=name,source_bytes=len(raw),source_sha256=sha(raw),source_mode=p.stat().st_mode&0o777,encoding='gzip' if compress else 'raw',stored_bytes=len(stored),stored_sha256=sha(stored)))
for name in stages:
 for p in sorted((r/name).rglob('*')):
  if p.is_file() and '__pycache__' not in p.parts:copy(p,name+'/'+p.relative_to(r/name).as_posix())
 copy(r/(name+'-driver.log'),'orchestration/'+name+'-driver.log')
images=[]
for name in ['trace-canonical-table-pilot','trace-canonical-capacity-pilot','trace-borrowed-key-pilot','trace-borrowed-key-shared-input-formatted']:images.append((name,load(r/name/'build.json')['image']))
for build in load(r/'trace-canonical-runtime-screen/builds.json'):images.append(('runtime-'+build['label'],build['image']))
for name,v in images:
 p=Path(v['path']);assert len(p.read_bytes())==v['bytes'] and sha(p.read_bytes())==v['sha256'];copy(p,'images/'+name+'.gz',True)
copy(r/'trace-key-representation-review.json','review.json');copy(Path(__file__),'orchestration/archive-driver.py');copy(r/'trace-materialization-pilot/control.rs','baseline/control.rs');copy(r/'trace-materialization-pilot-archive.json','baseline/archive.json')
(out/'origins.json').write_text(json.dumps(origins,indent=2)+'\n')
for o in origins:
 stored=(out/o['path']).read_bytes();assert len(stored)==o['stored_bytes'] and sha(stored)==o['stored_sha256'];raw=gzip.decompress(stored) if o['encoding']=='gzip' else stored;assert len(raw)==o['source_bytes'] and sha(raw)==o['source_sha256'];assert sha(Path(o['source']).read_bytes())==o['source_sha256']
(out/'README.md').write_text('''Trace-key representation qualification and rejection evidence.

Three source candidates remain isolated and unadmitted. Canonical-capacity
passes its local memory screen but fails the repeated-event runtime screen.
Borrowed report keys reduce bytes but have three cross-process allocation-count
failures. The same-input diagnostic retains all552full paired reports and actual
identity iteration vectors; it does not replace original failures or complete
full geometry/lifetime/runtime admission. Two zero-control harness preflight
failures, corrections and their original shared deadline/count budget remain.

All stage sources, scripts, logs, complete observations, independent verifiers,
raw/stored hashes and six validated final native images are retained. Initial
failed diagnostic builds have no claimed runtime observations or frozen images.
Only Python bytecode caches are omitted. Lossless gzip image restoration uses
origins.json encoding and original mode. Baseline controls referenced by the
verifiers live in the preceding record2026-11-17-interval-trace-materialization
at3cc14e7745bec36f5c6a0eebbf17587600aea49e; baseline/archive.json gives its manifest.
Restore stage files at origins.json paths for unmodified offline replay.
''')
total=sum(p.stat().st_size for p in out.rglob('*') if p.is_file());free=shutil.disk_usage(e).free;assert free-3*total-20*1024**2>=20*1024**3,(total,free)
shutil.copytree(out,dest);subprocess.run(['git','-C',str(e),'add','--sparse','--',record],check=True);subprocess.run(['git','-C',str(e),'diff','--cached','--check'],check=True);changed=git('diff','--cached','--name-only').decode().splitlines();assert changed and all(p.startswith(record+'/') for p in changed)
spec=importlib.util.spec_from_file_location('m',main/'scripts/evidence_archive.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);m.ROOTS={record:False};rows=m.manifest(str(e),git('write-tree').decode().strip());assert len(rows)==2
subprocess.run(['git','-C',str(e),'commit','-m','Preserve trace key memory controls and runtime rejection'],check=True,stdout=subprocess.PIPE);revision=git('rev-parse','HEAD').decode().strip();assert not git('status','--porcelain=v1') and m.manifest(str(e),revision)==rows;assert git('diff','--name-only',before,revision).decode().splitlines()==changed
for o in origins:
 stored=git('show',revision+':'+record+'/'+o['path']);assert len(stored)==o['stored_bytes'] and sha(stored)==o['stored_sha256']
_,count,size,digest=rows[1].split('\t');v=dict(previous_revision=before,revision=revision,record=record,row=rows[1],files=int(count),bytes=int(size),sha256=digest,all_original_and_stored_hashes_verified=True,all_committed_sources_verified=True,previous_archive_paths_unchanged=True,images=len(images),seconds=time.monotonic()-start);(r/'trace-key-representations-archive.json').write_text(json.dumps(v,indent=2)+'\n');print(json.dumps(v,indent=2))
