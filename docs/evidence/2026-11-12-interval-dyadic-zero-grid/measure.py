from pathlib import Path
import subprocess,hashlib,json,statistics,platform,os
out=Path('/tmp/interval-refactor/dyadic-zero-grid')
rows={};metadata={'cpu':platform.processor(),'affinity':sorted(os.sched_getaffinity(0)), 'runs':[]}
for label,mode in [('baseline','matched'),('candidate','matched'),('candidate','extreme')]:
 exe=Path('/tmp/interval-refactor/dyadic-zero-grid-probe-'+label+'/target/release/zero-grid-probe')
 log=out/(label+'-'+mode+'.csv')
 command=['taskset','-c','0',str(exe)]+(['extreme'] if mode=='extreme' else [])
 with log.open('w') as f:subprocess.run(command,stdout=f,check=True)
 metadata['runs'].append(dict(command=command,bytes=exe.stat().st_size,sha256=hashlib.sha256(exe.read_bytes()).hexdigest()))
 data={}
 for line in log.read_text().splitlines()[1:]:
  k,e,case,op,sample,ns,allocs,byte,work,result=line.split(',',9)
  key=(e,case,op)
  if k=='result':data[key]={'allocations':int(allocs),'bytes':int(byte),'work':int(work),'result':result,'samples':[]}
  else:data[key]['samples'].append(int(ns))
 rows[label+'-'+mode]=data
summary=[]
for key,a in rows['baseline-matched'].items():
 b=rows['candidate-matched'][key]
 assert a['result']==b['result'],key
 if key[1]=='nonzero':assert a['work']==b['work'],key
 summary.append(dict(exponent=int(key[0]),case=key[1],operation=int(key[2]),baseline_ns=statistics.median(a['samples'])/4096,candidate_ns=statistics.median(b['samples'])/4096,ratio=statistics.median(b['samples'])/statistics.median(a['samples']),baseline_allocations=a['allocations'],candidate_allocations=b['allocations'],baseline_bytes=a['bytes'],candidate_bytes=b['bytes'],baseline_work=a['work'],candidate_work=b['work']))
(out/'measure-summary.json').write_text(json.dumps({'metadata':metadata,'matched':summary,'extreme':[{**dict(exponent=int(k[0]),case=k[1],operation=int(k[2])),**v} for k,v in rows['candidate-extreme'].items()]},indent=2)+'\n')
print('matched',len(summary),'extreme',len(rows['candidate-extreme']))
print('nonzero ratio range',min(r['ratio'] for r in summary if r['case']=='nonzero'),max(r['ratio'] for r in summary if r['case']=='nonzero'))
