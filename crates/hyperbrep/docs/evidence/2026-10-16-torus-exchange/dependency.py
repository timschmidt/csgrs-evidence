"""Reproduce the necessary scalar dependency baseline and retain its checks.

The original 17 BREP benchmark binaries predate the feature. This additional
baseline is reconstructed after discovery of the scalar blocker by restoring
only its owning production file to HEAD, leaving the new regression tests in
place. A finally block always restores the candidate. Run no other builds or
source mutations concurrently. All comparisons use the same toolchain/flags.
"""
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import sys
from check import OUT, ROOT, run

BASE = 'fa541102c93c617cdef28faa0e5451fd0c0c8d25'
OWNER = Path('crates/hyperreal/src/computable/node/algebra.rs')
PHASE = sys.argv[1]
assert PHASE in ('baseline', 'candidate')
CARGO = ['cargo', 'test', '--offline', '--locked', '--release', '--all-features',
         '-p', 'hyperreal', '-p', 'hyperlimit', '-p', 'hypersolve', '-p', 'hypercurve',
         '--lib', '--no-fail-fast']
BUILD = ['cargo', 'build', '--offline', '--locked', '--release',
         '--no-default-features', '--features', 'hyperreal/serde',
         '-p', 'hyperreal', '-p', 'hyperlimit', '--bench', 'scalar_micro',
         '--bench', 'predicates', '--message-format=json']

candidate = (ROOT / OWNER).read_bytes()
backup = Path('/tmp/hyperbrep-torus-algebra-candidate.rs')
backup.write_bytes(candidate)
try:
    if PHASE == 'baseline':
        (ROOT / OWNER).write_bytes(subprocess.check_output(
            ['git', 'show', f'{BASE}:{OWNER}'], cwd=ROOT))
    failures = []
    if run(f'dependency-{PHASE}', CARGO, 1800):
        failures.append('library-tests')
    if run(f'dependency-{PHASE}-build', BUILD, 1200):
        raise SystemExit('dependency benchmark build failed')
    attempt = json.loads((OUT / 'attempts.json').read_text())[-1]
    executables = {}
    for line in (OUT / attempt['log']).read_text().splitlines():
        if not line.startswith('{'):
            continue
        item = json.loads(line)
        if item.get('reason') != 'compiler-artifact' or item['target']['kind'] != ['bench']:
            continue
        name = item['target']['name']
        path = Path('/tmp') / f'hyperbrep-torus-dependency-{PHASE}-{name}'
        if path.exists():
            assert path.read_bytes() == Path(item['executable']).read_bytes(), path
        else:
            shutil.copy2(item['executable'], path)
        executables[name] = dict(path=str(path), bytes=path.stat().st_size,
                                sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
                                features=item['features'])
    assert set(executables) == {'scalar_micro', 'predicates'}
    (OUT / f'dependency-{PHASE}-binaries.json').write_text(json.dumps(dict(
        owner=str(OWNER), production_baseline=BASE, phase=PHASE,
        build=attempt, executables=executables, test_failures=failures,
        reconstructed_baseline=PHASE == 'baseline',
    ), indent=2) + '\n')
    print('dependency phase complete; test failures:', failures, flush=True)
finally:
    (ROOT / OWNER).write_bytes(candidate)
    assert (ROOT / OWNER).read_bytes() == backup.read_bytes()
