from pathlib import Path
import subprocess,time,json,shutil,re
out=Path('/tmp/interval-refactor/dynamics-axis');rows=[]
for label,root in [('baseline',Path('/tmp/interval-refactor/dynamics-axis-baseline')),('candidate',Path('/mnt/development/csgrs'))]:
 log=out/('baseline-check-1.log' if label=='baseline' else 'check-04.log')
 relative=re.search(r'Running benches/path_predicates.rs \(([^)]+)\)',log.read_text()).group(1)
 exe=[root/relative];assert exe[0].exists()
 command=['taskset','-c','0',str(exe[0]),'--bench','--warm-up-time','0.1','--measurement-time','0.2','--sample-size','10','--save-baseline','dynamics-axis-'+label,'--noplot']
 start=time.monotonic()
 with (out/(label+'-owner-benchmark.log')).open('w') as f:r=subprocess.run(command,cwd=root,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(label=label,command=command,exit=r.returncode,seconds=time.monotonic()-start));(out/'owner-benchmark-commands.json').write_text(json.dumps(rows,indent=2)+'\n')
 assert r.returncode==0
 for p in (root/'target/criterion').rglob('dynamics-axis-'+label):
  if p.is_dir():
   dest=out/(label+'-criterion')/p.parent.relative_to(root/'target/criterion');shutil.copytree(p,dest)
 print(label,'done',flush=True)
