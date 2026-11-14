from pathlib import Path
import subprocess,csv,io,statistics,json,random
stage=Path('/tmp/interval-refactor/servo-migration');build=Path('/mnt/development/.interval-refactor-build');results={}
for kind in ['clock','foc']:
 pairs=[]
 for round in range(24):
  observed={}
  for name in (['baseline','candidate'] if round%2==0 else ['candidate','baseline']):
   command=[str(build/f'servo-{kind}-{name}'/'release'/('clock-owner-probe' if kind=='clock' else 'cost'))]
   if kind=='clock':command+=['time']
   output=subprocess.check_output(['taskset','-c','0',*command],text=True)
   (stage/f'{kind}-cost-{round}-{name}.log').write_text(output)
   if kind=='clock':
    samples=[int(x.split()[3])/int(x.split()[2]) for x in output.splitlines() if x.startswith('TIME ')]
    observed[name]={'clock':statistics.median(samples)}
   else:
    rows=list(csv.DictReader(io.StringIO(output)));actions=sorted({r['action'] for r in rows})
    observed[name]={a:statistics.median(int(r['elapsed_ns'])/int(r['completed_operations']) for r in rows if r['action']==a and r['implementation']=='native') for a in actions}
    signatures=[(r['implementation'],r['action'],r['completed_operations'],r['checksum'],r['allocation_calls'],r['allocated_bytes']) for r in rows]
    if name=='baseline':baseline_signatures=signatures
    else:candidate_signatures=signatures
  if kind=='foc':assert baseline_signatures==candidate_signatures
  pairs.append({a:observed['candidate'][a]/observed['baseline'][a] for a in observed['baseline']})
 summary={}
 for a in pairs[0]:
  ratios=[p[a] for p in pairs];rng=random.Random(637)
  samples=sorted(statistics.median(rng.choices(ratios,k=len(ratios))) for _ in range(10000))
  summary[a]={'median_ratio':statistics.median(ratios),'bootstrap95':[samples[250],samples[9750]],'ratios':ratios}
 results[kind]=summary
 print(kind,{a:{k:v for k,v in row.items() if k!='ratios'} for a,row in summary.items()},flush=True)
(stage/'consumer-cost-summary.json').write_text(json.dumps(results,indent=2)+'\n')
