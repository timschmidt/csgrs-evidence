from pathlib import Path
import subprocess,json,hashlib,platform
out=Path(__file__).parent; root=Path('/mnt/development/csgrs')
def run(args,cwd=root): return subprocess.check_output(args,cwd=cwd)
(out/'qualified-full.patch').write_bytes(run(['git','diff','--binary','HEAD']))
(out/'owner.patch').write_bytes(run(['git','diff','--binary','HEAD','--','crates/hypersolve']))
(out/'lock-addition.patch').write_bytes(run(['git','diff','--binary','--','Cargo.lock']))
(out/'interface.patch').write_bytes(run(['git','diff','--binary','HEAD'],Path('/mnt/development/alumina-interface')))
paths=[p for p in run(['git','diff','--name-only','HEAD','--','crates/hypersolve']).decode().splitlines()]
meta={'base':run(['git','rev-parse','HEAD']).decode().strip(),'status':run(['git','status','--short']).decode(),'files':[{'path':p,'bytes':(root/p).stat().st_size,'sha256':hashlib.sha256((root/p).read_bytes()).hexdigest()} for p in paths], 'lock_sha256':hashlib.sha256((root/'Cargo.lock').read_bytes()).hexdigest(),'platform':platform.platform()}
(out/'SOURCE_STATE.json').write_text(json.dumps(meta,indent=2)+'\n')
for name,cmd in [('rustc',['rustc','-Vv']),('msrv-rustc',['rustup','run','1.95.0','rustc','-Vv']),('nightly-rustc',['rustup','run','nightly','rustc','-Vv']),('cargo',['cargo','-Vv']),('cpu',['lscpu'])]:
 (out/(name+'.txt')).write_bytes(run(cmd))
