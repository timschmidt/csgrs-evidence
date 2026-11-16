from pathlib import Path
import json,subprocess,shlex,tomllib,shutil,hashlib,os,time
s=Path(__file__).parent;root=Path('/mnt/development/interval-clippy-closure/csgrs');allowed={(x['name'],x['version'],x.get('source'),x.get('checksum')) for x in tomllib.loads((root/'Cargo.lock').read_text())['package'] if x.get('source')};audit=[]
for tc in ['stable','1.95.0']:
 work=s/'generated-lint-consumers'/tc;packages=work/'packages';prep=json.loads((work/'preparation.json').read_text());paths={x['name']:packages/(x['name']+'-'+tomllib.loads((root/('Cargo.toml' if x['name']=='csgrs' else 'crates/'+x['name']+'/Cargo.toml')).read_text())['package']['version']) for x in prep['archives']};ffi=paths['csgrs-ffi'];shutil.copy2(ffi/'Cargo.lock',work/'ffi-Cargo.lock.before-resolution');shutil.copy2(root/'Cargo.lock',ffi/'Cargo.lock')
 args=[]
 for name,path in paths.items():args+=['--config','patch.crates-io.'+name+'.path='+json.dumps(str(path))]
 with (work/'ffi-metadata.stderr').open('w') as stderr:
  result=subprocess.run(['cargo','+'+tc,'metadata','--offline','--format-version','1','--manifest-path',str(ffi/'Cargo.toml'),*args],env=os.environ|{'CARGO_TARGET_DIR':str(work/'metadata-target')},stdout=subprocess.PIPE,stderr=stderr,check=True)
 (work/'ffi-metadata.json').write_bytes(result.stdout);resolved=json.loads(result.stdout)
 for p in resolved['packages']:
  if p['source'] is None:assert Path(p['manifest_path']).is_relative_to(packages),p
 registry={(x['name'],x['version'],x.get('source'),x.get('checksum')) for x in tomllib.loads((ffi/'Cargo.lock').read_text())['package'] if x.get('source')};assert registry<=allowed,registry-allowed
 command={'id':f'extra-clippy.generated-packaged-ffi-{tc}','repository':str(root),'toolchain':tc,'local_timeout_seconds':1800,'env':{'CARGO_BUILD_JOBS':'4','CARGO_TARGET_DIR':f'/mnt/development/.interval-refactor-build/coordinated-ci/generated-clippy-{tc}'},'run':shlex.join(['cargo','clippy','--locked','--offline','--manifest-path',str(ffi/'Cargo.toml'),'--lib',*args,'--','-D','warnings']),'scope':'Exact separate packaged FFI manifest/patch graph used by release-check.sh for C/C++ linkage; library target preserved. Consumer feature unification is not substituted. Registry resolution checked against workspace lock.'}
 (s/f'packaged-ffi-clippy-{tc}.json').write_text(json.dumps([command],indent=2)+'\n');audit.append({'toolchain':tc,'registry_packages':len(registry),'lock_sha256':hashlib.sha256((ffi/'Cargo.lock').read_bytes()).hexdigest(),'metadata_sha256':hashlib.sha256(result.stdout).hexdigest()})
(s/'generated-lint-consumers/ffi-preparation.json').write_text(json.dumps({'time_unix':time.time(),'records':audit},indent=2)+'\n');print('Both packaged FFI graphs prepared, no source edit',flush=True)
