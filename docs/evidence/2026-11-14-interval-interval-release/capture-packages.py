from pathlib import Path
import tarfile,tomllib,json,hashlib,re
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-interval-release');a=Path('/mnt/development/.interval-refactor-build/interval-release/release-check/package');text=(r/'scripts/release-check.sh').read_text();names=re.search(r'^crates=\(\n(.*?)\n\)',text,re.S|re.M).group(1).split();rows=[]
for name in names:
 p,=a.glob(name+'-[0-9]*.crate');data=p.read_bytes()
 with tarfile.open(p) as t:
  files={m.name.split('/',1)[1]:t.extractfile(m).read() for m in t.getmembers() if m.isfile()};manifest=tomllib.loads(files['Cargo.toml'].decode());vcs=json.loads(files['.cargo_vcs_info.json']);version=manifest['package']['version'];assert manifest['package']['name']==name
  row=dict(name=name,version=version,bytes=len(data),sha256=hashlib.sha256(data).hexdigest(),files=len(files),manifest_sha256=hashlib.sha256(files['Cargo.toml']).hexdigest(),lock_sha256=hashlib.sha256(files['Cargo.lock']).hexdigest(),vcs=vcs)
  if name in ['hyperinterval','hyperlattice-interval','hyperdynamics']:
   readme=files['README.md'];assert readme==(r/f'crates/{name}/README.md').read_bytes();row['readme_sha256']=hashlib.sha256(readme).hexdigest();row['readme_matches_final_source']=True
  rows.append(row)
(s/'package-artifacts.json').write_text(json.dumps(rows,indent=2)+'\n');assert len(rows)==21;print('21 verified package archive records; all three README sources match')
