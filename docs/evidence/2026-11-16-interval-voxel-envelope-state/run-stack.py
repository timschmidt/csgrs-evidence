from pathlib import Path
import sys,subprocess,json,hashlib,time
s=Path(__file__).parent;label=sys.argv[1];record=json.loads((s/(label+'-build.json')).read_text());binary=Path(record['binary']);assert hashlib.sha256(binary.read_bytes()).hexdigest()==record['sha256'];assert not (s/(label+'-runs.json')).exists()
rows=[]
for repeat in range(3):
 for warm in [0,16]:
  for case in ['empty','first','many','incompatible','surd','computable','inverted','malformed','unknown']:
   name=f'{label}-{repeat}-{warm}-{case}';cmd=[str(binary),'stack',case,str(warm),'baseline' if label=='original' else 'candidate'];start=time.time()
   with (s/(name+'.log')).open('w') as log:code=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,timeout=120).returncode
   rows.append({'label':label,'repeat':repeat,'warm':warm,'case':case,'command':cmd,'log':name+'.log','elapsed':time.time()-start,'exit_code':code});(s/(label+'-runs.json')).write_text(json.dumps(rows,indent=2)+'\n');assert code==0,(name,code)
print(label,len(rows),'fresh processes',flush=True)
