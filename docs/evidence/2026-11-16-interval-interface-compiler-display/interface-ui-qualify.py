from pathlib import Path
import hashlib,json,shutil,subprocess,sys,time
s=Path(__file__).parent
root=Path('/mnt/development/interval-coordinated-stack/alumina-interface')
primary=Path('/mnt/development/alumina-interface')
rel='crates/alumina-interface-core/src/partition.rs'
wait=s/'runs/alumina-interface.partition.restored-lints/result.json'
while not wait.exists():time.sleep(5)
assert json.loads(wait.read_text())['exit_code']==0
assert subprocess.check_output(['git','diff','--binary'],cwd=root)==(s/'interface-chunks-candidate.patch').read_bytes()
patch=subprocess.check_output(['git','diff','--binary'],cwd=primary)
assert patch==(s/'interface-ui-with-fixture-candidate.patch').read_bytes()
(s/'interface-ui-qualified-source.patch').write_bytes(patch)
base=json.loads((s/'interface-baseline-cost-lane.json').read_text())[0]
rows=[]

def run(name,command):
 r=base|{'id':'alumina-interface.ui-qualify.'+name,'run':command,'scope':'Same-layout combined display/validation compiler qualification; raw artifact/cumulative budget acceptance remains separate.'}
 manifest=s/(r['id']+'.manifest.json');assert not manifest.exists();manifest.write_text(json.dumps([r],indent=2)+'\n')
 subprocess.run([sys.executable,str(s/'run-one.py'),str(manifest),r['id']],check=True)
 out=s/'runs'/r['id'];result=json.loads((out/'result.json').read_text());assert result['source_boundaries_unchanged']
 rows.append({'id':r['id'],'exit_code':result['exit_code'],'elapsed_seconds':result['elapsed_seconds']});(s/'interface-ui-qualify-results.json').write_text(json.dumps(rows,indent=2)+'\n')
 return out

def unit_artifact(label,directory):
 candidates=[];core_test_flags=[]
 for line in (directory/'output.log').read_text().splitlines():
  if not line.startswith('{'):continue
  try:r=json.loads(line)
  except json.JSONDecodeError:continue
  if r.get('reason')!='compiler-artifact':continue
  if r['target']['name']=='alumina_interface_core':core_test_flags.append(r['profile']['test'])
  if r.get('executable') and r['target']['name']=='alumina_interface':candidates.append(Path(r['executable']))
 assert len(candidates)==1,candidates
 assert core_test_flags and not any(core_test_flags),core_test_flags
 out=s/('interface-ui-tests-'+label);out.mkdir();binary=out/'test-binary';shutil.copy2(candidates[0],binary)
 raw=binary.read_bytes();info={'bytes':len(raw),'sha256':hashlib.sha256(raw).hexdigest(),'core_dependency_cfg_test':False}
 temporary=out/'objcopy-temporary'
 subprocess.run(['objcopy','--dump-section','.text='+str(out/'text'),str(binary),str(temporary)],check=True);temporary.unlink()
 raw=(out/'text').read_bytes();info|={'text_bytes':len(raw),'text_sha256':hashlib.sha256(raw).hexdigest()}
 (out/'report.json').write_text(json.dumps(info,indent=2)+'\n');return binary

# Original UI and core source for the fixed-control unit executable.
(root/rel).write_bytes(subprocess.check_output(['git','show','HEAD:'+rel],cwd=root))
assert not subprocess.check_output(['git','diff','--binary'],cwd=root)
baseline=run('baseline-unit-build','cargo test --locked --release -p alumina-interface --lib --no-run --message-format=json')
unit_artifact('baseline',baseline)
subprocess.run(['git','apply',str(s/'interface-ui-qualified-source.patch')],cwd=root,check=True)
assert subprocess.check_output(['git','diff','--binary'],cwd=root)==patch
run('candidate-checks','cargo fmt --all -- --check\ncargo test --workspace --locked\ncargo clippy --workspace --all-targets --no-deps --locked -- -D warnings\ncargo clippy --workspace --target wasm32-unknown-unknown --no-deps --locked -- -D warnings')
candidate=run('candidate-unit-build','cargo test --locked --release -p alumina-interface --lib --no-run --message-format=json')
unit=unit_artifact('candidate',candidate)
run('candidate-unit-tests',str(unit)+' --test-threads=8')
run('native-release','cargo rustc --locked --release -p alumina-interface-core --lib -- --emit=llvm-ir,asm\ncargo build --locked --release')
run('wasm-release','trunk build --release --locked --public-url /alumina-interface/')
run('wasm-validate','wasm-tools validate dist/alumina-interface_bg.wasm\ngzip -t dist/index.html.gz\ngzip -t dist/alumina-interface.js.gz\ngzip -t dist/alumina-interface_bg.wasm.gz\nbrotli -t dist/alumina-interface_bg.wasm.br')
run('artifacts','python3 '+str(s/'interface-artifacts-ui.py')+' ui-candidate')
print('Combined Interface qualification commands completed; cost admission still requires review',flush=True)
