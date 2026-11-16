from pathlib import Path
import subprocess,os,json,time,shutil,hashlib
s=Path(__file__).parent
assert json.loads((s/'build-barrier/result.json').read_text())['terminal']
assert json.loads((s/'artifact-comparison.json').read_text())['passes_initial_caps']
lookup={label:{r['name']:r['size'] for r in json.loads((s/f'{label}-owner-artifacts.json').read_text())['artifacts']} for label in ['baseline','candidate']}
assert lookup['baseline'].keys()==lookup['candidate'].keys()
for mapping in lookup.values():
 for row in mapping.values():assert hashlib.sha256(Path(row['path']).read_bytes()).hexdigest()==row['sha256']
def guard(label):
 external=[]
 for proc in Path('/proc').iterdir():
  if not proc.name.isdecimal():continue
  try:
   comm=(proc/'comm').read_text().strip();stat=(proc/'stat').read_text();f=stat[stat.rfind(')')+2:].split()
   if (comm in ['alumina-route','kicad-cli'] or comm.startswith('alumina-enclos')) and f[0] not in ['T','t','Z','X']:external.append({'pid':int(proc.name),'comm':comm,'state':f[0],'starttime':f[19]})
  except (FileNotFoundError,PermissionError,ProcessLookupError):pass
 (s/('timing-host-'+label+'.json')).write_text(json.dumps(external,indent=2)+'\n')
 (s/('timing-processes-'+label+'.txt')).write_text(subprocess.check_output(['ps','-eo','pid,ppid,etimes,pcpu,comm'],text=True))
 assert not external,'Known competing external workload observed; preserve outcomes and wait for changed host state'
guard('preflight')
out=s/'owner-timing';out.mkdir(exist_ok=False);slot=Path('/mnt/development/.interval-refactor-build/dyadic-quotient-current-timing-slot');rows=[];started=time.monotonic()
for name in sorted(lookup['baseline']):
 # fixed_bounds is an illustrative functional executable, not a timing portfolio.
 orders=[['baseline','candidate']] if name=='fixed_bounds' else [['baseline','candidate','candidate','baseline'],['candidate','baseline','baseline','candidate']]
 for block,order in enumerate(orders):
  for pos,label in enumerate(order):
   ident=f'{name}-{block}-{pos}-{label}';guard(ident+'-before');row=lookup[label][name];shutil.copyfile(row['path'],slot);slot.chmod(0o755)
   assert hashlib.sha256(slot.read_bytes()).hexdigest()==row['sha256']
   args=['taskset','-c','0','setarch','x86_64','-R',str(slot)];start=time.monotonic()
   with (out/(ident+'.stdout')).open('w') as stdout,(out/(ident+'.stderr')).open('w') as stderr:
    p=subprocess.run(args,cwd=out,stdout=stdout,stderr=stderr,timeout=300)
   record={'name':name,'block':block,'position':pos,'label':label,'command':args,'sha256':row['sha256'],'exit_code':p.returncode,'elapsed':time.monotonic()-start};rows.append(record);(out/'runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(ident,p.returncode,flush=True)
   assert p.returncode==0;guard(ident+'-after')
   assert time.monotonic()-started<3500,'Owner portfolio reached declared total execution envelope; no silent continuation'
(out/'completed.json').write_text(json.dumps({'commands':len(rows),'scope':'Fourteen existing conformance cost examples in two ABBA/BAAB blocks each, plus two functional fixed_bounds runs. Raw completed case work, correctness checks and samples must still be reviewed; not automatic performance admission, paired confidence proof or full downstream qualification.'},indent=2)+'\n')
