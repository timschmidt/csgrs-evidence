from pathlib import Path
import os,subprocess,shutil,json,time,statistics,random,math,hashlib
p=Path(__file__).parent;bins=Path('/tmp/interval-refactor/machine-profile-binaries');common=bins/'profile-timing';records=[]
order=['baseline','candidate','candidate','baseline']*6
for index,label in enumerate(order):
 src=bins/('final-baseline-profile' if label=='baseline' else 'unsigned-candidate-profile');shutil.copy2(src,common)
 env=os.environ.copy();env['PROFILE_TIMING']='1';cmd=['setarch','x86_64','-R','taskset','-c','0',str(common)];start=time.monotonic()
 with (p/f'timing-{index:02}-{label}.log').open('w') as f:q=subprocess.run(cmd,env=env,stdout=f,stderr=subprocess.STDOUT)
 assert q.returncode==0
 records.append(dict(index=index,label=label,command=cmd,returncode=q.returncode,seconds=time.monotonic()-start,sha256=hashlib.sha256(common.read_bytes()).hexdigest()))
 p.joinpath('timing-runs.json').write_text(json.dumps(records,indent=2)+'\n')
 print(index,label,flush=True)
rows=[];rng=random.Random(173)
for case in range(7):
 data=[]
 for record in records:
  lines=p.joinpath(f"timing-{record['index']:02}-{record['label']}.log").read_text().splitlines();line=next(x for x in lines if x.startswith(f'TIMING {case} '));samples=json.loads(line.split(' ',2)[2]);assert len(samples)==31;data.append(statistics.median(samples))
 ratios=[]
 for block in range(6):
  a,b,c,d=data[block*4:block*4+4];ratios.append((b+c)/(a+d))
 boot=sorted(statistics.mean(rng.choices(ratios,k=len(ratios))) for _ in range(10000))
 rows.append(dict(case=case,median_ns_by_run=data,abba_block_ratios=ratios,mean_ratio=statistics.mean(ratios),bootstrap_95=[boot[250],boot[9749]],adverse_separated=boot[250]>1))
p.joinpath('timing-summary.json').write_text(json.dumps(dict(scope='Focused complete-profile construction probe: 31 samples of 64 completed calls, median per run; six ABBA blocks; bootstrap of block ratios. No cross-library claim.',rows=rows),indent=2)+'\n')
print(json.dumps(rows,indent=2))
