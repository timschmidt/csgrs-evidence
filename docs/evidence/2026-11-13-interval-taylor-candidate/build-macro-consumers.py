from pathlib import Path
import subprocess,json,time,shutil,hashlib
p=Path(__file__).parent;r=Path('/mnt/development/csgrs-taylor');target=Path('/tmp/interval-refactor/taylor-old-target');bins=Path('/tmp/interval-refactor/taylor-binaries');rows=[]
def build(variant):
 for project,exe in [('old-native-cost','dyadic-evolution-cost-probe'),('old-native-semantic','evolution-semantic-probe')]:
  name=variant+'-'+project;cmd=['cargo','+1.95.0','build','--release','--locked','--manifest-path',str(p/project/'Cargo.toml'),'--target-dir',str(target)];start=time.monotonic()
  with (p/(name+'-build.log')).open('w') as log:res=subprocess.run(cmd,cwd=r,stdout=log,stderr=subprocess.STDOUT)
  rows.append(dict(name=name,command=cmd,cwd=str(r),returncode=res.returncode,seconds=time.monotonic()-start));(p/'macro-builds.json').write_text(json.dumps(rows,indent=2)+'\n');assert res.returncode==0
  dest=bins/name;shutil.copy2(target/'release'/exe,dest)
  (p/(name+'-binary.json')).write_text(json.dumps(dict(path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest()),indent=2)+'\n')
  if project=='old-native-semantic':
   with (p/(name+'.log')).open('w') as log:res=subprocess.run([str(dest)],stdout=log,stderr=subprocess.STDOUT)
   assert res.returncode==0
  print(name,dest.stat().st_size,flush=True)
build('macro')
