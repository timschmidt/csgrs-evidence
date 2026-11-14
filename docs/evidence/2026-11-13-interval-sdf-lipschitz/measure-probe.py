from pathlib import Path
import subprocess,shutil,time,json,statistics
s=Path('/tmp/interval-refactor/sdf-lipschitz');art=Path('/mnt/development/.interval-refactor-build/sdf-lipschitz-artifacts');rows=[]
for i,label in enumerate(['candidate-probe','baseline-probe','baseline-probe','candidate-probe']):
 target=art/'measured-probe';shutil.copy2(art/label,target);cmd=['taskset','-c','0','setarch','x86_64','-R','python3',str(s/'warm-exec.py'),str(target)];start=time.monotonic()
 with (s/f'probe-{i}-{label}.log').open('w') as out:r=subprocess.run(cmd,stdout=out,stderr=subprocess.STDOUT)
 rows.append(dict(index=i,label=label,command=cmd,returncode=r.returncode,seconds=time.monotonic()-start));(s/'probe-commands.json').write_text(json.dumps(rows,indent=2)+'\n');print(i,label,r.returncode,flush=True);assert r.returncode==0
