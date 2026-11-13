from pathlib import Path
import subprocess,json,time,os
out=Path(__file__).parent;root='/mnt/development/csgrs'
commands=[
('native',['cargo','test','-p','hyperinterval','--all-features','--tests'],{}),
('rational-owner',['cargo','test','-p','hyperreal','--features','dispatch-trace','--lib','rational::'],{}),
('native-minimal',['cargo','test','-p','hyperinterval','--no-default-features','--features','dyadic,rational','--test','rational_conversion'],{}),
('native-msrv',['cargo','+1.95.0','test','--locked','-p','hyperinterval','--all-features','--test','rational_conversion','--test','real_bridge'],{}),
('program-owner',['cargo','test','-p','hypersolve','--all-features','--lib','--test','expression_program','--test','expression_interval','--test','program_jacobian','--test','symbolic_power_boundary','--test','smoke','--test','readme'],{}),
('integration',['cargo','test','-p','hyperdynamics','-p','hyperpath','--all-features'],{}),
('clippy',['cargo','clippy','-p','hyperreal','-p','hyperinterval','-p','hypersolve','-p','hyperdynamics','--all-features','--all-targets','--','-D','warnings'],{}),
('field-msrv',['cargo','+1.95.0','test','--locked','-p','hyperdynamics','--all-features','--test','expression_field'],{}),
('release',['cargo','test','--release','-p','hyperinterval','--all-features','--test','rational_conversion'],{}),
('wasm',['cargo','+stable','check','-p','hyperdynamics','--all-features','--target','wasm32-unknown-unknown','--lib'],{}),
('docs',['cargo','doc','-p','hyperreal','-p','hyperinterval','-p','hyperdynamics','--all-features','--no-deps'],{'RUSTDOCFLAGS':'-D warnings'}),
('asan',['cargo','+nightly','test','--locked','--target','x86_64-unknown-linux-gnu','-p','hyperinterval','--all-features','--test','rational_conversion'],{'RUSTFLAGS':'-Zsanitizer=address','CARGO_TARGET_DIR':'/tmp/interval-refactor/rational-admission-asan'}),
('fmt',['cargo','fmt','--all','--','--check'],{}),
('diff',['git','diff','--check'],{}),
]
rows=[r for r in json.loads((out/'checks-final.json').read_text()) if r['exit']==0]
for name,cmd,extra in commands:
 if any(r['name']==name for r in rows):continue
 start=time.monotonic()
 with (out/(name+'-final.log')).open('w') as f:r=subprocess.run(cmd,cwd=root,env={**os.environ,**extra},stdout=f,stderr=subprocess.STDOUT)
 row=dict(name=name,cwd=root,command=cmd,environment=extra,exit=r.returncode,seconds=time.monotonic()-start);rows.append(row)
 (out/'checks-final.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,round(row['seconds'],2),flush=True)
 if r.returncode:break
