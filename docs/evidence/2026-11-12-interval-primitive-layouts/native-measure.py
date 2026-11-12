import subprocess,json,hashlib,os,statistics,time
from pathlib import Path
out=Path('/tmp/interval-refactor/primitive-layouts')
root=Path('/mnt/development/csgrs/crates/hyperlattice-interval/conformance/primitive-layouts')
target=root/'target/release'
metadata={}
for name in ['native-probe','soa-probe','cost']:
 p=target/name
 metadata[name]=dict(bytes=p.stat().st_size,sha256=hashlib.sha256(p.read_bytes()).hexdigest())
 for tool in [['size',str(p)],['nm','-S','--size-sort','-C',str(p)]]:
  result=subprocess.run(tool,capture_output=True,text=True,check=True)
  (out/(name+'-'+tool[0]+'.txt')).write_text(result.stdout)
  if tool[0]=='nm':
   rows=[]
   for line in result.stdout.splitlines():
    parts=line.split(maxsplit=3)
    if len(parts)==4 and parts[2] in ['t','T'] and any(n in parts[3] for n in ['interval_layout_conformance','hyperlattice_interval','hyperinterval']):
     rows.append(dict(address=int(parts[0],16),bytes=int(parts[1],16),symbol=parts[3]))
   metadata[name]['named_kernel_symbols']=rows
   metadata[name]['unique_named_kernel_bytes']=sum(dict((r['address'],r['bytes']) for r in rows).values())
rows=[]
for seed in range(17):
 a=subprocess.check_output([str(target/'native-probe'),str(seed)],text=True)
 b=subprocess.check_output([str(target/'soa-probe'),str(seed)],text=True)
 assert a==b
 rows.append(dict(seed=seed,output=a))
(out/'native-probe-outputs.json').write_text(json.dumps(rows,indent=2)+'\n')
(out/'native-sizes.json').write_text(json.dumps(metadata,indent=2)+'\n')
cpu=min(os.sched_getaffinity(0))
start=time.monotonic()
with (out/'native-samples.csv').open('w') as log:
 subprocess.run(['taskset','-c',str(cpu),str(target/'cost')],stdout=log,check=True)
metadata=dict(cpu=cpu,seconds=time.monotonic()-start,frequency_control=False,rounds=12,warmup=16)
(out/'native-run.json').write_text(json.dumps(metadata,indent=2)+'\n')
groups={};sizes=[]
for line in (out/'native-samples.csv').read_text().splitlines():
 p=line.split(',')
 if p[0]=='size': sizes.append(dict(family=p[1],n=int(p[2]),native=int(p[3]),soa=int(p[4])))
 else:
  _,family,n,op,sample,soa,reps,ns,count,bytes_=p
  assert int(count)==0 and int(bytes_)==0
  key=(family,int(n),int(op));groups.setdefault(key,{}).setdefault(soa,[]).append(int(ns)/int(reps))
summary=[]
for (family,n,op),g in groups.items():
 a=statistics.median(g['false']);b=statistics.median(g['true'])
 summary.append(dict(family=family,n=n,operation=op,native_median_ns=a,soa_median_ns=b,ratio=b/a))
(out/'native-summary.json').write_text(json.dumps(dict(sizes=sizes,timings=summary),indent=2)+'\n')
print(json.dumps(metadata))
for family in ['i32q8','i64q32','f32','f64']:
 for n in [4,64,1024]:
  print(family,n,[(r['operation'],round(r['ratio'],3)) for r in summary if r['family']==family and r['n']==n])
