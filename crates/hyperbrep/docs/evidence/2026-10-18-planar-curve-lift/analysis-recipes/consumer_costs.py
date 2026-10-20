"""Three alternating matched pairs of each complete downstream consumer cohort."""
from pathlib import Path
import hashlib,json,os,platform,statistics,subprocess,sys
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ROOT,ENV,hashes
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
source=hashes();old=OUT.parent/'2026-10-18-parallel-pcurve-replay'
a=json.loads((old/'consumers.json').read_text())['binaries'];current=json.loads((OUT/'consumers.json').read_text());b=current['binaries']
assert current['source']==source and not json.loads((OUT/'qualification-driver.json').read_text())['failures']
sampler=Path(__file__).with_name('measure.py');inputs={str(p):sha(p) for p in [Path(__file__),sampler]};cpu=min(os.sched_getaffinity(0));dest=OUT/'consumer-costs';dest.mkdir(exist_ok=False)
all_rows=[];all_trials=[];binaries={}
for cohort,key,count in [('native','images_native',6),('spline','spline_native',9),('measurement','measurement_native',7),('selected','selected_native',11),('parallel','new_native',7)]:
 binaries[cohort]={s:d['parallel_native' if s=='candidate' and key=='new_native' else key] for s,d in [('baseline',a),('candidate',b)]}
 assert all(sha(x['path'])==x['sha256'] for x in binaries[cohort].values())
 trials=[]
 for trial in range(3):
  for side in (['baseline','candidate'] if trial%2==0 else ['candidate','baseline']):
   binary=binaries[cohort][side];label=f'{cohort}-{side}-{trial}';log=dest/(label+'.log');resource=dest/(label+'-resources.json')
   command=['python3',str(sampler),str(resource),'taskset','-c',str(cpu),binary['path'],'measure']
   print('Running',label,flush=True)
   with log.open('w') as output:r=subprocess.run(['timeout','--signal=TERM','--kill-after=30s','900s',*command],cwd=ROOT,env=ENV,stdout=output,stderr=subprocess.STDOUT)
   row=dict(cohort=cohort,side=side,trial=trial,command=command,exit_code=r.returncode,log=str(log.relative_to(OUT)),resource=json.loads(resource.read_text()),rows=[json.loads(x) for x in log.read_text().splitlines() if x.startswith('{')])
   trials.append(row);all_trials.append(row);(dest/'trials.json').write_text(json.dumps(all_trials,indent=2)+'\n')
   assert r.returncode==row['resource']['exit_code']==0 and len(row['rows'])==count
   assert hashes()==source and sha(binary['path'])==binary['sha256'] and all(sha(p)==h for p,h in inputs.items())
 strip=lambda rows:[{k:v for k,v in r.items() if k not in ['elapsed_ns','allocation_calls','requested_bytes']} for r in rows]
 assert all(strip(t['rows'])==strip(trials[0]['rows']) for t in trials)
 for i,r in enumerate(trials[0]['rows']):
  item=dict(cohort=cohort,case=r['case'],outcome=r['outcome'],iterations=r['iterations'])
  for side in ['baseline','candidate']:
   values=[t['rows'][i] for t in trials if t['side']==side]
   item[side]={k:statistics.median(x[k]/x['iterations'] for x in values) for k in ['elapsed_ns','allocation_calls','requested_bytes']}
  item['ratio']=item['candidate']['elapsed_ns']/item['baseline']['elapsed_ns'];all_rows.append(item)
assert len(all_rows)==40 and len(all_trials)==30
(OUT/'consumer-costs.json').write_text(json.dumps(dict(source=source,inputs=inputs,binaries=binaries,cpu=cpu,platform=platform.platform(),rustc=subprocess.check_output(['rustc','-Vv'],env=ENV,text=True),trials=all_trials,rows=all_rows,scope='Three alternating CPU-pinned pairs of each complete 6/9/7/11/7 native consumer cohort; original full assertions, iterations, outcomes and materialization. One warmup plus three measured repetitions per process. No task builds/tests overlap; shared host and warm OS caches. Expected-rejection controls stay labeled. Allocation requests/RSS are not retained-heap or operation-wide work bounds. This does not rerun the preceding 192-case benchmark catalogue or establish a general speedup.'),indent=2)+'\n')
