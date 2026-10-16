"""Affected local/downstream qualification; keep failures and all attempts.

No push is performed. Full release/MSRV/coverage/fuzz/formal gates remain open.
Run after measurements, or before them; do not overlap compiler/test CPU load
with benchmark measurements.
"""
import argparse
from pathlib import Path
import shutil
from check import run, ROOT, OUT

WASM=Path('/tmp/hyperbrep-supplied-pcurves-wasm-probe')
C=['--offline','--locked']
CORE=['-p','hyperbrep','-p','hyperbrep-io']
ROOT_TESTS=['empty_composition','primitive_failures','transform_failures','bounds_failures','curve_constructor_failures','planar_operation_failures','sampled_profile_failures','rounded_rectangle_fidelity','slice_projection_contract','strict_drilled_workflows']
COMMANDS=[
 ('occt-reader',['python3',str(OUT/'occt_read.py')],{},300),
 ('scalar-all',['cargo','test',*C,'-p','hyperreal','--all-features','--release'],{},900),
 ('predicates-all',['cargo','test',*C,'-p','hyperlimit','--all-features','--release'],{},900),
 ('native-debug',['cargo','test',*C,*CORE,'--all-features'],{},900),
 ('native-release',['cargo','test',*C,*CORE,'--all-features','--release'],{},900),
 ('native-minimal',['cargo','test',*C,*CORE,'--no-default-features','--release'],{},900),
 ('scalar-minimal',['cargo','test',*C,'-p','hyperreal','--no-default-features','--release'],{},900),
 ('predicates-minimal',['cargo','test',*C,'-p','hyperlimit','--no-default-features','--release'],{},900),
 ('curve-release',['cargo','test',*C,'-p','hypercurve','--release'],{},3600),
 ('solver-release',['cargo','test',*C,'-p','hypersolve','--release'],{},1800),
 ('root-acceptance',['cargo','test',*C,'-p','csgrs','--release','--no-default-features','--features','curve','--no-fail-fast']+sum((['--test',name] for name in ROOT_TESTS),[]),{},1800),
 ('scalar-clippy',['cargo','clippy',*C,'-p','hyperreal','--all-features','--all-targets','--','-D','warnings'],{},900),
 ('predicates-clippy',['cargo','clippy',*C,'-p','hyperlimit','--all-features','--all-targets','--','-D','warnings'],{},900),
 ('native-curve-clippy',['cargo','clippy',*C,*CORE,'-p','hypercurve','--all-features','--all-targets','--','-D','warnings'],{},900),
 ('native-minimal-clippy',['cargo','clippy',*C,*CORE,'--no-default-features','--all-targets','--','-D','warnings'],{},900),
 ('root-curve-clippy',['cargo','clippy',*C,'-p','csgrs','--no-default-features','--features','curve','--all-targets','--','-D','warnings'],{},900),
 ('rustdoc',['cargo','doc',*C,*CORE,'-p','hypercurve','-p','hyperreal','-p','hyperlimit','--all-features','--no-deps'],{'RUSTDOCFLAGS':'-D warnings'},900),
 ('supplied-example',['cargo','run',*C,'-p','hyperbrep-io','--example','supplied_step','--release'],{},900),
 ('circular-example',['cargo','run',*C,'-p','hyperbrep-io','--example','circular_step','--release'],{},900),
 ('allocation-example',['cargo','run',*C,'-p','hyperlimit','--all-features','--release','--example','allocation_profile','--','8'],{},900),
 ('fuzz-check',['cargo','check',*C,'--manifest-path','crates/hyperbrep/fuzz/Cargo.toml','--bins'],{},900),
 ('wasm-lock',['cargo','generate-lockfile','--offline','--manifest-path',str(WASM/'Cargo.toml')],{},300),
 ('wasm-build',['cargo','build',*C,'--manifest-path',str(WASM/'Cargo.toml'),'--target','wasm32-unknown-unknown','--release'],{},900),
 ('wasm-runtime',['python3',str(WASM/'run.py')],{},300),
 ('fmt',['cargo','fmt','--all','--','--check'],{},300),
 ('diff-check',['git','diff','--check'],{},300),
]
parser=argparse.ArgumentParser()
parser.add_argument('--only',nargs='+',choices=[x[0] for x in COMMANDS])
args=parser.parse_args()
(WASM/'src').mkdir(parents=True,exist_ok=True)
for source,dest in [('Cargo.toml','Cargo.toml'),('lib.rs','src/lib.rs'),('run.py','run.py')]:
 shutil.copyfile(OUT/'wasm-probe'/source,WASM/dest)
failures=[]
for label,command,env,seconds in COMMANDS:
 if args.only and label not in args.only: continue
 if run(label,command,seconds,env): failures.append(label)
 if label=='wasm-lock' and (WASM/'Cargo.lock').exists():
  shutil.copyfile(WASM/'Cargo.lock',OUT/'wasm-probe/Cargo.lock')

print('failed checks:',failures,flush=True)
raise SystemExit(bool(failures))
