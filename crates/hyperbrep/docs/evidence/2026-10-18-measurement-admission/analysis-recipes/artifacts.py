"""Complete native and STEP materialization in fresh processes; compare prior artifacts."""
import hashlib
import json
from pathlib import Path
import shutil
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, ENV, hashes, run

source = hashes()
sha = lambda p: hashlib.sha256(Path(p).read_bytes()).hexdigest()
F = OUT.parent/'2026-10-18-spline-exchange'
I = OUT.parent/'2026-10-18-native-boundary-images'
binaries = json.loads((OUT/'consumers.json').read_text())['binaries']
project = F/'final-review/artifact-project'
inputs = {str(p):sha(p) for p in [Path(__file__), *project.glob('*')] if p.is_file()}
def checked(label, command, extra=None):
    assert run(label, command, 900, extra) == 0, label
    assert hashes() == source and all(sha(p) == h for p, h in inputs.items())
checked('prior-spline-artifacts-build', ['cargo', 'build', '--offline', '--locked', '--release', '--manifest-path', str(project/'Cargo.toml')])
path = Path('/tmp/hyperbrep-measurement-admission-spline-artifacts')
assert not path.exists()
shutil.copy2(Path(ENV['CARGO_TARGET_DIR'])/'release/hyperbrep-spline-exchange-artifacts', path)
binary = dict(path=str(path), sha256=sha(path), bytes=path.stat().st_size)
rows = []
for suffix in ['artifacts', 'repeat']:
    new = OUT/('measurement-'+suffix)
    checked('measurement-'+suffix, [binaries['new_native']['path'], 'all'], {'HYPERBREP_MEASUREMENT_EXPORT_DIR': str(new)})
    checked('prior-spline-'+suffix, [str(path), str(OUT/('spline-'+suffix))])
    checked('prior-image-'+suffix, [binaries['images_native']['path'], 'artifacts', str(OUT/('image-'+suffix))])
for kind, count, previous in [('measurement', 12, None), ('spline', 58, F/'spline-artifacts'), ('image', 8, I/'new-native-artifacts')]:
    first = OUT/(kind+'-artifacts')
    repeat = OUT/(kind+'-repeat')
    names = sorted(p.name for p in first.iterdir())
    assert len(names) == count and names == sorted(p.name for p in repeat.iterdir()), kind
    for name in names:
        a, b = first/name, repeat/name
        assert a.read_bytes() == b.read_bytes(), name
        if previous:
            assert a.read_bytes() == (previous/name).read_bytes(), name
        rows.append(dict(path=str(a.relative_to(OUT)), repeat=str(b.relative_to(OUT)),
                         baseline=str((previous/name).relative_to(ROOT)) if previous else None,
                         sha256=sha(a), bytes=a.stat().st_size))
assert hashes() == source and sha(path) == binary['sha256']
(OUT/'artifacts.json').write_text(json.dumps(dict(source=source, inputs=inputs, binary=binary, rows=rows,
    new=12, preserved=66, fresh_processes=2, scope='Deterministic serialization is separate from the full independent exact assertions executed by each consumer.'), indent=2)+'\n')
