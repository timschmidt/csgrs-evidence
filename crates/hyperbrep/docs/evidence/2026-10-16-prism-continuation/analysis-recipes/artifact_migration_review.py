"""Record every original prism artifact, including intentional carrier changes."""
from collections import Counter
import hashlib
import json
from pathlib import Path

OUT = Path(__file__).resolve().parents[1]
digest = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
rows = []
for before in sorted((OUT / 'baseline-artifacts').iterdir()):
    after = OUT / 'final-prism-artifacts' / before.name
    assert after.is_file(), before.name
    row = dict(name=before.name,
               baseline=dict(path=str(before.relative_to(OUT)), bytes=before.stat().st_size,
                             sha256=digest(before)),
               candidate=dict(path=str(after.relative_to(OUT)), bytes=after.stat().st_size,
                              sha256=digest(after)),
               unchanged=before.read_bytes() == after.read_bytes())
    if before.suffix == '.json':
        a, b = [json.loads(path.read_text()) for path in [before, after]]
        assert a['version'] == b['version']
        assert a['selection'] == b['selection'] == dict(parameters=[], point_sources=[], pcurve_sources=[])
        topology = ['vertices', 'curves', 'pcurves', 'surfaces', 'edges', 'edge_uses',
                    'wires', 'faces', 'shells', 'solids']
        for side, value in [('baseline', a), ('candidate', b)]:
            row[side]['counts'] = {key: len(value[key]) for key in topology}
            row[side]['carrier_tags'] = {
                key: dict(Counter(next(iter(item)) for item in value[key]))
                for key in ['curves', 'surfaces']}
        assert len(a['solids']) == len(b['solids'])
        row['source_evidence_scope'] = (
            'The saved selection tables are empty on both sides. Native support/domain '
            'and incidence data remain subject to full replay validation. The live '
            'CurveRegion2 remains the authoring authority; no general durable '
            'Boolean input-lineage claim is established by these empty tables.')
    if row['unchanged']:
        row['reason'] = 'Original artifact bytes are preserved.'
    elif before.name.startswith('cylinder-'):
        assert before.suffix == '.json'
        row['reason'] = (
            'The certified circular image formerly stored as four rational Bezier '
            'cap curves now retains four native circular carriers. Their archive '
            'tag is EllipseArc; the public exact representation is CircleArc. '
            'Spatial domains and cap integrals survive splitting and replay.')
    else:
        assert before.name.startswith(('box-cover-', 'ring-cover-', 'strip-cover-'))
        row['reason'] = (
            'Contained-slab difference now materializes the same planar set through '
            'native profile extrusion. Side surfaces change from Plane to exact '
            'line Extrusion and STEP maps them back to planes with explicit affine '
            'charts. Surface sharing/entity order can change; this is an explicit '
            'representation migration, not a performance-only artifact waiver.')
    row['independent_semantic_checks'] = (
        'crates/hyperbrep/tests/support/prisms.rs and '
        'crates/hyperbrep-io/tests/support/prism_export.rs retain dimensional volume '
        'and area formulae, exact material-point expectations, full validation, '
        'archive replay and continued operations. The four old planar STEP files '
        'are permanent fixtures reimported beside new exports. '
        'analytic_export.rs independently interprets emitted charts and normals; '
        'prism-occt.json is an additional floating-point interoperability check.')
    rows.append(row)
assert len(rows) == 10
assert sum(row['unchanged'] for row in rows) == 3
report = dict(rows=rows, unchanged=3, explicit_migrations=7,
              scope='Every existing prism artifact is retained with old/new hashes and sizes. '
                    'Metadata and checksums are not independent set-equality proofs. '
                    'The separate 22-artifact preceding STEP corpus stays byte-identical.')
(OUT / 'representation-migrations.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(dict(artifacts=len(rows), unchanged=3, explicit_migrations=7)))
