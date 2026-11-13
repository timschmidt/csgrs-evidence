from pathlib import Path
import subprocess,time,json,os
out=Path(__file__).parent;core='/mnt/development/csgrs-field-core';integration='/mnt/development/csgrs'
jobs=[
 ('core-tests',core,['cargo','test','-p','hyperdynamics','--all-features','--all-targets'],{}),
 ('core-minimal',core,['cargo','test','-p','hyperdynamics','--no-default-features','--features','field','--test','expression_field'],{}),
 ('core-default',core,['cargo','check','-p','hyperdynamics','--no-default-features','--all-targets'],{}),
 ('core-msrv',core,['cargo','+1.95.0','test','--locked','-p','hyperdynamics','--all-features','--all-targets'],{}),
 ('core-release',core,['cargo','test','--release','-p','hyperdynamics','--all-features','--test','expression_field'],{}),
 ('core-clippy',core,['cargo','clippy','-p','hyperdynamics','-p','hypersolve','--all-features','--all-targets','--','-D','warnings'],{}),
 ('core-example',core,['cargo','run','-p','hyperdynamics','--features','field','--example','expression_field'],{}),
 ('core-docs',core,['cargo','doc','-p','hyperdynamics','-p','hypersolve','--all-features','--no-deps'],{'RUSTDOCFLAGS':'-D warnings'}),
 ('core-wasm',core,['cargo','+stable','check','-p','hyperdynamics','--all-features','--target','wasm32-unknown-unknown','--lib'],{}),
 ('core-owner',core,['cargo','test','-p','hypersolve','--all-features','--lib','--test','expression_program','--test','expression_interval','--test','program_jacobian','--test','symbolic_power_boundary','--test','smoke','--test','readme'],{}),
 ('core-asan',core,['cargo','+nightly','test','--locked','--target','x86_64-unknown-linux-gnu','-p','hyperdynamics','--all-features','--test','expression_field'],{'RUSTFLAGS':'-Zsanitizer=address','CARGO_TARGET_DIR':'/tmp/interval-refactor/field-core-asan'}),
 ('integration-tests',integration,['cargo','test','-p','hyperdynamics','-p','hyperpath','--all-features'],{}),
 ('integration-clippy',integration,['cargo','clippy','-p','hyperdynamics','-p','hyperpath','--all-features','--all-targets','--','-D','warnings'],{}),
 ('core-fmt',core,['cargo','fmt','--all','--','--check'],{}),
 ('integration-fmt',integration,['cargo','fmt','--all','--','--check'],{}),
 ('core-diff',core,['git','diff','--check'],{}),
 ('integration-diff',integration,['git','diff','--check'],{}),
]
rows=[]
for name,cwd,cmd,env in jobs:
 start=time.monotonic()
 with (out/(name+'-final.log')).open('w') as f:p=subprocess.run(cmd,cwd=cwd,env=os.environ|env,stdout=f,stderr=subprocess.STDOUT)
 row=dict(name=name,cwd=cwd,command=cmd,environment=env,exit=p.returncode,seconds=time.monotonic()-start);rows.append(row);(out/'checks-final.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(row),flush=True)
 if p.returncode:break
