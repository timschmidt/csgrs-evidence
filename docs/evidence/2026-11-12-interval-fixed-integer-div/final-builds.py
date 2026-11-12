import subprocess,json,hashlib,shutil
from pathlib import Path
root=Path('/tmp/interval-refactor/fixed-integer-div'); bins=Path('/tmp/interval-refactor/fixed-integer-div-binaries')
manifest='crates/hyperlattice-interval/conformance/alumina-foc/Cargo.toml'
rows=[]
for tc,tag in [('1.88.0','188'),('stable','stable')]:
 cmd=['cargo','+'+tc,'build','--locked','--release','--manifest-path',manifest,'--bins']
 with (root/f'final-build-{tag}.log').open('w') as f:subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,check=True)
 for name in ['native-probe','shared-probe','cost']:
  source=Path('crates/hyperlattice-interval/conformance/alumina-foc/target/release')/name; dest=bins/f'final-{tag}-{name}';shutil.copy2(source,dest)
  with (root/f'final-{tag}-{name}-sections.txt').open('w') as f:subprocess.run(['size','-A',str(dest)],stdout=f,check=True)
  data=dest.read_bytes();section=bins/f'final-{tag}-{name}.text'
  subprocess.run(['objcopy','--dump-section','.text='+str(section),str(dest)],check=True)
  old=bins/f'candidate3-{tag}-{name}.text'
  if not old.exists():subprocess.run(['objcopy','--dump-section','.text='+str(old),str(bins/f'candidate3-{tag}-{name}')],check=True)
  rows.append({'compiler':tc,'command':cmd,'binary':name,'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest(),'text_sha256':hashlib.sha256(section.read_bytes()).hexdigest(),'text_identical_to_candidate3':section.read_bytes()==old.read_bytes()})
(root/'final-binaries.json').write_text(json.dumps(rows,indent=2)+'\n')
print(json.dumps(rows,indent=2))
