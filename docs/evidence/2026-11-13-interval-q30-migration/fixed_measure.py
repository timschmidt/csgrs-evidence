from pathlib import Path
import subprocess,shutil,json,hashlib,csv,io,statistics,os
s=Path(__file__).resolve().parent;a=Path('/mnt/development/.interval-refactor-build/q30-artifacts');baseline=Path('/mnt/development/.interval-refactor-build/clock-migration-artifacts/fixed-final');assert hashlib.sha256(baseline.read_bytes()).hexdigest()=='4935c750dab95d3293d160c00122623d09fa292fbba89cd984b1dfe89eea50f1'
shutil.copy2(baseline,a/'baseline-fixed');shutil.copy2('/mnt/development/.interval-refactor-build/q30-fixed/release/clock-fixed-control',a/'candidate-fixed');rows=[];reference=None
for label in ['baseline','candidate']:
 for cmd in [['size','-A'],['nm','-SC']]: (s/f'fixed-{label}-{cmd[0]}.log').write_bytes(subprocess.check_output(cmd+[str(a/f'{label}-fixed')]))
for r in range(6):
 for label in (['baseline','candidate'] if r%2==0 else ['candidate','baseline']):
  out=subprocess.check_output(['taskset','-c',str(min(os.sched_getaffinity(0))),str(a/f'{label}-fixed')],text=True);(s/f'fixed-time-{r}-{label}.csv').write_text(out);entries=list(csv.DictReader(io.StringIO(out)))
  exact=sorted((x['operation'],x['sample'],x['backend'],x['completed_operations'],x['checksum']) for x in entries)
  if reference is None:reference=exact
  assert exact==reference
  for op in ['add','subtract','multiply','divide','square']:
   vals=[int(x['elapsed_ns'])/int(x['completed_operations']) for x in entries if x['operation']==op and x['backend']=='shared'];rows.append(dict(round=r,label=label,operation=op,median_ns=statistics.median(vals),samples_ns=vals))
 print(r,flush=True)
(s/'fixed-times.json').write_text(json.dumps(rows,indent=2)+'\n')
for op in ['add','subtract','multiply','divide','square']:
 print(op,{label:statistics.median(x['median_ns'] for x in rows if x['label']==label and x['operation']==op) for label in ['baseline','candidate']})
