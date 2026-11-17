from pathlib import Path
import gzip,hashlib,importlib.util,json,shutil,subprocess,time
r=Path('/tmp/interval-refactor');out=Path('/dev/shm/trace-borrowed-runtime-evidence');e=Path('/mnt/development/csgrs-evidence');main=Path('/mnt/development/csgrs');record='docs/evidence/2026-11-17-interval-trace-borrowed-runtime';dest=e/record;sha=lambda b:hashlib.sha256(b).hexdigest();load=lambda p:json.loads(Path(p).read_text());git=lambda *a:subprocess.check_output(['git','-C',str(e),*a]);start=time.monotonic();before=git('rev-parse','HEAD').decode().strip();stages=['trace-borrowed-key-runtime','trace-borrowed-shared-runtime','trace-take-unwind']
assert not out.exists() and not dest.exists() and not git('status','--porcelain=v1')
for name in stages:
 s=r/name;assert load(s/'completion.json')['exit_code']==load(s/'independent-verification-command.json')['exit_code']==0
for pid in [283919,294942,300806]:assert not Path(f'/proc/{pid}').exists()
f=Path('/proc/1621335/stat').read_text().rsplit(')',1)[1].split();assert f[0]=='T' and f[19]=='38218939' and not Path('/proc/3416600').exists()
out.mkdir();origins=[]
def copy(p,name,compress=False):
 raw=p.read_bytes();stored=gzip.compress(raw,mtime=0) if compress else raw;q=out/name;q.parent.mkdir(parents=True,exist_ok=True);q.write_bytes(stored);origins.append(dict(source=str(p),path=name,source_bytes=len(raw),source_sha256=sha(raw),source_mode=p.stat().st_mode&0o777,encoding='gzip' if compress else 'raw',stored_bytes=len(stored),stored_sha256=sha(stored)))
for name in stages:
 for p in sorted((r/name).rglob('*')):
  if p.is_file() and '__pycache__' not in p.parts:copy(p,name+'/'+p.relative_to(r/name).as_posix())
 copy(r/(name+'-driver.log'),'orchestration/'+name+'-driver.log')
images=[('source-'+b['label'],b['image']) for b in load(r/'trace-borrowed-key-runtime/builds.json')]+[('shared-input',load(r/'trace-borrowed-shared-runtime/build.json')['image'])]
for name,v in images:
 p=Path(v['path']);raw=p.read_bytes();assert len(raw)==v['bytes'] and sha(raw)==v['sha256'];copy(p,'images/'+name+'.gz',True)
copy(Path(__file__),'orchestration/archive-driver.py');copy(r/'trace-materialization-pilot/control.rs','baseline/control.rs');copy(r/'trace-borrowed-key-pilot/candidate.rs','baseline/borrowed.rs');copy(r/'trace-key-representations-archive.json','baseline/prior-archive.json')
(out/'origins.json').write_text(json.dumps(origins,indent=2)+'\n')
for o in origins:
 stored=(out/o['path']).read_bytes();assert len(stored)==o['stored_bytes'] and sha(stored)==o['stored_sha256'];raw=gzip.decompress(stored) if o['encoding']=='gzip' else stored;assert len(raw)==o['source_bytes'] and sha(raw)==o['source_sha256'];assert sha(Path(o['source']).read_bytes())==o['source_sha256']
(out/'README.md').write_text('''Borrowed report-key runtime and unwind acceptance evidence.

The source-runtime screen completes1344controls and672full-output pairs over56
domains. Shared-input runtime completes192paired controls over16domains, retaining
identical actual identity-table iteration vectors. Both campaigns retain every
sample and independent expected output. Large unique-label cases show higher
median candidate times; variability and contrary samples remain visible.
Non-regression is unproven, so the implementation stays unadmitted. Neither a
universal slowdown nor a specific CPU/cache/allocator cause is claimed.

The retained test covers take cleanup and scope restoration when debug overflow
causes aggregation to unwind. Both source implementations pass all10affected
debug tests and strict owner Clippy. Production prefixes are byte-identical;
only the test is proposed for primary retention. The candidate-plus-test remains
isolated at024e1c1dbc5cf1035d47a985f5dd0aa7e5e7b4f8. Initial inline source/log
verification and its durable script replay are both preserved; no test rerun.

All sources, protocols, scripts, commands, raw/stored hashes, complete outputs,
paired timings and three validated native timing images are retained. Only Python
bytecode caches are omitted. Decode image gzip and apply original modes from
origins.json to restore executables. Earlier sources and allocation evidence live
in the preceding archive record identified by baseline/prior-archive.json.
Restore original paths from origins.json for unchanged offline verifier replay.
No prior charge/failure or cap changes, no source admission and no push.
''')
total=sum(p.stat().st_size for p in out.rglob('*') if p.is_file());free=shutil.disk_usage(e).free;assert free-3*total-20*1024**2>=20*1024**3,(total,free)
shutil.copytree(out,dest);subprocess.run(['git','-C',str(e),'add','--sparse','--',record],check=True);subprocess.run(['git','-C',str(e),'diff','--cached','--check'],check=True);changed=git('diff','--cached','--name-only').decode().splitlines();assert changed and all(p.startswith(record+'/') for p in changed)
spec=importlib.util.spec_from_file_location('m',main/'scripts/evidence_archive.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);m.ROOTS={record:False};rows=m.manifest(str(e),git('write-tree').decode().strip());assert len(rows)==2
subprocess.run(['git','-C',str(e),'commit','-m','Preserve borrowed trace runtime controls and unwind witness'],check=True,stdout=subprocess.PIPE);revision=git('rev-parse','HEAD').decode().strip();assert not git('status','--porcelain=v1') and m.manifest(str(e),revision)==rows;assert git('diff','--name-only',before,revision).decode().splitlines()==changed
for o in origins:
 stored=git('show',revision+':'+record+'/'+o['path']);assert len(stored)==o['stored_bytes'] and sha(stored)==o['stored_sha256']
_,count,size,digest=rows[1].split('\t');v=dict(previous_revision=before,revision=revision,record=record,row=rows[1],files=int(count),bytes=int(size),sha256=digest,all_original_and_stored_hashes_verified=True,all_committed_sources_verified=True,previous_archive_paths_unchanged=True,images=len(images),seconds=time.monotonic()-start);(r/'trace-borrowed-runtime-archive.json').write_text(json.dumps(v,indent=2)+'\n');print(json.dumps(v,indent=2))
