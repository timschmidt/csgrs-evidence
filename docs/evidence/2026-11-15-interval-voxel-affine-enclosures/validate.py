from pathlib import Path
import subprocess,sys,os
s=Path(__file__).parent
base=['--locked','--manifest-path','crates/hypervoxel/Cargo.toml','-p','hypervoxel']
if sys.argv[1]=='stable':
 jobs=[('final-default',['cargo','+stable','test',*base,'--no-default-features']),('final-clippy',['cargo','+stable','clippy',*base,'--all-features','--all-targets','--','-D','warnings']),('default-clippy',['cargo','+stable','clippy',*base,'--no-default-features','--all-targets','--','-D','warnings']),('final-docs',['env','RUSTDOCFLAGS=-D warnings','cargo','+stable','doc',*base,'--all-features','--no-deps']),('owner-list',['cargo','+stable','test',*base,'--all-features','--','--list'])]
else:
 jobs=[('final-msrv',['cargo','+1.95.0','test',*base,'--features','interval-enclosure','--test','affine_enclosures']),('msrv-clippy',['cargo','+1.95.0','clippy',*base,'--all-features','--all-targets','--','-D','warnings']),('wasm',['cargo','+1.95.0','check',*base,'--features','interval-enclosure','--target','wasm32-unknown-unknown']),('final-client',['cargo','+1.95.0','run','--offline','--manifest-path','/mnt/development/.interval-refactor-build/voxel-affine-client/Cargo.toml']),('lattice-bridge',['cargo','+1.95.0','test','--locked','-p','hyperlattice-interval','--features','hyperreal']),('root-downstream',['cargo','+1.95.0','test','--locked','-p','hypersdf','--features','enclosure-program,hypervoxel-adapter','--test','voxel_enclosures']),('firmware-core',['cargo','+1.95.0','check','--locked','-p','hyperlattice-interval','--no-default-features','--features','fixed','--target','thumbv7em-none-eabihf'])]
for name,cmd in jobs:
 r=subprocess.run([sys.executable,str(s/'run_checks.py'),name,*cmd]);assert r.returncode==0,(name,r.returncode)
