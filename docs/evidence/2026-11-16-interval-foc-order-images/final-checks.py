from pathlib import Path
import subprocess
s=Path(__file__).parent;manifest='/mnt/development/interval-profile-static/alumina-firmware/Cargo.toml'
for label,args in [('final-firmware-tests',['test','--locked','--manifest-path',manifest]),('final-clippy',['clippy','--locked','--manifest-path',manifest,'--all-targets','--','-D','warnings']),('final-unit-release',['test','--locked','--release','--manifest-path',manifest,'-p','alumina-foc']),('final-fmt',['fmt','--all','--manifest-path',manifest,'--','--check'])]:
 subprocess.run(['python3',str(s/'run.py'),label,'cargo','+1.88.0',*args],check=True)
 if label=='final-unit-release':subprocess.run(['python3',str(s/'capture-unit.py'),'final'],check=True)
