from pathlib import Path
import gzip,hashlib,importlib.util,json,shutil,subprocess,time
r=Path('/tmp/interval-refactor');s=r/'trace-materialization-pilot';checks=r/'trace-materialization-primary-checks';out=Path('/dev/shm/trace-materialization-evidence');e=Path('/mnt/development/csgrs-evidence');main=Path('/mnt/development/csgrs');record='docs/evidence/2026-11-17-interval-trace-materialization';dest=e/record;sha=lambda b:hashlib.sha256(b).hexdigest();git=lambda *a:subprocess.check_output(['git','-C',str(e),*a]);start=time.monotonic();before=git('rev-parse','HEAD').decode().strip()
assert not out.exists() and not dest.exists() and not git('status','--porcelain=v1');assert json.loads((s/'completion.json').read_text())['exit_code']==json.loads((s/'independent-verification-v2-command.json').read_text())['exit_code']==0;assert json.loads((checks/'verification.json').read_text())['passed'];assert not Path('/proc/193542').exists()
f=Path('/proc/1621335/stat').read_text().rsplit(')',1)[1].split();assert f[0]=='T' and f[19]=='38218939'
out.mkdir();origins=[]
def copy(p,name,compress=False):
 raw=p.read_bytes();stored=gzip.compress(raw,mtime=0) if compress else raw;q=out/name;q.parent.mkdir(parents=True,exist_ok=True);q.write_bytes(stored);origins.append(dict(source=str(p),path=name,source_bytes=len(raw),source_sha256=sha(raw),source_mode=p.stat().st_mode&0o777,encoding='gzip' if compress else 'raw',stored_bytes=len(stored),stored_sha256=sha(stored)))
for root,prefix in [(s,'pilot'),(checks,'primary-checks')]:
 for p in sorted(root.rglob('*')):
  if p.is_file() and '__pycache__' not in p.parts:copy(p,prefix+'/'+p.relative_to(root).as_posix())
for b in json.loads((s/'builds.json').read_text()):
 p=Path(b['image']['path']);assert sha(p.read_bytes())==b['image']['sha256'];copy(p,'images/'+b['label']+'.gz',True)
copy(r/'trace-materialization-pilot-driver.log','orchestration/driver.log');copy(Path(__file__),'orchestration/archive-driver.py')
(out/'origins.json').write_text(json.dumps(origins,indent=2)+'\n')
for o in origins:
 stored=(out/o['path']).read_bytes();assert len(stored)==o['stored_bytes'] and sha(stored)==o['stored_sha256'];raw=gzip.decompress(stored) if o['encoding']=='gzip' else stored;assert len(raw)==o['source_bytes'] and sha(raw)==o['source_sha256'];assert sha(Path(o['source']).read_bytes())==o['source_sha256']
(out/'README.md').write_text('''Trace materialization pilot: two rejected implementations; no memory exception.

The pilot preserves every command/observation, full output, original and corrected
verifiers, failed verifier log, three final native images and source patches.
Only Python bytecode caches are omitted. Image files use lossless gzip; origins.json
records every source/stored length and SHA-256, original mode and encoding.
Restore an image by decoding its gzip and applying the recorded source mode.
Two identical counted Git revision reads share one log; both raw and stored hashes
match both command records. The original verifier failure/correction is retained.
Primary checks apply to the independent added regression test only. Production
trace code remains unchanged; rejected prototype commits remain isolated.
''')
total=sum(p.stat().st_size for p in out.rglob('*') if p.is_file());free=shutil.disk_usage(e).free;assert free-3*total-20*1024**2>=20*1024**3,(total,free)
shutil.copytree(out,dest);subprocess.run(['git','-C',str(e),'add','--sparse','--',record],check=True);subprocess.run(['git','-C',str(e),'diff','--cached','--check'],check=True);changed=git('diff','--cached','--name-only').decode().splitlines();assert changed and all(p.startswith(record+'/') for p in changed)
spec=importlib.util.spec_from_file_location('m',main/'scripts/evidence_archive.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);m.ROOTS={record:False};rows=m.manifest(str(e),git('write-tree').decode().strip());assert len(rows)==2
subprocess.run(['git','-C',str(e),'commit','-m','Preserve trace collector regressions and exact snapshot controls'],check=True,stdout=subprocess.PIPE);revision=git('rev-parse','HEAD').decode().strip();assert not git('status','--porcelain=v1') and m.manifest(str(e),revision)==rows;assert git('diff','--name-only',before,revision).decode().splitlines()==changed
for o in origins:
 stored=git('show',revision+':'+record+'/'+o['path']);assert len(stored)==o['stored_bytes'] and sha(stored)==o['stored_sha256']
_,count,size,digest=rows[1].split('\t');v=dict(previous_revision=before,revision=revision,record=record,row=rows[1],files=int(count),bytes=int(size),sha256=digest,all_original_and_stored_hashes_verified=True,all_committed_sources_verified=True,previous_archive_paths_unchanged=True,images=3,seconds=time.monotonic()-start);(r/'trace-materialization-pilot-archive.json').write_text(json.dumps(v,indent=2)+'\n');print(json.dumps(v,indent=2))
