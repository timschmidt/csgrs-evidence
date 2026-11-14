from pathlib import Path
import subprocess,shutil,gzip,json,hashlib,csv,io,statistics,os,random
s=Path(__file__).resolve().parent;a=Path('/mnt/development/.interval-refactor-build/q30-artifacts');cpu=str(min(os.sched_getaffinity(0)));summary={};artifact_rows={}
for compiler,target,base in [('188','q30-probe','baseline'),('195','q30-probe-195','195-baseline')]:
 for name in ['observe','cost','native-probe']:
  p=a/f'final-{compiler}-{name}';shutil.copy2(Path('/mnt/development/.interval-refactor-build')/target/'release'/name,p)
  artifact_rows[f'{compiler}-{name}']=dict(path=str(p),sha256=hashlib.sha256(p.read_bytes()).hexdigest(),bytes=p.stat().st_size)
 out=subprocess.check_output([str(a/f'final-{compiler}-observe')]);assert out==gzip.decompress((s/'baseline-rows.txt.gz').read_bytes());(s/f'final-{compiler}-rows.txt.gz').write_bytes(gzip.compress(out,mtime=0))
 for cmd in [['size','-A'],['nm','-SC'],['objdump','-Cd']]: (s/f'final-{compiler}-{cmd[0]}.log').write_bytes(subprocess.check_output(cmd+[str(a/f'final-{compiler}-native-probe')]))
 labels={'baseline':base,'candidate':f'final-{compiler}'}
 for label,prefix in labels.items():
  for warmup in range(8):
   out=subprocess.check_output(['taskset','-c',cpu,str(a/f'{prefix}-cost')]);(s/f'final-{compiler}-warmup-{label}-{warmup}.csv').write_bytes(out)
 rows=[];reference=None
 for r in range(24):
  for label in (['baseline','candidate'] if r%2==0 else ['candidate','baseline']):
   out=subprocess.check_output(['taskset','-c',cpu,str(a/f'{labels[label]}-cost')],text=True);(s/f'final-{compiler}-time-{r}-{label}.csv').write_text(out);entries=list(csv.DictReader(io.StringIO(out)))
   exact=sorted((x['implementation'],x['action'],x['sample'],x['completed_operations'],x['allocation_calls'],x['allocated_bytes'],x['checksum']) for x in entries)
   if reference is None:reference=exact
   assert exact==reference
   for action in ['Clarke','Park','InversePark','InverseClarke','Chain']:
    vals=[int(x['elapsed_ns'])/int(x['completed_operations']) for x in entries if x['implementation']=='native' and x['action']==action]
    rows.append(dict(round=r,label=label,action=action,median_ns=statistics.median(vals),samples_ns=vals))
 (s/f'final-{compiler}-times.json').write_text(json.dumps(rows,indent=2)+'\n');summary[compiler]={}
 for action in ['Clarke','Park','InversePark','InverseClarke','Chain']:
  ratios=[next(x['median_ns'] for x in rows if x['round']==r and x['label']=='candidate' and x['action']==action)/next(x['median_ns'] for x in rows if x['round']==r and x['label']=='baseline' and x['action']==action) for r in range(24)]
  rng=random.Random(9488);boot=sorted(statistics.median(rng.choices(ratios,k=24)) for _ in range(10000))
  summary[compiler][action]=dict(median_ratio=statistics.median(ratios),bootstrap_95=[boot[250],boot[9750]],paired_ratios=ratios)
  print(compiler,action,summary[compiler][action]['median_ratio'],summary[compiler][action]['bootstrap_95'],flush=True)
(s/'final-cost-summary.json').write_text(json.dumps(dict(cpu=cpu,actions=summary,artifacts=artifact_rows),indent=2)+'\n')
