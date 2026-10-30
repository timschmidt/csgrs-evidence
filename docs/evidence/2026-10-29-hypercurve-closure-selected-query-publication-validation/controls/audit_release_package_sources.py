"""Verify that package verification consumed the newly created package sources."""
from pathlib import Path
import argparse
import hashlib
import json
import re
import tarfile
import time
import tomllib

root = Path(__file__).resolve().parent
parser = argparse.ArgumentParser()
parser.add_argument('--record', type=Path, required=True)
args = parser.parse_args()
record = args.record.resolve()
assert record.parent == root.resolve()
summary = json.loads((record / 'summary.json').read_text())
assert summary['all_passed'] and summary['phase'] == 'release'
assert summary['head'] == json.loads((root / 'publication-source.json').read_text())['head']
assert len(summary['results']) == 2 and not summary['source_changes']
source = json.loads((record / 'sources-before.json').read_text())
assert source == json.loads((record / 'sources-after.json').read_text())
checkout = root / 'normal'
names = ['hyperreal', 'hyperlattice', 'hyperlimit', 'hypertri', 'hypersolve', 'hypercurve',
         'hypermesh', 'hyperphysics', 'hypersdf', 'csgrs', 'csgrs-ffi', 'hypergraphics',
         'hyperevolution', 'hyperpack', 'hyperparts', 'hyperpath', 'hyperdrc', 'hypercircuit']
packages = {}
for name in names:
    relative = Path('.') if name == 'csgrs' else Path('crates') / name
    manifest = tomllib.loads((checkout / relative / 'Cargo.toml').read_text())
    key = name + '-' + manifest['package']['version']
    packages[key] = relative
pattern = re.compile(r'(/[^:\s]+/registry/src/[^/\s]+/(' + '|'.join(map(re.escape, packages)) + r'))(?=/)')
groups = []
for row in summary['results']:
    assert row['status'] == 0 and row['command'] == 'bash scripts/release-check.sh'
    target = Path(row['target_dir'])
    assert target.parent == Path('/home/tim/Documents/GitHub/workspace/csgrs/target/research-closeout-selected-query-release-retry')
    release = target / 'release-check'
    archives = {}
    for key, relative in packages.items():
        candidates = sorted((release / 'package').rglob(key + '.crate'))
        assert candidates, key
        archive_hashes = {hashlib.sha256(path.read_bytes()).hexdigest() for path in candidates}
        assert len(archive_hashes) == 1, key
        files = {}
        with tarfile.open(candidates[0], 'r:gz') as archive:
            for member in archive.getmembers():
                if not member.isfile():
                    continue
                prefix, local = member.name.split('/', 1)
                assert prefix == key and '..' not in Path(local).parts
                data = archive.extractfile(member).read()
                digest = hashlib.sha256(data).hexdigest()
                files[local] = {'sha256': digest, 'bytes': len(data)}
                if local.startswith('src/') or local == 'build.rs':
                    source_name = str(relative / local)
                    assert source[source_name] == digest, (key, local, 'archive differs from qualified source')
        archives[key] = {'archive': str(candidates[0]), 'archive_sha256': archive_hashes.pop(), 'files': files}
    consumed = {}
    for depfile in release.rglob('*.d'):
        if not depfile.is_file():
            continue
        for path, key in pattern.findall(depfile.read_text(errors='replace')):
            consumed.setdefault((path, key), set()).add(str(depfile))
    assert any(key.startswith('hypersolve-') for _, key in consumed), 'No Hypersolve temporary-registry source attribution found'
    cached = []
    for (path, key), depfiles in sorted(consumed.items()):
        cache = Path(path)
        for local, expected in archives[key]['files'].items():
            actual = cache / local
            assert actual.is_file(), (path, local, 'missing cached package source')
            assert hashlib.sha256(actual.read_bytes()).hexdigest() == expected['sha256'], (path, local, 'stale package extraction')
        cached.append({'path': path, 'package': key, 'files_verified': len(archives[key]['files']),
                       'dependency_files': sorted(depfiles)})
    groups.append({'id': row['id'], 'target_dir': str(target), 'packages': archives,
                   'consumed_registry_sources': cached, 'all_matched': True})
result = {'source_revision': summary['head'], 'validation_record': str(record), 'epoch': time.time(),
          'groups': groups, 'all_passed': True,
          'scope': 'Each newly generated release archive source matches the frozen checkout. Every consumed released-crate registry extraction found in compiler dependency files matches its new archive, including manifests and source files. Clean consumer package-path checks remain enforced by the unchanged release-check script.'}
(root / 'release-source-audit.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps({'all_passed': True, 'groups': len(groups), 'consumed_registry_sources': [len(g['consumed_registry_sources']) for g in groups]}))
