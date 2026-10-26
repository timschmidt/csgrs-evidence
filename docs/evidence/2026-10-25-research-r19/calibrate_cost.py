from pathlib import Path
import hashlib
import json
import math
import statistics
import time

raw=Path(__file__).resolve().parent
record=Path(json.loads((raw/'latest-cost-baseline-check.json').read_text())['record'])
meta=json.loads((record/'metadata.json').read_text());assert meta['complete'] and meta['purpose']=='baseline-check'
batches={};medians={}
for kind in range(10):
    for path in ['json','cbor','value']:
        cell=f'{kind}-{path}';rows=[json.loads(line) for line in (record/'pair-00'/f'baseline-{cell}.jsonl').read_text().splitlines()]
        ns=statistics.median(r['ns']/r['iterations'] for r in rows if r['phase']=='warm');assert ns>0
        medians[cell]=ns;batches[cell]=min(4096,max(8,2**math.ceil(math.log2(2_000_000/ns))))
result={'created_ns':time.time_ns(),'record':str(record),'baseline_metadata_sha256':hashlib.sha256((record/'metadata.json').read_bytes()).hexdigest(),
        'baseline_medians_ns':medians,'batches':batches,'rule':'Baseline-only2ms target, rounded up to power of two; min8/max4096. No candidate timings used.'}
assert not (raw/'cost-batches.json').exists();(raw/'cost-batches.json').write_text(json.dumps(result,indent=2)+'\n')
assert not (raw/'cost-final-design.json').exists();(raw/'cost-final-design.json').write_text(json.dumps({'created_ns':time.time_ns(),'pairs':30,'protected_metrics':90,'family_metrics':118,'batches':batches,'predeclared_before_pilot':True},indent=2)+'\n')
print('R19 CALIBRATION FROZEN',len(batches),'cells',flush=True)
