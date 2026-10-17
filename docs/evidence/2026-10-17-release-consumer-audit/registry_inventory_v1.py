"""Check exact monorepo release versions against the official sparse index."""
import gzip
import json
from pathlib import Path
import tomllib

W = Path(__file__).resolve().parent
support = W / 'audit_v1.py'
source = support.read_text()
prefix, marker, _ = source.partition('\nassert not R.exists()\n')
assert marker
scope = {'__file__': str(support), '__name__': 'frozen_audit_support'}
# Reuse only the frozen runner definitions; never rerun its completed main.
exec(compile(prefix, str(support), 'exec'), scope)
ROOT, R, run, dump, sha = (scope[key] for key in ['ROOT', 'R', 'run', 'dump', 'sha'])
assert (R / 'audit-result.json').is_file()
manifests = [ROOT / 'Cargo.toml', *sorted((ROOT / 'crates').glob('*/Cargo.toml'))]
rows = []
for manifest in manifests:
    package = tomllib.loads(manifest.read_text()).get('package', {})
    if not package or package.get('publish') is False:
        continue
    name, version = package['name'], package['version']
    assert len(name) >= 4
    url = f'https://index.crates.io/{name[:2]}/{name[2:4]}/{name}'
    if name == 'csgrs':
        folder = R / 'registry-csgrs'
        result = json.loads((folder / 'result.json').read_text())
    else:
        folder = R / ('registry-' + name)
        result = run(folder.name, ['curl', '--proto', '=https', '--location', '--max-time', '30',
            '--fail-with-body', '--silent', '--show-error', url], ROOT)
    row = {'package': name, 'version': version, 'manifest': str(manifest.relative_to(ROOT)),
           'manifest_sha256': sha(manifest), 'url': url,
           'command_result': str((folder / 'result.json').relative_to(R)),
           'exit_code': result['exit_code'], 'resource_stops': result['resource_stops']}
    if result['exit_code'] == 0:
        entries = [json.loads(line) for line in gzip.open(folder / 'stdout.gz', 'rt')]
        exact = [entry for entry in entries if entry['vers'] == version]
        row.update(status='listed' if exact else 'version_not_listed',
                   exact_version_yanked=exact[0]['yanked'] if exact else None,
                   observed_versions=[entry['vers'] for entry in entries])
    else:
        # HTTP/network failures are retained without treating them as registry absence.
        row.update(status='lookup_failed', exact_version_yanked=None)
    rows.append(row)
dump(R / 'registry-inventory.json', {'packages': rows, 'runner_sha256': sha(support),
    'scope': 'Exact manifest version presence only; listing does not prove source equivalence, API compatibility, MSRV or a successful external build.',
    'full_release_qualified': False})
print(json.dumps({'packages': len(rows), 'status_counts': {
    status: sum(row['status'] == status for row in rows)
    for status in sorted({row['status'] for row in rows})}}))
