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
 assert len(r['timing'])==18 and len(r['allocations'])==46 and len(r['resources'])==7
 assert r['allocations']==runs['control-1']['allocations'];assert r['resources']==runs['control-1']['resources']
rows=[]
for case in sorted(runs['control-1']['timing']):
 old=statistics.median(runs['control-1']['timing'][case]+runs['control-2']['timing'][case]);new=statistics.median(runs['candidate-1']['timing'][case]+runs['candidate-2']['timing'][case]);rows.append(dict(case=case,control_median_ns=old,candidate_median_ns=new,ratio=new/old))
result=dict(scope='Unchanged completed Picard probe at matched paths/lockfile/compiler/policy, CPU 0, CBBC order, 62 timing samples per implementation (31x8 per run), eight warmups and 32 allocation epochs per run. Required outputs and destruction included. Original preparation exclusions retained. No build processes active.',rows=rows,allocations=runs['control-1']['allocations'],resources=runs['control-1']['resources'])
(s/'picard-comparison.json').write_text(json.dumps(result,indent=2)+'\n')
completed=[r for r in rows if not r['case'].endswith('/rejected')];print('Picard completed ratio median/range',statistics.median(r['ratio'] for r in completed),min(r['ratio'] for r in completed),max(r['ratio'] for r in completed));print('slower',[r['case'] for r in completed if r['ratio']>1])
r=parse('evolution-cost');assert len(r['timing'])==22 and len(r['allocations'])==58 and len(r['resources'])==9
r['scope']='Absolute complete native evolution and replay, CPU 0, eight warmups, 32 allocation epochs and 31x8 timing samples. Includes request/options copies, whole retained attempt/segment report materialization and destruction; replay includes JSON parsing, field validation and Jacobian generation. Initial source/request preparation and preexisting field build excluded from integrate. Independent analytic endpoint controls checked before timing; deterministic complete endpoint equality checked each invocation. Stopped runs and exhaustion counted separately, never as completed flow. Not a total work/heap contract.'
r['completed_timing_rows']=18;r['stopped_timing_rows']=4;r['exhaustion_rows']=36
(s/'evolution-cost.json').write_text(json.dumps(r,indent=2)+'\n');completed={k:statistics.median(v) for k,v in r['timing'].items() if not k.endswith('/stopped')}
print('Evolution completed median ns range',min(completed.values()),max(completed.values()));print('completed peak bytes',max(r['allocations'][k]['peak'] for k in completed));print('rows',[(k,round(v,2),r['allocations'][k]['allocations'],r['allocations'][k]['peak']) for k,v in completed.items()]);print('resources',r['resources'])
