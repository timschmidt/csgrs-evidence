"""Qualify native prism continuation and its necessary scalar identity extension."""
import argparse
from pathlib import Path
import shutil
from check import run, OUT

WASM = Path('/tmp/hyperbrep-prism-wasm-probe')
C = ['--offline','--locked']
CORE = ['-p','hyperbrep','-p','hyperbrep-io']
COMMANDS = [
    ('storage-identity',['python3',str(OUT/'storage_identity.py')],{},300),
    ('scalar-atan',['cargo','test',*C,'-p','hyperreal','--all-features','--release','--lib','atan'],{},900),
    ('scalar-release',['cargo','test',*C,'-p','hyperreal','--all-features','--release','--lib'],{},1500),
    ('scalar-minimal',['cargo','test',*C,'-p','hyperreal','--no-default-features','--features','serde','--release','--lib'],{},1500),
    ('scalar-clippy',['cargo','clippy',*C,'-p','hyperreal','--all-features','--all-targets','--','-D','warnings'],{},900),

    ('scalar-consumers',['cargo','test',*C,'-p','hyperlimit','-p','hypercurve','-p','hypersolve','--all-features','--release','--lib','--no-fail-fast'],{},1800),

    ('native-debug',['cargo','test',*C,*CORE,'--all-features','--no-fail-fast'],{},1500),
    ('native-release',['cargo','test',*C,*CORE,'--all-features','--release','--no-fail-fast'],{},900),
    ('native-minimal',['cargo','test',*C,*CORE,'--no-default-features','--release','--no-fail-fast'],{},900),
    ('native-clippy',['cargo','clippy',*C,*CORE,'--all-features','--all-targets','--','-D','warnings'],{},900),
    ('native-minimal-clippy',['cargo','clippy',*C,*CORE,'--no-default-features','--all-targets','--','-D','warnings'],{},900),
    ('rustdoc',['cargo','doc',*C,*CORE,'--all-features','--no-deps'],{'RUSTDOCFLAGS':'-D warnings'},900),
    ('analytic-example',['cargo','run',*C,'-p','hyperbrep-io','--example','analytic_step','--release','--',str(OUT/'exports')],{},900),
    ('faceted-example',['cargo','run',*C,'-p','hyperbrep-io','--example','faceted_step','--release','--',str(OUT/'faceted-exports')],{},900),
    ('advanced-example',['cargo','run',*C,'-p','hyperbrep-io','--example','advanced_step','--release','--',str(OUT/'advanced-exports')],{},900),
    ('supplied-example',['cargo','run',*C,'-p','hyperbrep-io','--example','supplied_step','--release'],{},900),
    ('circular-example',['cargo','run',*C,'-p','hyperbrep-io','--example','circular_step','--release'],{},900),
    ('similarity-example',['cargo','run',*C,'-p','hyperbrep-io','--example','analytic_similarity','--release','--',str(OUT/'scaled-exports')],{},900),
    ('occt-reader',['python3',str(OUT/'occt_read.py')],{},300),
    ('fuzz-check',['cargo','check',*C,'--manifest-path','crates/hyperbrep/fuzz/Cargo.toml','--bins'],{},900),

    ('wasm-build',['cargo','build',*C,'--manifest-path',str(WASM/'Cargo.toml'),'--target','wasm32-unknown-unknown','--release'],{},900),
    ('wasm-runtime',['python3',str(WASM/'run.py')],{},900),
    ('fmt',['cargo','fmt','--all','--','--check'],{},300),
    ('diff-check',['git','diff','--check'],{},300),
]
parser=argparse.ArgumentParser()
parser.add_argument('--only',nargs='+',choices=[x[0] for x in COMMANDS])
args=parser.parse_args()
(WASM/'src').mkdir(parents=True,exist_ok=True)
for source,dest in [('Cargo.toml','Cargo.toml'),('lib.rs','src/lib.rs'),('faceted.rs','src/faceted.rs'),('run.py','run.py'),('Cargo.lock','Cargo.lock')]:
    shutil.copyfile(OUT/'wasm-probe'/source,WASM/dest)
failures=[]
for label,command,env,seconds in COMMANDS:
    if args.only and label not in args.only: continue
    if run(label,command,seconds,env): failures.append(label)
print('failed checks:',failures,flush=True)
raise SystemExit(bool(failures))
