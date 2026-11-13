from pathlib import Path
import re,json,ast,statistics
out=Path(__file__).parent;runs={}
for name in ['candidate-1','control-1','control-2','candidate-2','control-3','candidate-3','candidate-4','control-4']:
 timing={};alloc={};resources={}
 for line in (out/(name+'.log')).read_text().splitlines():
  if line.startswith('TIMING '):
   case,samples=line[7:].split(' ns_per_operation=');timing[case]=ast.literal_eval(samples);assert len(timing[case])==31
  if line.startswith('| ') and not line.startswith('| Case'):
   v=[c.strip() for c in line.split('|')[1:-1]]
   if len(v)==8:alloc[v[0]+'/'+v[1]]=dict(allocations=float(v[2]),frees=float(v[3]),bytes=float(v[4]),reallocations=float(v[5]),peak=int(v[6]),live=int(v[7]))
  if line.startswith('RESOURCE '):
   v=line.split();resources[v[1]]={k:int(n) for k,n in (x.split('=') for x in v[2:])}
 assert len(timing)==35 and len(alloc)==56 and len(resources)==7
 assert all(r['live']==0 for r in alloc.values())
 runs[name]=dict(timing=timing,allocations=alloc,resources=resources)
rows=[]
for case in sorted(runs['control-1']['timing']):
 old=sum([runs[x]['timing'][case] for x in ['control-1','control-2','control-3','control-4']],[])
 new=sum([runs[x]['timing'][case] for x in ['candidate-1','candidate-2','candidate-3','candidate-4']],[])
 c=statistics.median(old);n=statistics.median(new)
 for prefix in ['candidate','control']:
  for i in [2,3,4]:assert runs[prefix+'-1']['allocations'][case]==runs[prefix+'-'+str(i)]['allocations'][case]
 rows.append(dict(case=case,control_median_ns=c,candidate_median_ns=n,ratio=n/c,control_allocation=runs['control-1']['allocations'][case],candidate_allocation=runs['candidate-1']['allocations'][case]))
for case,v in runs['control-1']['resources'].items():
 for key in ['build_graph','image_graph','jacobian_graph']:assert runs['candidate-1']['resources'][case][key]==v[key]
result=dict(scope='Matched same-source/same-path/same-lockfile release field workloads; configured policy unchanged. CPU 0, CBBC followed by BCCB order, 31x8 timing samples per run (124 samples per implementation), 8 warmups then 32 allocation iterations. Completed outputs, required construction/replay and destruction included. Source/input/preexisting-field preparation excluded as specified by operation. Exhaustion cases reported separately, never counted as completed geometry. Fresh subprocess per run. No compilers/Cargo active at start.',rows=rows,resources={k:runs[k]['resources'] for k in ['control-1','candidate-1']},exhaustion_cases=21,completed_cases=35)
(out/'cost.json').write_text(json.dumps(result,indent=2)+'\n')
print('ratio median/range',statistics.median(r['ratio'] for r in rows),min(r['ratio'] for r in rows),max(r['ratio'] for r in rows))
for operation in ['construct','replay','image','jacobian','pipeline']:
 subset=[r for r in rows if r['case'].endswith('/'+operation)];print(operation,'median ratio',statistics.median(r['ratio'] for r in subset),'range',min(r['ratio'] for r in subset),max(r['ratio'] for r in subset))
print('slower rows',[r['case'] for r in rows if r['ratio']>1]);print('peak control/candidate',max(r['control_allocation']['peak'] for r in rows),max(r['candidate_allocation']['peak'] for r in rows))
print('alloc changes',[(r['case'],r['control_allocation']['allocations'],r['candidate_allocation']['allocations']) for r in rows if r['case'].endswith('/pipeline')])
