from pathlib import Path
import hashlib
import json
import os
import shutil
import subprocess
import sys
import time

raw = Path(__file__).resolve().parent
root = Path('/tmp/csgrs-r19-trace')
variant = sys.argv[1]
assert variant in ['baseline', 'candidate']
record = raw / ('probe-build-' + variant + '-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
env = os.environ.copy()
env.update(CARGO_TARGET_DIR='/tmp/csgrs-r19-target', CARGO_BUILD_JOBS='1',
           CARGO_PROFILE_RELEASE_DEBUG='0', RUSTFLAGS='')
manifest = raw / 'probe/Cargo.toml'
def inventory():
    names = subprocess.check_output(['git', 'ls-files', '--cached', '--others', '--exclude-standard'], cwd=root, text=True).splitlines()
    result = {n: hashlib.sha256((root/n).read_bytes()).hexdigest() for n in names
              if (root/n).is_file() and (n.endswith('.rs') or Path(n).name in ['Cargo.toml','Cargo.lock','config.toml'])}
    result.update({'probe/' + name: hashlib.sha256((raw/'probe'/name).read_bytes()).hexdigest()
                   for name in ['Cargo.toml','Cargo.lock','main.rs']})
    return result
before = inventory()
(record / 'sources.json').write_text(json.dumps(before, indent=2) + '\n')
for name in ['Cargo.toml','Cargo.lock','main.rs']:
    (record / name).write_bytes((raw/'probe'/name).read_bytes())
(record/'representation.rs').write_bytes((root/'crates/hyperreal/src/computable/node/representation.rs').read_bytes())
command = ['cargo','build','--locked','--offline','--release','--manifest-path',str(manifest),'--message-format=json']
start = time.monotonic()
with (record/'build.stdout').open('w') as out, (record/'build.stderr').open('w') as err:
    result = subprocess.run(command,cwd=root,env=env,stdout=out,stderr=err,timeout=900)
(record/'command.json').write_text(json.dumps({'command':command,'status':result.returncode,'seconds':time.monotonic()-start,
    'env':{k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_PROFILE_RELEASE_DEBUG','RUSTFLAGS']}},indent=2)+'\n')
assert result.returncode == 0, record
artifacts = [r for line in (record/'build.stdout').read_text().splitlines()
             if (r:=json.loads(line)).get('reason')=='compiler-artifact' and r.get('executable')]
assert len(artifacts)==1
binary=record/'probe-binary';shutil.copy2(artifacts[0]['executable'],binary)
assert before==inventory()
result={'record':str(record),'binary':str(binary),'sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),
        'bytes':binary.stat().st_size,'sources_unchanged':True,'sources':str(record/'sources.json'),'variant':variant,
        'source_status':'Private R19 experiment; baseline matches all 2352 inputs validated by all20finalR18checks. No R19 primary retention yet.'}
(record/'completion.json').write_text(json.dumps(result,indent=2)+'\n')
(raw/('latest-probe-'+variant+'.json')).write_text(json.dumps(result,indent=2)+'\n')
print('R19 PROBE BUILT',variant,record,flush=True)
