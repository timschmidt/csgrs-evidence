from pathlib import Path
import subprocess,os,time,json
s=Path(__file__).resolve().parent;r=Path('/mnt/development/csgrs');e=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/wasm-float-main','CARGO_BUILD_JOBS':'12','CARGO_TERM_COLOR':'never'};rows=[]
commands=[
('float-test',['cargo','+stable','test','--locked','-p','hyperinterval','--all-features','--test','float']),
('fmt',['cargo','+stable','fmt','--all','--','--check']),
('zizmor',['/tmp/interval-refactor/tools/bin/zizmor','--pedantic','--strict-collection','.']),
('diff',['git','diff','--check']),
('budget',['bash','scripts/check-repository-budget.sh']),
]
for name,args in commands:
 start=time.time()
 with (s/('main-'+name+'.log')).open('w') as f:p=subprocess.run(args,cwd=r,env=e,stdout=f,stderr=subprocess.STDOUT,timeout=3600)
 row=dict(name=name,command=args,exit_code=p.returncode,elapsed_seconds=time.time()-start);rows.append(row);(s/'main-validation.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(row),flush=True)
 if p.returncode:raise SystemExit(p.returncode)
(s/'main-validation-completed.json').write_text(json.dumps(dict(all_passed=True,commands=len(rows)))+'\n')
