from pathlib import Path
import subprocess,time,json,shutil,hashlib
out=Path('/tmp/interval-refactor/dynamics-jerk');sizes=json.loads((out/'owner-binary-sizes.json').read_text());rows=[]
for index,label in enumerate(['candidate','baseline','baseline','candidate']):
 row=next(r for r in sizes if r['label']==label);exe=Path(row['path']);assert hashlib.sha256(exe.read_bytes()).hexdigest()==row['sha256']
 root=Path('/tmp/interval-refactor/dynamics-axis-baseline') if label=='baseline' else Path('/mnt/development/csgrs');tag=f'jerk-target-{index}'
 c=['taskset','-c','0',str(exe),'specctra_grid_.*text_parse|jerk_ramp.*certification|lookahead_feed_schedule_certification','--bench','--warm-up-time','0.2','--measurement-time','0.5','--sample-size','20','--noplot','--save-baseline',tag]
 start=time.monotonic()
 with (out/f'targeted-{index}-{label}.log').open('w') as f:r=subprocess.run(c,cwd=root,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(label=label,command=c,exit=r.returncode,seconds=time.monotonic()-start));(out/'targeted-benchmark-commands.json').write_text(json.dumps(rows,indent=2)+'\n');assert r.returncode==0
 for p in (root/'target/criterion').rglob(tag):
  if p.is_dir():shutil.copytree(p,out/f'targeted-{index}-criterion'/p.parent.relative_to(root/'target/criterion'))
 print(index,label,'done',flush=True)
