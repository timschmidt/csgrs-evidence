"""Matched preservation of the preceding six complete native workflow groups."""
import hashlib,json,os,statistics,subprocess,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ROOT,ENV,hashes
source=hashes();old=OUT.parent/'2026-10-18-native-boundary-images'
a=json.loads((old/'new-consumers.json').read_text())['binaries']['native']
b=json.loads((OUT/'new-consumers.json').read_text())['binaries']['prior_native']
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
assert all(sha(x['path'])==x['sha256'] for x in [a,b])
sampler=Path(__file__).with_name('measure.py');inputs={str(p):sha(p) for p in [Path(__file__),sampler]}
cpu=min(os.sched_getaffinity(0));dest=OUT/'prior-native-costs';dest.mkdir(exist_ok=False);trials=[]
for trial in range(3):
 for side,binary in ([('baseline',a),('candidate',b)] if trial%2==0 else [('candidate',b),('baseline',a)]):
  label=f'{side}-{trial}';log=dest/(label+'.log');resource=dest/(label+'-resources.json')
  command=['python3',str(sampler),str(resource),'taskset','-c',str(cpu),binary['path'],'measure']
  with log.open('w') as output:r=subprocess.run(['timeout','--signal=TERM','--kill-after=30s','900s',*command],cwd=ROOT,env=ENV,stdout=output,stderr=subprocess.STDOUT)
  row=dict(side=side,trial=trial,command=command,exit_code=r.returncode,log=str(log.relative_to(OUT)),resource=json.loads(resource.read_text()),rows=[json.loads(x) for x in log.read_text().splitlines() if x.startswith('{')])
  trials.append(row);(dest/'trials.json').write_text(json.dumps(trials,indent=2)+'\n')
  assert r.returncode==row['resource']['exit_code']==0 and len(row['rows'])==6
  assert hashes()==source and sha(binary['path'])==binary['sha256'] and all(sha(p)==h for p,h in inputs.items())
strip=lambda rows:[{k:v for k,v in r.items() if k not in ['elapsed_ns','allocation_calls','requested_bytes']} for r in rows]
assert all(strip(t['rows'])==strip(trials[0]['rows']) for t in trials)
rows=[]
for i,r in enumerate(trials[0]['rows']):
 item=dict(case=r['case'],outcome=r['outcome'],iterations=r['iterations'])
 for side in ['baseline','candidate']:
  values=[t['rows'][i] for t in trials if t['side']==side]
  item[side]={key:statistics.median(x[key]/x['iterations'] for x in values) for key in ['elapsed_ns','allocation_calls','requested_bytes']}
 item['ratio']=item['candidate']['elapsed_ns']/item['baseline']['elapsed_ns'];rows.append(item)
(OUT/'prior-native-cost-summary.json').write_text(json.dumps(dict(source=source,baseline=a,candidate=b,cpu=cpu,trials=trials,rows=rows,inputs=inputs,scope='Three alternating fresh CPU-pinned pairs; all six full original native/control groups, iterations and assertions retained. No task builds/tests overlap. Local shared-host observations, not statistical or retained-heap bounds.'),indent=2)+'\n')
