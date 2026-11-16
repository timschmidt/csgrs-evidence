from pathlib import Path
import json,subprocess,sys,time
from interface_unit_artifacts import unit_artifact
s=Path(__file__).parent
root=Path('/mnt/development/interval-coordinated-stack/alumina-interface')
primary=Path('/mnt/development/alumina-interface')
prior=s/'runs/alumina-interface.ui-qualify.artifacts/result.json'
print('WAIT for complete pre-bits artifact comparison before final test-source qualification',flush=True)
while not prior.exists():time.sleep(5)
assert json.loads(prior.read_text())['exit_code']==0
assert subprocess.check_output(['git','diff','--binary'],cwd=root)==(s/'interface-ui-qualified-source.patch').read_bytes()
assert subprocess.check_output(['git','diff','--binary'],cwd=primary)==(s/'interface-ui-final-candidate.patch').read_bytes()
rel='src/control_graph_ui.rs'
(root/rel).write_bytes((primary/rel).read_bytes())
assert subprocess.check_output(['git','diff','--binary'],cwd=root)==(s/'interface-ui-final-candidate.patch').read_bytes()
base=json.loads((s/'interface-baseline-cost-lane.json').read_text())[0]
results=[]
def run(name,command):
 r=base|{'id':'alumina-interface.ui-final.'+name,'run':command,'scope':'Final exact-bit rendering regression source; retain all earlier evidence and rerun affected compiler, test and final-artifact checks.'}
 manifest=s/(r['id']+'.manifest.json');assert not manifest.exists();manifest.write_text(json.dumps([r],indent=2)+'\n')
 subprocess.run([sys.executable,str(s/'run-one.py'),str(manifest),r['id']],check=True)
 out=s/'runs'/r['id'];d=json.loads((out/'result.json').read_text());assert d['source_boundaries_unchanged']
 results.append({'id':r['id'],'exit_code':d['exit_code'],'elapsed_seconds':d['elapsed_seconds']});(s/'interface-ui-final-results.json').write_text(json.dumps(results,indent=2)+'\n');return out
run('checks','cargo fmt --all -- --check\ncargo test --workspace --locked\ncargo clippy --workspace --all-targets --no-deps --locked -- -D warnings\ncargo clippy --workspace --target wasm32-unknown-unknown --no-deps --locked -- -D warnings\nbash scripts/audit-source-policy.sh')
r=run('unit-build','cargo test --locked --release -p alumina-interface --lib --no-run --message-format=json')
unit=unit_artifact('final',r)
run('unit-tests',str(unit)+' --test-threads=8')
run('native-release','cargo rustc --locked --release -p alumina-interface-core --lib -- --emit=llvm-ir,asm\ncargo build --locked --release')
run('wasm-release','trunk build --release --locked --public-url /alumina-interface/')
run('validate','wasm-tools validate dist/alumina-interface_bg.wasm\ngzip -t dist/index.html.gz\ngzip -t dist/alumina-interface.js.gz\ngzip -t dist/alumina-interface_bg.wasm.gz\nbrotli -t dist/alumina-interface_bg.wasm.br')
run('artifacts','python3 '+str(s/'interface-artifacts-ui-final.py')+' ui-final')
print('Final Interface artifacts retained; completed-workload cost admission remains separate',flush=True)
