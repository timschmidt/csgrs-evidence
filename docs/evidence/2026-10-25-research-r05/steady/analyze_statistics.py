from pathlib import Path
import json,statistics,random,hashlib
p=Path(__file__).resolve().parent
manifest=json.loads((p/'paired-manifest.json').read_text());rng=random.Random(20261025)
summary=[];controls={'section','restrict','line','quadratic'}
for case in manifest['cases']:
 pairs=[];memory=[]
 for pair in range(manifest['pairs']):
  variants={v:[json.loads(x) for x in (p/f'{v}-{case}-{pair}.jsonl').read_text().splitlines()] for v in ['baseline','candidate']}
  assert all(len(v)==manifest['samples_per_process'] for v in variants.values())
  assert {x['checksum'] for v in variants.values() for x in v}.__len__()==1
  assert {x['output_size'] for v in variants.values() for x in v}.__len__()==1
  for variant,rows in variants.items():
   assert all(x['status']=='completed' and x['certainty']=='Certified' for x in rows)
   assert all(x['retained_after_drop']==0 for x in rows[10:])
  assert sum(x['retained_after_drop'] for x in variants['baseline'])==sum(x['retained_after_drop'] for x in variants['candidate'])
  if case in controls:
   for a,b in zip(variants['baseline'],variants['candidate']):
    assert all(a[key]==b[key] for key in ['bytes','calls','peak_live_growth','result_live_growth','retained_after_drop'])
  pairs.append({cache:statistics.median(x['ns'] for x in variants['candidate'] if (x['sample']==0 if cache=='cold' else x['sample']>=10))/statistics.median(x['ns'] for x in variants['baseline'] if (x['sample']==0 if cache=='cold' else x['sample']>=10)) for cache in ['cold','warm']})
  memory.append(sum(x['retained_after_drop'] for x in variants['baseline']))
 result={'case':case,'retained_cache_growth_bytes':sorted(set(memory)),'steady_drop_growth_bytes':0,'timing':{}}
 for cache in ['cold','warm']:
  ratios=[x[cache] for x in pairs];boot=sorted(statistics.median(rng.choices(ratios,k=len(ratios))) for _ in range(10000))
  result['timing'][cache]={'paired_median_ratio':statistics.median(ratios),'bootstrap_95_percent':[boot[249],boot[9749]],'pair_ratios':ratios}
 summary.append(result)
 print(case,'warm ratio',round(result['timing']['warm']['paired_median_ratio'],3),'CI',[round(x,3) for x in result['timing']['warm']['bootstrap_95_percent']])
(p/'statistics.json').write_text(json.dumps({'seed':20261025,'bootstrap_replicates':10000,'method':'paired per-process medians; warm samples 10 through 19; 30 alternating process pairs; shared unpinned host','cases':summary},indent=2)+'\n')
