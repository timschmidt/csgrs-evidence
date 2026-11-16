from pathlib import Path
import json,subprocess,sys,time
s=Path(__file__).parent
manifest=Path(sys.argv[1]);label=sys.argv[2]
records=json.loads(manifest.read_text()); results=[]
for r in records:
    result=s/'runs'/r['id']/'result.json'
    if result.exists():
        print('RECORDED',r['id'],flush=True)
    else:
        subprocess.run([sys.executable,str(s/'run-one.py'),str(manifest),r['id']],check=False)
    if result.exists():
        data=json.loads(result.read_text());results.append({'id':r['id'],'exit_code':data['exit_code'],'elapsed_seconds':data['elapsed_seconds']})
    else:
        raise SystemExit(f"No terminal result for {r['id']}; inspect before continuing")
    (s/f'{label}-results.json').write_text(json.dumps(results,indent=2)+'\n')
print('LANE DONE',label,'passed',sum(r['exit_code']==0 for r in results),'failed',sum(r['exit_code']!=0 for r in results),flush=True)
