from pathlib import Path
import subprocess,time,json,hashlib,shutil,re
out=Path('/tmp/interval-refactor/dynamics-whole-cost');summary=json.loads((out/'owner-benchmark-summary.json').read_text());previous={r['name'] for r in json.loads((out/'targeted-summary.json').read_text())}
names=sorted(r['name'] for r in summary if r['ratio']>1.03 and r['candidate_ci']['lower_bound']>r['baseline_ci']['upper_bound'] and r['name'] not in previous)
(out/'supplemental-selection.json').write_text(json.dumps(dict(rule='All broad cases with ratio > 1.03 and non-overlapping mean CIs, excluding already repeated ten cases',names=names),indent=2)+'\n');print(len(names),'cases',flush=True)
pattern='^(?:'+'|'.join(re.escape(n) for n in names)+')$';sizes=json.loads((out/'owner-binary-sizes.json').read_text());rows=[]
for index,label in enumerate(['candidate','baseline','baseline','candidate']):
 row=next(r for r in sizes if r['label']==label);exe=Path(row['path']);assert hashlib.sha256(exe.read_bytes()).hexdigest()==row['sha256'];root=Path('/tmp/interval-refactor/dynamics-axis-baseline') if label=='baseline' else Path('/mnt/development/csgrs');tag=f'whole-supplemental-{index}'
 c=['taskset','-c','0',str(exe),pattern,'--bench','--warm-up-time','0.2','--measurement-time','0.5','--sample-size','20','--noplot','--save-baseline',tag];start=time.monotonic()
 with (out/f'supplemental-{index}-{label}.log').open('w') as f:r=subprocess.run(c,cwd=root,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(label=label,command=c,exit=r.returncode,seconds=time.monotonic()-start));(out/'supplemental-benchmark-commands.json').write_text(json.dumps(rows,indent=2)+'\n');assert r.returncode==0
 for p in (root/'target/criterion').rglob(tag):
  if p.is_dir():shutil.copytree(p,out/f'supplemental-{index}-criterion'/p.parent.relative_to(root/'target/criterion'))
 print(index,label,'done',flush=True)
