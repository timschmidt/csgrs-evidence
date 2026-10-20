"""Locate an unresolved area equality without changing its acceptance assertion."""
import hashlib,json,shutil,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ENV,run,hashes
project=Path('/tmp/hyperbrep-torus-continuation-probe')
probe=Path(__file__).with_suffix('.rs')
inputs=[Path(__file__),probe,project/'Cargo.toml',project/'Cargo.lock']
digest=lambda:{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in inputs}
before=digest(); source=hashes()
(OUT/'growth-diagnostic-inputs.json').write_text(json.dumps(before,indent=2)+'\n')
shutil.copyfile(probe,project/'src/bin/growth_diagnostic.rs')
assert run('growth-diagnostic-build',['cargo','build','--offline','--locked','--release','--manifest-path',str(project/'Cargo.toml'),'--bin','growth_diagnostic'],900)==0
assert run('growth-diagnostic',[str(Path(ENV['CARGO_TARGET_DIR'])/'release/growth_diagnostic'),str(OUT/'growth-diagnostic-artifacts')],600)==0
assert digest()==before and hashes()==source
