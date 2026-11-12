from pathlib import Path
import sys,subprocess,shutil,hashlib,json
root=Path('/tmp/interval-refactor/interface-measurements');revision=sys.argv[1]
bins=Path('/tmp/interval-refactor/interface-measurement-binaries');bins.mkdir(exist_ok=True)
source=Path('/mnt/development/csgrs/crates/hyperinterval/conformance/alumina-measurements');rows=[]
for name,path in [('cost',source/'target/release/cost'),('probe',source/'target/release/probe'),('wasm',source/'wasm/target/wasm32-unknown-unknown/release/interval_measurement_wasm.wasm')]:
 dest=bins/(revision+'-'+name);shutil.copy2(path,dest);data=dest.read_bytes();rows.append({'name':name,'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest(),'path':str(dest)})
 if name!='wasm':
  with (root/(revision+'-'+name+'-sections.txt')).open('w') as f:subprocess.run(['size','-A',str(dest)],stdout=f,check=True)
(root/(revision+'-artifacts.json')).write_text(json.dumps(rows,indent=2)+'\n')
with (root/(revision+'-cost.csv')).open('w') as f:subprocess.run([str(bins/(revision+'-cost'))],stdout=f,check=True)
outputs=[]
for i in range(8):outputs.append({'fixture':i,'output':subprocess.check_output([str(bins/(revision+'-probe')),str(i)],text=True)})
(root/(revision+'-outputs.json')).write_text(json.dumps(outputs,indent=2)+'\n')
with (root/(revision+'-wasm-replay.json')).open('w') as f:subprocess.run(['/tmp/interval-refactor/tools/bin/python',str(root/'wasm-replay.py'),str(bins/(revision+'-wasm'))],stdout=f,check=True)
print(json.dumps(rows,indent=2))
