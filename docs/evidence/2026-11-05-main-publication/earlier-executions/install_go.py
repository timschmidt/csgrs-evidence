import hashlib
import json
from pathlib import Path
import subprocess
import tarfile

out = Path(__file__).resolve().parent
metadata = subprocess.check_output(['curl', '--fail', '--silent', '--show-error', '--location', '--proto', '=https', '--tlsv1.2', 'https://go.dev/dl/?mode=json&include=all'])
(out / 'go-download-metadata.json').write_bytes(metadata)
release = next(item for item in json.loads(metadata) if item['version'] == 'go1.27.3')
package = next(item for item in release['files'] if item['os'] == 'linux' and item['arch'] == 'amd64' and item['kind'] == 'archive')
archive = out / package['filename']
subprocess.run(['curl', '--fail', '--location', '--proto', '=https', '--tlsv1.2', '--output', str(archive), 'https://go.dev/dl/' + package['filename']], check=True)
actual = hashlib.sha256(archive.read_bytes()).hexdigest()
if actual != package['sha256']:
    raise RuntimeError('official Go archive checksum mismatch')
tools = out / 'tools'
tools.mkdir(exist_ok=True)
with tarfile.open(archive) as bundle:
    bundle.extractall(tools, filter='data')
bin_dir = tools / 'bin'
bin_dir.mkdir(exist_ok=True)
for name in ['go', 'gofmt']:
    link = bin_dir / name
    if not link.exists():
        link.symlink_to('../go/bin/' + name)
(out / 'go-install.json').write_text(json.dumps(dict(package=package, actual_sha256=actual), indent=2) + '\n')
subprocess.run([str(bin_dir / 'go'), 'version'], check=True)
