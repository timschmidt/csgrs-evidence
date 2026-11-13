from pathlib import Path
import subprocess,time,json,os
out=Path(__file__).parent;root='/mnt/development/csgrs';interface='/mnt/development/alumina-interface'
jobs=[
 ('owner-tests',root,['cargo','test','-p','hypersolve','--all-features','--lib','--test','program_jacobian','--test','symbolic_power_boundary','--test','expression_program','--test','expression_interval','--test','smoke','--test','readme'],{}),
 ('minimal',root,['cargo','test','-p','hypersolve','--no-default-features','--features','expression-program','--test','program_jacobian'],{}),
 ('msrv',root,['cargo','+1.95.0','test','--locked','-p','hypersolve','--all-features','--test','program_jacobian','--test','symbolic_power_boundary'],{}),
 ('release',root,['cargo','test','--release','-p','hypersolve','--all-features','--test','program_jacobian','--test','symbolic_power_boundary'],{}),
 ('clippy',root,['cargo','clippy','-p','hypersolve','--all-features','--all-targets','--','-D','warnings'],{}),
 ('point-example',root,['cargo','run','-p','hypersolve','--features','expression-program','--example','owned_program'],{}),
 ('interval-example',root,['cargo','run','-p','hypersolve','--features','interval-program','--example','enclosed_program'],{}),
 ('docs',root,['cargo','doc','-p','hypersolve','--all-features','--no-deps'],{'RUSTDOCFLAGS':'-D warnings'}),
 ('wasm',root,['cargo','+stable','check','-p','hypersolve','--all-features','--target','wasm32-unknown-unknown','--lib'],{}),
 ('asan',root,['cargo','+nightly','test','--locked','--target','x86_64-unknown-linux-gnu','-p','hypersolve','--all-features','--test','program_jacobian','--test','symbolic_power_boundary'],{'RUSTFLAGS':'-Zsanitizer=address','CARGO_TARGET_DIR':'/tmp/interval-refactor/authored-center-radius-asan'}),
 ('downstream',root,['cargo','+1.95.0','test','--locked','-p','hyperdynamics','-p','hyperpath','--all-features'],{}),
 ('interface',interface,['cargo','+1.95.0','test','--locked','-p','alumina-interface-core'],{}),
 ('interface-clippy',interface,['cargo','+1.95.0','clippy','--locked','-p','alumina-interface-core','--all-targets','--','-D','warnings'],{}),
 ('successive',root,['cargo','+1.95.0','bench','--locked','--bench','successive_operations','--features','curve,stl-io,obj-io','--','--test'],{}),
 ('owner-bench',root,['cargo','+1.95.0','bench','--locked','-p','hypersolve','--bench','certification','--','--test'],{}),
 ('path-bench',root,['cargo','+1.95.0','bench','--locked','-p','hyperpath','--bench','path_predicates','--','--test'],{}),
 ('point-bench',root,['cargo','bench','-p','hypersolve','--features','expression-program','--bench','expression_program','--','--test'],{}),
 ('fmt',root,['cargo','fmt','--all','--','--check'],{}),
 ('diff',root,['git','diff','--check'],{}),
]
rows=[]
for name,cwd,cmd,env in jobs:
 start=time.monotonic()
 with (out/(name+'-final.log')).open('w') as f:p=subprocess.run(cmd,cwd=cwd,env=os.environ|env,stdout=f,stderr=subprocess.STDOUT)
 row=dict(name=name,cwd=cwd,command=cmd,environment=env,exit=p.returncode,seconds=time.monotonic()-start);rows.append(row);(out/'checks-final.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(row),flush=True)
 if p.returncode:break
