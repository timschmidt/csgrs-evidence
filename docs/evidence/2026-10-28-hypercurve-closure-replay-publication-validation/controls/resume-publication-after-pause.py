from pathlib import Path
import subprocess,sys,json,re
r=Path(__file__).resolve().parent
missing=json.loads((r/'resume-publication-selection.json').read_text())
selection='^(?:'+'|'.join(re.escape(x) for x in missing if not x.startswith('hyperspatial-directed-'))+')$'
for phase in ['workflow','release']:
 print('START',phase,flush=True)
 with (r/(phase+'-resumed-run.log')).open('w') as out:
  code=subprocess.call([sys.executable,str(r/'driver.py'),'--checkout',str(r/'normal'),'--phase',phase,'--only',selection],stdout=out,stderr=subprocess.STDOUT)
 print('FINISH',phase,code,flush=True)
 if code:sys.exit(code)
