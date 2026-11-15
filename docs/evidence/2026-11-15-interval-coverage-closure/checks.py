from pathlib import Path
import subprocess,os,time,json
s=Path(__file__).parent;root=Path('/mnt/development/interval-profile-static/csgrs');env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/interval-coverage-closure-tests','CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'}
checks=[
('all-target-tests',['cargo','+1.95.0','test','--locked','-p','hyperinterval','--all-features','--all-targets']),
('no-default-tests',['cargo','+1.95.0','test','--locked','-p','hyperinterval','--no-default-features']),
('strict-clippy',['cargo','+1.95.0','clippy','--locked','-p','hyperinterval','--all-features','--all-targets','--','-D','warnings']),
('no-default-clippy',['cargo','+1.95.0','clippy','--locked','-p','hyperinterval','--no-default-features','--all-targets','--','-D','warnings']),
('release-witnesses',['cargo','+1.95.0','test','--locked','-p','hyperinterval','--all-features','--release','--test','boundary_composition','--test','rational']),
('docs',['cargo','+1.95.0','doc','--locked','-p','hyperinterval','--all-features','--no-deps']),
('examples-benches',['cargo','+1.95.0','check','--locked','-p','hyperinterval','--all-features','--examples','--benches']),
('workspace-fmt',['cargo','+1.95.0','fmt','--all','--','--check']),
('msrv-witnesses',['cargo','+1.88.0','test','--locked','-p','hyperinterval','--no-default-features','--features','integer,fixed,dyadic,float-proposal,float-enclosure,serde','--test','boundary_composition']),
('stable-witnesses',['cargo','+stable','test','--locked','-p','hyperinterval','--all-features','--test','boundary_composition','--test','rational']),
]
rows=[]
for name,cmd in checks:
 start=time.monotonic();check_env=env|({'RUSTDOCFLAGS':'-D warnings'} if name=='docs' else {})
 with (s/(name+'.log')).open('w') as out:p=subprocess.run(cmd,cwd=root,env=check_env,stdout=out,stderr=subprocess.STDOUT)
 rows.append({'label':name,'command':cmd,'cwd':str(root),'exit_code':p.returncode,'seconds':time.monotonic()-start});(s/'checks.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,p.returncode,flush=True)
 if p.returncode:raise SystemExit(p.returncode)
