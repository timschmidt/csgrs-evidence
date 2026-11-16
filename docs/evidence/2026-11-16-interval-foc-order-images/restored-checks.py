from pathlib import Path
import subprocess
s=Path(__file__).parent;manifest='/mnt/development/interval-profile-static/alumina-firmware/Cargo.toml'
for label,args in [('restored-firmware-tests',['test','--locked','--manifest-path',manifest]),('restored-clippy',['clippy','--locked','--manifest-path',manifest,'--all-targets','--','-D','warnings']),('restored-unit-release',['test','--locked','--release','--manifest-path',manifest,'-p','alumina-foc']),('restored-fmt',['fmt','--all','--manifest-path',manifest,'--','--check'])]:
 subprocess.run(['python3',str(s/'run.py'),label,'cargo','+1.88.0',*args],check=True)
 if label=='restored-unit-release':subprocess.run(['python3',str(s/'capture-unit.py'),'restored'],check=True)
