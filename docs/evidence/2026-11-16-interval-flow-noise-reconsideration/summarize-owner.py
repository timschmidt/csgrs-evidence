from pathlib import Path
import json,re,statistics
s=Path(__file__).parent;out=s/'owner-timing';runs=json.loads((out/'runs.json').read_text());cases={}
for r in runs:
 root=out/f"{r['name']}-{r['block']}-{r['position']}-{r['label']}"
 if r['name']=='adaptive_taylor':
  vals={m.group(1):(float(m.group(2)),float(m.group(2)),float(m.group(2))) for m in re.finditer(r'([^\s]+): iterations=\d+ total_ns=\d+ ns_per_operation=(\d+)',(root/'output.log').read_text())}
 else:
  vals={}
  for p in (root/'criterion').rglob('new/estimates.json'):
   x=json.loads(p.read_text())['mean'];vals[str(p.parent.parent.relative_to(root/'criterion'))]=(x['point_estimate'],x['confidence_interval']['lower_bound'],x['confidence_interval']['upper_bound'])
 for key,v in vals.items():cases.setdefault((r['name'],key),[]).append(r|{'estimate':v})
rows=[]
for (target,case),items in sorted(cases.items()):
 blocks=[]
 for block in range(2):
  group={l:[r['estimate'] for r in items if r['block']==block and r['label']==l] for l in ['baseline','candidate']}
  if any(len(v)!=2 for v in group.values()):continue
  b=[statistics.mean(v[i] for v in group['baseline']) for i in range(3)];c=[statistics.mean(v[i] for v in group['candidate']) for i in range(3)]
  blocks.append({'block':block,'baseline_ns':b[0],'candidate_ns':c[0],'ratio':c[0]/b[0],'estimate_interval_separation':c[1]>b[2] if target!='adaptive_taylor' else None})
 rows.append({'target':target,'case':case,'blocks':blocks})
(s/'owner-timing-summary.json').write_text(json.dumps(rows,indent=2)+'\n')
print('complete cases',sum(len(x['blocks'])==2 for x in rows))
for x in rows:
 if len(x['blocks'])==2 and all(b['ratio']>1 and b['estimate_interval_separation'] is not False for b in x['blocks']):print('ADVERSE',x)
