from pathlib import Path
import json,subprocess,time
s=Path(__file__).parent;art=Path('/mnt/development/.interval-refactor-build/linalg-finite-artifacts');out=s/'full-campaign';out.mkdir();rows=[];pairs=[]
for case in range(16):
 for warm in (0,1):
  for rep in range(4):
   for mode,patterns in [('observe',(165,)),('stack',(165,90))]:
    for pattern in patterns:
     pair={}
     for label in (('baseline','candidate') if rep%2==0 else ('candidate','baseline')):
      cmd=[str(art/f'full-{label}-resource'),str(case),mode,str(warm),str(pattern)];t=time.monotonic();p=subprocess.run(cmd,capture_output=True,text=True,timeout=30)
      name=f'{label}-{case}-{warm}-{rep}-{mode}-{pattern}.log';(out/name).write_text(p.stdout+p.stderr);assert p.returncode==0,(name,p.stderr)
      fields=dict(line.split(' ',1) for line in p.stdout.splitlines());row={'label':label,'case':case,'warm':warm,'rep':rep,'mode':mode,'pattern':pattern,'command':cmd,'exit_code':p.returncode,'elapsed_not_a_latency_sample':time.monotonic()-t,'fields':fields};rows.append(row);pair[label]=row
     assert pair['baseline']['fields']['OUTPUT']==pair['candidate']['fields']['OUTPUT']
     if mode=='observe':
      for key in ['ALLOCATION','CLEANUP']:assert pair['baseline']['fields'][key]==pair['candidate']['fields'][key],(case,warm,key)
     pairs.append({'case':case,'warm':warm,'mode':mode,'outputs_equal':True,'allocation_drop_equal':True if mode=='observe' else None})
(s/'full-resource-observations.json').write_text(json.dumps(rows,indent=2)+'\n');groups=[]
for case in range(16):
 for warm in (0,1):
  maxima={label:max(int(row['fields']['STACK']) for row in rows if row['mode']=='stack' and row['case']==case and row['warm']==warm and row['label']==label) for label in ('baseline','candidate')}
  groups.append({'case':case,'warm':warm,**maxima,'delta':maxima['candidate']-maxima['baseline']})
summary={'processes':len(rows),'output_pairs':len(pairs),'allocation_and_cleanup_pairs':sum(p['mode']=='observe' for p in pairs),'stack_groups':groups,'stack_pass':all(g['delta']<=0 for g in groups),'all_outputs_and_allocations_equal':True,'scope':'Full external Hypersolve dependency, default features; finite host corpus; no timing or universal resource bound.'}
(s/'full-resource-summary.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary,indent=2))
