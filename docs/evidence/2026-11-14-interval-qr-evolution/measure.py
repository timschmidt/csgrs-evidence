from pathlib import Path
import subprocess,os,json,hashlib,shutil,time
s=Path(__file__).parent;a=Path('/mnt/development/.interval-refactor-build/qr-evolution-artifacts');rows=[]
old=json.loads((s/'cost-builds.json').read_text());new=json.loads((s/'third-fixture-build.json').read_text());artifacts={r['name']:r for r in old if r['name']!='new'}|{r['name']:r for r in new}
for r in artifacts.values():assert hashlib.sha256(Path(r['path']).read_bytes()).hexdigest()==r['sha256']
(s/'final-artifacts.json').write_text(json.dumps(list(artifacts.values()),indent=2)+'\n')
for name,cmd in [('hardware',['lscpu']),('toolchain',['rustc','+1.95.0','-Vv']),('kernel',['uname','-a']),('processes',['ps','-eo','pid,comm,args'])]:
 (s/f'{name}.log').write_bytes(subprocess.check_output(cmd))
# The measured binary always runs from one stable pathname with ASLR disabled.
stable=a/'measured';controls=['base','default','enabled','enabled','default','base']
for trial,name in enumerate(controls):
 shutil.copy2(artifacts[name]['path'],stable)
 assert hashlib.sha256(stable.read_bytes()).hexdigest()==artifacts[name]['sha256']
 data=a/f'criterion-{trial}';cmd=['taskset','-c','0','setarch','x86_64','-R',str(stable),'--bench','--warm-up-time','0.2','--measurement-time','0.5','--sample-size','10','--noplot']
 with (s/f'timing-control-{trial}-{name}.log').open('w') as log:
  start=time.monotonic();p=subprocess.run(cmd,cwd=a,env=os.environ|{'CRITERION_HOME':str(data)},stdout=log,stderr=subprocess.STDOUT)
 row=dict(kind='control',trial=trial,name=name,command=cmd,criterion_home=str(data),returncode=p.returncode,seconds=time.monotonic()-start,sha256=artifacts[name]['sha256']);rows.append(row);(s/'timing-runs.json').write_text(json.dumps(rows,indent=2)+'\n');assert p.returncode==0
 if data.exists():shutil.copytree(data,s/f'criterion-{trial}')
 print(name,trial,flush=True)
shutil.copy2(artifacts['new']['path'],stable)
assert hashlib.sha256(stable.read_bytes()).hexdigest()==artifacts['new']['sha256']
for trial in range(3):
 cmd=['taskset','-c','0','setarch','x86_64','-R',str(stable),'--test']
 with (s/f'timing-new-{trial}.log').open('w') as log:
  start=time.monotonic();p=subprocess.run(cmd,cwd=a,env=os.environ|{'QR_EVOLUTION_ITERATIONS':'100'},stdout=log,stderr=subprocess.STDOUT)
 rows.append(dict(kind='new',trial=trial,command=cmd,iterations=100,warmup=4,returncode=p.returncode,seconds=time.monotonic()-start,sha256=artifacts['new']['sha256']));(s/'timing-runs.json').write_text(json.dumps(rows,indent=2)+'\n');assert p.returncode==0;print('new',trial,flush=True)
