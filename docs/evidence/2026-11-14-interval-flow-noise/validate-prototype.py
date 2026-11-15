from pathlib import Path
import hashlib,json,os,subprocess,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-flow-noise')
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/flow-noise','CARGO_BUILD_JOBS':'4'}
base=['cargo','+1.95.0'];rows=[]
commands=[
 ('prototype-focused',base+['test','--locked','-p','hyperdynamics','--features','flow-noise,serde','--test','flow_noise_witness']),
 ('prototype-example',base+['run','--locked','-p','hyperdynamics','--features','flow-noise','--example','flow_noise']),
 ('prototype-clippy',base+['clippy','--locked','-p','hyperdynamics','--all-features','--all-targets','--','-D','warnings']),
 ('prototype-owner',base+['test','--locked','-p','hyperdynamics','--all-features']),
 ('prototype-docs',base+['doc','--locked','-p','hyperdynamics','--all-features','--no-deps']),
 ('prototype-disabled',base+['check','--locked','-p','hyperdynamics','--no-default-features','--all-targets']),
 ('prototype-wasm',base+['check','--locked','-p','hyperdynamics','--features','flow-noise,serde','--target','wasm32-unknown-unknown','--lib']),
 ('prototype-format',base+['fmt','--all','--','--check']),
 ('prototype-diff',['git','diff','--check']),
]
for name,cmd in commands:
 start=time.monotonic();local=env|({'RUSTDOCFLAGS':'-D warnings'} if name=='prototype-docs' else {})
 with (s/(name+'.log')).open('wb') as out:p=subprocess.run(cmd,cwd=r,env=local,stdout=out,stderr=subprocess.STDOUT)
 rows.append({'name':name,'command':cmd,'returncode':p.returncode,'seconds':time.monotonic()-start});(s/'prototype-checks.json').write_text(json.dumps(rows,indent=2)+'\n')
 print(name,p.returncode,flush=True)
 if p.returncode:raise SystemExit(p.returncode)
print('prototype checks passed; performance, archive delivery and full acceptance remain pending',flush=True)
