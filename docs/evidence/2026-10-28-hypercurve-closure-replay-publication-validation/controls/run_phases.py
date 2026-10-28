from pathlib import Path
import subprocess,sys,time
root=Path(__file__).resolve().parent
for phase in ['quick','lint','workflow','release']:
 print('START',phase,flush=True)
 with (root/(phase+'-run.log')).open('w') as out:
  result=subprocess.run([sys.executable,str(root/'driver.py'),'--checkout',str(root/'normal'),'--phase',phase,'--only','^(?!hyperspatial-directed-)'],stdout=out,stderr=subprocess.STDOUT)
 print('FINISH',phase,result.returncode,flush=True)
 if result.returncode:sys.exit(result.returncode)
