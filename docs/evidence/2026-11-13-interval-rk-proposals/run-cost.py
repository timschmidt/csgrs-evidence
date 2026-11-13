from pathlib import Path
import os,sys,json,subprocess,time
p=Path('/tmp/interval-refactor/rk-proposal')
pid=1520310
paths={'conversion': {'baseline': '/tmp/interval-refactor/rk-baseline-binaries/conversion', 'candidate': '/tmp/interval-refactor/rk-conversion-candidate-target/release/ieee-conversion-cost-probe'}, 'float': {'baseline': '/tmp/interval-refactor/rk-baseline-binaries/strict-float', 'candidate': '/tmp/interval-refactor/rk-float-baseline-target/release/examples/float_cost'}, 'evolution': {'baseline': '/tmp/interval-refactor/rk-baseline-binaries/native-evolution', 'candidate': '/tmp/interval-refactor/rational-time-target/release/dyadic-evolution-cost-probe'}}

while pid:
 try:os.kill(pid,0)
 except ProcessLookupError:break
 time.sleep(5)
for name,count in [('checks-final.json',23),('supplementary-checks.json',12),('padding-final-checks.json',14)]:
 rows=json.loads((p/name).read_text());assert len(rows)==count and all(r['returncode']==0 for r in rows)
rows=[]
def run(name,binary):
 cmd=['taskset','-c','0','python3',str(p/'warm-start.py'),binary];start=time.monotonic()
 with (p/(name+'.log')).open('w') as log:r=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,timeout=180)
 rows.append(dict(name=name,command=cmd,returncode=r.returncode,seconds=time.monotonic()-start,log=name+'.log'))
 (p/'cost-runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,flush=True)
 assert r.returncode==0
for family,binaries in paths.items():
 counts={'baseline':0,'candidate':0}
 for variant in ['candidate','baseline','baseline','candidate','baseline','candidate','candidate','baseline']:
  counts[variant]+=1;run(f'{family}-{variant}-{counts[variant]}',binaries[variant])
for n in [1,2]:run(f'rk-completed-{n}','/tmp/interval-refactor/rk-cost-target/release/rk-proposal-cost-probe')
