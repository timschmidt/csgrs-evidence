from pathlib import Path
import subprocess,os,json,time
s=Path(__file__).parent
rows={label:{x['source']:x for x in json.loads((s/(label+'-binaries.json')).read_text())} for label in ['baseline','candidate']}
# Every benchmark whose linked code includes derive is compared in ABBA order.
size=json.loads((s/'native-size-comparison.json').read_text())
targets=[x['artifact'] for x in size['artifacts'] if '/benches/' in x['artifact'] and x['metrics']['text']['incremental_bytes']]
results=[]
for target in sorted(targets):
 source='/mnt/development/interval-profile-static/csgrs/'+target
 for position,label in enumerate(['baseline','candidate','candidate','baseline']):
  key=target.replace('/','_')+f'-{position}-{label}';folder=s/'criterion'/key;folder.mkdir(parents=True,exist_ok=True)
  command=['setarch','x86_64','-R','taskset','-c','0',rows[label][source]['path'],'--bench','--noplot','--sample-size','40','--warm-up-time','0.2','--measurement-time','0.6']
  start=time.monotonic()
  with (folder/'output.log').open('w') as out:p=subprocess.run(command,env=os.environ|{'CRITERION_HOME':str(folder/'data')},stdout=out,stderr=subprocess.STDOUT)
  result={'target':target,'position':position,'label':label,'command':command,'exit_code':p.returncode,'seconds':time.monotonic()-start};results.append(result)
  (s/'criterion-runs.json').write_text(json.dumps(results,indent=2)+'\n');print(key,p.returncode,flush=True);assert p.returncode==0
