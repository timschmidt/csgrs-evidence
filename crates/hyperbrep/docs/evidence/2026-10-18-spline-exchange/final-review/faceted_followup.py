"""Three additional full faceted pairs investigate the observed units_2000 row.

Run only after the original campaign and native group measurements finish.
The original adverse observation is retained irrespective of this result.
"""
import hashlib,json,os,statistics,subprocess,sys
from dataclasses import asdict
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ROOT,ENV,hashes
sys.path.insert(0,str(OUT.parent/'2026-10-15-closed-edges'))
import receipts
source=hashes();read=lambda n:json.loads((OUT/n).read_text())
assert all(read(n)['source']==source for n in ['cost-summary.json','prior-native-cost-summary.json','new-cost-summary.json'])
cost=read('cost-summary.json'); binaries={side:cost[side]['faceted'] for side in ['baseline','candidate']}
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
sampler=Path(__file__).with_name('measure.py')
inputs={str(p):sha(p) for p in [Path(__file__),sampler,Path(receipts.__file__),ROOT/'crates/hyperbrep/tools/benchmark_receipt.py']}
names=receipts.brep.expected_cases((ROOT/'crates/hyperbrep-io/benches/faceted.rs').read_text())
dest=OUT/'faceted-followup';dest.mkdir(exist_ok=False);trials=[];cpu=min(os.sched_getaffinity(0))
env=ENV|{'HYPERREAL_SKIP_BENCHMARK_REPORTS':'1','HYPERLIMIT_SKIP_BENCHMARK_REPORTS':'1'}
for key in list(env):
 if key.startswith('CSGRS_') and key.endswith('_BENCH_ITERS'):env.pop(key,None)
for trial in range(3):
 for side in (['baseline','candidate'] if trial%2==0 else ['candidate','baseline']):
  binary=binaries[side];assert sha(binary['path'])==binary['sha256']
  label=f'{side}-{trial}';log=dest/(label+'.log');resource=dest/(label+'-resources.json')
  command=['python3','-B',str(sampler),str(resource),'taskset','-c',str(cpu),binary['path']]
  with log.open('w') as output:
   result=subprocess.run(['timeout','--signal=TERM','--kill-after=30s','300s',*command],cwd=ROOT,env=env,stdout=output,stderr=subprocess.STDOUT)
  text=log.read_text();rows=[asdict(r) for r in receipts.brep.read_receipt(text,names)]
  item=dict(side=side,trial=trial,command=command,exit_code=result.returncode,resource=json.loads(resource.read_text()),log=str(log.relative_to(OUT)),rows=rows,facts=[s for s in text.splitlines() if s.startswith('fixture ') or s.startswith('allocation_metadata ')])
  trials.append(item);(dest/'trials.json').write_text(json.dumps(trials,indent=2)+'\n')
  assert item['exit_code']==item['resource']['exit_code']==0 and len(rows)==7
  assert hashes()==source and all(sha(p)==h for p,h in inputs.items())
strip=lambda rows:[{k:v for k,v in r.items() if k not in ['elapsed_ns','per_iteration_ns']} for r in rows]
assert all(strip(t['rows'])==strip(trials[0]['rows']) and t['facts']==trials[0]['facts'] for t in trials)
for path in sorted((OUT/'costs').glob('faceted-*.log')):
 text=path.read_text();prior=[asdict(r) for r in receipts.brep.read_receipt(text,names)]
 assert strip(prior)==strip(trials[0]['rows'])
 assert [s for s in text.splitlines() if s.startswith('fixture ') or s.startswith('allocation_metadata ')]==trials[0]['facts']
original={r['case']:r for r in cost['costs'] if r['corpus']=='faceted'}
rows=[]
for i,first in enumerate(trials[0]['rows']):
 name=first['name'];n=first['iterations'];medians={side:statistics.median(t['rows'][i]['elapsed_ns']/n for t in trials if t['side']==side) for side in binaries}
 assert n==original[name]['iterations']
 rows.append(dict(case=name,iterations=n,baseline_median_ns=medians['baseline'],candidate_median_ns=medians['candidate'],ratio=medians['candidate']/medians['baseline'],original_ratio=original[name]['ratio']))
(OUT/'faceted-followup.json').write_text(json.dumps(dict(source=source,inputs=inputs,binaries=binaries,cpu=cpu,trials=trials,rows=rows,receipts_preserved=True,scope='Additional three alternating pairs of the entire unchanged seven-case faceted harness, same fixtures, iterations, warmup, assertions and materialized receipts. Investigates the original units_2000 adverse timing; does not replace or erase it. No task builds/tests overlap. Shared-host observations do not establish statistical significance.'),indent=2)+'\n')
print(json.dumps(rows,indent=2),flush=True)
