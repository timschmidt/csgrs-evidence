from pathlib import Path
import gzip,hashlib,importlib.util,io,json,shutil,subprocess,tarfile,time
out=Path('/dev/shm/cancellation-qualification-record');e=Path('/mnt/development/csgrs-evidence');r=Path('/mnt/development/csgrs');stage=Path('/tmp/interval-refactor');sha=lambda b:hashlib.sha256(b).hexdigest();git=lambda *a:subprocess.check_output(['git','-C',str(e),*a]);v=json.loads((out/'snapshot-verification.json').read_text());before=git('rev-parse','HEAD').decode().strip();record=v['record'];dest=e/record;start=time.monotonic()
assert before==v['previous_revision'] and not dest.exists() and not git('status','--porcelain=v1')
shutil.copyfile(__file__,out/'commit-driver.py');shutil.copyfile(stage/'cancellation-qualification-archive.log',out/'archive-driver.log')
parts=[]
for p in v['parts']:
 data=(out/p['path']).read_bytes();assert len(data)==p['bytes'] and sha(data)==p['sha256'];parts.append(data)
container=b''.join(parts);assert len(container)==v['xz_bytes'] and sha(container)==v['xz_sha256'];entries={x['path']:x for x in json.loads(gzip.decompress((out/'snapshot-manifest.json.gz').read_bytes()))};seen=set()
with tarfile.open(fileobj=io.BytesIO(container),mode='r:xz') as tar:
 for member in tar:
  assert member.isfile() and member.name in entries and member.name not in seen;raw=tar.extractfile(member).read();m=entries[member.name];assert len(raw)==m['bytes'] and sha(raw)==m['sha256'] and member.mode==m['mode'];seen.add(member.name)
assert seen==set(entries)
total=sum(p.stat().st_size for p in out.rglob('*') if p.is_file());free=shutil.disk_usage(e).free;guard=dict(record_bytes=total,free_before=free,three_copy_margin=3*total,extra_margin=20*1024**2,reserve=20*1024**3,passed=free-3*total-20*1024**2>=20*1024**3);(stage/'cancellation-qualification-storage-guard.json').write_text(json.dumps(guard,indent=2)+'\n');assert guard['passed'],guard
shutil.copytree(out,dest);subprocess.run(['git','-C',str(e),'add','--sparse','--',record],check=True);subprocess.run(['git','-C',str(e),'diff','--cached','--check'],check=True);changed=git('diff','--cached','--name-only').decode().splitlines();assert changed and all(p.startswith(record+'/') for p in changed)
spec=importlib.util.spec_from_file_location('m',r/'scripts/evidence_archive.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);m.ROOTS={record:False};tree=git('write-tree').decode().strip();rows=m.manifest(str(e),tree);assert len(rows)==2
subprocess.run(['git','-C',str(e),'commit','-m','Preserve cancellation qualification and controlled launch accounting'],check=True,stdout=subprocess.PIPE);revision=git('rev-parse','HEAD').decode().strip();assert not git('status','--porcelain=v1') and m.manifest(str(e),revision)==rows;assert git('diff','--name-only',before,revision).decode().splitlines()==changed
# Match committed parts with the verified container, rather than trusting checkout bytes.
for p in v['parts']:
 data=git('show',revision+':'+record+'/'+p['path']);assert len(data)==p['bytes'] and sha(data)==p['sha256']
_,count,size,digest=rows[1].split('\t');result=dict(previous_revision=before,revision=revision,record=record,row=rows[1],files=int(count),bytes=int(size),sha256=digest,previous_archive_paths_unchanged=True,source_stages_frozen=True,container_verification=v,committed_parts_verified=True,all_members_verified=True,storage_guard=guard,seconds=time.monotonic()-start)
(stage/'solver-cancellation-qualification-archive.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
