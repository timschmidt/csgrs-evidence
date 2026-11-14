from pathlib import Path
import subprocess,shutil,gzip,json,hashlib,csv,io,statistics,os,sys
s=Path(__file__).resolve().parent;a=Path('/mnt/development/.interval-refactor-build/q30-artifacts');target=Path('/mnt/development/.interval-refactor-build/q30-probe/release');label=sys.argv[1]
artifacts={}
for name in ['observe','cost','native-probe']:
 p=a/f'{label}-{name}';shutil.copy2(target/name,p);artifacts[name]=dict(bytes=p.stat().st_size,sha256=hashlib.sha256(p.read_bytes()).hexdigest())
for command in [['size','-A'],['nm','-SC'],['objdump','-Cd']]: (s/f'{label}-native-{command[0]}.log').write_bytes(subprocess.check_output(command+[str(a/f'{label}-native-probe')]))
out=subprocess.check_output([str(a/f'{label}-observe')]);(s/f'{label}-rows.txt.gz').write_bytes(gzip.compress(out,mtime=0));assert out==gzip.decompress((s/'baseline-rows.txt.gz').read_bytes())
artifacts['observations']=dict(lines=len(out.splitlines()),sha256=hashlib.sha256(out).hexdigest(),bytes=len(out));(s/f'{label}-artifacts.json').write_text(json.dumps(artifacts,indent=2)+'\n')
rows=[];reference=None
for r in range(6):
 for variant in (['baseline',label] if r%2==0 else [label,'baseline']):
  out=subprocess.check_output(['taskset','-c',str(min(os.sched_getaffinity(0))),str(a/f'{variant}-cost')],text=True)
  (s/f'{label}-time-{r}-{variant}.csv').write_text(out);entries=list(csv.DictReader(io.StringIO(out)))
  exact=sorted((x['implementation'],x['action'],x['sample'],x['completed_operations'],x['allocation_calls'],x['allocated_bytes'],x['checksum']) for x in entries)
  if reference is None:reference=exact
  assert exact==reference
  for action in ['Clarke','Park','InversePark','InverseClarke','Chain']:
   vals=[int(x['elapsed_ns'])/int(x['completed_operations']) for x in entries if x['implementation']=='native' and x['action']==action]
   rows.append(dict(round=r,label=variant,action=action,median_ns=statistics.median(vals),samples_ns=vals))
 print(r,flush=True)
(s/f'{label}-times.json').write_text(json.dumps(rows,indent=2)+'\n')
for action in ['Clarke','Park','InversePark','InverseClarke','Chain']:
 print(action,{variant:statistics.median(x['median_ns'] for x in rows if x['label']==variant and x['action']==action) for variant in ['baseline',label]})
