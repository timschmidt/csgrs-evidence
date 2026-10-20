"""Exactly three full arc pairs after the recorded single-pair observation."""
import hashlib,json,os,statistics,subprocess,sys
from pathlib import Path
OUT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(OUT))
from check import ROOT,ENV,hashes
sys.path.insert(0,str(OUT.parent/'2026-10-15-closed-edges'))
import receipts
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
source=hashes()
main=json.loads((OUT/'cost-summary.json').read_text())
assert main['source']==source
for name in ['prior-native-cost-summary.json','prior-spline-cost-summary.json','new-cost-summary.json']:
 assert json.loads((OUT/name).read_text())['source']==source
sampler=OUT/'analysis-recipes/measure.py'
inputs={str(p):sha(p) for p in [Path(__file__),OUT/'arc-followup-contract.md',sampler,Path(receipts.__file__),ROOT/'crates/hyperbrep/tools/benchmark_receipt.py']}
binaries={s:main[s]['arc'] for s in ['baseline','candidate']}
assert all(sha(r['path'])==r['sha256'] for r in binaries.values())
original={s:receipts.read('arc',(OUT/f'costs/arc-{s}-0.log').read_text()) for s in binaries}
dest=OUT/'arc-followup';dest.mkdir(exist_ok=False)
env=ENV|{'HYPERREAL_SKIP_BENCHMARK_REPORTS':'1','HYPERLIMIT_SKIP_BENCHMARK_REPORTS':'1'}
for key in list(env):
 if key in ['HYPERCURVE_BENCH_ARC_ONLY','HYPERCURVE_BENCH_ARC_COUNT','HYPERCURVE_BENCH_ARC_ITERATIONS'] or key.startswith('CSGRS_') and key.endswith('_BENCH_ITERS'):env.pop(key,None)
cpu=min(os.sched_getaffinity(0));trials=[]
for i in range(3):
 for side in (['baseline','candidate'] if i%2==0 else ['candidate','baseline']):
  label=f'{side}-{i}';resource=dest/(label+'-resources.json');log=dest/(label+'.log');b=binaries[side]
  command=['python3',str(sampler),str(resource),'taskset','-c',str(cpu),b['path']]
  with log.open('w') as output:r=subprocess.run(['timeout','--signal=TERM','--kill-after=30s','900s',*command],cwd=ROOT,env=env,stdout=output,stderr=subprocess.STDOUT)
  row=dict(side=side,trial=i,command=command,log=str(log.relative_to(OUT)),exit_code=r.returncode,resource=json.loads(resource.read_text()),rows=receipts.read('arc',log.read_text()))
  trials.append(row);(dest/'trials.json').write_text(json.dumps(trials,indent=2)+'\n')
  assert r.returncode==row['resource']['exit_code']==0
  receipts.compare(original[side],row['rows']);receipts.compare(original['baseline'],row['rows'])
  assert hashes()==source and sha(b['path'])==b['sha256'] and all(sha(p)==h for p,h in inputs.items())
rows=[]
for i,r in enumerate(original['baseline']):
 a=statistics.median(x['rows'][i]['elapsed_ns']/r['iterations'] for x in trials if x['side']=='baseline')
 b=statistics.median(x['rows'][i]['elapsed_ns']/r['iterations'] for x in trials if x['side']=='candidate')
 rows.append(dict(case=r['name'],iterations=r['iterations'],baseline_median_ns=a,candidate_median_ns=b,ratio=b/a))
(OUT/'arc-followup.json').write_text(json.dumps(dict(source=source,inputs=inputs,binaries=binaries,cpu=cpu,trials=trials,rows=rows,scope='Fixed three-pair complete-harness follow-up; original single pair remains separate. Same receipts and iterations, no task builds/tests overlap. Shared-host observations, not significance, resource bounds or a general speedup.'),indent=2)+'\n')
print('All 12 arc receipts preserved in three further pairs.')
