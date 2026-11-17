from pathlib import Path
import json,os,subprocess,time,shutil
s=Path(__file__).parent;h=s/'witness';started=time.time();env=os.environ|{'CARGO_TARGET_DIR':'/dev/shm/interval-five-repair-packaged/target/consumer','CARGO_BUILD_JOBS':'6','CARGO_HOME':'/dev/shm/interval-five-repair-packaged/cargo-home','CARGO_NET_OFFLINE':'true'}
assert shutil.disk_usage('/mnt/development').free>=20*1024**3
(s/'started.json').write_text(json.dumps(dict(time=started,total_budget_seconds=1800,environment={k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_HOME','CARGO_NET_OFFLINE']}),indent=2)+'\n')
rows=[]
for name,command,budget,expected in [('lock',['cargo','+1.95.0','generate-lockfile','--offline'],60,0),('build',['cargo','+1.95.0','build','--release','--locked','--offline'],600,0),('witness',[env['CARGO_TARGET_DIR']+'/release/cancellation-boundary-witness'],20,101)]:
 with (s/(name+'.log')).open('w') as log:p=subprocess.run(command,cwd=h,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=budget)
 rows.append(dict(name=name,command=command,exit_code=p.returncode,expected=expected));(s/'reproduction.json').write_text(json.dumps(rows,indent=2)+'\n');assert p.returncode==expected,(name,p.returncode)
text=(s/'witness.log').read_text();assert 'result: Ok(7)' in text and 'cancellation must be observed before publishing an uninstrumented result' in text
print('Public package witness reproduces current Ok(7); proposed contract assertion fails as expected.')
