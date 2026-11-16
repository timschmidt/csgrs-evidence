from pathlib import Path
import os,subprocess,json,time,shutil,re,statistics,random
s=Path(__file__).parent;out=s/'manual-controls';out.mkdir(exist_ok=False)
build=Path('/mnt/development/.interval-refactor-build');slot=build/'noise-reconsideration-running';rows=[]
for case in ['constant','shear']:
 for temp in ['cold','warm']:
  normalized={}
  for label in ['baseline','candidate']:
   args=[str(build/('noise-reconsideration-'+label+'-allocation')),'noise',case,'1',temp,'8'];r=subprocess.run(args,capture_output=True,text=True,check=True)
   (out/f'allocation-{case}-{temp}-{label}.log').write_text(r.stdout+r.stderr)
   normalized[label]=re.sub(r'ns=\d+','ns=TIME',r.stdout)
  assert normalized['baseline']==normalized['candidate'],(case,temp)
(out/'allocations.json').write_text(json.dumps({'all_four_exact':True})+'\n')
# Each process retains cold/warm meanings from the unchanged probe. Validation,
# output retention/destruction and cold preparation remain inside every timer.
subprocess.run(['taskset','-c','0','python3','-c','import time; t=time.monotonic();\nwhile time.monotonic()-t<2: pass'],check=True)
for case in ['constant','shear']:
 for temp in ['cold','warm']:
  for block in range(8):
   order=['baseline','candidate','candidate','baseline'] if block%2==0 else ['candidate','baseline','baseline','candidate']
   for position,label in enumerate(order):
    shutil.copy2(build/('noise-reconsideration-'+label+'-time'),slot)
    args=['taskset','-c','0','setarch','x86_64','-R',str(slot),'noise',case,'1',temp,'512'];start=time.monotonic();r=subprocess.run(args,cwd=out,capture_output=True,text=True,check=True)
    name=f'{case}-{temp}-{block}-{position}-{label}';(out/(name+'.log')).write_text(r.stdout+r.stderr)
    samples=[int(x) for x in re.findall(r'ns=(\d+)',r.stdout)];assert len(samples)==512
    row={'case':case,'temperature':temp,'block':block,'position':position,'label':label,'command':args,'seconds':time.monotonic()-start,'mean_ns':statistics.mean(samples[4:]),'median_ns':statistics.median(samples[4:]),'samples':len(samples),'discarded_warmup':4};rows.append(row)
    (out/'runs.json').write_text(json.dumps(rows,indent=2)+'\n')
   print(case,temp,'block',block,flush=True)
summary=[]
for case in ['constant','shear']:
 for temp in ['cold','warm']:
  ratios=[]
  for block in range(8):
   groups={label:[x['mean_ns'] for x in rows if x['case']==case and x['temperature']==temp and x['block']==block and x['label']==label] for label in ['baseline','candidate']}
   ratios.append(statistics.mean(groups['candidate'])/statistics.mean(groups['baseline']))
  rng=random.Random(0);boots=sorted(statistics.mean(rng.choices(ratios,k=len(ratios))) for _ in range(20000))
  summary.append({'case':case,'temperature':temp,'ratios':ratios,'mean_ratio':statistics.mean(ratios),'paired_block_bootstrap95':[boots[500],boots[19499]]})
(out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary),flush=True)
(out/'completed.json').write_text(json.dumps({'commands':len(rows),'samples':512*len(rows),'all_passed':True})+'\n')
