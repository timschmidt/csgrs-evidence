from pathlib import Path
import subprocess,json,shutil,hashlib
s=Path(__file__).parent;root=Path('/mnt/development/csgrs-dynamics-replay-inline')
assert json.loads((s/'baseline-build.json').read_text())['returncode']==0
assert json.loads((s/'observer-baseline-build.json').read_text())['observation_returncode']==0
assert not subprocess.check_output(['git','status','--porcelain=v1'],cwd=root)
subprocess.run(['git','apply','--index',str(s/'pending-extraction.patch')],cwd=root,check=True)
assert subprocess.check_output(['git','diff','--cached','--binary'],cwd=root)==(s/'pending-extraction.patch').read_bytes()
with (s/'extraction-driver.log').open('w') as out:
    subprocess.run(['python3','-B',str(s/'build.py'),'extraction'],stdout=out,stderr=subprocess.STDOUT,check=True)
old=Path('/tmp/interval-refactor/dynamics-provider-errors')
with (s/'provider-apply.log').open('w') as out:
    subprocess.run(['git','apply','--check',str(old/'candidate.patch')],cwd=root,stdout=out,stderr=subprocess.STDOUT,check=True)
subprocess.run(['git','apply',str(old/'candidate.patch')],cwd=root,check=True)
shutil.copy2(old/'provider_errors.rs',root/'crates/hyperdynamics/tests/provider_errors.rs')
for script,label in [('build.py','provider-control'),('build-observer.py','provider-control')]:
    with (s/f'{script}-{label}-driver.log').open('w') as out:
        subprocess.run(['python3','-B',str(s/script),label],stdout=out,stderr=subprocess.STDOUT,check=True)
assert subprocess.check_output(['git','diff','--cached','--binary'],cwd=root)==(s/'pending-extraction.patch').read_bytes()
print('current baseline, extraction and provider controls built',flush=True)
