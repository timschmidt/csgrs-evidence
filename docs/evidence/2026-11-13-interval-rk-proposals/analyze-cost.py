from pathlib import Path
import json,re,statistics,hashlib
p=Path(__file__).parent
runs=json.loads((p/'cost-runs.json').read_text());assert len(runs)==26 and all(r['returncode']==0 for r in runs)
summary={}
for family in ['conversion','float','evolution']:
 data={};signatures={};allocations={}
 for variant in ['baseline','candidate']:
  data[variant]={};signatures[variant]=[];allocations[variant]=[]
  for n in range(1,5):
   lines=(p/f'{family}-{variant}-{n}.log').read_text().splitlines()
   if family=='float':
    sig=[];samples={}
    for l in lines:
     m=re.fullmatch(r'(32|64),(\d+),(\d+),(\d+),(\d+)',l)
     if m:
      width,index,elapsed,count,checksum=m.groups();sig.append((width,index,count,checksum));samples.setdefault(width,[]).append(int(elapsed)/int(count))
    assert len(sig)==60
    signatures[variant].append(sig)
   else:
    signatures[variant].append([l for l in lines if l.startswith(('EXACT ','SHORT ','RESOURCE '))])
    allocations[variant].append([l for l in lines if l.startswith('|')])
    samples={}
    for l in lines:
     m=re.fullmatch(r'TIMING (\S+) ns_per_operation=(\[.*\])',l)
     if m:samples[m[1]]=json.loads(m[2])
   for name,values in samples.items():data[variant].setdefault(name,[]).append(values)
 assert all(a==signatures['baseline'][0] for a in signatures['baseline']+signatures['candidate'])
 assert all(a==allocations['baseline'][0] for a in allocations['baseline']+allocations['candidate']) if family!='float' else True
 rows=[]
 for name in data['baseline']:
  a=data['baseline'][name];b=data['candidate'][name]
  med=lambda xs:statistics.median([v for run in xs for v in run])
  am,bm=med(a),med(b);ar=[statistics.median(r) for r in a];br=[statistics.median(r) for r in b]
  rows.append(dict(name=name,baseline_ns=am,candidate_ns=bm,ratio=bm/am,baseline_run_medians_ns=ar,candidate_run_medians_ns=br,run_median_ranges_overlap=max(min(ar),min(br))<=min(max(ar),max(br))))
 summary[family]=dict(artifacts_and_allocation_rows_equal=True,artifact_rows=len(signatures['baseline'][0]),allocation_rows=len(allocations['baseline'][0]) if family!='float' else 0,rows=rows,median_ratio=statistics.median(r['ratio'] for r in rows),range_ratio=[min(r['ratio'] for r in rows),max(r['ratio'] for r in rows)])
rk={};stats=[];sig=None
for n in [1,2]:
 lines=(p/f'rk-completed-{n}.log').read_text().splitlines()
 current=[l for l in lines if l.startswith('EXACT ')];assert sig is None or sig==current;sig=current
 currentstats=[l for l in lines if l.startswith('|')];assert not stats or stats==currentstats;stats=currentstats
 for l in lines:
  m=re.fullmatch(r'TIMING (\S+) ns_per_operation=(\[.*\])',l)
  if m:rk.setdefault(m[1],[]).extend(json.loads(m[2]))
summary['rk']=dict(rows=[dict(name=k,median_ns=statistics.median(v),samples=len(v)) for k,v in rk.items()],allocation_rows=stats,signature_rows=len(sig))
summary['interpretation']='Matched CPU-0 runs, balanced order and two-second pre-exec warm-up. Old completed artifacts/resources/allocations agree; executable .text bytes and function sizes agree. Timings retain noise and adverse observations; no speedup or cross-library claim. RK certified, rejected-proof and controlled exhaustion workloads remain separate. Heap accounting covers measured ownership, not a whole-resource bound.'
(p/'cost-comparison.json').write_text(json.dumps(summary,indent=2)+'\n')
for key in ['conversion','float','evolution']:print(key,summary[key]['median_ratio'],summary[key]['range_ratio'])
print('RK',len(rk),'workload rows')
