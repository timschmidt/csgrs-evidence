from pathlib import Path
import os,subprocess,json,time
s=Path(__file__).resolve().parent;out=s/'pinned-provider';out.mkdir(exist_ok=False);cpu=json.loads((s/'cost-host.json').read_text())['selected_cpu'];rows=[]
for temperature in ['cold','warm']:
 for batch in range(16):
  for label in (['baseline','provider'] if batch%2==0 else ['provider','baseline']):
   name=f'shear-{temperature}-{batch}-{label}';args=['taskset','-c',str(cpu),'/mnt/development/.interval-refactor-build/noise-evolution-'+label+'-time','noise','shear','1',temperature,'256'];start=time.time()
   with (out/(name+'.log')).open('w') as log:r=subprocess.run(args,stdout=log,stderr=subprocess.STDOUT,timeout=120)
   rows.append(dict(name=name,command=args,exit_code=r.returncode,elapsed_seconds=time.time()-start));(out/'results.json').write_text(json.dumps(rows,indent=2)+'\n')
   if r.returncode:raise SystemExit(r.returncode)
  print('completed '+temperature+' pair '+str(batch),flush=True)
(out/'completed.json').write_text(json.dumps(dict(commands=len(rows),all_passed=True))+'\n')
