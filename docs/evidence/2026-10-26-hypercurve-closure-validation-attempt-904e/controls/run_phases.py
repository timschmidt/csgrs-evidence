from pathlib import Path
import subprocess,json,time,sys
root=Path(__file__).resolve().parent
rows=[]
for phase in ['quick','lint','workflow','release']:
 command=[sys.executable,str(root/'driver.py'),'--checkout',str(root/'normal'),'--phase',phase]
 if phase=='workflow':command+=['--only','^(?!hyperspatial-directed-)']
 print('PHASE',phase,flush=True);started=time.time();result=subprocess.run(command);rows.append({'phase':phase,'command':command,'status':result.returncode,'elapsed_seconds':time.time()-started});(root/'phase-results.json').write_text(json.dumps(rows,indent=2)+'\n')
 if result.returncode:raise SystemExit(result.returncode)
