from pathlib import Path
import gzip,hashlib,importlib.util,json,shutil,subprocess,sys
stage=Path(sys.argv[1]);record=sys.argv[2];message=sys.argv[3];e=Path('/mnt/development/csgrs-evidence');r=Path('/mnt/development/csgrs');dest=e/record;ram=Path('/dev/shm')/(record.rsplit('/',1)[1]+'-archive')
sha=lambda b:hashlib.sha256(b).hexdigest()
git=lambda *args:subprocess.check_output(['git','-C',str(e),*args])
previous=git('rev-parse','HEAD').decode().strip();assert not git('status','--porcelain=v1') and not dest.exists() and not ram.exists()
ram.mkdir();sources=[(p,Path('qualification')/p.relative_to(stage)) for p in sorted(stage.rglob('*')) if p.is_file() and '__pycache__' not in p.parts]
owned_archives=json.loads((stage/'package-archives.json').read_text())
assert len(owned_archives)==6 and {str(p) for p,_ in sources if p.suffix=='.crate'}=={a['path'] for a in owned_archives}
for a in owned_archives:
 assert a['revision']=='4a04dd9744bfecb578963b42fa3bffef5b7062b5' and sha(Path(a['path']).read_bytes())==a['sha256']
if (stage/'builds.json').exists():
 for row in json.loads((stage/'builds.json').read_text()):
  if 'artifact' in row:
   p=Path(row['artifact']['path']);assert sha(p.read_bytes())==row['artifact']['sha256'];sources.append((p,Path('final-images')/p.name))
origins=[]
for source,rel in sources:
 raw=source.read_bytes();encoding='identity';stored=raw
 if rel.parts[0]=='final-images' or source.suffix in ['.log','.txt','.crate'] or (len(raw)>16384 and source.suffix!='.gz'):
  stored=gzip.compress(raw,compresslevel=6,mtime=0);rel=rel.with_name(rel.name+'.gz');encoding='gzip';assert gzip.decompress(stored)==raw
 out=ram/rel;out.parent.mkdir(parents=True,exist_ok=True);out.write_bytes(stored)
 origins.append(dict(source=str(source),destination=rel.as_posix(),source_sha256=sha(raw),source_bytes=len(raw),stored_sha256=sha(stored),stored_bytes=len(stored),encoding=encoding,source_mode=oct(source.stat().st_mode&0o777)))
(ram/'origins.json').write_text(json.dumps(origins,indent=2)+'\n');shutil.copyfile(__file__,ram/'archive-driver.py')
(ram/'README.md').write_text('Qualification evidence only; no source or resource account admitted.\n\nOriginal observations, failures and scripts are preserved in qualification.\norigins.json records source and stored hashes, lengths, modes and gzip encoding.\nFinal images, where listed, are losslessly compressed in final-images.\nThe stage is frozen at this snapshot; earlier evidence remains unchanged.\nSix verified repository-owned package archives are preserved as .crate.gz.\nNo downloaded third-party package archives are included.\n')
total=sum(p.stat().st_size for p in ram.rglob('*') if p.is_file());assert shutil.disk_usage(e).free-2*total-20*1024**2>=20*1024**3,(total,shutil.disk_usage(e).free)
shutil.copytree(ram,dest);subprocess.run(['git','-C',str(e),'add','--sparse','--',record],check=True);subprocess.run(['git','-C',str(e),'diff','--cached','--check'],check=True)
changed=git('diff','--cached','--name-only').decode().splitlines();assert changed and all(p.startswith(record+'/') for p in changed) and not git('diff','--name-only')
spec=importlib.util.spec_from_file_location('archive_manifest',r/'scripts/evidence_archive.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);m.ROOTS={record:False};tree=git('write-tree').decode().strip();manifest=m.manifest(str(e),tree);assert len(manifest)==2
entries=list(m.tree_entries(str(e),tree));digests=m.blob_digests(str(e),sorted({oid for _,_,oid in entries}))
for path,kind,oid in entries:
 data=(e/path).read_bytes();assert kind=='-' and digests[oid]==(sha(data),len(data))
for o in origins:
 data=(dest/o['destination']).read_bytes();raw=gzip.decompress(data) if o['encoding']=='gzip' else data
 assert sha(raw)==o['source_sha256'] and len(raw)==o['source_bytes'] and sha(data)==o['stored_sha256']
subprocess.run(['git','-C',str(e),'commit','-m',message],check=True,stdout=subprocess.PIPE)
revision=git('rev-parse','HEAD').decode().strip();assert not git('status','--porcelain=v1');assert git('diff','--name-only',previous,revision).decode().splitlines()==changed;assert m.manifest(str(e),revision)==manifest
_,count,size,digest=manifest[1].split('\t');result=dict(previous_revision=previous,revision=revision,record=record,row=manifest[1],files=int(count),bytes=int(size),sha256=digest,previous_archive_paths_unchanged=True,all_scoped_git_blobs_verified=True,source_stage_frozen=True)
Path(str(stage)+'-archive.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
