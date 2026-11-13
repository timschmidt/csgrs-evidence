from pathlib import Path
import subprocess,time,json,hashlib,shutil
q=Path(__file__).parent;p=q.parent;r=Path('/mnt/development/csgrs-taylor-affine');bins=Path('/tmp/interval-refactor/taylor-affine-binaries');rows=[];state=json.loads((q/'SOURCE_FINAL.json').read_text())
for row in state['paths']:assert hashlib.sha256((r/row['path']).read_bytes()).hexdigest()==row['sha256']
for project,exe,target in [('old-native-cost','dyadic-evolution-cost-probe','taylor-affine-old-target'),('old-native-semantic','evolution-semantic-probe','taylor-affine-old-target'),('model-cost','taylor-model-cost-probe','taylor-affine-new-target'),('affine-cost','taylor-model-cost-probe','taylor-affine-new-target')]:
 cmd=['cargo','+1.95.0','build','--release','--locked','--offline','--manifest-path',str(p/project/'Cargo.toml'),'--target-dir','/tmp/interval-refactor/'+target];start=time.monotonic()
 with (q/(project+'-build.log')).open('w') as f:result=subprocess.run(cmd,cwd=r,stdout=f,stderr=subprocess.STDOUT)
 assert result.returncode==0,project
 dest=bins/('isolated-'+project);shutil.copy2(Path('/tmp/interval-refactor')/target/'release'/exe,dest)
 rows.append(dict(source_snapshot_sha256=hashlib.sha256((q/'SOURCE_FINAL.json').read_bytes()).hexdigest(),project=project,command=cmd,cwd=str(r),returncode=result.returncode,seconds=time.monotonic()-start,path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest()));(q/'consumer-builds.json').write_text(json.dumps(rows,indent=2)+'\n');print(project,flush=True)
