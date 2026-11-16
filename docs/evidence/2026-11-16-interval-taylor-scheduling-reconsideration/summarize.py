from pathlib import Path
import json,re
s=Path(__file__).parent
out={}
for label in ['candidate-tests','restored-tests']:
 if not (s/(label+'.json')).exists():continue
 meta=json.loads((s/(label+'.json')).read_text());log=(s/(label+'.log')).read_text()
 totals=[tuple(map(int,m)) for m in re.findall(r'test result: (?:ok|FAILED)\. (\d+) passed; (\d+) failed; (\d+) ignored; (\d+) measured; (\d+) filtered out',log)]
 out[label]=meta|{'suites':len(totals),'passed':sum(x[0] for x in totals),'failed':sum(x[1] for x in totals),'ignored':sum(x[2] for x in totals),'filtered':sum(x[4] for x in totals)}
if (s/'restored-binaries.json').exists():
 b={r['source']:r for r in json.loads((s/'baseline-binaries.json').read_text())};r=json.loads((s/'restored-binaries.json').read_text());different=[x['source'] for x in r if x['sha256']!=b[x['source']]['sha256']]
 out['restoration']={'artifacts':len(r),'different_sha256':different};assert not different
(s/'check-summary.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
