"""Run a fresh bounded root Cargo inventory with a declared longer allowance."""
import collections
import gzip
import hashlib
import json
from pathlib import Path
import subprocess

W = Path(__file__).resolve().parent
ROOT = W.parents[2]
P = ROOT / 'docs/evidence/2026-10-17-release-consumer-audit'
previous = json.loads((P / 'checkpoint-v1.json').read_text())
support = P / 'audit_v1.py'
assert hashlib.sha256(support.read_bytes()).hexdigest() == previous['evidence_files_sha256'][str(support.relative_to(ROOT))]
prefix, marker, _ = support.read_text().partition('\nassert not R.exists()\n')
assert marker
changes = {
    "csgrs-release-consumer-audit-v1": "csgrs-package-evidence-boundary-v1",
    '> 24 * 1024**2': '> 16 * 1024**2',
    '> 8 * 1024**2': '> 12 * 1024**2',
    '> 180:': '> 900:',
    '> 64 * 1024**2': '> 256 * 1024**2',
}
for before, after in changes.items():
    assert prefix.count(before) == 1, before
    prefix = prefix.replace(before, after)
runner = W / 'runner_v1.py'
assert not runner.exists()
runner.write_text(prefix)
scope = {'__file__': str(runner), '__name__': 'package_inventory_runner'}
exec(compile(prefix, str(runner), 'exec'), scope)
R, run, dump, sha, guards = (scope[key] for key in ['R', 'run', 'dump', 'sha', 'guards'])
assert not R.exists() and not guards()
subprocess.run(['git', 'diff', '--quiet'], cwd=ROOT, check=True)
subprocess.run(['git', 'diff', '--cached', '--quiet'], cwd=ROOT, check=True)
R.mkdir()
(R / 'tmp').mkdir()
base = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip()
inputs = ['Cargo.toml', 'Cargo.lock', '.gitignore', '.cargo/config.toml', 'readme.md', 'examples/basic.rs',
          'tests/readme.rs', 'properties.md', 'docs/admission.md', 'AGENTS.md']
dump(R / 'source-pins.json', {'base_revision': base, 'inputs_sha256': {name: sha(ROOT / name) for name in inputs},
    'previous_runner_sha256': sha(support), 'new_runner_sha256': sha(runner),
    'runner_substitutions': changes, 'contract_sha256': sha(W / 'contract-v1.md')})
records = []
for name, argv in [('toolchain', ['rustc', '-Vv']), ('cargo-version', ['cargo', '-Vv']),
                   ('tracked-tree', ['git', 'ls-tree', '-r', '-l', '-z', 'HEAD'])]:
    result = run(name, argv, ROOT)
    records.append(result)
    assert result['exit_code'] == 0 and not result['resource_stops']
raw = gzip.open(R / 'tracked-tree/stdout.gz', 'rb').read()
counts, sizes = collections.Counter(), collections.Counter()
for row in raw.rstrip(b'\0').split(b'\0'):
    meta, path = row.split(b'\t', 1)
    name = path.decode()
    prefix = 'docs/evidence' if name.startswith('docs/evidence/') else name.split('/')[0]
    counts[prefix] += 1
    size = meta.split()[-1]
    sizes[prefix] += int(size) if size != b'-' else 0
dump(R / 'tracked-inventory.json', {'tracked_files': sum(counts.values()), 'tracked_blob_bytes': sum(sizes.values()),
    'counts_by_prefix': dict(counts), 'bytes_by_prefix': dict(sizes), 'scope': 'Committed Git tree, not Cargo package contents.'})
del raw
result = run('package-before', ['cargo', 'package', '--list', '--offline', '--locked', '--allow-dirty', '-p', 'csgrs'], ROOT)
records.append(result)
if result['exit_code'] == 0 and not result['resource_stops']:
    counts, sizes = collections.Counter(), collections.Counter()
    missing = []
    for name in gzip.open(R / 'package-before/stdout.gz', 'rt'):
        name = name.rstrip('\n')
        prefix = 'docs/evidence' if name.startswith('docs/evidence/') else name.split('/')[0]
        counts[prefix] += 1
        path = ROOT / name
        if path.is_file():
            sizes[prefix] += path.stat().st_size
        else:
            missing.append(name)
    dump(R / 'package-before/inventory.json', {'files': sum(counts.values()), 'counts_by_prefix': dict(counts),
        'existing_source_bytes': sum(sizes.values()), 'source_bytes_by_prefix': dict(sizes),
        'generated_or_absent_paths': missing, 'archive_size_established': False})
dump(R / 'baseline-result.json', {'base_revision': base, 'commands': records,
    'package_inventory_complete': result['exit_code'] == 0 and not result['resource_stops'],
    'previous_180_second_failure_preserved': True, 'performance_claimed': False,
    'package_built': False, 'release_qualified': False})
