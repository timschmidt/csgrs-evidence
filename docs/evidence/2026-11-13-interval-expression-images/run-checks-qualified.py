from pathlib import Path
import json,subprocess,time,os
out=Path(__file__).parent
jobs=[
 ('native-tests',['cargo','test','-p','hyperinterval','--all-features','--test','inverse_functions','--test','arctangent','--test','logarithm','--test','fractional_power','--test','dyadic_zero_grid'],{}),
 ('program-tests',['cargo','test','-p','hypersolve','--all-features','--lib','--test','expression_program','--test','expression_interval','--test','symbolic_power_boundary','--test','smoke','--test','readme'],{}),
 ('clippy',['cargo','clippy','-p','hyperinterval','-p','hypersolve','--all-features','--all-targets','--','-D','warnings'],{}),
 ('example',['cargo','run','-p','hypersolve','--features','interval-program','--example','enclosed_program'],{}),
 ('docs',['cargo','doc','-p','hyperinterval','-p','hypersolve','--all-features','--no-deps'],{'RUSTDOCFLAGS':'-D warnings'}),
 ('wasm',['cargo','+stable','check','-p','hypersolve','--all-features','--target','wasm32-unknown-unknown','--lib'],{}),
 ('fmt',['cargo','fmt','--all','--','--check'],{}),
 ('diff',['git','diff','--check'],{}),
 ('bench-build',['cargo','bench','-p','hypersolve','--features','expression-program','--bench','expression_program','--','--test'],{}),
]
rows=[]
for name,cmd,env in jobs:
 start=time.monotonic()
 with (out/(name+'-qualified.log')).open('w') as f:p=subprocess.run(cmd,cwd='/mnt/development/csgrs',env=os.environ|env,stdout=f,stderr=subprocess.STDOUT)
 row=dict(name=name,command=cmd,environment=env,exit=p.returncode,seconds=time.monotonic()-start);rows.append(row);(out/'checks-qualified.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(row),flush=True)
 if p.returncode:break
