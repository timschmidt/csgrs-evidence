"""Current-source qualification with external containment and retained attempts.

An expected inherited downstream failure is recorded, never converted to pass.
Use --only to retry named commands; old logs and source snapshots remain.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import shutil
import subprocess
import time

ROOT = Path(__file__).resolve().parents[5]
OUT = Path(__file__).resolve().parent
WASM = Path('/tmp/hyperbrep-closed-edges-wasm-probe')
ENV = os.environ | {
    'PATH': '/tmp/hyperbrep-upstream-tools/usr/bin:/home/tim/.cargo/bin:' + os.environ['PATH'],
    'CARGO_HOME': '/tmp/hyperbrep-review-cargo',
    'CARGO_TARGET_DIR': '/tmp/hyperbrep-review-target',
    'GMP_MPFR_SYS_CACHE': '/tmp/hyperbrep-upstream-tools/gmp-cache',
}
COMMON = ['--offline', '--locked']
CORE = ['-p', 'hyperbrep', '-p', 'hyperbrep-io']
ROOT_TESTS = ['empty_composition', 'primitive_failures', 'transform_failures', 'bounds_failures',
              'curve_constructor_failures', 'planar_operation_failures', 'sampled_profile_failures',
              'rounded_rectangle_fidelity', 'slice_projection_contract', 'strict_drilled_workflows']
COMMANDS = [
    ('native-debug', ['cargo', 'test', *COMMON, *CORE, '--all-features'], {}, 900),
    ('native-release', ['cargo', 'test', *COMMON, *CORE, '--all-features', '--release'], {}, 900),
    ('native-minimal', ['cargo', 'test', *COMMON, *CORE, '--no-default-features', '--release'], {}, 900),
    ('curve-focused-debug', ['cargo', 'test', *COMMON, '-p', 'hypercurve', '--test', 'hypercurve_curve_string'], {}, 900),
    ('curve-release', ['cargo', 'test', *COMMON, '-p', 'hypercurve', '--release'], {}, 3600),
    ('root-acceptance', ['cargo', 'test', *COMMON, '-p', 'csgrs', '--release', '--no-default-features', '--features', 'curve', '--no-fail-fast']
     + sum((['--test', name] for name in ROOT_TESTS), []), {}, 1800),
    ('clippy', ['cargo', 'clippy', *COMMON, *CORE, '-p', 'hypercurve', '--all-targets', '--all-features', '--', '-D', 'warnings'], {}, 900),
    ('clippy-minimal', ['cargo', 'clippy', *COMMON, *CORE, '--all-targets', '--no-default-features', '--', '-D', 'warnings'], {}, 900),
    ('root-curve-clippy', ['cargo', 'clippy', *COMMON, '-p', 'csgrs', '--all-targets', '--no-default-features', '--features', 'curve', '--', '-D', 'warnings'], {}, 900),
    ('rustdoc', ['cargo', 'doc', *COMMON, *CORE, '-p', 'hypercurve', '--features', 'hyperbrep/tessellation', '--no-deps'], {'RUSTDOCFLAGS': '-D warnings'}, 900),
    ('fuzz-check', ['cargo', 'check', *COMMON, '--manifest-path', 'crates/hyperbrep/fuzz/Cargo.toml', '--bins'], {}, 900),
    ('wasm-lock', ['cargo', 'generate-lockfile', '--offline', '--manifest-path', str(WASM/'Cargo.toml')], {}, 300),
    ('wasm-build', ['cargo', 'build', *COMMON, '--manifest-path', str(WASM/'Cargo.toml'), '--target', 'wasm32-unknown-unknown', '--release'], {}, 900),
    ('wasm-runtime', ['python3', str(WASM/'run.py')], {}, 300),
    ('fmt', ['cargo', 'fmt', '--all', '--', '--check'], {}, 300),
    ('diff-check', ['git', 'diff', '--check'], {}, 300),
]

def hashes():
    paths = [ROOT/p for p in ['Cargo.toml', 'Cargo.lock', 'properties.md', 'docs/admission.md', 'AGENTS.md']]
    for name in ['hyperbrep', 'hyperbrep-io', 'hyperreal', 'hyperlimit', 'hyperlattice', 'hypersolve', 'hypercurve', 'hypertri', 'hypermesh', 'hypersdf']:
        crate = ROOT/'crates'/name
        paths.extend([crate/'Cargo.toml', *crate.glob('src/**/*.rs'), *crate.glob('tests/**/*.rs'), *crate.glob('benches/*.rs'), *crate.glob('examples/*.rs')])
    paths.extend((ROOT/'src').glob('**/*.rs'))
    paths.extend((ROOT/'tests').glob('**/*.rs'))
    paths.extend((ROOT/'crates/hyperbrep/fuzz').glob('fuzz_targets/*.rs'))
    paths.extend(OUT/'wasm-probe'/p for p in ['Cargo.toml', 'lib.rs', 'run.py'])
    return {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(set(paths))}

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--only', nargs='+', choices=[c[0] for c in COMMANDS])
    args = parser.parse_args()
    (WASM/'src').mkdir(parents=True, exist_ok=True)
    for source, destination in [('Cargo.toml','Cargo.toml'), ('lib.rs','src/lib.rs'), ('run.py','run.py')]:
        shutil.copyfile(OUT/'wasm-probe'/source, WASM/destination)
    original = hashes()
    snapshot_hash = hashlib.sha256(json.dumps(original, sort_keys=True).encode()).hexdigest()
    snapshot = OUT/('source-' + snapshot_hash + '.json')
    snapshot.write_text(json.dumps(original, indent=2)+'\n')
    environment = dict(baseline_revision=subprocess.check_output(['git','rev-parse','HEAD'],cwd=ROOT,text=True).strip(),
                       platform=platform.platform(), cpu_affinity=sorted(os.sched_getaffinity(0)),
                       cpu=json.loads(subprocess.check_output(['lscpu','--json'],text=True)),
                       rustc=subprocess.check_output(['rustc','-Vv'],env=ENV,text=True),
                       cargo=subprocess.check_output(['cargo','-V'],env=ENV,text=True),
                       cargo_home=ENV['CARGO_HOME'], cargo_target_dir=ENV['CARGO_TARGET_DIR'],
                       source_snapshot=snapshot.name, source_snapshot_sha256=snapshot_hash,
                       limits='External timeouts; no internal total-work or retained-byte bound claimed.')
    (OUT/'environment.json').write_text(json.dumps(environment,indent=2)+'\n')
    attempts = json.loads((OUT/'attempts.json').read_text()) if (OUT/'attempts.json').exists() else []
    for label, command, extra, seconds in COMMANDS:
        if args.only and label not in args.only:
            continue
        attempt = 1 + sum(row['label']==label for row in attempts)
        logname = f'{label}-attempt-{attempt}.log'
        start = time.monotonic()
        print('running', label, 'attempt', attempt, flush=True)
        with (OUT/logname).open('w') as log:
            result = subprocess.run(['timeout','--signal=TERM','--kill-after=30s',str(seconds)+'s',*command],cwd=ROOT,env=ENV|extra,stdout=log,stderr=subprocess.STDOUT)
        assert hashes()==original, 'source changed during qualification'
        attempts.append(dict(label=label, attempt=attempt, command=command, environment=extra,
                             external_timeout_seconds=seconds, elapsed_seconds=time.monotonic()-start,
                             exit_code=result.returncode, log=logname, source_snapshot=snapshot.name))
        (OUT/'attempts.json').write_text(json.dumps(attempts,indent=2)+'\n')
        current = {row['label']:row for row in attempts if row['source_snapshot']==snapshot.name}
        (OUT/'commands.json').write_text(json.dumps([current[c[0]] for c in COMMANDS if c[0] in current],indent=2)+'\n')
        shutil.copyfile(OUT/logname,OUT/(label+'.log'))
        if label=='wasm-runtime' and result.returncode==0:
            shutil.copyfile(OUT/logname,OUT/'wasm-runtime.json')
        print(label, 'exit', result.returncode, flush=True)
    if (WASM/'Cargo.lock').exists():
        shutil.copyfile(WASM/'Cargo.lock',OUT/'wasm-probe/Cargo.lock')

if __name__=='__main__':
    main()
