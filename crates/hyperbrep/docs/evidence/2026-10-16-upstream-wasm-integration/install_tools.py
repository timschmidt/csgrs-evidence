"""Install pinned local binding tools from their official distribution sources."""
import base64
import hashlib
import json
from pathlib import Path
import subprocess
import tarfile
import tomllib
import urllib.request

OUT = Path(__file__).resolve().parent
ROOT = OUT.parents[4]
DEST = Path('/tmp/hyperbrep-binding-tools')
DEST.mkdir(exist_ok=True)
records = []

def fetch(url, filename):
    request = urllib.request.Request(url, headers={'User-Agent':'hyperbrep-integration-check'})
    with urllib.request.urlopen(request, timeout=60) as response:
        data = response.read()
    path = DEST / filename
    path.write_bytes(data)
    records.append(dict(url=url, path=str(path), bytes=len(data), sha256=hashlib.sha256(data).hexdigest()))
    (OUT / 'tool-downloads.json').write_text(json.dumps(records, indent=2) + '\n')
    return path

checksums = fetch('https://nodejs.org/dist/latest-v22.x/SHASUMS256.txt', 'node-SHASUMS256.txt')
selected = [line.split() for line in checksums.read_text().splitlines() if line.endswith('-linux-x64.tar.xz')]
assert len(selected) == 1
expected, name = selected[0]
node_archive = fetch('https://nodejs.org/dist/latest-v22.x/' + name, name)
assert hashlib.sha256(node_archive.read_bytes()).hexdigest() == expected
with tarfile.open(node_archive) as archive:
    archive.extractall(DEST, filter='data')
node = DEST / name.removesuffix('.tar.xz') / 'bin/node'

lock = tomllib.loads((ROOT / 'Cargo.lock').read_text())
version = next(item['version'] for item in lock['package'] if item['name'] == 'wasm-bindgen')
release = fetch('https://api.github.com/repos/wasm-bindgen/wasm-bindgen/releases/tags/' + version, 'wasm-bindgen-release.json')
assets = [item for item in json.loads(release.read_text())['assets']
          if item['name'].endswith('x86_64-unknown-linux-musl.tar.gz')]
assert len(assets) == 1
asset = assets[0]
bindgen_archive = fetch(asset['browser_download_url'], asset['name'])
if asset.get('digest'):
    assert asset['digest'] == 'sha256:' + hashlib.sha256(bindgen_archive.read_bytes()).hexdigest()
with tarfile.open(bindgen_archive) as archive:
    archive.extractall(DEST, filter='data')
bindgen = DEST / asset['name'].removesuffix('.tar.gz') / 'wasm-bindgen'
assert subprocess.check_output([str(bindgen), '--version'], text=True).strip() == 'wasm-bindgen ' + version

package_lock = json.loads((ROOT / 'tests/wasm/package-lock.json').read_text())
typescript = package_lock['packages']['node_modules/typescript']
ts_archive = fetch(typescript['resolved'], 'typescript-' + typescript['version'] + '.tgz')
assert typescript['integrity'] == 'sha512-' + base64.b64encode(hashlib.sha512(ts_archive.read_bytes()).digest()).decode()
ts_dir = DEST / ('typescript-' + typescript['version'])
ts_dir.mkdir(exist_ok=True)
with tarfile.open(ts_archive) as archive:
    archive.extractall(ts_dir, filter='data')
tsc = ts_dir / 'package/bin/tsc'
report = dict(node=str(node), node_version=subprocess.check_output([str(node),'--version'],text=True).strip(),
              wasm_bindgen=str(bindgen), wasm_bindgen_version=version,
              tsc=str(tsc), typescript_version=typescript['version'],
              downloads='tool-downloads.json',
              executable_sha256={str(path):hashlib.sha256(path.read_bytes()).hexdigest() for path in [node,bindgen,tsc]},
              scope='Task-local tools. Node archive matches official SHASUMS256; TypeScript matches the repository lock integrity; wasm-bindgen matches Cargo.lock and its release asset digest when supplied. No global installation or package script execution.')
(OUT / 'tools.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({key:report[key] for key in ['node_version','wasm_bindgen_version','typescript_version']}))
