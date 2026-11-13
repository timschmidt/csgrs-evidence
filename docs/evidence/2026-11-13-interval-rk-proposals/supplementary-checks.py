import os,sys,subprocess,json,time,shlex
from pathlib import Path
p=Path('/tmp/interval-refactor/rk-proposal')
pid=1465098
commands=[('native-post-layout', 'cargo test --locked -p hyperinterval --all-features', {}, '/mnt/development/csgrs'), ('program-post-layout', 'cargo test --locked -p hypersolve --all-features', {}, '/mnt/development/csgrs'), ('integration-post-layout', 'cargo test --locked -p hyperdynamics -p hyperpath --all-features', {}, '/mnt/development/csgrs'), ('minimal-post-layout', 'cargo test --locked -p hyperdynamics --no-default-features --features rk-proposal --test rk_proposal', {}, '/mnt/development/csgrs'), ('program-minimal-post-layout', 'cargo test --locked -p hypersolve --no-default-features --features float-proposal-program --test program_float_proposal', {}, '/mnt/development/csgrs'), ('native-msrv-post-layout', 'cargo +1.88.0 test --locked -p hyperinterval --no-default-features --features dyadic,float-proposal --test dyadic_float_ingress', {}, '/mnt/development/csgrs'), ('isolated-accepted-core', 'cargo test --locked -p hyperdynamics --all-features --all-targets', {}, '/mnt/development/csgrs-field-core'), ('successive', 'cargo +1.95.0 bench --locked --bench successive_operations --features curve,stl-io,obj-io -- --test', {}, '/mnt/development/csgrs'), ('owner-bench', 'cargo +1.95.0 bench --locked -p hypersolve --bench certification -- --test', {}, '/mnt/development/csgrs'), ('point-bench', 'cargo bench --locked -p hypersolve --features expression-program --bench expression_program -- --test', {}, '/mnt/development/csgrs'), ('interface', 'cargo +1.95.0 test --locked -p alumina-interface-core', {}, '/mnt/development/alumina-interface'), ('fmt-post-layout', 'cargo fmt --all -- --check', {}, '/mnt/development/csgrs')]

while pid:
 try:os.kill(pid,0)
 except ProcessLookupError:break
 time.sleep(5)
checks=json.loads((p/'checks-final.json').read_text())
if len(checks)!=23 or any(r['returncode'] for r in checks):sys.exit('Primary qualification failed or incomplete')
results=[]
for name,command,env,cwd in commands:
 start=time.time()
 with (p/(name+'.log')).open('w') as log:
  r=subprocess.run(shlex.split(command),cwd=cwd,env={**os.environ,**env},stdout=log,stderr=subprocess.STDOUT,timeout=900)
 results.append(dict(name=name,command=command,env=env,cwd=cwd,returncode=r.returncode,seconds=time.time()-start,log=name+'.log'))
 (p/'supplementary-checks.json').write_text(json.dumps(results,indent=2)+'\n')
 print(name,r.returncode,round(time.time()-start,2),flush=True)
 if r.returncode:sys.exit(r.returncode)
