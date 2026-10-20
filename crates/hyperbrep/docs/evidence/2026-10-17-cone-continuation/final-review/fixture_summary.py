"""Audit explicit positive-proof and unresolved-control fixture migrations."""
import hashlib
import json
from pathlib import Path
import re
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes
from source_binding import admit

read = lambda p: json.loads((OUT / p).read_text())
attempts = read('attempts.json')
latest = lambda label: next(r for r in reversed(attempts) if r['label'] == label)
source = hashes()


def outcomes(row):
    result = {}
    target = None
    for line in (OUT / row['log']).read_text().splitlines():
        running = re.search(r'Running (?:unittests|tests/\S+\.rs) .*?/(\w+)-[0-9a-f]+\)', line)
        if running:
            target = running[1]
        status = re.fullmatch(r'test (\S+)(?: - should panic)? \.\.\. (ok|FAILED|ignored)(?:, .*)?', line)
        if status:
            assert target, line
            name = target+'::'+status[1]
            assert name not in result, name
            result[name] = status[2]
    assert result
    return result


comparisons = {}
for before_label, after_label in [
    ('dependency-libraries', 'dependency-libraries'),
    ('fixture-scalar-before', 'fixture-scalar-all-features'),
    ('fixture-predicate-before', 'fixture-predicate-all-features'),
    ('fixture-curve-before', 'fixture-curve-all-features'),
    ('fixture-solver-before', 'fixture-solver-smoke'),
]:
    before = next(r for r in attempts if r['label'] == before_label and r['source_unchanged'])
    after = latest(after_label)
    assert after['exit_code'] == 0
    binding = admit(after, source)
    old, new = outcomes(before), outcomes(after)
    renamed = {
        'affine_polynomial_cancellation::an_unproved_trigonometric_relation_is_not_a_ring_proof': 'affine_polynomial_cancellation::unit_circle_proofs_preserve_offsets_and_unproved_angle_addition',
        'quotient_polynomial_cancellation::an_unproved_zero_denominator_keeps_its_typed_failure': 'quotient_polynomial_cancellation::proved_and_unproved_zero_denominators_keep_typed_failures',
    }
    mapped = {renamed.get(name, name): status for name, status in old.items()}
    assert set(mapped) <= set(new)
    for name, status in mapped.items():
        assert new[name] == ('ok' if status == 'FAILED' else status), (name, status, new[name])
    added = {name: status for name, status in new.items() if name not in mapped}
    if before_label == 'fixture-predicate-before':
        assert set(added) == {
            'point_equality::original_unit_circle_points_now_have_certified_equality_and_order',
            'composite_policy::original_unit_circle_inputs_now_produce_certified_composite_reports',
        }
        assert all(status == 'ok' for status in added.values())
    else:
        assert not added, added
    comparisons[before_label] = dict(before=before, after=after, source_admission=binding,
        before_outcomes=old, after_outcomes=new, added=added,
        failed_expectations_migrated=[name for name, status in old.items() if status == 'FAILED'])

application = read('fixture-migration-application.json')
for row in application['files']:
    assert hashlib.sha256((ROOT / row['path']).read_bytes()).hexdigest() == row['formatted'], row['path']
assert len(application['files']) == 36
assert len(comparisons['dependency-libraries']['failed_expectations_migrated']) == 111
assert len(comparisons['fixture-curve-before']['failed_expectations_migrated']) == 31
edge = latest('native-release')
assert edge['exit_code'] == 0
admit(edge, source)
assert 'test image_query_keeps_unresolved_proofs_strict_across_policy_reuse ... ok' in (OUT / edge['log']).read_text()
result = dict(admitted=True, source=source, comparisons=comparisons, application=application,
    native_edge_image=edge, recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    original_identity='sin(e)^2 + cos(e)^2 - 1 = 0, with the corresponding one-valued fixture preserved where used',
    independent_terminal_control='sin(e+1) - sin(e)*cos(1) - cos(e)*sin(1) = 0 by angle addition; currently unresolved in the admitted normal form',
    scope='Explicit representation-capability migration of synthetic uncertainty fixtures, not unchanged-input performance evidence. Original constructors are retained as positive proof cases; public edge-image, scalar, point, ray/halfspace, opaque sign and marching-grid outcomes also retain the original modeled inputs with stronger certified expectations. All old terminal-policy and cache assertions remain on a separate exact zero, with unchanged geometry, policies, resolution and failure semantics. Passing pre-aborted, structural-fact and solver residual-ball fixtures remain unchanged.')
(OUT / 'uncertainty-fixture-migration.json').write_text(json.dumps(result, indent=2)+'\n')
print('admitted fixture migrations:', {k: len(v['failed_expectations_migrated']) for k,v in comparisons.items()})
