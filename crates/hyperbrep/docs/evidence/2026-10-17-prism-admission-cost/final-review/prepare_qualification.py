"""Keep the preceding full qualification domain and pin all external inputs."""
import hashlib
import json
from pathlib import Path

OUT = Path(__file__).resolve().parents[1]
OLD = OUT.parent / '2026-10-17-axial-shells'
DEST = OUT / 'final-review'

def recipe(name, changes=()):
    text = (OLD/'final-review'/name).read_text()
    for before, after in changes:
        assert before in text, (name, before)
        text = text.replace(before, after)
    target = DEST/name
    assert not target.exists()
    target.write_text(text)

inputs = json.loads((OLD/'external-inputs.json').read_text())
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest() == h for p, h in inputs.items())
(OUT/'external-inputs.json').write_text(json.dumps(inputs, indent=2)+'\n')
recipe('qualify.py', [
    ('Qualification of the final BREP axial-shell source and its real consumers.',
     'Qualification of the prism relation optimization and unchanged complete consumers.'),
    (" ('axial-chart-debug'", " ('plane-relation-debug',['cargo','test',*C,'-p','hyperbrep','--lib','geometry::planes::tests'],{},900),\n ('axial-chart-debug'"),
])
recipe('finish_checks.py', [('hyperbrep-axial-shell-final.wasm', 'hyperbrep-prism-cost-final.wasm')])
recipe('consumer.py', [('hyperbrep-axial-shell-consumer-final', 'hyperbrep-prism-cost-consumer-final')])
recipe('previous_axial.py', [('hyperbrep-axial-shell-previous-axial', 'hyperbrep-prism-cost-previous-axial')])
recipe('components.py', [
    ("assert run('components-lock',['cargo','generate-lockfile','--offline','--manifest-path',str(PROJECT/'Cargo.toml')])==0\n(OUT/'final-review/components-Cargo.lock').write_bytes((PROJECT/'Cargo.lock').read_bytes())",
     "assert (PROJECT/'Cargo.lock').read_bytes()==(OUT/'final-review/components-Cargo.lock').read_bytes()"),
    ('hyperbrep-axial-shell-components-consumer', 'hyperbrep-prism-cost-components-consumer'),
])
for name in ['components-Cargo.toml', 'components-Cargo.lock', 'region_components.rs']:
    recipe(name)
recipe('old_path.py', [
    ('hyperbrep-axial-shell-old-path-control', 'hyperbrep-prism-cost-old-path-control'),
    ("baseline=json.loads((OLD/'candidate-consumer-outcomes.json').read_text())",
     "BASE=OUT.parent/'2026-10-17-axial-shells'\nbaseline=json.loads((BASE/'old-path-control.json').read_text())"),
    ("(OLD/'candidate-artifacts')", "(BASE/'old-path-artifacts')"),
    ('# Compare separately: native carrier specialization intentionally changes archive bytes.',
     'assert current.read_bytes()==old.read_bytes(), old'),
])
recipe('continuation.py', [
    ("OLD = OUT.parent/'2026-10-17-cone-continuation'", "OLD = OUT.parent/'2026-10-17-cone-continuation'\nBASE = OUT.parent/'2026-10-17-axial-shells'"),
    ('hyperbrep-axial-shell-final-', 'hyperbrep-prism-cost-final-'),
    ("OUT.parent/'2026-10-17-region-extrusion/continuation-frontier.json'", "BASE/'continuation-frontier.json'"),
    ('(OLD/directory)', '(BASE/directory)'),
    ('# Native carrier migration is reviewed explicitly in preserved-artifacts.json.',
     "assert all(row['unchanged'] for row in artifacts)"),
    ('Original 24-slot prism outcomes and intentional native-carrier artifact migrations are reviewed separately.',
     'All 24 original prism results and all final artifacts must remain unchanged.'),
])
for name in ['prism_occt.py', 'axial_shell_occt.py', 'previous_axial_occt.py',
             'components_occt.py', 'occt_cones.py', 'torus_occt.py', 'occt_read.py', 'measure.py']:
    recipe(name)
recipe('benchmark.py', [
    ('Matched full preceding corpora plus absolute completed axial-exchange cost.',
     'Matched complete-domain cost campaign; every original receipt is mandatory.'),
    ("old=read('baseline-benchmark-binaries.json')['executables']", "old=read('baseline.json')['current']"),
    ("'candidate-benchmark-binaries.json'", "'relation-benchmark-binaries.json'"),
    ("assert set(old)==set(new)-{'axial_shell_exchange'}", "assert set(old)==set(new) and len(old)==22\nassert read('finish-checks.json')['passed'] and read('finish-checks.json')['source']==source"),
    ('Three alternating paired fresh processes per preserved corpus; three candidate processes for the new complete workflow.',
     'Three alternating paired fresh processes per complete unchanged corpus.'),
    ("    print('complete',kind", "    assert not migrations,migrations\n    print('complete',kind"),
    ('representation_migration=True', 'representation_migration=False'),
    ('# Intentional native-carrier/STEP migrations are reviewed separately; retain all raw receipt differences.',
     "assert not migrations and len(commands)==132 and len(all_costs)==192"),
])
(OUT/'qualification-recipes.json').write_text(json.dumps(dict(
    source=str(OLD/'final-review'),
    inputs=inputs,
    recipes={str(p.relative_to(OUT)):hashlib.sha256(p.read_bytes()).hexdigest()
             for p in sorted(DEST.glob('*')) if p.is_file()},
    scope='Identical complete fixtures, locks, assertions and materialization; new temporary executable names prevent overwriting prior qualified artifacts.'
), indent=2)+'\n')
