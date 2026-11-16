from pathlib import Path
import hashlib,json,re,shutil,subprocess,sys
s=Path(__file__).parent
root=Path('/mnt/development/interval-coordinated-stack/alumina-interface')
primary=Path('/mnt/development/alumina-interface')
assert json.loads((s/'runs/alumina-interface.ui-final.size-comparison/result.json').read_text())['exit_code']==2
assert json.loads((s/'interface-ui-revised-size-review.json').read_text())['all_size_caps_pass']
patch=(s/'interface-ui-final-candidate.patch').read_bytes()
assert subprocess.check_output(['git','diff','--binary'],cwd=root)==patch
assert subprocess.check_output(['git','diff','--binary'],cwd=primary)==patch
paths=['crates/alumina-interface-core/src/partition.rs','crates/alumina-interface-core/src/machine_profile.rs']
saved={p:(root/p).read_bytes() for p in paths}
fixed='f5341f36803ad77c856313315d67ac8b3bb63f9a';previous='32a59de0d69436427e5b97297c4929fd908bf326'
base=json.loads((s/'interface-baseline-cost-lane.json').read_text())[0]
base['toolchain']='1.95.0';base['env']=base['env']|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/coordinated-ci/interface-core-budget-1.95.0'}
base['local_timeout_seconds']=1800
out=s/'interface-core-budget';out.mkdir()
state={'fixed_revision':fixed,'previous_revision':previous,'candidate_patch_sha256':hashlib.sha256(patch).hexdigest(),'toolchain':'1.95.0','scope':'Same-layout fixed-goal, previously retained and final candidate core lib-test executable comparison; preserve the existing Rust1.95 artifact account and all earlier accepted growth. Root UI code is not built into this crate target. Dependency test-only changes are not compiled.','variants':{}}
tests=json.loads((s/'interface-partition-result.json').read_text())['tests']
ledger=json.loads(Path('/mnt/development/csgrs/docs/research/interval-size-accounts.json').read_text())
account=[r for r in ledger['accounts'] if r['artifact']=='alumina-interface/crates/alumina-interface-core/src/lib.rs#release-tests']
assert len(account)==1 and account[0]['toolchain']=='Rust 1.95.0'
state['existing_account']=account[0]
state['caps']={k:account[0]['metrics'][k]['caps'] for k in ['file','text']}
state['admission']='Measure and run original affected complete workloads. No assertions change in primary or retained candidate. Temporary historical controls differ only by their exact historical source. Size/cost acceptance and accounting remain separate.'
(out/'admission.json').write_text(json.dumps(state,indent=2)+'\n')
def run(name,cmd):
 row=base|{'id':'alumina-interface.core-budget.'+name,'run':cmd,'scope':state['scope']}
 manifest=s/(row['id']+'.manifest.json');assert not manifest.exists();manifest.write_text(json.dumps([row],indent=2)+'\n')
 subprocess.run([sys.executable,str(s/'run-one.py'),str(manifest),row['id']],check=True)
 directory=s/'runs'/row['id'];result=json.loads((directory/'result.json').read_text());assert result['source_boundaries_unchanged'];return directory
try:
 for label,revision in [('fixed',fixed),('previous',previous),('candidate',None)]:
  for rel in paths:
   data=saved[rel] if revision is None else subprocess.check_output(['git','show',revision+':'+rel],cwd=root)
   (root/rel).write_bytes(data)
  dest=out/label;dest.mkdir();(dest/'source.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=root))
  record=run(label+'-build','cargo test --locked --release -p alumina-interface-core --lib --no-run --message-format=json')
  artifacts=[];dependencies=[]
  for line in (record/'output.log').read_text().splitlines():
   if not line.startswith('{'):continue
   item=json.loads(line)
   if item.get('reason')!='compiler-artifact':continue
   if item['target']['name']=='alumina_interface_core' and item.get('executable'):artifacts.append(item)
   elif item['target']['kind']==['lib']:dependencies.append({'package_id':item['package_id'],'test':item['profile']['test']})
  assert len(artifacts)==1 and all(not d['test'] for d in dependencies)
  binary=dest/'test-binary';shutil.copy2(artifacts[0]['executable'],binary)
  raw=binary.read_bytes();data={'bytes':len(raw),'sha256':hashlib.sha256(raw).hexdigest(),'dependency_test_flags':dependencies}
  sections=subprocess.check_output(['readelf','-SW',str(binary)]);(dest/'sections.txt').write_bytes(sections)
  data['allocated_sections']={}
  for line in sections.decode().splitlines():
   m=re.match(r'\s*\[\s*\d+\]\s+(\.\S+)\s+(\S+)\s+[0-9a-f]+\s+[0-9a-f]+\s+([0-9a-f]+)\s+[0-9a-f]+\s+(\S+)\s+\d+\s+\d+\s+\d+\s*$',line)
   if m and 'A' in m[4]:data['allocated_sections'][m[1]]={'bytes':int(m[3],16),'type':m[2],'flags':m[4]}
  assert '.text' in data['allocated_sections']
  data['text_bytes']=data['allocated_sections']['.text']['bytes']
  temporary=dest/'objcopy-temporary';subprocess.run(['objcopy','--dump-section','.text='+str(dest/'text'),str(binary),str(temporary)],check=True);temporary.unlink()
  data['text_sha256']=hashlib.sha256((dest/'text').read_bytes()).hexdigest()
  (dest/'program-headers.txt').write_bytes(subprocess.check_output(['readelf','-lW',str(binary)]))
  cmd='\n'.join(str(binary)+' --exact '+test+' --test-threads=1' for test in tests)
  run(label+'-tests',cmd)
  state['variants'][label]=data
  (out/'result.json').write_text(json.dumps(state,indent=2)+'\n')
finally:
 for rel,data in saved.items():(root/rel).write_bytes(data)
 assert subprocess.check_output(['git','diff','--binary'],cwd=root)==patch
 state['candidate_restored']=True
 (out/'result.json').write_text(json.dumps(state,indent=2)+'\n')
run('restored-lints','cargo fmt --all -- --check\ncargo clippy --locked -p alumina-interface-core --all-targets --no-deps -- -D warnings')
print('Rust1.95 core fixed/previous/candidate artifacts retained; existing account caps unchanged; review cumulative measurements next.',flush=True)
