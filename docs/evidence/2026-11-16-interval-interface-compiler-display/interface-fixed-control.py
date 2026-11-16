from pathlib import Path
import hashlib
import json
import subprocess

s = Path(__file__).parent
specs = [
    ('csgrs', '/mnt/development/csgrs', 'c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb',
     '955593aa9e25727c8e8cfbd0ab1e599d6a09dd53', ['crates/hyperlattice-interval/src/lib.rs']),
    ('interface', '/mnt/development/alumina-interface', 'f5341f36803ad77c856313315d67ac8b3bb63f9a',
     '32a59de0d69436427e5b97297c4929fd908bf326', ['crates/alumina-interface-core/src/machine_profile.rs']),
    ('firmware', '/mnt/development/alumina-firmware', '2d68e82b7341db7b747b20e4ad1455a4c1113a00',
     'dd2b8f987ae6440dbec696836f65f1cee55c5602', ['crates/alumina-foc/src/current.rs']),
]
report = []
for name, repository, fixed, measured, production_files in specs:
    def git(*args):
        return subprocess.check_output(['git', '-C', repository, *args])
    changed = git('diff', '--name-only', fixed, measured).decode().splitlines()
    manifests = [path for path in changed if Path(path).name in ('Cargo.toml', 'Cargo.lock', 'build.rs')]
    assert not manifests, (name, manifests)
    production = {}
    for path in production_files:
        a = git('show', fixed + ':' + path)
        b = git('show', measured + ':' + path)
        a_prefix = a.split(b'#[cfg(test)]', 1)[0].rstrip()
        b_prefix = b.split(b'#[cfg(test)]', 1)[0].rstrip()
        assert a_prefix == b_prefix, path
        production[path] = {'non_test_prefix_sha256': hashlib.sha256(a_prefix).hexdigest(),
                            'non_test_prefix_bytes': len(a_prefix)}
    for path in changed:
        if path in production_files or '/tests/' in path or path.startswith('docs/'):
            continue
        if path in ('INTERVAL_REFACTOR_PROGRESS.md', 'interval-inventory.tsv'):
            continue
        if name == 'firmware' and path == 'crates/alumina-foc/src/current/interval_widening.rs':
            parent = git('show', measured + ':crates/alumina-foc/src/current.rs')
            assert b'#[cfg(test)]\nmod interval_widening;' in parent
            continue
        raise AssertionError((name, 'Unclassified changed input', path))
    # Preserve the complete diffs so the cfg(test)-only classification is reviewable.
    (s / ('interface-fixed-control-' + name + '.diff')).write_bytes(git('diff', fixed, measured))
    report.append({'repository': name, 'fixed_revision': fixed, 'measured_control_revision': measured,
                   'changed_files': changed, 'manifests_and_lockfiles_unchanged': True,
                   'unchanged_non_test_source': production})
(s / 'interface-fixed-control.json').write_text(json.dumps({
    'status': 'Equivalent completed release control; not a claim to have rebuilt the older Git heads',
    'basis': 'All changed normal-source prefixes are byte-identical; remaining differences are cfg(test) modules, integration tests and documentation. Cargo manifests and locks are unchanged. Measured release commands do not enable cfg(test).',
    'repositories': report,
    'scope': 'Normal Interface application/fixture/WASM artifacts only. Test executables are not equivalent and retain their existing separate size accounts.'
}, indent=2) + '\n')
print('Verified equivalent normal-build source inputs for the fixed goal baseline across all three repositories')
