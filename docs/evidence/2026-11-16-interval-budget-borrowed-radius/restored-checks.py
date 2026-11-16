from pathlib import Path
import subprocess
s=Path(__file__).parent
c='/mnt/development/interval-profile-static/csgrs'; i='/mnt/development/interval-profile-static/alumina-interface'
checks=[
 ('restored-interval-tests',c,['test','--locked','-p','hyperinterval','--all-features']),
 ('restored-owner-clippy',c,['clippy','--locked','-p','hyperinterval','--all-targets','--all-features','--','-D','warnings']),
 ('restored-owner-fmt',c,['fmt','--all','--','--check']),
 ('restored-interface-tests','/mnt/development/csgrs',['test','--locked','--manifest-path',i+'/crates/alumina-interface-core/Cargo.toml','--lib']),
 ('restored-interface-clippy','/mnt/development/csgrs',['clippy','--locked','--manifest-path',i+'/crates/alumina-interface-core/Cargo.toml','--all-targets','--','-D','warnings']),
 ('restored-interface-fmt',i,['fmt','--all','--','--check']),
]
for label,cwd,args in checks:
 subprocess.run(['python3',str(s/'run.py'),label,'cargo','+1.95.0',*args],cwd=cwd,check=True)
