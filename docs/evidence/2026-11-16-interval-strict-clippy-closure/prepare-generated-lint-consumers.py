from pathlib import Path
import json,re,hashlib,subprocess,tarfile,shutil,tomllib,time,os
s=Path(__file__).parent;root=Path('/mnt/development/interval-clippy-closure/csgrs');dest=s/'generated-lint-consumers';dest.mkdir(exist_ok=False)
script=(root/'scripts/release-check.sh').read_text();names=re.search(r'^crates=\(\n(.*?)\n\)',script,re.M|re.S)[1].split();features=dict(re.findall(r'\[([\w-]+)\]="([\w,-]+)"',re.search(r'declare -A quickstart_features=\(\n(.*?)\n\)',script,re.S)[1]));meta=json.loads(subprocess.check_output(['cargo','metadata','--locked','--no-deps','--format-version','1'],cwd=root,text=True));packages={p['name']:p for p in meta['packages']};records=[]
for tc in ['stable','1.95.0']:
 work=dest/tc;unpacked=work/'packages';unpacked.mkdir(parents=True);archives=[];mismatches=[];versions={};files_checked=0
 for name in names:
  version=packages[name]['version'];versions[name]=version;archive=Path(f'/mnt/development/.interval-refactor-build/coordinated-ci/release-{tc}/release-check/package/{name}-{version}.crate');prefix=f'{name}-{version}/';current=Path(packages[name]['manifest_path']).parent
  with tarfile.open(archive) as tar:
   members=tar.getmembers();assert all(m.isfile() and m.name.startswith(prefix) and '..' not in Path(m.name).parts for m in members)
   for member in members:
    relative=member.name[len(prefix):];data=tar.extractfile(member).read();p=unpacked/member.name;p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(data)
    if relative in ['Cargo.lock','Cargo.toml','.cargo_vcs_info.json']:continue
    source=current/('Cargo.toml' if relative=='Cargo.toml.orig' else relative)
    if not source.is_file() or source.read_bytes()!=data:mismatches.append(str(source))
    files_checked+=1
  archives.append({'name':name,'path':str(archive),'sha256':hashlib.sha256(archive.read_bytes()).hexdigest(),'bytes':archive.stat().st_size,'vcs':json.loads((unpacked/f'{name}-{version}/.cargo_vcs_info.json').read_text())})
 assert not mismatches,mismatches
 consumer=work/'consumer';(consumer/'src/bin').mkdir(parents=True);lines=['[package]','name = "release-consumer"','version = "0.0.0"','edition = "2024"','publish = false','','[dependencies]']
 for name in names:
  value='{ version = "='+versions[name]+'", features = ["'+features[name]+'"] }' if name in features else '"='+versions[name]+'"';lines.append(name+' = '+value)
 lines+=['','[patch.crates-io]']+[name+' = { path = "../packages/'+name+'-'+versions[name]+'" }' for name in names]+['','[workspace]']
 (consumer/'Cargo.toml').write_text('\n'.join(lines)+'\n');shutil.copy2(root/'scripts/release-consumer/user_path.rs',consumer/'src/bin/user_path.rs');(consumer/'src/main.rs').write_text('fn main() {}\n')
 for name in names:
  if name=='csgrs-ffi':continue
  p=unpacked/f'{name}-{versions[name]}'/('readme.md' if name=='csgrs' else 'README.md');block=re.search(r'<!-- quickstart:start -->\s*```rust\n(.*?)```\s*<!-- quickstart:end -->',p.read_text(),re.S);assert block
  (consumer/f'src/bin/quickstart_{name.replace("-","_")}.rs').write_text(block[1])
 shutil.copy2(unpacked/f'hypercurve-{versions["hypercurve"]}/examples/interval_ranges.rs',consumer/'src/bin/curve_interval_ranges.rs')
 # Root workspace lock pins registry versions; the only permissible changes are
 # pruning unused packages and replacing workspace roots with the generated one.
 shutil.copy2(root/'Cargo.lock',consumer/'Cargo.lock.before-resolution');shutil.copy2(root/'Cargo.lock',consumer/'Cargo.lock')
 with (work/'metadata.stderr').open('w') as stderr:
  result=subprocess.run(['cargo','+'+tc,'metadata','--offline','--format-version','1','--manifest-path',str(consumer/'Cargo.toml')],env=os.environ|{'CARGO_TARGET_DIR':str(work/'metadata-target')},stdout=subprocess.PIPE,stderr=stderr,check=True)
 (work/'metadata.json').write_bytes(result.stdout);resolved=json.loads(result.stdout);original=tomllib.loads((root/'Cargo.lock').read_text())['package'];allowed={(p['name'],p['version'],p.get('source'),p.get('checksum')) for p in original if p.get('source')};actual=tomllib.loads((consumer/'Cargo.lock').read_text())['package'];registry={(p['name'],p['version'],p.get('source'),p.get('checksum')) for p in actual if p.get('source')};assert registry<=allowed,registry-allowed
 for p in resolved['packages']:
  if p['source'] is None and p['name']!='release-consumer':assert Path(p['manifest_path']).is_relative_to(unpacked),p
 row={'toolchain':tc,'archives':archives,'current_source_files_byte_identical':files_checked,'registry_packages_same_as_workspace_lock':len(registry),'consumer_manifest_sha256':hashlib.sha256((consumer/'Cargo.toml').read_bytes()).hexdigest(),'consumer_lock_sha256':hashlib.sha256((consumer/'Cargo.lock').read_bytes()).hexdigest(),'bins':len(list((consumer/'src/bin').glob('*.rs')))+1,'metadata_sha256':hashlib.sha256(result.stdout).hexdigest(),'scope':'Newly qualified retained target-directory archives, not a claim of original workflow artifact identity. Archive VCS/lock differences between compilers preserved; every original authored file and Cargo.toml.orig equals current checkout.'};(work/'preparation.json').write_text(json.dumps(row,indent=2)+'\n');records.append(row)
 # The source consumer is a separate manifest generated by spatial checks.sh.
 native=work/'spatial-consumer';(native/'src/bin').mkdir(parents=True);blocks=re.findall(r'```rust\n(.*?)```',(root/'crates/hyperspatial/README.md').read_text(),re.S);assert blocks
 (native/'Cargo.toml').write_text('[package]\nname = "hyperspatial-source-consumer"\nversion = "0.0.0"\nedition = "2024"\n[workspace]\n[dependencies]\nhyperspatial = { path = '+json.dumps(str(root/'crates/hyperspatial'))+' }\nhyperlattice = { path = '+json.dumps(str(root/'crates/hyperlattice'))+' }\n')
 for i,block in enumerate(blocks):
  body='\n'.join(l[2:] if l.startswith('# ') else l for l in block.splitlines());(native/f'src/bin/readme_{i}.rs').write_text('fn main() -> Result<(), hyperspatial::Error> {\n'+body+'\n}\n')
 shutil.copy2(root/'Cargo.lock',native/'Cargo.lock')
 with (work/'spatial-metadata.stderr').open('w') as stderr:
  r=subprocess.run(['cargo','+'+tc,'metadata','--offline','--format-version','1','--manifest-path',str(native/'Cargo.toml')],env=os.environ|{'CARGO_TARGET_DIR':str(work/'metadata-target')},stdout=subprocess.PIPE,stderr=stderr,check=True)
 (work/'spatial-metadata.json').write_bytes(r.stdout);resolvedlock=tomllib.loads((native/'Cargo.lock').read_text())['package'];reg={(p['name'],p['version'],p.get('source'),p.get('checksum')) for p in resolvedlock if p.get('source')};assert reg<=allowed,reg-allowed
 commands=[]
 for label,manifest in [('release',consumer/'Cargo.toml'),('spatial',native/'Cargo.toml')]:
  commands.append({'id':f'extra-clippy.generated-{label}-{tc}','repository':str(root),'toolchain':tc,'local_timeout_seconds':1800,'env':{'CARGO_BUILD_JOBS':'4','CARGO_TARGET_DIR':f'/mnt/development/.interval-refactor-build/coordinated-ci/generated-clippy-{tc}'},'run':f'cargo clippy --locked --offline --manifest-path {manifest} --all-targets -- -D warnings','scope':'Exact generated consumer code from original CI helper, separate package graph; no fixture/source/lint weakening. Source/package locks verified before first build.'})
 (s/f'generated-consumer-clippy-{tc}.json').write_text(json.dumps(commands,indent=2)+'\n')
(dest/'preparation.json').write_text(json.dumps({'time_unix':time.time(),'records':records,'release_script_sha256':hashlib.sha256(script.encode()).hexdigest(),'spatial_script_sha256':hashlib.sha256((root/'crates/hyperspatial/scripts/source-consumer.py').read_bytes()).hexdigest()},indent=2)+'\n');print('Prepared both release and spatial consumer manifests on both compilers; pinned registry versions and current authored source match',flush=True)
