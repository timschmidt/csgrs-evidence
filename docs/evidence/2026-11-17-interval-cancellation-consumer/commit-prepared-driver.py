from pathlib import Path
import gzip,hashlib,importlib.util,json,shutil,subprocess,tarfile,io
out=Path('/dev/shm/cancellation-consumer-container-record');e=Path('/mnt/development/csgrs-evidence');r=Path('/mnt/development/csgrs');record='docs/evidence/2026-11-17-interval-cancellation-consumer';dest=e/record;stage=Path('/tmp/interval-refactor/solver-cancellation-consumer');sha=lambda b:hashlib.sha256(b).hexdigest();git=lambda *a:subprocess.check_output(['git','-C',str(e),*a]);before=git('rev-parse','HEAD').decode().strip();v=json.loads((out/'snapshot-verification.json').read_text());assert before==v['previous_revision'] and not dest.exists() and not git('status','--porcelain=v1')
shutil.copytree('/tmp/interval-refactor/residual-packaged-relocation',out/'additional-storage-relocation');shutil.copyfile('/tmp/interval-refactor/cancellation-consumer-container-archive.log',out/'container-storage-guard-failure.log');shutil.copyfile(__file__,out/'commit-prepared-driver.py')
parts=[]
for part in v['parts']:
 data=(out/part['path']).read_bytes();assert len(data)==part['bytes'] and sha(data)==part['sha256'];parts.append(data)
container=b''.join(parts);assert len(container)==v['xz_bytes'] and sha(container)==v['xz_sha256'];entries={x['path']:x for x in json.loads(gzip.decompress((out/'snapshot-manifest.json.gz').read_bytes()))};seen=set()
with tarfile.open(fileobj=io.BytesIO(container),mode='r:xz') as tar:
 for member in tar:
  assert member.isfile() and member.name in entries and member.name not in seen;raw=tar.extractfile(member).read();assert len(raw)==entries[member.name]['bytes'] and sha(raw)==entries[member.name]['sha256'];seen.add(member.name)
assert seen==set(entries)
total=sum(p.stat().st_size for p in out.rglob('*') if p.is_file());free=shutil.disk_usage(e).free;assert free-2*total-20*1024**2>=20*1024**3,(total,free)
shutil.copytree(out,dest);subprocess.run(['git','-C',str(e),'add','--sparse','--',record],check=True);subprocess.run(['git','-C',str(e),'diff','--cached','--check'],check=True)
changed=git('diff','--cached','--name-only').decode().splitlines();assert changed and all(x.startswith(record+'/') for x in changed)
spec=importlib.util.spec_from_file_location('m',r/'scripts/evidence_archive.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);m.ROOTS={record:False};tree=git('write-tree').decode().strip();rows=m.manifest(str(e),tree);assert len(rows)==2
subprocess.run(['git','-C',str(e),'commit','-m','Preserve cancellation consumer cost failures and verified recovery'],check=True,stdout=subprocess.PIPE);revision=git('rev-parse','HEAD').decode().strip();assert not git('status','--porcelain=v1') and m.manifest(str(e),revision)==rows;assert git('diff','--name-only',before,revision).decode().splitlines()==changed
_,count,size,digest=rows[1].split('\t');result=dict(previous_revision=before,revision=revision,record=record,row=rows[1],files=int(count),bytes=int(size),sha256=digest,previous_archive_paths_unchanged=True,source_stage_frozen=True,container_verification=v,all_committed_container_members_verified=True,additional_storage_relocation_files=12)
Path(str(stage)+'-archive.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
