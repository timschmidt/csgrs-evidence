from pathlib import Path
import gzip,hashlib,importlib.util,json,shutil,subprocess,time
r=Path('/tmp/interval-refactor');out=Path('/dev/shm/trace-borrowed-runtime-evidence');e=Path('/mnt/development/csgrs-evidence');main=Path('/mnt/development/csgrs');record='docs/evidence/2026-11-17-interval-trace-borrowed-runtime';dest=e/record;sha=lambda b:hashlib.sha256(b).hexdigest();load=lambda p:json.loads(Path(p).read_text());git=lambda *a:subprocess.check_output(['git','-C',str(e),*a]);start=time.monotonic();before=git('rev-parse','HEAD').decode().strip();assert before=='5fd724d2341e4ad19fed277370f27e2bb66ccf0b'
origins=load(out/'origins.json');old_name='trace-take-unwind/addition.rs';matches=[o for o in origins if o['path']==old_name];assert len(matches)==1;o=matches[0];raw=(out/old_name).read_bytes();assert raw==(dest/old_name).read_bytes()==Path(o['source']).read_bytes() and sha(raw)==o['source_sha256']==o['stored_sha256'];stored=gzip.compress(raw,mtime=0);new_name=old_name+'.gz'
for root in [out,dest]:(root/new_name).write_bytes(stored);(root/old_name).unlink()
subprocess.run(['git','-C',str(e),'rm','--cached','--sparse','--',record+'/'+old_name],check=True,stdout=subprocess.PIPE);o.update(path=new_name,encoding='gzip',stored_bytes=len(stored),stored_sha256=sha(stored))
def copy(p,name):
 raw=p.read_bytes();q=out/name;q.parent.mkdir(parents=True,exist_ok=True);q.write_bytes(raw);origins.append(dict(source=str(p),path=name,source_bytes=len(raw),source_sha256=sha(raw),source_mode=p.stat().st_mode&0o777,encoding='raw',stored_bytes=len(raw),stored_sha256=sha(raw)))
copy(r/'archive-trace-borrowed-runtime.log','orchestration/archive-attempt-01.log');copy(Path(__file__),'orchestration/archive-finish.py');(out/'origins.json').write_text(json.dumps(origins,indent=2)+'\n');p=out/'README.md';p.write_text(p.read_text()+'''
Archive correction: the initial staged whitespace check rejected the intentional
trailing separator in the saved test insertion fragment addition.rs. Preserve the
original fragment losslessly as addition.rs.gz, with unchanged raw SHA-256 and
updated stored SHA-256/encoding in origins.json. The full compiled source files
are unchanged. The failed command/log and reviewed archive continuation remain
in orchestration/. No measurement, test, protocol or source fragment was changed.
''')
for o in origins:
 stored=(out/o['path']).read_bytes();assert len(stored)==o['stored_bytes'] and sha(stored)==o['stored_sha256'];raw=gzip.decompress(stored) if o['encoding']=='gzip' else stored;assert len(raw)==o['source_bytes'] and sha(raw)==o['source_sha256'];assert sha(Path(o['source']).read_bytes())==o['source_sha256']
f=Path('/proc/1621335/stat').read_text().rsplit(')',1)[1].split();assert f[0]=='T' and f[19]=='38218939' and not Path('/proc/3416600').exists()
for pid in [283919,294942,300806]:assert not Path(f'/proc/{pid}').exists()
total=sum(p.stat().st_size for p in out.rglob('*') if p.is_file());free=shutil.disk_usage(e).free;assert free-3*total-20*1024**2>=20*1024**3,(total,free)
shutil.copytree(out,dest,dirs_exist_ok=True);subprocess.run(['git','-C',str(e),'add','--sparse','--',record],check=True);subprocess.run(['git','-C',str(e),'diff','--cached','--check'],check=True);changed=git('diff','--cached','--name-only').decode().splitlines();assert changed and all(p.startswith(record+'/') for p in changed)
spec=importlib.util.spec_from_file_location('m',main/'scripts/evidence_archive.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);m.ROOTS={record:False};rows=m.manifest(str(e),git('write-tree').decode().strip());assert len(rows)==2
subprocess.run(['git','-C',str(e),'commit','-m','Preserve borrowed trace runtime controls and unwind witness'],check=True,stdout=subprocess.PIPE);revision=git('rev-parse','HEAD').decode().strip();assert not git('status','--porcelain=v1') and m.manifest(str(e),revision)==rows;assert git('diff','--name-only',before,revision).decode().splitlines()==changed
for o in origins:
 stored=git('show',revision+':'+record+'/'+o['path']);assert len(stored)==o['stored_bytes'] and sha(stored)==o['stored_sha256']
_,count,size,digest=rows[1].split('\t');v=dict(previous_revision=before,revision=revision,record=record,row=rows[1],files=int(count),bytes=int(size),sha256=digest,all_original_and_stored_hashes_verified=True,all_committed_sources_verified=True,previous_archive_paths_unchanged=True,images=3,initial_archive_whitespace_failure_preserved=True,fragment_losslessly_compressed=True,seconds=time.monotonic()-start);(r/'trace-borrowed-runtime-archive.json').write_text(json.dumps(v,indent=2)+'\n');print(json.dumps(v,indent=2))
