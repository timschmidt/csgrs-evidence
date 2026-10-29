from pathlib import Path
import argparse,json,subprocess,sys,time
r=Path(__file__).resolve().parents[1];p=r/'prepush-selected-fields'
parser=argparse.ArgumentParser();parser.add_argument('mode',choices=['normal','directed']);args=parser.parse_args()
prepared=json.loads((p/'cache-preparation.json').read_text())
source=json.loads((p/'publication-source.json').read_text())
assert prepared['source_revision']==source['head'] and prepared['source_unchanged']
checkout=(p/args.mode).resolve()
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=checkout,text=True).strip()==source['head']
assert not subprocess.check_output(['git','status','--porcelain'],cwd=checkout,text=True).strip()
phases=['quick','lint','workflow','release'] if args.mode=='normal' else ['workflow']
build_root=r.parent/('research-closeout-builds' if args.mode=='normal' else 'research-closeout-directed-expanded-builds')
rows=[]
for phase in phases:
 command=[sys.executable,str(p/'driver.py'),'--checkout',str(checkout),'--phase',phase,'--build-root',str(build_root),'--only','^(?!hyperspatial-directed-)' if args.mode=='normal' else '^hyperspatial-directed-']
 print('START',args.mode,phase,flush=True);started=time.time()
 with (p/(args.mode+'-'+phase+'-controller.log')).open('w') as log:result=subprocess.run(command,stdout=log,stderr=subprocess.STDOUT)
 row={'mode':args.mode,'phase':phase,'command':command,'exit_code':result.returncode,'elapsed_seconds':time.time()-started};rows.append(row)
 (p/(args.mode+'-phases.json')).write_text(json.dumps(rows,indent=2)+'\n')
 print('FINISH',row,flush=True)
 if result.returncode:raise SystemExit(result.returncode)
print('MODE COMPLETE',args.mode,flush=True)
