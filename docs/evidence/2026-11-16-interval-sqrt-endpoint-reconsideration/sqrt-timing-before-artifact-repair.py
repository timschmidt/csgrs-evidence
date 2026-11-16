from pathlib import Path
import subprocess,os,time,json,shutil,statistics,hashlib
s=Path(__file__).parent
out=s/'sqrt-timing-confirmation';out.mkdir(exist_ok=False)
slot=Path('/mnt/development/.interval-refactor-build/sqrt-endpoint-running')
lookup={label:json.loads((s/(label+'-sqrt-native-artifact.json')).read_text()) for label in ['baseline','candidate']}
rows=[]
for warm_index,label in enumerate(['baseline','candidate'] * 6):
 shutil.copy2(lookup[label]['path'],slot)
 result=subprocess.run(['taskset','-c','0','setarch','x86_64','-R',str(slot)],cwd=out,env=os.environ|{'SQRT_TIMING':'1'},stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
 (out/('warmup-'+str(warm_index)+'-'+label+'.log')).write_text(result.stdout)
 assert result.returncode==0
for block,order in enumerate([['baseline','candidate','candidate','baseline'],['candidate','baseline','baseline','candidate']] * 4):
 for position,label in enumerate(order):
  r=lookup[label];shutil.copy2(r['path'],slot)
  assert hashlib.sha256(slot.read_bytes()).hexdigest()==r['sha256']
  cmd=['taskset','-c','0','setarch','x86_64','-R',str(slot)]
  start=time.monotonic()
  result=subprocess.run(cmd,cwd=out,env=os.environ|{'SQRT_TIMING':'1'},stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
  (out/f'{block}-{position}-{label}.log').write_text(result.stdout)
  row={'block':block,'position':position,'label':label,'command':cmd,'exit_code':result.returncode,'seconds':time.monotonic()-start,'sha256':r['sha256'],'cases':{}}
  assert result.returncode==0
  for line in result.stdout.splitlines():
   if line.startswith('TIMING '):
    _,index,samples=line.split(' ',2);samples=json.loads(samples)
    row['cases'][index]={'samples':samples,'median_ns':statistics.median(samples)}
  assert len(row['cases'])==12
  rows.append(row);(out/'runs.json').write_text(json.dumps(rows,indent=2)+'\n')
  print(block,position,label,round(row['seconds'],2),flush=True)
summary=[]
for index in map(str,range(12)):
 item={'case':index,'completion':'no nonnegative real domain' if index == '3' else 'successful enclosure','blocks':[]}
 for block in range(8):
  values={label:[r['cases'][index]['median_ns'] for r in rows if r['block']==block and r['label']==label] for label in lookup}
  medians={label:statistics.mean(values[label]) for label in lookup}
  item['blocks'].append({'block':block,'run_medians_ns':values,'ratio':medians['candidate']/medians['baseline']})
 summary.append(item)
(out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n');print("eight matched blocks complete")
