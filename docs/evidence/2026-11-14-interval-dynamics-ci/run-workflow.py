from pathlib import Path
import yaml,subprocess,os,json,sys,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-dynamics-ci');toolchain=sys.argv[1];label=toolchain.replace('.','_')
w=yaml.safe_load((r/'.github/workflows/hyperdynamics.yml').read_text());steps=w['jobs']['quality']['steps'];rows=[]
env=os.environ|{'DYNAMICS_RUST':toolchain,'CARGO_TARGET_DIR':f'/mnt/development/.interval-refactor-build/dynamics-ci-{label}','CARGO_BUILD_JOBS':'4','CARGO_TERM_COLOR':'never','CARGO_NET_OFFLINE':'true'}
for i,step in enumerate(steps):
 if 'run' not in step or step['name']=='Install Rust and feature driver':continue
 name=step['name'];log=s/f'{label}-{i:02}.log';start=time.monotonic()
 print(f'{toolchain}: {name}',flush=True)
 with log.open('wb') as out:p=subprocess.run(['bash','-euo','pipefail','-c',step['run']],cwd=r,env=env|step.get('env',{}),stdout=out,stderr=subprocess.STDOUT)
 row=dict(name=name,command=step['run'],env=step.get('env',{}),returncode=p.returncode,elapsed_seconds=time.monotonic()-start,log=log.name);rows.append(row);(s/f'{label}-commands.json').write_text(json.dumps(rows,indent=2)+'\n')
 if p.returncode:raise SystemExit(p.returncode)
print(f'{toolchain}: all {len(rows)} validation steps passed',flush=True)
