from pathlib import Path
import subprocess,json,os,shutil,time
s=Path(__file__).parent;rows=json.loads((s/'timing-binaries.json').read_text());cpu=min(os.sched_getaffinity(0));result=[];work=Path('/mnt/development/.interval-refactor-build/adaptive-order-sharing-timing');work.mkdir(exist_ok=True)
assert subprocess.run(['pgrep','-x','rustc'],stdout=subprocess.DEVNULL).returncode==1
for trial,variant in enumerate(['baseline','factor','candidate','candidate','factor','baseline']):
 for entry in rows:
  name=entry['name']
  if name=='hyperdynamics':continue
  target=work/f'{trial}-{variant}-{name}';target.mkdir()
  cmd=['taskset','-c',str(cpu),entry[variant]['path']]
  if name!='adaptive_taylor':cmd+=['--bench','--warm-up-time','0.5','--measurement-time','1','--sample-size','20','--noplot']
  env=os.environ|{'CARGO_TARGET_DIR':str(target),'ADAPTIVE_TAYLOR_ITERATIONS':'1000','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
  print(trial,variant,name,flush=True);start=time.monotonic()
  with (s/f'timing-{trial}-{variant}-{name}.log').open('wb') as out:p=subprocess.run(cmd,cwd='/mnt/development/csgrs-adaptive-order-sharing',env=env,stdout=out,stderr=subprocess.STDOUT)
  result.append(dict(trial=trial,variant=variant,name=name,command=cmd,cpu=cpu,returncode=p.returncode,seconds=time.monotonic()-start));(s/'default-timing-commands.json').write_text(json.dumps(result,indent=2)+'\n');assert p.returncode==0,(trial,name)
  source=target/'criterion'
  if source.exists():
   for file in source.rglob('new/*.json'):
    dest=s/'default-criterion'/str(trial)/name/file.relative_to(source);dest.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(file,dest)
print('default baseline/factor/candidate/candidate/factor/baseline campaign complete')
