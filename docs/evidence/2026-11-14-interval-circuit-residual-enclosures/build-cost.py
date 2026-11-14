from pathlib import Path
import subprocess,os,time,json,hashlib,shutil
s=Path(__file__).parent;root=Path('/mnt/development');artifacts=root/'.interval-refactor-build/circuit-residual-artifacts';artifacts.mkdir(exist_ok=True)
rows=[]
for variant,repo,features,bench in [('baseline','csgrs-circuit-residual-enclosures-base',None,'mna'),('candidate-default','csgrs-circuit-residual-enclosures',None,'mna'),('candidate-enabled','csgrs-circuit-residual-enclosures','interval-residuals','mna'),('new','csgrs-circuit-residual-enclosures','interval-residuals','interval_residuals')]:
 env=os.environ|{'CARGO_TARGET_DIR':str(root/'.interval-refactor-build'/('circuit-residual-cost-base' if variant=='baseline' else 'circuit-residual-cost')),'CARGO_BUILD_JOBS':'3'}
 cmd=['cargo','+1.95.0','bench','--locked','-p','hypercircuit','--bench',bench,'--no-run','--message-format=json']
 if features:cmd+=['--features',features]
 start=time.monotonic()
 with (s/f'build-{variant}.jsonl').open('w') as out,(s/f'build-{variant}.log').open('w') as err:code=subprocess.run(cmd,cwd=root/repo,env=env,stdout=out,stderr=err).returncode
 row=dict(variant=variant,command=cmd,returncode=code,seconds=time.monotonic()-start)
 assert code==0,(variant,code)
 files=[]
 for line in (s/f'build-{variant}.jsonl').read_text().splitlines():
  m=json.loads(line)
  if m.get('reason')=='compiler-artifact' and m.get('executable') and m['target']['name']==bench:files.append(m['executable'])
 assert len(files)==1
 dst=artifacts/variant;shutil.copy2(files[0],dst);row.update(path=str(dst),bytes=dst.stat().st_size,sha256=hashlib.sha256(dst.read_bytes()).hexdigest());rows.append(row);(s/'cost-builds.json').write_text(json.dumps(rows,indent=2)+'\n');print(variant,code,flush=True)
