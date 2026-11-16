from pathlib import Path
import json
from artifact_sizes import native
s=Path(__file__).parent;groups=[]
for lock in ['pinned','external']:
 for mode in ['allocation','trace','stack']:
  measurements={label:native(json.loads((s/f'{label}-{lock}-{mode}-build.json').read_text())['binary']) for label in ['fixed','baseline','candidate']}
  groups.append({'id':f'probe-{lock}-{mode}','measurements':measurements})
portfolios={label:{r['name']:r['size'] for r in json.loads((s/f'{label}-owner-artifacts.json').read_text())['artifacts']} for label in ['fixed','baseline','candidate']}
for label in ['baseline','candidate']:assert portfolios[label].keys()==portfolios['fixed'].keys()
for name in sorted(portfolios['fixed']):groups.append({'id':'owner-'+name,'measurements':{label:portfolios[label][name] for label in portfolios}})
for row in groups:
 m=row['measurements'];c=m['candidate'];row['comparisons']={};row['passes']=True
 for label in ['fixed','baseline']:
  b=m[label];metrics={}
  for metric,cap in [('file',4096),('text',2048),('named_text',2048)]:
   delta=c[metric]-b[metric];passes=delta<=cap and delta<=b[metric]*.01
   metrics[metric]={'before':b[metric],'after':c[metric],'delta':delta,'percent':delta*100/b[metric],'absolute_cap':cap,'percent_cap':1,'passes':passes};row['passes']&=passes
  sections={}
  for name in c['sections'].keys()|b['sections'].keys():
   before=b['sections'].get(name,0);after=c['sections'].get(name,0);delta=after-before
   if delta>0:
    passes=delta<=4096 and delta<=before*.01
    sections[name]={'before':before,'after':after,'delta':delta,'percent':delta*100/before if before else None,'passes':passes};row['passes']&=passes
  row['comparisons'][label]={'metrics':metrics,'growing_sections':sections,'byte_identical':c['sha256']==b['sha256']}
summary={'fixed_baseline':'c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb','current_baseline':'17522b4eb8e26e1f3538a0c24aa6d5044cda7f8f','candidate':json.loads((s/'candidate-source.json').read_text())['head'],'passes_initial_caps':all(r['passes'] for r in groups),'groups':groups,'scope':'All21matched final native links. Additional whole-consumer, native package/WASM/firmware and cumulative existing-account qualification remain open; no account is adopted. Both fixed and incremental caps apply independently; growing sections are not netted against shrinking sections. Fixed/current differences remain visible.'}
(s/'artifact-comparison.json').write_text(json.dumps(summary,indent=2)+'\n')
for r in groups:print(r['id'],r['passes'],{k:v['delta'] for k,v in r['comparisons']['baseline']['metrics'].items()},r['comparisons']['baseline']['growing_sections'])
