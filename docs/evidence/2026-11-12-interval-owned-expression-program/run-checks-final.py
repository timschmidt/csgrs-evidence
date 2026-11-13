import subprocess, json, time
from pathlib import Path
out=Path(__file__).parent
commands=[
 ('owner-tests', ['cargo','test','-p','hypersolve','--all-features','--lib','--test','expression_program','--test','symbolic_power_boundary']),
 ('feature-only', ['cargo','test','-p','hypersolve','--no-default-features','--features','expression-program','--test','expression_program']),
 ('clippy', ['cargo','clippy','-p','hypersolve','--all-features','--all-targets','--','-D','warnings']),
 ('downstream', ['cargo','test','-p','hyperdynamics','-p','hyperpath','--lib','--tests']),
 ('example', ['cargo','run','-p','hypersolve','--features','expression-program','--example','owned_program']),
 ('docs', ['cargo','doc','-p','hypersolve','--all-features','--no-deps']),
 ('wasm', ['cargo','+stable','check','-p','hypersolve','--all-features','--lib','--target','wasm32-unknown-unknown']),
 ('fmt', ['cargo','fmt','--all','--','--check']),
 ('diff', ['git','diff','--check']),
 ('budget', ['bash','scripts/check-repository-budget.sh']),
]
results=[]
for name,cmd in commands:
 start=time.monotonic()
 with (out/(name+'-final.log')).open('w') as f:
  p=subprocess.run(cmd,cwd='/mnt/development/csgrs',stdout=f,stderr=subprocess.STDOUT)
 row={'name':name,'command':cmd,'exit':p.returncode,'seconds':time.monotonic()-start}
 results.append(row);(out/'checks-final.json').write_text(json.dumps(results,indent=2)+'\n')
 print(json.dumps(row),flush=True)
 if p.returncode: break
