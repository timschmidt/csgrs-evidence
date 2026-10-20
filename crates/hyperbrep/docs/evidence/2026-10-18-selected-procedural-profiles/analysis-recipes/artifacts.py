"""Complete native and STEP materialization in fresh processes; compare prior artifacts."""
import hashlib
import json
from pathlib import Path
import shutil
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, ENV, hashes, run
from format_comparison import compare

source = hashes()
sha = lambda p: hashlib.sha256(Path(p).read_bytes()).hexdigest()
M = OUT.parent/'2026-10-18-retained-plane-contacts'
F = OUT.parent/'2026-10-18-spline-exchange'
I = OUT.parent/'2026-10-18-native-boundary-images'
binaries = json.loads((OUT/'consumers.json').read_text())['binaries']
project = F/'final-review/artifact-project'
inputs = {str(p):sha(p) for p in [Path(__file__), *project.glob('*')] if p.is_file()}
def checked(label, command, extra=None):
    assert run(label, command, 900, extra) == 0, label
    assert hashes() == source and all(sha(p) == h for p, h in inputs.items())
checked('prior-spline-artifacts-build', ['cargo', 'build', '--offline', '--locked', '--release', '--manifest-path', str(project/'Cargo.toml')])
path = Path('/tmp/hyperbrep-selected-procedural-v1-spline-artifacts')
assert not path.exists()
shutil.copy2(Path(ENV['CARGO_TARGET_DIR'])/'release/hyperbrep-spline-exchange-artifacts', path)
binary = dict(path=str(path), sha256=sha(path), bytes=path.stat().st_size)
rows = []
for suffix in ['artifacts', 'repeat']:
    checked('selected-'+suffix, [binaries['selected_native']['path'], 'artifacts', str(OUT/('selected-'+suffix))])
    new = OUT/('measurement-'+suffix)
    checked('measurement-'+suffix, [binaries['measurement_native']['path'], 'all'], {'HYPERBREP_MEASUREMENT_EXPORT_DIR': str(new)})
    checked('prior-spline-'+suffix, [str(path), str(OUT/('spline-'+suffix))])
    checked('prior-image-'+suffix, [binaries['images_native']['path'], 'artifacts', str(OUT/('image-'+suffix))])
for kind, count, previous in [('selected', 48, M/'selected-artifacts'), ('measurement', 12, M/'measurement-artifacts'), ('spline', 58, M/'spline-artifacts'), ('image', 8, M/'image-artifacts')]:
    first = OUT/(kind+'-artifacts')
    repeat = OUT/(kind+'-repeat')
    names = sorted(p.name for p in first.iterdir())
    assert len(names) == count and names == sorted(p.name for p in repeat.iterdir()), kind
    for name in names:
        a, b = first/name, repeat/name
        assert a.read_bytes() == b.read_bytes(), name
        if previous:
            compare(previous/name, a)
        rows.append(dict(path=str(a.relative_to(OUT)), repeat=str(b.relative_to(OUT)),
                         baseline=str((previous/name).relative_to(ROOT)) if previous else None,
                         sha256=sha(a), bytes=a.stat().st_size))
assert hashes() == source and sha(path) == binary['sha256']
(OUT/'artifacts.json').write_text(json.dumps(dict(source=source, inputs=inputs, binary=binary, rows=rows,
    new=0, preserved=126, fresh_processes=2, scope='Deterministic serialization is separate from the full independent exact assertions executed by each consumer.'), indent=2)+'\n')

for suffix in ['artifacts', 'repeat']:
    checked('parallel-'+suffix, [binaries['parallel_native']['path'], 'all'], {'HYPERBREP_PARALLEL_ARCHIVE_DIR': str(OUT/('parallel-'+suffix))})
first=OUT/'parallel-artifacts';repeat=OUT/'parallel-repeat'
files=sorted(first.glob('*.json'))
assert files and [p.name for p in files]==sorted(p.name for p in repeat.glob('*.json'))
new=[]
for p in files:
    assert p.read_bytes()==(repeat/p.name).read_bytes()
    new.append(dict(path=str(p.relative_to(OUT)),repeat=str((repeat/p.name).relative_to(OUT)),sha256=sha(p),bytes=p.stat().st_size))
(OUT/'parallel-artifacts.json').write_text(json.dumps(dict(source=source, rows=new, fresh_processes=2),indent=2)+'\n')

for row in new:
    compare(M/row['path'], OUT/row['path'])
for suffix in ['artifacts','repeat']:
    checked('planar-'+suffix,[binaries['planar_native']['path'],'all'],{'HYPERBREP_PLANAR_LIFT_ARTIFACT_DIR':str(OUT/('planar-'+suffix))})
