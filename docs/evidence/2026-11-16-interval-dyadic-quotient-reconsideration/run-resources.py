from pathlib import Path
import sys,json,subprocess,time,hashlib
s=Path(__file__).parent;label=sys.argv[1];lock=sys.argv[2];dest=s/f'resource-runs-{label}-{lock}.json';assert not dest.exists()
cases=['positive','negative','mixed','exact','zero','empty','wide','sqrt','rational','exp','log','atan','sin','cos','tan','power','split','contains_zero','size','work','retry','midpoint','radius']
(s/'cases.json').write_text(json.dumps(cases)+'\n')
runs=[]
for mode in ['allocation','trace','stack']:
 b=json.loads((s/f'{label}-{lock}-{mode}-build.json').read_text());assert b['exit_code']==0
 binary=Path(b['binary']);assert hashlib.sha256(binary.read_bytes()).hexdigest()==b['sha256']
 for repeat in range(3):
  for warm in [0,16]:
   for case in cases:
    log=f'resource-{label}-{lock}-{mode}-{repeat}-{warm}-{case}.log';cmd=[str(binary),mode,case,str(warm)];start=time.time()
    with (s/log).open('w') as f:
     try:code=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,timeout=120).returncode
     except subprocess.TimeoutExpired:code=124
    runs.append({'label':label,'lock':lock,'mode':mode,'repeat':repeat,'warm':warm,'case':case,'cmd':cmd,'log':log,'elapsed':time.time()-start,'exit_code':code});dest.write_text(json.dumps(runs,indent=2)+'\n')
    if code:print(log,code,flush=True);sys.exit(code)
 print(label,lock,mode,'completed',flush=True)
