"""Exercise only newly affected integration paths; preserve the preceding gates."""
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import time

OUT = Path(__file__).resolve().parent
ROOT = OUT.parents[4]
OLD = OUT.parent / '2026-10-16-upstream-format-integration'
sys.path.insert(0, str(OUT.parent / '2026-10-16-prism-continuation'))
from check import ENV as BASE_ENV, hashes as product_hashes

read = lambda path: json.loads(path.read_text())
write = lambda path,value: path.write_text(json.dumps(value,indent=2)+'\n')
digest = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
tools = read(OUT / 'tools.json')
ENV = BASE_ENV | dict(PATH=str(Path(tools['node']).parent)+':'+BASE_ENV['PATH'],
    WASM_BINDGEN=tools['wasm_bindgen'], TSC=tools['tsc'], CARGO_NET_OFFLINE='true')

def hashes():
    result = product_hashes()
    paths = [OUT/'qualify.py', OUT/'install_tools.py', ROOT/'scripts/test-wasm-bindings.sh']
    for pattern in ['*.cjs','*.ts','package*.json']:
        paths.extend((ROOT/'tests/wasm').glob(pattern))
    for path in paths:
        result[str(path.relative_to(ROOT))] = digest(path)
    return result

def run(label, command, extra=None, seconds=1500):
    source = hashes()
    identity = hashlib.sha256(json.dumps(source,sort_keys=True).encode()).hexdigest()
    snapshot = 'source-'+identity+'.json'
    write(OUT/snapshot,source)
    ledger = OUT/'commands.json'
    rows = read(ledger) if ledger.exists() else []
    attempt = 1+sum(row['label']==label for row in rows)
    logname = f'{label}-{attempt}.log'
    print('running',label,attempt,flush=True)
    started = time.monotonic()
    with (OUT/logname).open('w') as log:
        process = subprocess.run(['timeout','--signal=TERM','--kill-after=30s',str(seconds)+'s',*command],
            cwd=ROOT,env=ENV|(extra or {}),stdout=log,stderr=subprocess.STDOUT)
    unchanged = source==hashes()
    rows.append(dict(label=label,attempt=attempt,command=command,environment=extra or {},
        elapsed_seconds=time.monotonic()-started,external_timeout_seconds=seconds,
        exit_code=process.returncode,source=snapshot,source_unchanged=unchanged,log=logname))
    write(ledger,rows)
    assert unchanged
    print('finished',label,'exit',process.returncode,flush=True)
    return process.returncode

if __name__=='__main__':
    merge=read(OUT/'merge-review.json')
    git=lambda *args:subprocess.check_output(['git',*args],cwd=ROOT).decode()
    assert git('rev-parse','HEAD').strip()==merge['baseline']
    assert git('rev-parse','MERGE_HEAD').strip()==merge['upstream']
    previous=read(OLD/'manifest.json')
    old_source=read(OLD/previous['source'])
    current=product_hashes()
    prefixes=tuple('crates/'+name+'/' for name in ['hyperbrep','hyperbrep-io','hyperreal',
                    'hyperlimit','hypercurve','hypersolve','hyperlattice','hypermesh','hypertri'])
    retained={name:value for name,value in old_source.items() if name.startswith(prefixes)
              and name in current}
    assert all(current[name]==value for name,value in retained.items())
    for path in ['Cargo.toml','Cargo.lock','properties.md','docs/admission.md','AGENTS.md']:
        assert current[path]==old_source[path]
    write(OUT/'preserved-brep-source.json',dict(files=retained,
        preceding_manifest='../2026-10-16-upstream-format-integration/manifest.json',
        runtime_and_dependency_sources_identical=True,
        scope='The preceding 512/504 native, both Clippy configurations, documentation, fuzz compilation and 83-group WASM gates remain tied to identical BREP/dependency inputs. New format/binding paths are checked here; old costs are not remeasured.'))
    for path,expected in tools['executable_sha256'].items():
        assert digest(Path(path))==expected
    write(OUT/'environment.json',dict(
        rustc=subprocess.check_output(['rustc','-vV'],env=ENV,text=True),
        cargo=subprocess.check_output(['cargo','-V'],env=ENV,text=True),
        node=subprocess.check_output([tools['node'],'--version'],text=True),
        wasm_bindgen=subprocess.check_output([tools['wasm_bindgen'],'--version'],text=True),
        typescript=subprocess.check_output([tools['node'],tools['tsc'],'--version'],text=True),
        build_environment={key:ENV[key] for key in ['PATH','CARGO_HOME','CARGO_TARGET_DIR','GMP_MPFR_SYS_CACHE','WASM_BINDGEN','TSC','CARGO_NET_OFFLINE']},
        inherited_optional_environment={key:value for key,value in os.environ.items() if key.startswith(('RUST','CARGO','GMP'))}))
    C=['--offline','--locked']
    F=['-p','csgrs','--no-default-features','--features','obj-io,stl-io',
       '--test','obj_export_failures','--test','stl_import_contracts','--test','export_projection_contracts']
    commands=[
        ('format-debug',['cargo','test',*C,*F,'--no-fail-fast'],{}),
        ('format-release',['cargo','test',*C,*F,'--release','--no-fail-fast'],{}),
        ('format-clippy',['cargo','clippy',*C,*F,'--','-D','warnings'],{}),
        ('format-docs',['cargo','doc',*C,'-p','csgrs','--no-default-features','--features','obj-io,stl-io','--no-deps'],{'RUSTDOCFLAGS':'-D warnings'}),
        ('prism-continuation',['cargo','test',*C,'-p','hyperbrep','-p','hyperbrep-io','--all-features','--release','--test','prisms','--test','prism_export','--no-fail-fast'],{}),
        ('binding-shell',['bash','-n','scripts/test-wasm-bindings.sh'],{}),
        ('real-bindings',['bash','scripts/test-wasm-bindings.sh'],{}),
        ('wasm-clippy',['cargo','clippy',*C,'--profile','wasm','--target','wasm32-unknown-unknown','--no-default-features','--features','wasm','--lib','--','-D','warnings'],{}),
        ('fmt',['cargo','fmt','--all','--','--check'],{}),
        ('diff-check',['git','diff','--check'],{}),
    ]
    failures=[label for label,command,extra in commands if run(label,command,extra)]
    print('failed checks:',failures,flush=True)
    raise SystemExit(bool(failures))
