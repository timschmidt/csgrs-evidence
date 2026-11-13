from pathlib import Path
import subprocess,time,json,shutil,hashlib
out=Path('/tmp/interval-refactor/dynamics-whole-cost');rows=[]
sizes=json.loads((out/'owner-binary-sizes.json').read_text())
for label in ['baseline','candidate']:
 row=next(r for r in sizes if r['label']==label);exe=Path(row['path']);assert hashlib.sha256(exe.read_bytes()).hexdigest()==row['sha256']
 root=Path('/tmp/interval-refactor/dynamics-axis-baseline') if label=='baseline' else Path('/mnt/development/csgrs')
 tag='dynamics-whole-cost-'+label
 command=['taskset','-c','0',str(exe),'--bench','--warm-up-time','0.1','--measurement-time','0.2','--sample-size','10','--save-baseline',tag,'--noplot']
 start=time.monotonic()
 with (out/(label+'-owner-benchmark.log')).open('w') as f:r=subprocess.run(command,cwd=root,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(label=label,command=command,exit=r.returncode,seconds=time.monotonic()-start));(out/'owner-benchmark-commands.json').write_text(json.dumps(rows,indent=2)+'\n');assert r.returncode==0
 for p in (root/'target/criterion').rglob(tag):
  if p.is_dir():shutil.copytree(p,out/(label+'-criterion')/p.parent.relative_to(root/'target/criterion'))
 print(label,'done',flush=True)
