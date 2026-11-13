from pathlib import Path
import subprocess,time,json,hashlib
out=Path('/tmp/interval-refactor/dynamics-axis');root=Path('/tmp/interval-refactor/dynamics-axis-baseline');rows=[]
executables={'baseline':root/'target/release/deps/path_predicates-76b5bb949f77565a','control':root/'target/release/deps/path_predicates-f6f4f4070af4a364','candidate':Path('/mnt/development/csgrs/target/release/deps/path_predicates-f6f4f4070af4a364')}
for i,label in enumerate(['baseline','control','candidate','control','baseline']):
 exe=executables[label];command=['taskset','-c','0',str(exe),'specctra_grid_route_text_parse_256','--bench','--warm-up-time','0.5','--measurement-time','1','--sample-size','50','--noplot','--save-baseline',f'axis-control-{i}']
 with (out/f'control-{i}-{label}.log').open('w') as f:
  start=time.monotonic();result=subprocess.run(command,cwd=root,stdout=f,stderr=subprocess.STDOUT,check=True)
 data=json.loads((root/f'target/criterion/specctra_grid_route_text_parse_256/axis-control-{i}/estimates.json').read_text())
 rows.append(dict(label=label,command=command,bytes=exe.stat().st_size,sha256=hashlib.sha256(exe.read_bytes()).hexdigest(),seconds=time.monotonic()-start,mean=data['mean']))
 (out/'dependency-control-summary.json').write_text(json.dumps(rows,indent=2)+'\n');print(label,data['mean']['point_estimate'],flush=True)
