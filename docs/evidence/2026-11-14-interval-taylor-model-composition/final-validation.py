from pathlib import Path
import subprocess,json,time,shutil
s=Path(__file__).parent;r='/mnt/development/csgrs';target='/mnt/development/.interval-refactor-build/taylor-polynomial-arithmetic-main'
shutil.copy2(s/'main-owner-focus.log',s/'main-owner-focus-initial.log')
commands=[('owner-focus',['cargo','+1.95.0','test','--locked','-p','hypersolve','--all-features','--test','program_taylor_composition','--test','program_taylor_polynomial','--target-dir',target]),('final-test-clippy',['cargo','+1.95.0','clippy','--locked','-p','hypersolve','--all-features','--test','program_taylor_composition','--target-dir',target,'--','-D','warnings']),('final-format',['cargo','+1.95.0','fmt','--all','--','--check'])]
rows=[]
for name,cmd in commands:
 start=time.monotonic()
 with (s/f'main-{name}.log').open('w') as out:code=subprocess.run(cmd,cwd=r,stdout=out,stderr=subprocess.STDOUT).returncode
 rows.append(dict(name=name,command=cmd,returncode=code,seconds=time.monotonic()-start));(s/'final-validation.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,code,flush=True);assert code==0
