from pathlib import Path
import json,statistics,hashlib
p=Path(__file__).resolve().parent;manifest=json.loads((p/'paired-manifest.json').read_text());summary=[]
assert manifest['status']=='completed'
for case in manifest['cases']:
 rows=[(p/'rows'/f'{v}-{case}-{pair}.json').read_bytes() for v in ['baseline','candidate'] for pair in range(manifest['pairs'])]
 assert all(r==rows[0] for r in rows),(case,'exact rows differ')
 entry={'case':case,'exact_bytes':len(rows[0]),'exact_sha256':hashlib.sha256(rows[0]).hexdigest()}
 for variant in ['baseline','candidate']:
  samples=[json.loads(line) for pair in range(manifest['pairs']) for line in (p/f'{variant}-{case}-{pair}.jsonl').read_text().splitlines()]
  assert len(samples)==manifest['samples_per_process']*manifest['pairs']
  assert all(s['status']=='completed' and s['certainty']=='Certified' for s in samples)
  entry[variant]={cache:{key:statistics.median(s[key] for s in samples if (s['sample']==0 if cache=='cold' else s['sample']>=10)) for key in ['ns','bytes','calls','peak_live_growth','result_live_growth','retained_after_drop','output_size']} for cache in ['cold','warm']}
  entry[variant]['checksums']=sorted(set(s['checksum'] for s in samples))
 assert entry['baseline']['checksums']==entry['candidate']['checksums']
 summary.append(entry);print(case,'warm us',*[round(entry[v]['warm']['ns']/1000,3) for v in ['baseline','candidate']],'; bytes',*[entry[v]['warm']['bytes'] for v in ['baseline','candidate']],'; result live',*[entry[v]['warm']['result_live_growth'] for v in ['baseline','candidate']])
(p/'paired-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
