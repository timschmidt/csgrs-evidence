from pathlib import Path
import subprocess,json,hashlib,os,statistics,random,re,platform
s=Path(__file__).parent;art=Path('/mnt/development/.interval-refactor-build/coordinate-evolution-artifacts');cpu=min(os.sched_getaffinity(0))
def run(label,mode,n,action):
 cmd=['taskset','-c',str(cpu),str(art/label),mode,str(n),action]
 result=subprocess.run(cmd,check=True,capture_output=True);assert not result.stderr
 name=f'{label}-{mode}-{n}-{action}.log';(s/name).write_bytes(result.stdout);return result.stdout
metadata={'cpu':cpu,'kernel':platform.platform(),'compiler':subprocess.check_output(['rustc','+1.95.0','-Vv']).decode(),'cargo':subprocess.check_output(['cargo','+1.95.0','-V']).decode(),'cpu_description':subprocess.check_output(['lscpu']).decode(),'source_base':'3c9a6a8e384a990850b746782ba250c7cb9cf30c','timing':'prepared chart; request/options/budget construction, complete integration and output transport where requested, independent endpoint assertion, black_box and drop; eight warmups, twenty samples of sixteen calls','scope':'Focused additive API cost probe, not a competitive benchmark or speedup claim. Manual assembly provides identical successful output but lacks the new aggregate atomic resource boundary. Native old/new is the same existing contract. External Cargo.lock is retained; it differs from the workspace lock.'};(s/'measurement-environment.json').write_text(json.dumps(metadata,indent=2)+'\n')
rows=[];tasks=[]
for n in [1,3,16,64]:
 outputs={}
 for label,modes in [('baseline',['native','manual']),('candidate',['native','manual','owned'])]:
  for mode in modes:
   data=run(label,mode,n,'row');outputs[label,mode]=data;row={'label':label,'mode':mode,'segments':n,'row_bytes':len(data),'sha256':hashlib.sha256(data).hexdigest()};rows.append(row)
   stats=run(label,mode,n,'alloc').decode();row['allocations_16_calls']={k:int(v) for k,v in re.findall(r'(allocations|deallocations|reallocations|allocated_bytes|peak_live_bytes|live_bytes): (-?\d+)',stats)}
   tasks.append((label,mode,n))
 assert outputs['baseline','native']==outputs['candidate','native']
 assert outputs['baseline','manual']==outputs['candidate','manual']==outputs['candidate','owned']
random.Random(20261113).shuffle(tasks)
for label,mode,n in tasks:
 samples=[int(line.split('|')[-1])/16 for line in run(label,mode,n,'time').decode().splitlines()]
 row=next(r for r in rows if (r['label'],r['mode'],r['segments'])==(label,mode,n));row['ns_per_call']=samples;row['median_ns']=statistics.median(samples)
 (s/'measurements.json').write_text(json.dumps(rows,indent=2)+'\n');print(label,mode,n,round(row['median_ns']),flush=True)
for n in [1,3,16,64]:
 a=next(r for r in rows if (r['label'],r['mode'],r['segments'])==('baseline','native',n));b=next(r for r in rows if (r['label'],r['mode'],r['segments'])==('candidate','native',n));assert a['allocations_16_calls']==b['allocations_16_calls']
print('All exact rows match; native old/new allocation counts unchanged.',flush=True)
