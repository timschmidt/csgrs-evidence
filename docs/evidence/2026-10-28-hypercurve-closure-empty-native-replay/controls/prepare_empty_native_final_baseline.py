from pathlib import Path
import hashlib
import importlib.util
import json
import os
import subprocess
import sys
import time

sys.dont_write_bytecode=True
root=Path(__file__).resolve().parents[1]
controls=root/'controls'
checkout=(root/'empty-native-replay').resolve()
record=controls/'empty-native-final-base-build'
record.mkdir()
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py')
e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot()
assert source==json.loads((controls/'selected-circle-corners-qualification-corner4/source-before.json').read_text())
e.save_json(record/'source-before.json',source);e.save_json(record/'files-before.json',files)
(record/'candidate.patch').write_bytes(patch)
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_TARGET_DIR':str(root.parent/'hypercurve-selected-circle-regions-admission'),'CARGO_BUILD_JOBS':'2','CCACHE_DIR':str(root.parent/'hypercurve-admission-ccache'),'CCACHE_TEMPDIR':str(root.parent/'hypercurve-admission-ccache/tmp')}
command=['cargo','build','--locked','--release','--all-features','-p','hypercurve','--lib','--message-format=json']
started=time.time()
with (record/'build.jsonl').open('w') as log,(record/'build-stderr.log').open('w') as err:
    result=subprocess.run(command,cwd=checkout,env=env,stdout=log,stderr=err,timeout=1800)
after,after_files,_=e.source_snapshot()
e.save_json(record/'source-after.json',after);e.save_json(record/'files-after.json',after_files)
e.save_json(record/'result.json',{'command':command,'exit_code':result.returncode,'elapsed_seconds':time.time()-started,'source_stable':source==after})
assert result.returncode==0 and source==after
artifacts=[json.loads(line) for line in (record/'build.jsonl').read_text().splitlines()]
library=Path(next(filename for item in artifacts if item.get('reason')=='compiler-artifact' and item['target']['name']=='hypercurve' for filename in item['filenames'] if filename.endswith('.rlib')))
e.save_json(record/'attribution.json',{'source':source,'library':str(library),'library_sha256':hashlib.sha256(library.read_bytes()).hexdigest()})
subprocess.run(['python3',str(controls/'probe_empty_native_replay.py'),'--checkout','empty-native-replay','--record','empty-native-final-baseline1','--attribution','empty-native-final-base-build/attribution.json'],check=True)
