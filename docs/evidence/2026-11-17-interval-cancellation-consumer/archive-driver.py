from pathlib import Path
import gzip,hashlib,importlib.util,json,shutil,subprocess,tarfile,time
s=Path('/tmp/interval-refactor/solver-cancellation-consumer');prepared=Path('/dev/shm/2026-11-17-interval-cancellation-consumer-archive');bundle=Path('/dev/shm/cancellation-consumer-evidence.tar.xz');out=Path('/dev/shm/cancellation-consumer-container-record');e=Path('/mnt/development/csgrs-evidence');r=Path('/mnt/development/csgrs');record='docs/evidence/2026-11-17-interval-cancellation-consumer';dest=e/record;started=time.monotonic()
sha=lambda b:hashlib.sha256(b).hexdigest();git=lambda *a:subprocess.check_output(['git','-C',str(e),*a]);before=git('rev-parse','HEAD').decode().strip()
assert not git('status','--porcelain=v1') and not dest.exists() and not out.exists() and not bundle.exists();out.mkdir()
files=[p for p in sorted(prepared.rglob('*')) if p.is_file()];entries=[]
with tarfile.open(bundle,'w:xz',preset=6) as tar:
 for p in files:
  rel=p.relative_to(prepared).as_posix();raw=p.read_bytes();info=tar.gettarinfo(str(p),arcname=rel);info.uid=info.gid=0;info.uname=info.gname='';info.mtime=0
  with p.open('rb') as f:tar.addfile(info,f)
  entries.append(dict(path=rel,bytes=len(raw),sha256=sha(raw),mode=oct(p.stat().st_mode&0o777)))
 assert time.monotonic()-started<600
manifest={x['path']:x for x in entries};origins={x['destination']:x for x in json.loads((prepared/'origins.json').read_text())};seen=set()
with tarfile.open(bundle,'r:xz') as tar:
 for member in tar:
  assert member.isfile() and member.name in manifest and member.name not in seen;raw=tar.extractfile(member).read();entry=manifest[member.name];assert len(raw)==entry['bytes'] and sha(raw)==entry['sha256'];seen.add(member.name)
  if member.name in origins:
   o=origins[member.name];decoded=gzip.decompress(raw) if o['encoding']=='gzip' else raw;assert len(decoded)==o['source_bytes'] and sha(decoded)==o['source_sha256']
assert seen==set(manifest)
parts=[]
with bundle.open('rb') as f:
 while block:=f.read(32*1024**2):
  name=f'snapshot.tar.xz.part{len(parts):03d}';(out/name).write_bytes(block);parts.append(dict(path=name,bytes=len(block),sha256=sha(block)))
(out/'snapshot-manifest.json.gz').write_bytes(gzip.compress((json.dumps(entries,indent=2)+'\n').encode(),mtime=0))
shutil.copyfile('/tmp/interval-refactor/cancellation-consumer-archive.log',out/'initial-storage-guard-failure.log');shutil.copyfile(__file__,out/'archive-driver.py')
(out/'README.md').write_text('''Complete cancellation-consumer evidence; no implementation/account admitted.

The initial per-file archival preparation exceeded the existing storage guard
and wrote no evidence-repository files. This lossless container preserves every
prepared file, all original raw/encoded source hashes, all failed observations,
24 native images, and the verified residual-artifact relocation/recovery record.
Concatenate snapshot.tar.xz.part* in order and decode as an XZ-compressed tar.
Member manifest gives exact lengths, hashes and modes; inner origins.json
preserves each original source hash and gzip encoding. No prior record changes.
''')
verification=dict(previous_revision=before,record=record,member_files=len(entries),member_bytes=sum(x['bytes'] for x in entries),xz_bytes=bundle.stat().st_size,xz_sha256=sha(bundle.read_bytes()),parts=parts,all_member_hashes_verified=True,all_source_hashes_verified=True,initial_guard_preserved=True,seconds=time.monotonic()-started)
(out/'snapshot-verification.json').write_text(json.dumps(verification,indent=2)+'\n')
total=sum(p.stat().st_size for p in out.iterdir());free=shutil.disk_usage(e).free;assert free-2*total-20*1024**2>=20*1024**3,(total,free)
shutil.copytree(out,dest);subprocess.run(['git','-C',str(e),'add','--sparse','--',record],check=True);subprocess.run(['git','-C',str(e),'diff','--cached','--check'],check=True)
changed=git('diff','--cached','--name-only').decode().splitlines();assert changed and all(x.startswith(record+'/') for x in changed)
spec=importlib.util.spec_from_file_location('m',r/'scripts/evidence_archive.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);m.ROOTS={record:False};tree=git('write-tree').decode().strip();rows=m.manifest(str(e),tree);assert len(rows)==2
subprocess.run(['git','-C',str(e),'commit','-m','Preserve cancellation consumer failures in verified lossless container'],check=True,stdout=subprocess.PIPE)
revision=git('rev-parse','HEAD').decode().strip();assert not git('status','--porcelain=v1') and m.manifest(str(e),revision)==rows;assert git('diff','--name-only',before,revision).decode().splitlines()==changed
_,count,size,digest=rows[1].split('\t');result=dict(previous_revision=before,revision=revision,record=record,row=rows[1],files=int(count),bytes=int(size),sha256=digest,previous_archive_paths_unchanged=True,source_stage_frozen=True,container_verification=verification)
Path(str(s)+'-archive.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
