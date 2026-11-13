from pathlib import Path
import subprocess,json,time,shutil,hashlib
p=Path(__file__).parent;r=Path('/mnt/development/csgrs-taylor');target=Path('/tmp/interval-refactor/taylor-old-target');bins=Path('/tmp/interval-refactor/taylor-binaries');bins.mkdir(exist_ok=True)
patch=subprocess.check_output(['git','diff','--binary'],cwd=r);(p/'candidate-tracked.patch').write_bytes(patch)
paths=subprocess.check_output(['git','diff','--name-only'],cwd=r,text=True).splitlines()+subprocess.check_output(['git','ls-files','--others','--exclude-standard'],cwd=r,text=True).splitlines()
source=[]
for name in paths:
 data=(r/name).read_bytes();dest=p/'source-files'/name;dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes(data);source.append(dict(path=name,sha256=hashlib.sha256(data).hexdigest()))
(p/'SOURCE_STATE.json').write_text(json.dumps(source,indent=2)+'\n');rows=[]
def build(variant):
 for project,exe in [('old-native-cost','dyadic-evolution-cost-probe'),('old-native-semantic','evolution-semantic-probe')]:
  name=variant+'-'+project;cmd=['cargo','+1.95.0','build','--release','--locked','--manifest-path',str(p/project/'Cargo.toml'),'--target-dir',str(target)];start=time.monotonic()
  with (p/(name+'-build.log')).open('w') as log:res=subprocess.run(cmd,cwd=r,stdout=log,stderr=subprocess.STDOUT)
  rows.append(dict(name=name,command=cmd,cwd=str(r),returncode=res.returncode,seconds=time.monotonic()-start));(p/'old-builds.json').write_text(json.dumps(rows,indent=2)+'\n');assert res.returncode==0
  dest=bins/name;shutil.copy2(target/'release'/exe,dest)
  (p/(name+'-binary.json')).write_text(json.dumps(dict(path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest()),indent=2)+'\n')
  if project=='old-native-semantic':
   with (p/(name+'.log')).open('w') as log:res=subprocess.run([str(dest)],stdout=log,stderr=subprocess.STDOUT)
   assert res.returncode==0
  print(name,dest.stat().st_size,flush=True)
build('candidate')
subprocess.run(['git','apply','-R',str(p/'candidate-tracked.patch')],cwd=r,check=True)
try:
 assert not subprocess.check_output(['git','diff','--binary'],cwd=r)
 build('baseline')
finally:
 subprocess.run(['git','apply',str(p/'candidate-tracked.patch')],cwd=r,check=True)
 for row in source:assert hashlib.sha256((r/row['path']).read_bytes()).hexdigest()==row['sha256']
 print('candidate source restored exactly',flush=True)
