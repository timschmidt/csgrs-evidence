"""Reproduce and prove the one intentional archive-expression migration."""
import hashlib
import io
import json
from pathlib import Path
import shutil
import subprocess
import tarfile

from check import ENV, OUT, ROOT, run

baseline = 'e8c1b6e14daf0a93350bb421dfe76b8bbc684787'
checkout = Path('/tmp/hyperbrep-seam-receipt-source')
checkout.mkdir(exist_ok=False)
data = subprocess.check_output(['git', 'archive', baseline, 'crates/hyperbrep/src',
                                'crates/hyperbrep/Cargo.toml', 'crates/hyperbrep/README.md'], cwd=ROOT)
with tarfile.open(fileobj=io.BytesIO(data)) as archive:
    archive.extractall(checkout, filter='data')
crate = checkout / 'crates/hyperbrep'
manifest = (crate / 'Cargo.toml').read_text().split('[[bench]]')[0]
manifest = manifest.replace('path = "../hyper', 'path = "/mnt/development/csgrs/crates/hyper')
manifest += '\n[workspace]\n'
(crate / 'Cargo.toml').write_text(manifest)
(crate / 'examples').mkdir()
shutil.copyfile(OUT / 'receipt-migration.rs.txt', crate / 'examples/receipt_migration.rs')
shutil.copyfile(ROOT / 'Cargo.lock', crate / 'Cargo.lock')
candidate = Path('/tmp/hyperbrep-analytic-similarity-wasm-probe')
shutil.copyfile(OUT / 'receipt-migration.rs.txt', candidate / 'examples/receipt_migration.rs')
assert subprocess.run(['cargo', 'generate-lockfile', '--offline', '--manifest-path', str(crate / 'Cargo.toml')],
                      cwd=ROOT, env=ENV).returncode == 0
shutil.copyfile(crate / 'Cargo.toml', OUT / 'receipt-baseline-Cargo.toml.txt')
shutil.copyfile(crate / 'Cargo.lock', OUT / 'receipt-baseline-Cargo.lock')
sources = {str(path.relative_to(crate)): hashlib.sha256(path.read_bytes()).hexdigest()
           for path in sorted((crate / 'src').rglob('*.rs'))}
(OUT / 'receipt-baseline-source.json').write_text(json.dumps(dict(revision=baseline, source=sources,
    setup='Pinned baseline BREP sources with only dependency paths made absolute and unused bench manifests omitted. Dependencies use the unchanged current surrounding crates. This is a semantic archive probe, not a timed benchmark.'), indent=2)+'\n')
for label, directory, arguments in [
    ('receipt-baseline', crate, ['emit', str(OUT / 'radical-baseline.json')]),
    ('receipt-candidate', candidate, ['emit', str(OUT / 'radical-candidate.json')]),
    ('receipt-equality', candidate, ['compare', str(OUT / 'radical-baseline.json'),
                                   str(OUT / 'radical-candidate.json'), str(OUT / 'receipt-migration.json')]),
]:
    command = ['cargo', 'run', '--offline', '--locked', '--release', '--manifest-path',
               str(directory / 'Cargo.toml'), '--example', 'receipt_migration', '--', *arguments]
    if run(label, command): raise SystemExit(1)
