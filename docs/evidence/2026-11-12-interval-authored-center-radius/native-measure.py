from pathlib import Path
import subprocess,os,json,hashlib,csv,statistics
out=Path('/tmp/interval-refactor/authored-center-radius')
binary=Path('/mnt/development/csgrs/target/release/examples/centered_cost')
cpu=min(os.sched_getaffinity(0))
with (out/'native-samples.csv').open('w') as log,(out/'native-layouts.txt').open('w') as error:
 subprocess.run(['taskset','-c',str(cpu),str(binary)],stdout=log,stderr=error,check=True)
with (out/'native-size.txt').open('w') as log:subprocess.run(['size',str(binary)],stdout=log,check=True)
(out/'native-binary.json').write_text(json.dumps(dict(bytes=binary.stat().st_size,sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),cpu=cpu,frequency_control=False),indent=2)+'\n')
groups={}
for row in csv.DictReader((out/'native-samples.csv').open()):
 key=(row['family'],int(row['dimension']),int(row['action']))
 groups.setdefault(key,[]).append({k:int(v) for k,v in row.items() if k!='family'})
summary=[]
for (family,n,action),rows in groups.items():
 summary.append(dict(family=family,n=n,action=action,median_ns=statistics.median(r['nanoseconds']/r['repetitions'] for r in rows),min_allocations=min(r['allocations']/r['repetitions'] for r in rows),max_allocations=max(r['allocations']/r['repetitions'] for r in rows),max_bytes=max(r['bytes']/r['repetitions'] for r in rows)))
(out/'native-summary.json').write_text(json.dumps(summary,indent=2)+'\n')
print('samples',sum(len(rows) for rows in groups.values()))
for r in summary:
 if r['n']==64:print(r)
