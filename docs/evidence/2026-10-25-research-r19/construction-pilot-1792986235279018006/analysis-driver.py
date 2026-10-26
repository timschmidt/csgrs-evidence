from pathlib import Path
import json,math,statistics,sys
from scipy.stats import t
record=Path(sys.argv[1]).resolve();meta=json.loads((record/'metadata.json').read_text())
assert meta['complete'] and meta['purpose'] in ['pilot','final'] and meta['protected_metrics']==24 and meta['family_metrics']==118
pairs=meta['pairs'];assert pairs>1
metrics=[]
for kind in range(8):
    rows={(pair,v):[json.loads(line) for line in (record/f'pair-{pair:02}'/f'{v}-{kind}.jsonl').read_text().splitlines()] for pair in range(pairs) for v in ['baseline','candidate']}
    for name,phase,aggregate in [('first','first',statistics.median),('warm-median','warm',statistics.median),('warm-maximum','warm',max)]:
        samples={v:[aggregate(r['ns']/r['iterations'] for r in rows[pair,v] if r['phase']==phase) for pair in range(pairs)] for v in ['baseline','candidate']}
        logs=[math.log(b/a) for a,b in zip(samples['baseline'],samples['candidate'])]
        mean=statistics.mean(logs);sd=statistics.stdev(logs);se=sd/math.sqrt(pairs)
        marginal=t.ppf(1-.05/2,pairs-1)*se;simultaneous=t.ppf(1-.05/(2*118),pairs-1)*se
        metrics.append({'kind':kind,'metric':name,'ratio':math.exp(mean),'paired_log_sd':sd,
                        'marginal_95':[math.exp(mean-marginal),math.exp(mean+marginal)],
                        'simultaneous_95':[math.exp(mean-simultaneous),math.exp(mean+simultaneous)],
                        'baseline_median_ns':statistics.median(samples['baseline']),'candidate_median_ns':statistics.median(samples['candidate']),
                        'baseline_samples_ns':samples['baseline'],'candidate_samples_ns':samples['candidate']})
assert len(metrics)==24
result={'record':str(record),'purpose':meta['purpose'],'pairs':pairs,'metrics':metrics,
        'method':'Paired log-ratio Student t; marginal 95% and Bonferroni simultaneous 95% across 118 predeclared total metrics.',
        'upper_exceeds_one':sum(r['simultaneous_95'][1]>1 for r in metrics),
        'marginal_adverse':sum(r['marginal_95'][0]>1 for r in metrics),
        'simultaneous_adverse':sum(r['simultaneous_95'][0]>1 for r in metrics),
        'literal_performance_gate_pass':all(r['simultaneous_95'][1]<=1 for r in metrics),
        'scope':'Eight completed construction controls; intended shared reciprocal graph simplification in cases 2 and 7 is separately identified.'}
(record/'analysis-driver.py').write_bytes(Path(__file__).read_bytes());(record/'analysis.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='metrics'},indent=2))
