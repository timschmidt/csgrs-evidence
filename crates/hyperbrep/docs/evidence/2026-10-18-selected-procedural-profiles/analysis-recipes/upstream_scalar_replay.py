"""Isolate upstream integration from the pending BRep feature, using committed bytes."""
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import ENV, OUT, ROOT, hashes, run

revision = '75b4aa7ab4cf1f28d928c9c018edcc5de4bcb081'
destination = Path('/tmp/hyperbrep-upstream-only-scalar-replay')
assert not destination.exists()
destination.mkdir()
crates = {'hyperbrep', 'hyperbrep-io', 'hypercurve', 'hyperreal',
          'hyperlimit', 'hyperlattice', 'hypersolve', 'hypertri'}
project = 'crates/hyperbrep/docs/evidence/2026-10-18-selected-planar-images/consumer-project'
tree = subprocess.check_output(['git', 'ls-tree', '-rz', revision], cwd=ROOT)
entries = []
for entry in tree.split(b'\0'):
    if not entry:
        continue
    meta, name = entry.split(b'\t', 1)
    mode, kind, oid = meta.decode().split()
    name = name.decode()
    parts = Path(name).parts
    if name.startswith(project + '/') or (
        len(parts) > 2 and parts[0] == 'crates' and parts[1] in crates
        and 'evidence' not in parts
    ):
        assert kind == 'blob' and mode in ['100644', '100755'], (name, mode, kind)
        entries.append((name, oid))
files = {}
reader = subprocess.Popen(['git', 'cat-file', '--batch'], cwd=ROOT,
                          stdin=subprocess.PIPE, stdout=subprocess.PIPE)
for name, oid in entries:
    reader.stdin.write((oid + '\n').encode())
    reader.stdin.flush()
    header = reader.stdout.readline().decode().split()
    assert header[0] == oid and header[1] == 'blob'
    data = reader.stdout.read(int(header[2]))
    assert reader.stdout.read(1) == b'\n'
    path = destination / name
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(data)
    files[name] = hashlib.sha256(data).hexdigest()
reader.stdin.close()
assert reader.wait() == 0
source = hashes()
report = dict(revision=revision, destination=str(destination), files=files,
              source=source, scope='Committed pre-feature BRep with merged upstream corrections. '
              'The standalone consumer owns its workspace; all copied crate bytes are unchanged.')
(OUT/'upstream-only-scalar-inputs.json').write_text(json.dumps(report, indent=2)+'\n')
assert run('upstream-only-scalar-build', ['cargo', 'build', '--offline', '--locked',
    '--release', '--manifest-path', str(destination/project/'Cargo.toml')], 1200) == 0
binary = Path('/tmp/hyperbrep-upstream-only-scalar-consumer')
assert not binary.exists()
shutil.copy2(Path(ENV['CARGO_TARGET_DIR'])/'release/hyperbrep-selected-planar-consumer', binary)
report['binary'] = dict(path=str(binary), sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),
                        bytes=binary.stat().st_size)
assert run('upstream-only-scalar-run', [str(binary), 'all'], 900,
           {'HYPERBREP_SELECTED_PLANAR_ARTIFACT_DIR': str(OUT/'upstream-only-scalar-artifacts')}) == 0
assert hashes() == source
assert all(hashlib.sha256((destination/name).read_bytes()).hexdigest() == digest
           for name, digest in files.items())
(OUT/'upstream-only-scalar-inputs.json').write_text(json.dumps(report, indent=2)+'\n')
