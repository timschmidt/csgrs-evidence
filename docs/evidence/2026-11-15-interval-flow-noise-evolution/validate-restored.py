from pathlib import Path
import os,subprocess,json,time,sys
s=Path(__file__).resolve().parent;out=s/'restored-validation';out.mkdir(exist_ok=False)
e=os.environ.copy();e.update(CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/workspace-qualification',CARGO_BUILD_JOBS='12',CARGO_TERM_COLOR='never',RUSTDOCFLAGS='-D warnings')
commands=[
('owner',['cargo','+stable','test','--locked','-p','hyperdynamics','--all-features']),
('fmt',['cargo','+stable','fmt','--all','--','--check']),
]
rows=[]
for name,args in commands:
 print('START '+name,flush=True);start=time.time()
 with (out/(name+'.log')).open('w') as log:r=subprocess.run(args,cwd='/mnt/development/csgrs-flow-noise-evolution',env=e,stdout=log,stderr=subprocess.STDOUT,timeout=7200)
 row=dict(name=name,command=args,exit_code=r.returncode,elapsed_seconds=time.time()-start);rows.append(row);(out/'results.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(row),flush=True)
 if r.returncode:sys.exit(r.returncode)
(out/'completed.json').write_text(json.dumps(dict(commands=len(rows),all_passed=True))+'\n')
