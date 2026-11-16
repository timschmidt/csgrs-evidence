import subprocess,sys
from pathlib import Path
s=Path(__file__).parent
checks=[
('native-tests',['cargo','+1.95.0','test','--locked','-p','hyperlattice-interval','-p','hyperlattice','-p','hyperdynamics','-p','hypersolve','--all-features']),
('strict-clippy',['cargo','+1.95.0','clippy','--locked','-p','hyperlattice-interval','-p','hyperlattice','-p','hyperdynamics','--all-features','--all-targets','--','-D','warnings']),
('owner-docs',['cargo','+1.95.0','doc','--locked','-p','hyperlattice-interval','--no-deps','--all-features']),
('candidate-controls',['cargo','+1.95.0','test','--locked','-p','hyperdynamics','--all-features','--test','native_evolution_trace','--test','flow_noise_trace','--','--nocapture']),
('format',['cargo','+1.95.0','fmt','--all','--','--check'])]
for label,cmd in checks:
 r=subprocess.run([sys.executable,str(s/'run.py'),label,*cmd])
 if r.returncode:sys.exit(r.returncode)
