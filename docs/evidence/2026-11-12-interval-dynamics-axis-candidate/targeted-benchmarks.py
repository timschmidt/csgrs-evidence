from pathlib import Path
import subprocess,json,time
out=Path('/tmp/interval-refactor/dynamics-axis');rows=[]
for index,(label,exe,root) in enumerate([
('candidate','/mnt/development/csgrs/target/release/deps/path_predicates-f6f4f4070af4a364','/mnt/development/csgrs'),
('baseline','/tmp/interval-refactor/dynamics-axis-baseline/target/release/deps/path_predicates-76b5bb949f77565a','/tmp/interval-refactor/dynamics-axis-baseline'),
('baseline','/tmp/interval-refactor/dynamics-axis-baseline/target/release/deps/path_predicates-76b5bb949f77565a','/tmp/interval-refactor/dynamics-axis-baseline'),
('candidate','/mnt/development/csgrs/target/release/deps/path_predicates-f6f4f4070af4a364','/mnt/development/csgrs')]):
 c=['taskset','-c','0',exe,'specctra_grid_.*text_parse','--bench','--warm-up-time','0.2','--measurement-time','0.5','--sample-size','20','--noplot','--save-baseline',f'axis-target-{index}']
 with (out/f'targeted-{index}-{label}.log').open('w') as f:
  start=time.monotonic();r=subprocess.run(c,cwd=root,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(command=c,cwd=root,label=label,exit=r.returncode,seconds=time.monotonic()-start));(out/'targeted-benchmarks.json').write_text(json.dumps(rows,indent=2)+'\n');assert r.returncode==0
