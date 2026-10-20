"""Apply reviewed test-only migrations after the frozen baseline run finished."""
import hashlib
import json
from pathlib import Path
import shutil

ROOT = Path('/mnt/development/csgrs')
OUT = ROOT / 'crates/hyperbrep/docs/evidence/2026-10-17-cone-continuation'
baseline = json.loads((OUT / 'fixture-public-before-driver.json').read_text())
assert [r['exit_code'] for r in baseline['commands']] == [101, 101, 101, 0]
sha = lambda data: hashlib.sha256(data).hexdigest()
changes = {}
for directory in [OUT / 'exploratory-policy/planned-updates', Path('/tmp/hyperbrep-cone-public-proposals')]:
    for row in json.loads((directory / 'proposal.json').read_text())['files']:
        relative = row['path']
        before, after = (ROOT / relative).read_bytes(), (directory / relative).read_bytes()
        assert sha(before) == row['before'] == baseline['source'][relative]
        assert sha(after) == row['after']
        assert relative not in changes
        changes[relative] = (before, after)

prototypes = {
    'crates/hyperbrep/tests/support/edge_image_queries.rs': '/tmp/hyperbrep-cone-edge-image-migration.rs',
    'crates/hyperreal/tests/affine_polynomial_cancellation.rs': '/tmp/hyperbrep-cone-affine-migration.rs',
    'crates/hyperreal/tests/quotient_polynomial_cancellation.rs': '/tmp/hyperbrep-cone-quotient-migration-v2.rs',
    'crates/hyperlimit/tests/point_equality.rs': '/tmp/hyperbrep-cone-point-equality-migration.rs',
    'crates/hyperlimit/tests/composite_policy.rs': '/tmp/hyperbrep-cone-composite-migration.rs',
}
for relative, source in prototypes.items():
    before = (ROOT / relative).read_bytes()
    assert sha(before) == baseline['source'][relative]
    assert relative not in changes
    changes[relative] = (before, Path(source).read_bytes())
assert len(changes) == 36

records = []
for relative, (before, after) in changes.items():
    (ROOT / relative).write_bytes(after)
    records.append(dict(path=relative, before=sha(before), proposed=sha(after)))

retained = OUT / 'exploratory-policy'
for name in ['prepare-cone-fixture-migration.py', 'prepare-cone-public-migration.py', 'apply-cone-fixture-migration.py']:
    shutil.copy2(Path('/tmp') / name, retained / name)
shutil.copytree('/tmp/hyperbrep-cone-public-proposals', retained / 'public-proposals')
(OUT / 'fixture-migration-application.json').write_text(json.dumps(dict(
    files=records, original_source=baseline['source'],
    scope='Explicit synthetic uncertainty-fixture migration. Every original identity constructor is retained as a newly certified positive case; the exact angle-addition zero retains all existing unresolved, terminal-policy and cache assertions. No test is removed, ignored, reduced in resolution or weakened to accept multiple outcomes. The unchanged solver smoke, pre-aborted and structural-fact fixtures are not migrated.'), indent=2)+'\n')

# Prepare non-test inputs before final source-bound qualification.
assert sha((ROOT / 'crates/hyperbrep/README.md').read_bytes()) == baseline['source']['crates/hyperbrep/README.md']
shutil.copy2('/tmp/hyperbrep-cone-readme.md', ROOT / 'crates/hyperbrep/README.md')
shutil.copy2('/tmp/hyperbrep-cone-qualify.py', OUT / 'analysis-recipes/qualify.py')
shutil.copytree('/tmp/hyperbrep-cone-final-review', OUT / 'final-review')
print('applied', len(records), 'reviewed test-file migrations')
