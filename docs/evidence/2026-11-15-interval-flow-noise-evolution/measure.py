from pathlib import Path
import subprocess,os,json,time
s=Path(__file__).resolve().parent;out=s/'measurements';out.mkdir(exist_ok=False);env=os.environ.copy();env['CARGO_TERM_COLOR']='never';rows=[]
def run(name,args,extra=None):
 e=env.copy();e.update(extra or {});start=time.time();print('START '+name,flush=True)
 with (out/(name+'.log')).open('w') as log:r=subprocess.run(args,cwd=out,env=e,stdout=log,stderr=subprocess.STDOUT,timeout=600)
 row=dict(name=name,command=args,exit_code=r.returncode,elapsed_seconds=time.time()-start);rows.append(row);(out/'results.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(row),flush=True)
 if r.returncode:raise SystemExit(r.returncode)
controls={label:{('allocation' if 'allocation' in x['path'] else 'time'):x['path'] for x in json.loads((s/(label+'-control-builds.json')).read_text())} for label in ['baseline','candidate']}
for case in ['constant','shear']:
 for temperature in ['cold','warm']:
  for batch in range(6):
   for label in (['baseline','candidate'] if batch%2==0 else ['candidate','baseline']):
    run(f'manual-{case}-{temperature}-{batch}-{label}',[controls[label]['time'],'noise',case,'1',temperature,'64'])
  for label in ['baseline','candidate']:
   run(f'allocation-{case}-{temperature}-{label}',[controls[label]['allocation'],'noise',case,'1',temperature,'8'])
benches={x['name']:x for x in json.loads((s/'candidate-owner-benches.json').read_text())['binaries']}
for name,item in benches.items():
 run('owner-smoke-'+name,[item['path'],'--test'],{'ADAPTIVE_TAYLOR_ITERATIONS':'2'})
run('automatic-portfolio',[benches['flow_noise_evolution']['path'],'--bench','--sample-size','20','--warm-up-time','0.5','--measurement-time','1','--noplot'],{'CARGO_TARGET_DIR':str(out/'criterion')})
(out/'completed.json').write_text(json.dumps(dict(commands=len(rows),all_passed=True),indent=2)+'\n')
