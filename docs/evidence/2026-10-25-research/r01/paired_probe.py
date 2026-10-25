import subprocess,json,hashlib,os,time
from pathlib import Path
r=Path(__file__).resolve().parent
cpu=max(os.sched_getaffinity(0));os.sched_setaffinity(0,{cpu})
cases=[(mode,n) for mode in ['negative','positive','disjoint','overlap','axis'] for n in [3,5,6]]+[('negative',32),('positive',32),('disjoint',32)]
metadata={'cpu_affinity':[cpu],'repetitions':3,'samples_per_process':5,'sample_0':'cold operation after profile construction','samples_1_to_4':'warm operation; prior output was validated, serialized and dropped','timing':'operation, validation, exact materialization and output drop measured separately; profile construction excluded','caveat':'focused uninstrumented-clock/atomic-allocation probe on a shared host, not a cross-library or deployed-size claim','cases':cases,'binaries':{name:hashlib.sha256((r/(name+'-probe')).read_bytes()).hexdigest() for name in ['baseline','candidate']}}
(r/'paired-manifest.json').write_text(json.dumps(metadata,indent=2)+'\n')
with (r/'paired-journal.jsonl').open('w',buffering=1) as journal:
 for repeat in range(3):
  for mode,n in cases:
   for name in (['baseline','candidate'] if repeat%2==0 else ['candidate','baseline']):
    binary=r/(name+'-probe');rows=r/(name+'-rows');out=r/f'{name}-{mode}-{n}-{repeat}.tsv'
    cmd=[str(binary),mode,str(n),str(rows)]
    start=time.time();journal.write(json.dumps({'event':'start','command':cmd,'repeat':repeat,'utc_epoch':start})+'\n')
    with out.open('w') as output,(out.with_suffix('.stderr')).open('w') as error:
     try: code=subprocess.run(cmd,cwd='/tmp',stdout=output,stderr=error,timeout=60).returncode
     except subprocess.TimeoutExpired: code='timeout'
    journal.write(json.dumps({'event':'finish','binary':name,'case':mode,'segments':n,'repeat':repeat,'exit_code':code,'elapsed_s':time.time()-start,'raw_sha256':hashlib.sha256(out.read_bytes()).hexdigest()})+'\n')
    assert code==0,(name,mode,n,code)
  print('completed pair repetition',repeat,flush=True)
for mode,n in cases:
 if mode in ['negative','positive'] or n%2==0:
  a=(r/'baseline-rows'/f'{mode}-{n}.json').read_bytes();b=(r/'candidate-rows'/f'{mode}-{n}.json').read_bytes()
  assert a==b,('unchanged row contract',mode,n)
print('all one-sided and even-lattice exact rows match',flush=True)
