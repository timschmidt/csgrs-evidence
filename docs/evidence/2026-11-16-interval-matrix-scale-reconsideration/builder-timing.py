from pathlib import Path
import csv, hashlib, io, json, os, statistics, subprocess, time

s=Path(__file__).parent
art=Path('/mnt/development/.interval-refactor-build/matrix-scale-reconsideration/artifacts')
names=[]
maps={label:{r['name']:r['path'] for r in json.loads((s/(label+'-binaries.json')).read_text()) if r['name'] in names} for label in ['baseline','candidate']}
for label in maps: maps[label]['matrix_scale']=str(art/(('builder' if label=='candidate' else label)+'-scale-cost'))
raw=s/'builder-timings';raw.mkdir(exist_ok=True)
started=time.time();samples=[];controls={};runs=[]
for block in range(4):
 for name in names+['matrix_scale']:
  for index,label in enumerate(['baseline','candidate','candidate','baseline']):
   key=f'{block}-{name}-{index}-{label}';cmd=['setarch','x86_64','-R','taskset','-c','0',maps[label][name]]
   begin=time.time()
   with (raw/(key+'.csv')).open('w') as out,(raw/(key+'.log')).open('w') as err:p=subprocess.run(cmd,stdout=out,stderr=err)
   runs.append({'key':key,'command':cmd,'exit_code':p.returncode,'started':begin,'finished':time.time()})
   if p.returncode:raise RuntimeError(key+' failed')
   rows=list(csv.DictReader(io.StringIO((raw/(key+'.csv')).read_text())))
   stable=[]
   for row in rows:
    clock='elapsed_ns' if 'elapsed_ns' in row else 'nanoseconds'
    count='completed_operations' if 'completed_operations' in row else 'repetitions'
    stable.append({k:v for k,v in row.items() if k!=clock})
    exclude={clock,count,'sample','allocation_calls','allocated_bytes','allocations','bytes'}
    case=tuple((k,v) for k,v in row.items() if k not in exclude)
    samples.append({'block':block,'run':key,'label':label,'probe':name,'case':case,'ns_per_operation':int(row[clock])/int(row[count]),'operations':int(row[count])})
   canonical=json.dumps(stable,sort_keys=True).encode()+(raw/(key+'.log')).read_bytes()
   digest=hashlib.sha256(canonical).hexdigest()
   # Timing differs; every output and allocation/work column must agree.
   if name in controls and controls[name]!=digest:raise RuntimeError('control mismatch '+key)
   controls[name]=digest
 print('completed block',block,flush=True)
groups={}
for row in samples:
 key=(row['probe'],tuple(tuple(x) for x in row['case']))
 groups.setdefault(key,{'baseline':[],'candidate':[]})[row['label']].append(row['ns_per_operation'])
summary=[]
for (probe,case),values in groups.items():
 b=statistics.median(values['baseline']);c=statistics.median(values['candidate'])
 summary.append({'probe':probe,'case':case,'baseline_median_ns':b,'candidate_median_ns':c,'percent':100*(c/b-1),'samples_per_side':len(values['baseline'])})
result={'started':started,'finished':time.time(),'blocks':4,'order':'ABBA; CPU0; ASLR disabled','runs':runs,'identical_output_and_allocation_controls':controls,'samples':len(samples),'completed_operations':sum(r['operations'] for r in samples),'summary':summary,'claim':'descriptive matched measurements; no universal speedup or threshold-based pass inferred'}
(s/'builder-timing-summary.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'runs':len(runs),'samples':len(samples),'completed_operations':result['completed_operations'],'scale': [r for r in summary if r['probe']=='matrix_scale']}))
