"""Reproduce the inherited debug-only zero-factor failure on both revisions."""
from pathlib import Path
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import ROOT, run

owner = ROOT / 'crates/hyperreal/src/computable/node/algebra.rs'
candidate = owner.read_bytes()
base = 'fa541102c93c617cdef28faa0e5451fd0c0c8d25'
backup = Path('/tmp/hyperbrep-torus-zero-factor-candidate.rs')
backup.write_bytes(candidate)
try:
    for phase in ['baseline', 'candidate']:
        owner.write_bytes(candidate if phase == 'candidate' else subprocess.check_output(
            ['git', 'show', f'{base}:crates/hyperreal/src/computable/node/algebra.rs'], cwd=ROOT))
        for features in [[], ['--all-features']]:
            label = f'zero-factor-{phase}-' + ('all-features' if features else 'default')
            result = run(label, ['cargo', 'test', '--offline', '--locked', '-p', 'hyperreal',
                *features, '--test', 'determinant_product_cancellation',
                'other_arities_keep_their_mathematical_values', '--', '--exact'], 600)
            assert result == 101, (label, result)
finally:
    owner.write_bytes(candidate)
    assert owner.read_bytes() == backup.read_bytes()
