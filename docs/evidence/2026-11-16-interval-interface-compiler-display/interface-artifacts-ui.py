from pathlib import Path
import hashlib
import json
import shutil
import subprocess
import sys

s = Path(__file__).parent
label = sys.argv[1]
assert label == 'ui-candidate'
root = Path('/mnt/development/interval-coordinated-stack/alumina-interface')
target = Path('/mnt/development/.interval-refactor-build/coordinated-ci/alumina-interface')
out = s / ('interface-artifacts-' + label)
out.mkdir(exist_ok=False)
record = {'label': label, 'source_head': subprocess.check_output(
    ['git', 'rev-parse', 'HEAD'], cwd=root, text=True).strip(), 'artifacts': {}}
(out / 'source.patch').write_bytes(subprocess.check_output(['git', 'diff', '--binary', 'HEAD'], cwd=root))
files = {
    'desktop': target / 'release/alumina-interface',
    'native-library': target / 'release/libalumina_interface.so',
    'fixture-driver': target / 'release/alumina-cam-fixture',
    'wasm-raw': target / 'wasm32-unknown-unknown/release/alumina_interface.wasm',
    'wasm-final': root / 'dist/alumina-interface_bg.wasm',
    'wasm-gzip': root / 'dist/alumina-interface_bg.wasm.gz',
    'wasm-brotli': root / 'dist/alumina-interface_bg.wasm.br',
}
for extension in ['s', 'll']:
    found = list((target / 'release/deps').glob('alumina_interface_core-*.' + extension))
    assert len(found) == 1, found
    files['core-' + extension] = found[0]
for name, source in files.items():
    assert source.is_file(), source
    dest = out / name
    shutil.copy2(source, dest)
    raw = dest.read_bytes()
    info = {'source': str(source), 'bytes': len(raw), 'sha256': hashlib.sha256(raw).hexdigest()}
    if name in ('wasm-raw', 'wasm-final'):
        assert raw[:8] == b'\0asm\x01\0\0\0'
        offset = 8
        sections = []
        while offset < len(raw):
            section_id = raw[offset]
            offset += 1
            size = shift = 0
            while True:
                byte = raw[offset]
                offset += 1
                size |= (byte & 127) << shift
                if not byte & 128:
                    break
                shift += 7
                assert shift < 35
            payload = raw[offset:offset + size]
            assert len(payload) == size
            sections.append({'id': section_id, 'bytes': size,
                             'sha256': hashlib.sha256(payload).hexdigest()})
            offset += size
        info['sections'] = sections
        info['code_bytes'] = sum(row['bytes'] for row in sections if row['id'] == 10)
    if name in ('desktop', 'native-library', 'fixture-driver'):
        (out / (name + '.sections')).write_bytes(subprocess.check_output(['size', '-A', str(source)]))
        textfile = out / (name + '.text')
        copied_object = out / (name + '.objcopy-temporary')
        subprocess.run(['objcopy', '--dump-section', '.text=' + str(textfile), str(source), str(copied_object)], check=True)
        copied_object.unlink()
        info['text_bytes'] = textfile.stat().st_size
        info['text_sha256'] = hashlib.sha256(textfile.read_bytes()).hexdigest()
    record['artifacts'][name] = info
for mode in ['network-attended', 'cached-autonomous']:
    command = [str(files['fixture-driver']), '--network-policy', mode]
    result = subprocess.run(command, cwd=root, capture_output=True, timeout=300)
    (out / (mode + '.stdout')).write_bytes(result.stdout)
    (out / (mode + '.stderr')).write_bytes(result.stderr)
    assert result.returncode == 0, (mode, result.returncode, result.stderr)
record['fixture_scope'] = 'Existing strict simulator-targeted canonical-job fixture, both network policies; full JSON bytes retained.'
(out / 'report.json').write_text(json.dumps(record, indent=2) + '\n')
print(label, {name: row['bytes'] for name, row in record['artifacts'].items()})
