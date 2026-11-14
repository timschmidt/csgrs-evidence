from pathlib import Path
import subprocess,os,json,shutil
s=Path(__file__).parent;base=Path('/mnt/development/.interval-refactor-build/interval-release-readme-final');r=base/'all-features-consumer';shutil.copytree(base/'consumer',r);rows=[];env=os.environ|{'CARGO_NET_OFFLINE':'true','CARGO_TARGET_DIR':str(base/'all-features-target'),'CARGO_BUILD_JOBS':'2'};selection=['-p','hyperinterval','-p','hyperlattice-interval','-p','hyperdynamics']
commands=[('prepare',['cargo','+1.95.0','check','--all-features','--lib',*selection]),('clippy',['cargo','+1.95.0','clippy','--locked','--all-features','--lib',*selection,'--','-D','warnings']),('docs',['cargo','+1.95.0','doc','--locked','--all-features','--no-deps',*selection]),('tree',['cargo','+1.95.0','tree','--locked','--all-features','--edges','features',*selection])]
for name,cmd in commands:
 with (s/f'packaged-features-{name}.log').open('w') as out:p=subprocess.run(cmd,cwd=r,env=env|({'RUSTDOCFLAGS':'-D warnings'} if name=='docs' else {}),stdout=out,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,returncode=p.returncode));(s/'packaged-feature-checks.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,p.returncode,flush=True)
 if p.returncode:break
(s/'packaged-features-Cargo.lock').write_bytes((r/'Cargo.lock').read_bytes())
