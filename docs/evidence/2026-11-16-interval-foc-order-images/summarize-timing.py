from pathlib import Path
import json,statistics,random
s=Path(__file__).parent;result=[]
for version in ['1.88.0','1.95.0']:
 for campaign in ['first','repeat']:
  for row in json.loads((s/f'timing-{version}-{campaign}/summary.json').read_text()):
   ratios=[b['ratio'] for b in row['blocks']];deltas=[statistics.mean(b['run_medians_ns']['candidate'])-statistics.mean(b['run_medians_ns']['baseline']) for b in row['blocks']]
   rng=random.Random(90);boot=sorted(statistics.mean(rng.choices(ratios,k=8)) for _ in range(20000));ci=[100*(boot[int(p*len(boot))]-1) for p in [.025,.975]]
   r={'version':version,'campaign':campaign,'case':int(row['case']),'completion':row['completion'],'mean_percent':100*(statistics.mean(ratios)-1),'bootstrap_95_percent':ci,'mean_delta_ns':statistics.mean(deltas),'block_ratios':ratios};result.append(r)
   print(version,campaign,row['case'],round(r['mean_percent'],2),[round(x,2) for x in ci])
(s/'timing-summary.json').write_text(json.dumps({'scope':'31 samples of 4096 complete calls per run; 8 alternating ABBA/BAAB blocks per campaign; two campaigns per compiler. Pin CPU0, disable ASLR, same executable path. Percent CI resamples eight block ratios, 20000 seeded bootstrap draws. Includes successful modulation and typed errors separately. Host diagnostic; not MCU cycles.','timed_calls':4*32*12*31*4096,'successful_modulations':4*32*5*31*4096,'typed_rejections':4*32*7*31*4096,'rows':result},indent=2)+'\n')
