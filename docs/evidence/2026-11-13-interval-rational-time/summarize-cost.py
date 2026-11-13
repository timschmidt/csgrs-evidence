from pathlib import Path
import ast,json,statistics
s=Path(__file__).parent
def parse(name):
 timing={};alloc={};resources={}
 for line in (s/(name+'.log')).read_text().splitlines():
  if line.startswith('TIMING '):
   key,value=line[7:].split(' ns_per_operation=');timing[key]=ast.literal_eval(value);assert len(timing[key])==31
  if line.startswith('| ') and not line.startswith('| Case'):
   v=[x.strip() for x in line.split('|')[1:-1]]
   if len(v)==8:alloc[v[0]+'/'+v[1]]=dict(allocations=float(v[2]),frees=float(v[3]),bytes=float(v[4]),reallocations=float(v[5]),peak=int(v[6]),live=int(v[7]))
  if line.startswith('RESOURCE '):
   v=line.split();resources[v[1]]={k:int(n) for k,n in (x.split('=') for x in v[2:])}
 assert all(a['live']==0 for a in alloc.values())
 return dict(timing=timing,allocations=alloc,resources=resources)
runs={name:parse(name) for name in ['candidate-1','control-1','control-2','candidate-2']}
for r in runs.values():
 assert len(r['timing'])==22 and len(r['allocations'])==58 and len(r['resources'])==9
 assert r['allocations']==runs['control-1']['allocations'];assert r['resources']==runs['control-1']['resources']
rows=[]
for case in sorted(runs['control-1']['timing']):
 old=statistics.median(runs['control-1']['timing'][case]+runs['control-2']['timing'][case]);new=statistics.median(runs['candidate-1']['timing'][case]+runs['candidate-2']['timing'][case]);rows.append(dict(case=case,control_median_ns=old,candidate_median_ns=new,ratio=new/old))
result=dict(scope='Unchanged completed dyadic evolution probe at matched paths/lock versions/compiler/policy, CPU 0, CBBC order, 62 timing samples per implementation (31x8 per run), eight warmups and 32 allocation epochs per run. Required outputs and destruction included. Preparation exclusions retained. No other build/test processes active. Hyperreal dependency edge added to field package; versions unchanged.',rows=rows,allocations=runs['control-1']['allocations'],resources=runs['control-1']['resources'])
(s/'evolution-comparison.json').write_text(json.dumps(result,indent=2)+'\n')
completed=[r for r in rows if not r['case'].endswith('/stopped')];print('Evolution completed ratio median/range',statistics.median(r['ratio'] for r in completed),min(r['ratio'] for r in completed),max(r['ratio'] for r in completed));print('slower',[(r['case'],r['ratio']) for r in completed if r['ratio']>1])
r=parse('clock-cost');assert len(r['timing'])==18 and len(r['allocations'])==66 and len(r['resources'])==9
r['scope']='Absolute rational physical-horizon evolution and fresh replay, CPU 0, eight warmups, 32 allocation epochs and 31x8 timing samples. Includes initial/options copies, all retained attempts/proofs, exact physical materialization/final comparison and destruction. Replay includes parsing, original field validation/Jacobian, affine transformation and normalized Jacobian. Initial source/field/clock preparation excluded from integrate and separately counted in resource rows. Independent analytic endpoint controls checked before timing; deterministic endpoint equality checked each invocation. 36 exhausted runs and 12 zero-allocation coefficient rejections separate from completion. Not a total work/heap bound.'
(s/'clock-cost.json').write_text(json.dumps(r,indent=2)+'\n');completed={k:statistics.median(v) for k,v in r['timing'].items()};print('Clock completed ns range',min(completed.values()),max(completed.values()));print('Clock completed peak bytes',max(r['allocations'][k]['peak'] for k in completed));print('Rows',[(k,round(v,2),r['allocations'][k]['peak']) for k,v in completed.items()])
