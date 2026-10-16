"""Source-bound, externally contained checks; retain every attempt."""
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[5]
OUT = Path(__file__).resolve().parent
ENV = os.environ | dict(PATH='/tmp/hyperbrep-upstream-tools/usr/bin:/home/tim/.cargo/bin:' + os.environ['PATH'],
                       CARGO_HOME='/tmp/hyperbrep-review-cargo',
                       CARGO_TARGET_DIR='/tmp/hyperbrep-review-target',
                       GMP_MPFR_SYS_CACHE='/tmp/hyperbrep-upstream-tools/gmp-cache')

def hashes():
    paths = [ROOT/p for p in ['Cargo.toml','Cargo.lock','properties.md','docs/admission.md','AGENTS.md','readme.md','examples/readme_renders.rs']]
    for name in ['hyperbrep-io','hyperbrep','hyperreal','hyperlimit','hypercurve','hypersolve','hyperlattice','hypermesh']:
        crate = ROOT/'crates'/name
        paths.extend([crate/'Cargo.toml', crate/'README.md', *crate.glob('src/**/*.rs'), *crate.glob('benches/*.rs'),
                      *crate.glob('tests/**/*.rs'), *crate.glob('tests/fixtures/*'), *crate.glob('examples/*.rs')])
    paths.extend((ROOT/'crates/hyperbrep/fuzz').glob('Cargo.*'))
    paths.extend((ROOT/'crates/hyperbrep/fuzz/fuzz_targets').glob('*.rs'))
    paths.extend(ROOT.glob('src/**/*.rs'))
    paths.extend(ROOT.glob('tests/**/*.rs'))
    paths.extend(ROOT.glob('benchmarks/rust/*.rs'))
    paths.extend((OUT/'wasm-probe').glob('*'))
    return {str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest()
            for p in sorted(set(paths)) if p.is_file()}

def run(label, command, seconds=900, extra=None):
    source = hashes()
    identity = hashlib.sha256(json.dumps(source,sort_keys=True).encode()).hexdigest()
    snapshot = 'source-'+identity+'.json'
    (OUT/snapshot).write_text(json.dumps(source,indent=2)+'\n')
    path = OUT/'attempts.json'
    rows = json.loads(path.read_text()) if path.exists() else []
    attempt = 1 + sum(row['label']==label for row in rows)
    logname = f'{label}-{attempt}.log'
    print('running',label,attempt,flush=True)
    start = time.monotonic()
    with (OUT/logname).open('w') as log:
        p = subprocess.run(['timeout','--signal=TERM','--kill-after=30s',str(seconds)+'s',*command],
                           cwd=ROOT,env=ENV|(extra or {}),stdout=log,stderr=subprocess.STDOUT)
    unchanged = hashes()==source
    rows.append(dict(label=label,attempt=attempt,command=command,environment=extra or {},
                     exit_code=p.returncode,external_timeout_seconds=seconds,
                     elapsed_seconds=time.monotonic()-start,source=snapshot,
                     source_unchanged=unchanged,log=logname))
    path.write_text(json.dumps(rows,indent=2)+'\n')
    print('finished',label,'exit',p.returncode,'log',logname,flush=True)
    assert unchanged, 'source changed during check'
    return p.returncode

if __name__ == '__main__':
    sys.exit(run(sys.argv[1],sys.argv[2:]))