files=sorted((OUT/'planar-artifacts').glob('*.json'))
assert files and [p.name for p in files]==sorted(p.name for p in (OUT/'planar-repeat').glob('*.json'))
rows=[]
for p in files:
    repeat=OUT/'planar-repeat'/p.name
    assert p.read_bytes()==repeat.read_bytes()
    rows.append(dict(path=str(p.relative_to(OUT)),repeat=str(repeat.relative_to(OUT)),sha256=sha(p),bytes=p.stat().st_size))
(OUT/'planar-artifacts.json').write_text(json.dumps(dict(source=source,rows=rows,fresh_processes=2),indent=2)+'\n')

for row in rows:
    compare(M/row['path'], OUT/row['path'])
for suffix in ['artifacts','repeat']:
    checked('selected-planar-'+suffix,[binaries['selected_planar_native']['path'],'all'],{'HYPERBREP_SELECTED_PLANAR_ARTIFACT_DIR':str(OUT/('selected-planar-'+suffix))})
files=sorted((OUT/'selected-planar-artifacts').glob('*.json'))
assert files and [p.name for p in files]==sorted(p.name for p in (OUT/'selected-planar-repeat').glob('*.json'))
rows=[]
for p in files:
    repeat=OUT/'selected-planar-repeat'/p.name
    assert p.read_bytes()==repeat.read_bytes()
    rows.append(dict(path=str(p.relative_to(OUT)),repeat=str(repeat.relative_to(OUT)),sha256=sha(p),bytes=p.stat().st_size))
(OUT/'selected-planar-artifacts.json').write_text(json.dumps(dict(source=source,rows=rows,fresh_processes=2),indent=2)+'\n')

for row in rows:
    compare(M/row['path'], OUT/row['path'])
for suffix in ['artifacts','repeat']:
    checked('plane-contact-'+suffix,[binaries['contacts_native']['path'],'all'],{'HYPERBREP_PLANE_CONTACT_ARTIFACT_DIR':str(OUT/('plane-contact-'+suffix))})
files=sorted((OUT/'plane-contact-artifacts').glob('*.json'))
assert len(files)==18 and [p.name for p in files]==sorted(p.name for p in (OUT/'plane-contact-repeat').glob('*.json'))
rows=[]
for p in files:
    repeat=OUT/'plane-contact-repeat'/p.name
    assert p.read_bytes()==repeat.read_bytes()
    rows.append(dict(path=str(p.relative_to(OUT)),repeat=str(repeat.relative_to(OUT)),sha256=sha(p),bytes=p.stat().st_size))
(OUT/'plane-contact-artifacts.json').write_text(json.dumps(dict(source=source,rows=rows,fresh_processes=2),indent=2)+'\n')

for row in rows:
    compare(M/row['path'], OUT/row['path'])
for suffix in ['artifacts','repeat']:
    checked('selected-procedural-'+suffix,[binaries['new_native']['path'],'all'],{'HYPERBREP_SELECTED_PROCEDURAL_ARTIFACT_DIR':str(OUT/('selected-procedural-'+suffix))})
files=sorted((OUT/'selected-procedural-artifacts').glob('*.json'))
assert files and [p.name for p in files]==sorted(p.name for p in (OUT/'selected-procedural-repeat').glob('*.json'))
rows=[]
for p in files:
    repeat=OUT/'selected-procedural-repeat'/p.name
    assert p.read_bytes()==repeat.read_bytes()
    rows.append(dict(path=str(p.relative_to(OUT)),repeat=str(repeat.relative_to(OUT)),sha256=sha(p),bytes=p.stat().st_size))
(OUT/'selected-procedural-artifacts.json').write_text(json.dumps(dict(source=source,rows=rows,fresh_processes=2),indent=2)+'\n')

# Audit every prior artifact once, retaining each field-level schema change.
rows=[]
for ledger in ['artifact-comparison.json','artifacts.json','parallel-artifacts.json','planar-artifacts.json','selected-planar-artifacts.json','plane-contact-artifacts.json']:
    for row in json.loads((M/ledger).read_text())['rows']:
        rows.append(dict(path=row['path'], **compare(M/row['path'], OUT/row['path'])))
assert len(rows)==450 and len({row['path'] for row in rows})==450
(OUT/'format-migration.json').write_text(json.dumps(dict(source=source,rows=rows,scope='All 450 baseline artifacts: exact bytes except the explicitly verified v9/v10 header and source-chart coefficient representation. Full independent geometry expectations run in native/WASM consumers; this field audit alone is not a set-equality oracle.'),indent=2)+'\n')
