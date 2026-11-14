from pathlib import Path
import subprocess,shutil,gzip,json,hashlib,csv,io,statistics,os,random
s=Path(__file__).resolve().parent;a=Path('/mnt/development/.interval-refactor-build/q30-artifacts');artifacts={}
for label,target in [('baseline',Path('/mnt/development/.interval-refactor-build/q30-baseline-195/release')),('candidate',Path('/mnt/development/.interval-refactor-build/q30-probe-195/release'))]:
 for name in ['observe','cost','native-probe']:
  p=a/f'195-{label}-{name}';shutil.copy2(target/name,p);artifacts[f'{label}-{name}']=dict(bytes=p.stat().st_size,sha256=hashlib.sha256(p.read_bytes()).hexdigest())
 for cmd in [['size','-A'],['nm','-SC'],['objdump','-Cd']]: (s/f'195-{label}-native-{cmd[0]}.log').write_bytes(subprocess.check_output(cmd+[str(a/f'195-{label}-native-probe')]))
 out=subprocess.check_output([str(a/f'195-{label}-observe')]);assert out==gzip.decompress((s/'baseline-rows.txt.gz').read_bytes());(s/f'195-{label}-rows.txt.gz').write_bytes(gzip.compress(out,mtime=0))
(s/'195-artifacts.json').write_text(json.dumps(artifacts,indent=2)+'\n')
rows=[];reference=None
for r in range(12):
 for label in (['baseline','candidate'] if r%2==0 else ['candidate','baseline']):
  out=subprocess.check_output(['taskset','-c',str(min(os.sched_getaffinity(0))),str(a/f'195-{label}-cost')],text=True);(s/f'195-time-{r}-{label}.csv').write_text(out);entries=list(csv.DictReader(io.StringIO(out)))
  exact=sorted((x['implementation'],x['action'],x['sample'],x['completed_operations'],x['allocation_calls'],x['allocated_bytes'],x['checksum']) for x in entries)
  if reference is None:reference=exact
  assert exact==reference
  for action in ['Clarke','Park','InversePark','InverseClarke','Chain']:
   vals=[int(x['elapsed_ns'])/int(x['completed_operations']) for x in entries if x['implementation']=='native' and x['action']==action]
   rows.append(dict(round=r,label=label,action=action,median_ns=statistics.median(vals),samples_ns=vals))
(s/'195-times.json').write_text(json.dumps(rows,indent=2)+'\n')
for action in ['Clarke','Park','InversePark','InverseClarke','Chain']:
 print(action,{label:statistics.median(x['median_ns'] for x in rows if x['label']==label and x['action']==action) for label in ['baseline','candidate']})
