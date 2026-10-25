from pathlib import Path
import json,statistics,random
p=Path(__file__).resolve().parent
rows=json.loads((p/'paired-summary.json').read_text());rng=random.Random(20261025);report=[]
for x in rows:
 ratios=x['boolean_ns_paired_warm_ratios']
 medians=sorted(statistics.median(rng.choices(ratios,k=len(ratios))) for _ in range(5000))
 report.append({'mode':x['mode'],'components':x['count'],'median_ratio':statistics.median(ratios),'ratio_range':[min(ratios),max(ratios)],'bootstrap_95_percentile':[medians[125],medians[4875]],'seed':20261025,'resamples':5000})
(p/'timing-variability.json').write_text(json.dumps(report,indent=2)+'\n')
