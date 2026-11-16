from pathlib import Path
import subprocess,sys
s=Path(__file__).parent
for name,args in [
 ('fmt',['fmt','--all','--','--check']),
 ('clippy',['clippy','--locked','-p','hyperdynamics','-p','hyperphysics','--all-features','--all-targets','--','-D','warnings']),
 ('controller-minimal',['test','--locked','-p','hyperdynamics','--no-default-features','--features','flow-noise-evolution','--test','flow_noise_evolution']),
 ('controller-trace',['test','--locked','-p','hyperdynamics','--all-features','--test','flow_noise_trace','--test','native_evolution_trace','--','--nocapture']),
]:
 p=subprocess.run([sys.executable,str(s/'run.py'),name,'cargo','+1.95.0']+args)
 if p.returncode:sys.exit(p.returncode)
