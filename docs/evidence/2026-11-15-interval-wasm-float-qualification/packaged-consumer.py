from pathlib import Path
import subprocess,os,json,time,tarfile,hashlib,shutil
s=Path(__file__).resolve().parent;r=Path('/mnt/development/csgrs-wasm-float');b=Path('/mnt/development/.interval-refactor-build/wasm-float-packaged');source=json.loads((s/'SOURCE.json').read_text());packages=b/'packages';packages.mkdir();artifacts=[]
for name in ['hyperreal','hyperinterval']:
 archive,=(b/'target/package').glob(name+'-[0-9]*.crate')
 with tarfile.open(archive) as t:t.extractall(packages,filter='data')
 root=packages/archive.name.removesuffix('.crate');vcs=json.loads((root/'.cargo_vcs_info.json').read_text());assert vcs['git']['sha1']==source['commit'] and not vcs['git'].get('dirty',False)
 artifacts.append(dict(name=name,archive=str(archive),sha256=hashlib.sha256(archive.read_bytes()).hexdigest(),bytes=archive.stat().st_size,vcs=vcs))
(s/'package-artifacts.json').write_text(json.dumps(artifacts,indent=2)+'\n')
client=b/'consumer';(client/'src').mkdir(parents=True);shutil.copyfile(r/'crates/hyperinterval/conformance/wasm-float/src/lib.rs',client/'src/lib.rs')
manifest='[package]\nname = "packaged-float-wasm-client"\nversion = "0.0.0"\nedition = "2024"\nrust-version = "1.88"\n[workspace]\n[lib]\ncrate-type = ["cdylib"]\n[dependencies]\nhyperinterval = { version = "=0.1.0", default-features = false, features = ["float-enclosure"] }\n[profile.release]\npanic = "abort"\noverflow-checks = true\n[patch.crates-io]\n'
for name in ['hyperreal','hyperinterval']:
 root,=packages.glob(name+'-[0-9]*');manifest+=name+' = { path = '+json.dumps(str(root))+' }\n'
(client/'Cargo.toml').write_text(manifest);(s/'packaged-consumer-Cargo.toml').write_text(manifest)
env=os.environ|{'CARGO_HOME':str(b/'cargo-home'),'CARGO_TARGET_DIR':str(b/'consumer-target'),'CARGO_BUILD_JOBS':'12','CARGO_NET_OFFLINE':'true','CARGO_TERM_COLOR':'never'};rows=[]
def run(name,args):
 start=time.time()
 with (s/(name+'.log')).open('w') as out,(s/(name+'.stderr.log')).open('w') as err:p=subprocess.run(args,cwd=client,env=env,stdout=out,stderr=err,timeout=600)
 row=dict(name=name,command=args,exit_code=p.returncode,elapsed_seconds=time.time()-start);rows.append(row);(s/'packaged-consumer-results.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(row),flush=True);assert p.returncode==0
for version in ['1.88.0','stable']:
 run('packaged-build-'+version,['cargo','+'+version,'build','--offline','--release','--target','wasm32-unknown-unknown',*(['--locked'] if version=='stable' else [])])
 module=b/('packaged-'+version+'.wasm');shutil.copyfile(b/'consumer-target/wasm32-unknown-unknown/release/packaged_float_wasm_client.wasm',module)
 corpus='/mnt/development/.interval-refactor-build/wasm-float-qualified/complete-stable/corpus.json'
 run('packaged-node-'+version,['node',str(r/'crates/hyperinterval/conformance/wasm-float/check.mjs'),str(module),corpus])
 run('packaged-browser-'+version,['node',str(r/'crates/hyperinterval/conformance/wasm-float/browser.mjs'),str(module),corpus])
 run('packaged-metadata-'+version,['cargo','+'+version,'metadata','--locked','--offline','--format-version','1'])
 metadata=json.loads((s/('packaged-metadata-'+version+'.log')).read_text())
 for item in metadata['packages']:
  if item['source'] is None and item['name']!='packaged-float-wasm-client':assert Path(item['manifest_path']).resolve().is_relative_to(packages)
 assert {item['name'] for item in metadata['packages']}=={'packaged-float-wasm-client','hyperinterval'}
shutil.copyfile(client/'Cargo.lock',s/'packaged-consumer-Cargo.lock');(s/'packaged-consumer-completed.json').write_text(json.dumps(dict(all_passed=True,source=source['commit'],normal_dependencies=['hyperinterval'],all_library_sources_from_archives=True,consumer_source_sha256=hashlib.sha256((client/'src/lib.rs').read_bytes()).hexdigest()))+'\n')
