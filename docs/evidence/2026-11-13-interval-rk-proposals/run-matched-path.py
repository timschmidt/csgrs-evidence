from pathlib import Path
import subprocess,json,time,shutil,hashlib
p=Path('/tmp/interval-refactor/rk-proposal')
paths={'baseline':'/tmp/interval-refactor/rk-baseline-binaries/native-evolution','candidate':'/tmp/interval-refactor/rational-time-target/release/dyadic-evolution-cost-probe'}
common=Path('/tmp/interval-refactor/rk-matched-evolution');rows=[];counts={k:0 for k in paths}
for variant in ['candidate','baseline','baseline','candidate','baseline','candidate','candidate','baseline']:
 counts[variant]+=1;name=f'matched-evolution-{variant}-{counts[variant]}'
 shutil.copy2(paths[variant],common);sha=hashlib.sha256(common.read_bytes()).hexdigest()
 cmd=['taskset','-c','0','python3',str(p/'warm-start.py'),str(common)];start=time.monotonic()
 with (p/(name+'.log')).open('w') as f:r=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,timeout=180)
 rows.append(dict(name=name,variant=variant,sha256=sha,command=cmd,returncode=r.returncode,seconds=time.monotonic()-start,log=name+'.log'))
 (p/'matched-path-runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,flush=True)
 assert r.returncode==0
