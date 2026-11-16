from pathlib import Path
import csv, json, statistics, collections, sys
s=Path(__file__).parent;t=s/'timings';values=collections.defaultdict(lambda:collections.defaultdict(list));invariants=collections.defaultdict(dict)
mode=sys.argv[1]
for p in sorted(t.glob(mode+'-*.stdout')):
 parts=p.stem.split('-');sweep=int(parts[1]);side=parts[2];name='-'.join(parts[3:])
 if mode=='external':
  records=[json.loads(x) for x in p.read_text().splitlines()]
  exact=[x for x in records if x.get('kind')!='timing'];invariants[name][sweep]=exact
  for x in records:
   if x.get('kind')=='timing':values[(name,x['case'],x['mode'])][side].append(x['total_ns']/x['iterations'])
 else:
  records=list(csv.DictReader(p.read_text().splitlines()));exact=[]
  for x in records:
   duration=float(x['elapsed_ns']);count_key=next(k for k in x if k.startswith('completed_'));duration/=int(x[count_key])
   key=tuple([name]+[f'{k}={v}' for k,v in x.items() if k not in ['sample','elapsed_ns',count_key,'checksum','work_units_per_image']])
   values[key][side].append(duration)
   exact.append({k:v for k,v in x.items() if k!='elapsed_ns'})
  # host_cost deliberately alternates rows; keep canonical sample/identity order.
  invariants[name][sweep]=sorted(exact,key=lambda x:json.dumps(x,sort_keys=True))
rows=[]
for key,data in values.items():
 assert set(data)=={'baseline','candidate'},key
 b,c=(statistics.median(data[x]) for x in ['baseline','candidate'])
 rows.append({'case':list(key),'baseline_ns':b,'candidate_ns':c,'ratio':c/b,'baseline_samples':len(data['baseline']),'candidate_samples':len(data['candidate'])})
for name,runs in invariants.items():
 assert len(runs)==4,(name,len(runs))
 assert all(v==runs[0] for v in runs.values()),name
out={'mode':mode,'all_exact_rows_unchanged':True,'rows':rows};(s/(mode+'-timing-summary.json')).write_text(json.dumps(out,indent=2)+'\n')
for r in rows: print('/'.join(r['case']),round(r['ratio'],4))
