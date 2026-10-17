"""Run the existing README contracts without rebuilding the geometry stack."""
import hashlib
import json
from pathlib import Path
import tomllib

W = Path(__file__).resolve().parent
support = W / 'audit_v1.py'
prefix, marker, _ = support.read_text().partition('\nassert not R.exists()\n')
assert marker
scope = {'__file__': str(support), '__name__': 'frozen_audit_support'}
exec(compile(prefix, str(support), 'exec'), scope)
ROOT, R, run, dump, sha = (scope[key] for key in ['ROOT', 'R', 'run', 'dump', 'sha'])
pins = json.loads((R / 'source-pins.json').read_text())['inputs_sha256']
changed = ['readme.md', 'tests/readme.rs']
for name in changed:
    assert (ROOT / name).read_bytes() == (W / (name.replace('/', '-') + '.after')).read_bytes()
for name, digest in pins.items():
    if name not in changed:
        assert sha(ROOT / name) == digest
current = {name: sha(ROOT / name) for name in changed}
version = tomllib.loads((ROOT / 'Cargo.toml').read_text())['package']['version']
env = {'CARGO_PKG_VERSION': version}
binary = R / 'readme-compile/readme-contracts'
commands = []
commands.append(run('readme-compile', ['rustc', '--edition=2024', '--test', 'tests/readme.rs',
    '--crate-name', 'readme_contracts', '-C', 'opt-level=3', '-C', 'codegen-units=16',
    '-C', 'embed-bitcode=no', '-D', 'warnings', '-o', str(binary)], ROOT, env.copy()))
assert commands[-1]['exit_code'] == 0 and not commands[-1]['resource_stops']
commands.append(run('readme-tests', [str(binary), '--test-threads=1', '--nocapture'], ROOT))
assert commands[-1]['exit_code'] == 0 and not commands[-1]['resource_stops']
commands.append(run('readme-clippy', ['clippy-driver', '--edition=2024', '--test', 'tests/readme.rs',
    '--crate-name', 'readme_contracts', '--emit=metadata', '-D', 'warnings',
    '-o', str(R / 'readme-clippy/readme-contracts.rmeta')], ROOT, env.copy()))
assert commands[-1]['exit_code'] == 0 and not commands[-1]['resource_stops']
commands.append(run('format', ['cargo', 'fmt', '--all', '--', '--check'], ROOT))
assert commands[-1]['exit_code'] == 0 and not commands[-1]['resource_stops']
commands.append(run('whitespace', ['git', 'diff', '--check', '--', *changed], ROOT))
assert commands[-1]['exit_code'] == 0 and not commands[-1]['resource_stops']
assert all(sha(ROOT / name) == digest for name, digest in current.items())
assert all(sha(ROOT / name) == digest for name, digest in pins.items() if name not in changed)
dump(R / 'readme-validation.json', {'commands': commands, 'complete': True,
    'implementation_sha256': current, 'CARGO_PKG_VERSION_from_manifest': version,
    'test_scope': 'Both existing dependency-free README tests, compiled directly with rustc; no csgrs library or downstream runtime rebuild.',
    'existing_quickstart_rust_unchanged': True, 'geometry_sources_unchanged': True,
    'package_manifest_unchanged': True, 'external_build_run': False,
    'external_pipeline_run': False, 'release_readiness_claimed': False,
    'cache_index_admitted': False})
