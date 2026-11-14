from pathlib import Path
import hashlib,tarfile,io,json,re,subprocess,tomllib,copy
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-interval-release');source=json.loads((s/'SOURCE.json').read_text());names=re.search(r'^crates=\(\n(.*?)\n\)',(r/'scripts/release-check.sh').read_text(),re.S|re.M).group(1).split();previous={v['name']:v for v in json.loads((s/'package-artifacts.json').read_text())};dirs={'dirty':Path('/mnt/development/.interval-refactor-build/interval-release/release-check/package'),'clean':Path('/mnt/development/.interval-refactor-build/interval-release-clean/release-check/package'),'reproduced':Path('/mnt/development/.interval-refactor-build/interval-release-reproduce/target/package')};rows=[];all_values={};all_contents={}
def files(data):
 with tarfile.open(fileobj=io.BytesIO(data)) as t:return {m.name.split('/',1)[1]:t.extractfile(m).read() for m in t.getmembers() if m.isfile()}
for name in names:
 values={};contents={};raw={}
 for label,root in dirs.items():
  candidates=list(root.glob(name+'-[0-9]*.crate')) or list((root/'tmp-crate').glob(name+'-[0-9]*.crate'));path,=candidates;data=path.read_bytes();raw[label]=data;contents[label]=files(data);vcs=json.loads(contents[label]['.cargo_vcs_info.json']);values[label]=dict(path=str(path),bytes=len(data),sha256=hashlib.sha256(data).hexdigest(),vcs=vcs)
  if label=='dirty':assert values[label]['sha256']==previous[name]['sha256']
  else:
   assert vcs['git']['sha1']==source['commit'],vcs
   assert not vcs['git'].get('dirty',False),vcs
   assert vcs['path_in_vcs']==('' if name=='csgrs' else 'crates/'+name),vcs
 assert raw['clean']==raw['reproduced'],name
 all_values[name]=values;all_contents[name]=contents
for name in names:
 contents=all_contents[name];differences=[key for key in sorted(contents['dirty'].keys()|contents['clean'].keys()) if contents['dirty'].get(key)!=contents['clean'].get(key)]
 assert '.cargo_vcs_info.json' in differences and set(differences)<=set(['.cargo_vcs_info.json','Cargo.lock']),(name,differences)
 a=tomllib.loads(contents['dirty']['Cargo.lock'].decode());b=tomllib.loads(contents['clean']['Cargo.lock'].decode());assert len(a['package'])==len(b['package']);checksum_links=[]
 for old,new in zip(a['package'],b['package']):
  assert old['name']==new['name'] and old['version']==new['version'],(name,old,new)
  if old.get('checksum')==new.get('checksum'):continue
  upstream=old['name'];assert upstream in previous and old['version']==previous[upstream]['version']
  assert old['checksum']==all_values[upstream]['dirty']['sha256']
  assert new['checksum']==all_values[upstream]['clean']['sha256']
  checksum_links.append(dict(package=upstream,version=old['version'],dirty=old['checksum'],clean=new['checksum'],both_match_actual_archives=True))
  # Remove only these already-verified relational checksum values for comparing
  # the remaining complete parsed lock structure. All package versions, source
  # registries, dependency lists and other fields must remain exactly equal.
  old['checksum']=new['checksum']
 assert a==b,(name,'lock fields besides verified archive checksum links changed')
 rows.append(dict(name=name,artifacts=all_values[name],clean_reproduction_byte_identical=True,dirty_clean_different_members=differences,verified_checksum_links=checksum_links))
for path in ['/mnt/development/csgrs-interval-release-clean','/mnt/development/csgrs-interval-release-reproduce']:
 assert not subprocess.check_output(['git','status','--porcelain'],cwd=path)
result=dict(source_commit=source['commit'],count=len(rows),all_clean_archives_identical=True,full_clean_validation_still_required=True,rows=rows);assert len(rows)==21;(s/'package-reproducibility.json').write_text(json.dumps(result,indent=2)+'\n');print('all21 clean archives byte-identical; dirty/clean source identical; only VCS provenance and verified upstream archive checksum links differ')
