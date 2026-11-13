from pathlib import Path
import subprocess,time,json,os
out=Path(__file__).parent
jobs=[
 ('final-tests',['cargo','test','-p','hypersolve','--all-features','--test','expression_program','--test','readme','--test','smoke'],{}),
 ('msrv',['cargo','+1.95.0','test','--locked','-p','hypersolve','--all-features','--test','expression_program'],{}),
 ('release-tests',['cargo','test','--release','-p','hypersolve','--all-features','--test','expression_program'],{}),
 ('final-clippy',['cargo','clippy','-p','hypersolve','--all-features','--all-targets','--','-D','warnings'],{}),
 ('strict-docs',['cargo','doc','-p','hypersolve','--all-features','--no-deps'],{'RUSTDOCFLAGS':'-D warnings'}),
 ('asan',['cargo','+nightly','test','--locked','--target','x86_64-unknown-linux-gnu','-p','hypersolve','--all-features','--test','expression_program'],{'RUSTFLAGS':'-Zsanitizer=address','CARGO_TARGET_DIR':'/tmp/interval-refactor/authored-center-radius-asan'}),
 ('allocation',['cargo','run','--release','--manifest-path',str(out/'cost-project/Cargo.toml')],{'CARGO_TARGET_DIR':'/tmp/interval-refactor/owned-expression-cost-target'}),
 ('bench-smoke',['cargo','bench','-p','hypersolve','--features','expression-program','--bench','expression_program','--','--test'],{}),
 ('bench-cost',['cargo','bench','-p','hypersolve','--features','expression-program','--bench','expression_program','--','--sample-size','20','--measurement-time','1','--warm-up-time','1','--noplot'],{}),
]
rows=[]
for name,cmd,env in jobs:
 start=time.monotonic()
 with (out/(name+'-qualified.log')).open('w') as f: p=subprocess.run(cmd,cwd='/mnt/development/csgrs',env=os.environ|env,stdout=f,stderr=subprocess.STDOUT)
 row=dict(name=name,command=cmd,environment=env,exit=p.returncode,seconds=time.monotonic()-start); rows.append(row)
 (out/'qualification-final.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(row),flush=True)
 if p.returncode: break
