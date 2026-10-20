"""Bind preserved checks across explicitly audited nonsemantic source changes.

BREP test-module wiring is excluded only for dependency checks that never read
it. The scalar formatting exception requires the exact reviewed before/after
digests and canonical-rustfmt equality; no mathematical edit is exempted.
"""
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT

MODULE_WIRING = {
    'crates/hyperbrep-io/tests/torus_export.rs',
    'crates/hyperbrep-io/tests/support/torus_exchange.rs',
    'crates/hyperbrep-io/tests/support/torus_input.rs',
    'crates/hyperbrep-io/tests/support/seam_export.rs',
    'crates/hyperbrep-io/tests/support/coplanar_export.rs',
    'crates/hyperbrep-io/tests/support/sector_export.rs',
    'crates/hyperbrep/tests/support/sectors.rs',
}

def admit_dependency_source(row, final):
    assert row['label'].startswith(('dependency-', 'scalar-', 'zero-factor-candidate-'))
    return admit_final_source(row, final)

def admit_final_source(row, final):
    before = json.loads((OUT / row['source']).read_text())
    differences = {p: dict(checked=before.get(p), final=final.get(p))
        for p in sorted(set(before) | set(final)) if before.get(p) != final.get(p)}
    remaining = set(differences)
    formatting = None
    owner = 'crates/hyperreal/src/computable/node/algebra.rs'
    if owner in remaining:
        review = json.loads((OUT / 'scalar-format-review.json').read_text())
        assert review.get('applied') and review['unchanged_canonical_rustfmt']
        assert differences[owner] == dict(checked=review['current_sha256'], final=review['preview_sha256'])
        formatting = dict(review='scalar-format-review.json', **differences[owner])
        remaining.remove(owner)
    if remaining:
        assert row['label'].startswith(('dependency-', 'scalar-', 'zero-factor-candidate-'))
        assert remaining <= MODULE_WIRING, (row['label'], differences)
    return dict(source=row['source'], differences=differences,
        scalar_formatting_admission=formatting,
        unconsumed_test_module_differences=sorted(remaining),
        scope='All remaining inputs match byte-for-byte. A scalar-file difference is admitted only for the reviewed removal of incidental formatting with identical canonical rustfmt output. BREP test-module wiring can differ only for dependency commands that do not consume those files; BREP consumers are requalified after their module repair. Original snapshots and every failed attempt remain retained.')
