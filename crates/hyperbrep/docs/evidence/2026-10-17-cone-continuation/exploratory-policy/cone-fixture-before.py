"""Reproduce affected public uncertainty contracts before test migration."""
import hashlib
import json
from pathlib import Path
import sys

OUT = Path('/mnt/development/csgrs/crates/hyperbrep/docs/evidence/2026-10-17-cone-continuation')
sys.path.insert(0, str(OUT))
from check import hashes, run

source = hashes()
commands = [
    ('fixture-scalar-before', ['cargo', 'test', '--offline', '--locked', '-p', 'hyperreal', '--release', '--all-features', '--test', 'affine_polynomial_cancellation', '--test', 'quotient_polynomial_cancellation', '--no-fail-fast']),
    ('fixture-predicate-before', ['cargo', 'test', '--offline', '--locked', '-p', 'hyperlimit', '--release', '--all-features', '--test', 'point_equality', '--test', 'composite_policy', '--test', 'real_representations', '--no-fail-fast']),
    ('fixture-curve-before', ['cargo', 'test', '--offline', '--locked', '-p', 'hypercurve', '--release', '--all-features', '--test', '*', '--no-fail-fast']),
    ('fixture-solver-before', ['cargo', 'test', '--offline', '--locked', '-p', 'hypersolve', '--release', '--all-features', '--test', 'smoke', 'residual_ball_certification_preserves_approximate_policy_certainty', '--', '--exact']),
]
results = []
for label, command in commands:
    results.append(dict(label=label, exit_code=run(label, command, 1800)))
    assert hashes() == source
(OUT/'fixture-public-before-driver.json').write_text(json.dumps(dict(
    recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    source=source, commands=results,
    scope='Before migration on the current production candidate; failures retained and individually reviewed. No tests, geometry, policies or expectations changed during this run.'), indent=2)+'\n')
print(results, flush=True)
