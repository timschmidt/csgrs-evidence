from pathlib import Path
import subprocess,json,time,hashlib,shutil
p=Path(__file__).parent;r=Path('/mnt/development/csgrs-taylor-affine');state=json.loads((p/'SOURCE_FINAL.json').read_text());rows=[];bins=Path('/tmp/interval-refactor/taylor-affine-binaries');bins.mkdir(exist_ok=True)
for row in state['paths']:assert hashlib.sha256((r/row['path']).read_bytes()).hexdigest()==row['sha256']
projects=[('old-native-cost','dyadic-evolution-cost-probe','taylor-affine-old-target'),('old-native-semantic','evolution-semantic-probe','taylor-affine-old-target'),('model-cost','taylor-model-cost-probe','taylor-affine-new-target')]
def build(label,project,exe,target):
 cmd=['cargo','+1.95.0','build','--release','--locked','--offline','--manifest-path',str(p/project/'Cargo.toml'),'--target-dir','/tmp/interval-refactor/'+target];start=time.monotonic()
 with (p/(label+'-'+project+'-build.log')).open('w') as f:result=subprocess.run(cmd,cwd=r,stdout=f,stderr=subprocess.STDOUT)
 assert result.returncode==0,(label,project)
 dest=bins/(label+'-'+project);shutil.copy2(Path('/tmp/interval-refactor')/target/'release'/exe,dest)
 rows.append(dict(label=label,project=project,command=cmd,cwd=str(r),returncode=result.returncode,seconds=time.monotonic()-start,path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest()));(p/'consumer-builds.json').write_text(json.dumps(rows,indent=2)+'\n');print(label,project,flush=True)
# No tests/builds may run against this source while the baseline is installed.
try:
 for row in state['paths']:
  name=row['path'];base=subprocess.run(['git','show',state['base']+':'+name],cwd=r,capture_output=True)
  if base.returncode==0:(r/name).write_bytes(base.stdout)
 for project,exe,target in projects:build('baseline',project,exe,target)
finally:
 for row in state['paths']:(r/row['path']).write_bytes((p/'final-source-files'/row['path']).read_bytes())
 for row in state['paths']:assert hashlib.sha256((r/row['path']).read_bytes()).hexdigest()==row['sha256']
for project,exe,target in projects:build('final',project,exe,target)
build('final','affine-cost','taylor-model-cost-probe','taylor-affine-new-target')
