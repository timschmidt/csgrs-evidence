from pathlib import Path
import hashlib
import json
import os
import shutil
import subprocess
import sys
import time
import tomllib

raw=Path(__file__).resolve().parent
root=Path('/tmp/csgrs-r19-trace')
variant=sys.argv[1];mode='native'
assert variant in ['baseline','candidate'] and mode in ['native','allocations']
record=raw/('brep-build-'+variant+'-'+mode+'-'+str(time.time_ns()));record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
env=os.environ.copy();env.update(CARGO_TARGET_DIR='/tmp/csgrs-r19-target',CARGO_BUILD_JOBS='1',CARGO_PROFILE_RELEASE_DEBUG='0',RUSTFLAGS='')
manifest=raw/'brep/Cargo.toml';lock=manifest.with_name('Cargo.lock')
if not lock.exists():
    shutil.copy2(root/'Cargo.lock',lock)
    with (record/'metadata.stdout').open('w') as out,(record/'metadata.stderr').open('w') as err:
        subprocess.run(['cargo','metadata','--offline','--manifest-path',str(manifest),'--format-version=1'],cwd=root,env=env,stdout=out,stderr=err,check=True,timeout=120)
packages={(p['name'],p['version'],p.get('source')):p.get('checksum') for p in tomllib.loads((root/'Cargo.lock').read_text())['package']}
for p in tomllib.loads(lock.read_text())['package']:
    if p.get('source'):
        key=(p['name'],p['version'],p['source']);assert key in packages and packages[key]==p.get('checksum'),key
def inventory():
    names=subprocess.check_output(['git','ls-files','--cached','--others','--exclude-standard'],cwd=root,text=True).splitlines()
    result={n:hashlib.sha256((root/n).read_bytes()).hexdigest() for n in names if (root/n).is_file() and (n.endswith('.rs') or Path(n).name in ['Cargo.toml','Cargo.lock','config.toml'])}
    result.update({'brep/'+n:hashlib.sha256((raw/'brep'/n).read_bytes()).hexdigest() for n in ['Cargo.toml','Cargo.lock','main.rs']})
    return result
before=inventory()
expected=raw/'domain-replay-prototype-1792977115683792550/before.rs' if variant=='baseline' else Path(json.loads((raw/'latest-candidate-runtime.json').read_text())['source'])
assert before['crates/hyperreal/src/computable/node/representation.rs']==hashlib.sha256(expected.read_bytes()).hexdigest()
(record/'sources.json').write_text(json.dumps(before,indent=2)+'\n')
for n in ['Cargo.toml','Cargo.lock','main.rs']:(record/n).write_bytes((raw/'brep'/n).read_bytes())
(record/'representation.rs').write_bytes(expected.read_bytes())
command=['cargo','build','--locked','--offline','--release','--manifest-path',str(manifest),'--message-format=json']
if mode=='allocations':command+=['--features','allocations']
start=time.monotonic()
with (record/'build.stdout').open('w') as out,(record/'build.stderr').open('w') as err:
    proc=subprocess.run(command,cwd=root,env=env,stdout=out,stderr=err,timeout=900)
(record/'command.json').write_text(json.dumps({'command':command,'status':proc.returncode,'seconds':time.monotonic()-start,'env':{k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_PROFILE_RELEASE_DEBUG','RUSTFLAGS']}},indent=2)+'\n')
assert proc.returncode==0,record
assert before==inventory()
artifacts=[r for line in (record/'build.stdout').read_text().splitlines() if (r:=json.loads(line)).get('reason')=='compiler-artifact' and r.get('executable')]
assert len(artifacts)==1
binary=record/'brep-binary';shutil.copy2(artifacts[0]['executable'],binary)
result={'record':str(record),'binary':str(binary),'sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),
        'bytes':binary.stat().st_size,'variant':variant,'mode':mode,'sources':str(record/'sources.json'),
        'harness_sha256':before['brep/main.rs'],
        'lock_sha256':before['brep/Cargo.lock'],'sources_unchanged':True,'rustc':subprocess.check_output(['rustc','-Vv'],text=True)}
(record/'completion.json').write_text(json.dumps(result,indent=2)+'\n')
(raw/f'latest-brep-build-{variant}.json').write_text(json.dumps(result,indent=2)+'\n')
print('R19 BREP BUILT',variant,mode,record,flush=True)
