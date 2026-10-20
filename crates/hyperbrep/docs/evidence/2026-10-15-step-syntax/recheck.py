from pathlib import Path
import os,json,subprocess,time
root=Path('/mnt/development/csgrs');out=Path('/tmp/hyperbrep-step-syntax-evidence')
env=os.environ.copy();env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'],CARGO_HOME='/tmp/hyperbrep-review-cargo',CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
records=json.loads((out/'commands.json').read_text())
for name,cmd in [
 ('final-tests',['cargo','test','--offline','--locked','-p','hyperbrep-io','--all-features']),
 ('final-clippy',['cargo','clippy','--offline','--locked','-p','hyperbrep-io','--all-targets','--all-features','--','-D','warnings']),
 ('final-fmt',['cargo','fmt','--all','--','--check']),
 ('diff-check',['git','diff','--check'])]:
 print('running',name,flush=True);started=time.time()
 with (out/(name+'.log')).open('w') as log:r=subprocess.run(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT)
 records.append(dict(name=name,command=cmd,exit_code=r.returncode,elapsed_seconds=time.time()-started));(out/'commands.json').write_text(json.dumps(records,indent=2)+'\n');print(name,r.returncode,flush=True)
 if r.returncode:print((out/(name+'.log')).read_text()[-8000:]);raise SystemExit(r.returncode)
