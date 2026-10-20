"""Verify this evidence bundle and the current source/documentation snapshot."""

from pathlib import Path
import hashlib
import json
import re

directory = Path(__file__).resolve().parent
root = directory.parents[4]
manifest = json.loads((directory / 'manifest.json').read_text())
for key, base in [('source_sha256', root), ('artifact_sha256', directory)]:
    for relative, expected in manifest[key].items():
        actual = hashlib.sha256((base / relative).read_bytes()).hexdigest()
        assert actual == expected, (key, relative)

documents = [root / 'crates/hyperbrep/README.md', root / 'crates/hyperbrep/PERFORMANCE.md', directory / 'README.md']
documents.extend((root / 'crates/hyperbrep/docs').glob('*.md'))
documents.extend((root / 'crates/hyperbrep/docs/architecture').glob('*.md'))
links = 0
for document in documents:
    for link in re.findall(r'\]\(([^)]+)\)', document.read_text()):
        if link.startswith(('http:', 'https:', '#')):
            continue
        target = link.split('#')[0]
        if target:
            assert (document.parent / target).resolve().exists(), (document, link)
            links += 1

ledger = json.loads((root / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json').read_text())
packages = ledger['work_packages']
assert len(packages) == 28 and len({package['id'] for package in packages}) == 28
json.loads((root / 'docs/properties-status.json').read_text())
print(json.dumps({
    'sources_verified': len(manifest['source_sha256']),
    'artifacts_verified': len(manifest['artifact_sha256']),
    'relative_links_resolve': links,
    'work_packages': len(packages),
    'completed_work_packages': sum(package['status'] == 'complete' for package in packages),
}, indent=2))

commands = json.loads((directory / 'commands.json').read_text())
for name in ['final-tests','final-default-tests','final-hypercurve-tests','final-clippy','hypercurve-test-clippy','final-release-selected-tests','docs','wasm','bench-build','fuzz-clippy','final-fmt','fuzz-fmt','diff-check']:
    matching = [record for record in commands if record['name'] == name]
    assert matching and matching[-1]['exit_code'] == 0, name
benchmarks = json.loads((directory / 'benchmark-commands.json').read_text())
assert len(benchmarks) == 9 and all(record['exit_code'] == 0 for record in benchmarks)
controls = json.loads((directory / 'controls.json').read_text())
assert len(controls) == 3 and all(record['exit_code'] == 101 for record in controls)
for record in controls:
    assert record['expected_failure'] in (directory / 'controls' / (record['name'] + '.log')).read_text()
assert json.loads((directory / 'comparison.json').read_text())['all_66_receipts_equal']
print('Final commands, nine measured processes, 66 native receipts and three rejected controls verified.')
