from pathlib import Path
import subprocess,os,json,time,shutil
s=Path(__file__).parent;out=s/'owner-timing';out.mkdir(exist_ok=False);rows=[]
lookup={l:{x['source']:x for x in json.loads((s/(l+'-binaries.json')).read_text())} for l in ['baseline','candidate']}
slot=Path('/mnt/development/.interval-refactor-build/noise-reconsideration-owner-running')
targets=sorted(x for x in lookup['baseline'] if '/hyperdynamics/benches/' in x)
for target in targets:
 name=Path(target).stem
 for block in range(2):
  order=['baseline','candidate','candidate','baseline'] if block==0 else ['candidate','baseline','baseline','candidate']
  for pos,label in enumerate(order):
   dest=out/f'{name}-{block}-{pos}-{label}';dest.mkdir();shutil.copy2(lookup[label][target]['path'],slot)
   args=['taskset','-c','0','setarch','x86_64','-R',str(slot),'--bench','--noplot','--sample-size','30','--warm-up-time','0.5','--measurement-time','1']
   env=os.environ|{'CRITERION_HOME':str(dest/'criterion'),'ADAPTIVE_TAYLOR_ITERATIONS':'256'}
   start=time.monotonic()
   with (dest/'output.log').open('w') as log:p=subprocess.run(args,cwd=out,env=env,stdout=log,stderr=subprocess.STDOUT)
   row={'target':target,'name':name,'block':block,'position':pos,'label':label,'command':args,'exit_code':p.returncode,'seconds':time.monotonic()-start};rows.append(row);(out/'runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,block,pos,label,p.returncode,flush=True);assert p.returncode==0
(out/'completed.json').write_text(json.dumps({'commands':len(rows),'all_passed':True})+'\n')
