from pathlib import Path
import subprocess,os,time,json
s=Path(__file__).resolve().parent;r=Path('/mnt/development/csgrs-wasm-float');e=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/workspace-qualification','CARGO_BUILD_JOBS':'12','CARGO_TERM_COLOR':'never'};rows=[]
features='integer,fixed,dyadic,float-proposal,float-enclosure,serde'
commands=[
('owner-tests',['cargo','+1.88.0','test','--locked','-p','hyperinterval','--no-default-features','--features',features]),
('clippy',['cargo','+1.88.0','clippy','--locked','-p','hyperinterval','--all-targets','--no-default-features','--features',features,'--','-D','warnings']),
('unsupported-thumb',['cargo','+1.88.0','build','--locked','-p','hyperinterval','--target','thumbv7em-none-eabihf','--no-default-features','--features','float-enclosure','--message-format=json']),
('fmt',['cargo','+stable','fmt','--all','--','--check']),
('zizmor',['/tmp/interval-refactor/tools/bin/zizmor','--pedantic','--strict-collection','.']),
]
for name,args in commands:
 start=time.time()
 with (s/('msrv-'+name+'.log')).open('w') as f:p=subprocess.run(args,cwd=r,env=e,stdout=f,stderr=subprocess.STDOUT,timeout=3600)
 row=dict(name=name,command=args,exit_code=p.returncode,elapsed_seconds=time.time()-start);rows.append(row);(s/'msrv-validation.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(row),flush=True)
 if p.returncode:raise SystemExit(p.returncode)
(s/'msrv-validation-completed.json').write_text(json.dumps(dict(all_passed=True,commands=len(rows)))+'\n')
