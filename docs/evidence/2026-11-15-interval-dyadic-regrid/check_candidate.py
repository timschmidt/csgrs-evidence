from pathlib import Path
import subprocess,sys
s=Path(__file__).parent
jobs=[
 ('candidate-artifacts',['test','--locked','-p','hyperdynamics','--features','adaptive-taylor,dispatch-trace','--test','regrid_artifact_observer','--','--nocapture']),
 ('candidate-core-tests',['test','--locked','-p','hyperinterval','-p','hyperlattice-interval','-p','hypersolve','-p','hyperdynamics','--all-features']),
 ('candidate-core-clippy',['clippy','--locked','-p','hyperinterval','-p','hyperlattice-interval','-p','hypersolve','-p','hyperdynamics','--all-features','--all-targets','--','-D','warnings']),
 ('candidate-brep',['test','--locked','-p','hyperbrep','--features','interval-ranges,dispatch-trace','--test','interval_ranges']),
 ('candidate-curve',['test','--locked','-p','hypercurve','--features','interval-ranges,dispatch-trace','--test','interval_ranges_example']),
 ('candidate-sdf',['test','--locked','-p','hypersdf','--all-features','--tests']),
 ('candidate-physics-circuit',['test','--locked','-p','hyperphysics','-p','hypercircuit','--all-features']),
 ('candidate-msrv',['test','--locked','-p','hyperinterval','--no-default-features','--features','dyadic,serde']),
 ('candidate-wasm',['check','--locked','-p','hyperinterval','--no-default-features','--features','dyadic,serde','--target','wasm32-unknown-unknown']),
 ('candidate-thumb',['check','--locked','-p','hyperinterval','--no-default-features','--features','dyadic,serde','--target','thumbv7em-none-eabihf']),
]
for label,args in jobs:
 version='+1.88.0' if label in ['candidate-msrv','candidate-wasm','candidate-thumb'] else '+1.95.0'
 result=subprocess.run([sys.executable,str(s/'run.py'),label,'cargo',version,*args])
 assert result.returncode==0,label
