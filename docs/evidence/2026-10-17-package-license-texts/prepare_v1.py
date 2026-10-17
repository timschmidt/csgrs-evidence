"""Capture the missing declared license texts before changing package contents."""
import gzip
import hashlib
import json
import platform
import runpy
import subprocess
import sys
import tomllib
from pathlib import Path

sys.dont_write_bytecode = True
W = Path(__file__).resolve().parent
ROOT = W.parents[2]
R = Path('/run/user/1000/csgrs-package-license-texts-v1')
P = ROOT / 'docs/evidence/2026-10-17-circle-support-reuse-full-library'
RUNNER = ROOT / 'docs/evidence/2026-10-17-package-evidence-boundary/runner_v1.py'
CRATES = ['hyperbrep', 'hypercircuit', 'hypercurve', 'hyperevolution',
          'hyperlimit', 'hyperpack', 'hyperparts', 'hyperpath',
          'hyperphysics', 'hypersdf', 'hypersolve', 'hypertri']
README_EDITS = ['hypercurve', 'hyperlimit', 'hyperphysics', 'hypersolve', 'hypertri']


def sha(path):
    with Path(path).open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def dump(path, value):
    Path(path).write_text(json.dumps(value, indent=2, sort_keys=True) + '\n')


def harness():
    assert sha(RUNNER) == 'ea8e36a670773534e854c8ad23fa3e2f2d33c9cc85e2d2c72be8d579f4d6805b'
    loaded = runpy.run_path(str(RUNNER))
    scope = loaded['run'].__globals__
    scope.update(ROOT=ROOT, R=R)
    original = scope['guards']

    def guards():
        reasons = original()
        if sum(p.stat().st_size for p in R.rglob('*') if p.is_file()) > 4 * 1024**2:
            reasons.append('fresh_output_4_mib')
        return reasons

    scope['guards'] = guards
    return scope['run'], guards


def capture_inventory(run, phase, crate):
    folder = ROOT / 'crates' / crate
    name = phase + '-' + crate
    result = run(name, ['cargo', 'package', '--list', '--allow-dirty', '--offline',
                        '--locked', '--manifest-path', str(folder / 'Cargo.toml')],
                 ROOT, {'CARGO_HOME': '/home/tim/.cargo'})
    assert result['exit_code'] == 0 and not result['resource_stops'], result
    listing = gzip.decompress((R / name / 'stdout.gz').read_bytes()).decode().splitlines()
    assert len(listing) == len(set(listing))
    assert all(not Path(p).is_absolute() and '..' not in Path(p).parts for p in listing)
    actual = {p: sha(folder / p) for p in listing if (folder / p).is_file()}
    generated = sorted(set(listing) - actual.keys())
    assert set(generated) <= {'.cargo_vcs_info.json', 'Cargo.toml.orig'}
    return {'command': result, 'paths': sorted(listing), 'physical_sha256': actual,
            'generated_or_absent_paths': generated}


def main():
    assert not (R / 'protocol.json').exists()
    base = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip()
    assert base == 'd1b5adf86a335c019dc6b07d90ec9f936da70633'
    subprocess.run(['git', 'diff', '--quiet'], cwd=ROOT, check=True)
    subprocess.run(['git', 'diff', '--cached', '--quiet'], cwd=ROOT, check=True)
    previous = json.loads((P / 'checkpoint-v1.json').read_text())
    assert all(sha(ROOT / p) == digest for p, digest in previous['evidence_files_sha256'].items())
    assert sha(ROOT / 'docs/properties-status.json') == previous['ledger_after_sha256']
    manifests = [ROOT / 'Cargo.toml', *sorted((ROOT / 'crates').glob('*/Cargo.toml'))]
    pins = {str(p.relative_to(ROOT)): sha(p) for p in manifests}
    for p in [ROOT / 'Cargo.lock', *sorted((ROOT / 'crates').glob('*/Cargo.lock'))]:
        if p.is_file():
            pins[str(p.relative_to(ROOT))] = sha(p)
    declarations = []
    for manifest in manifests:
        package = tomllib.loads(manifest.read_text()).get('package', {})
        if not package or package.get('publish') is False:
            continue
        licenses = {}
        for path in sorted(manifest.parent.glob('LICENSE*')):
            pins[str(path.relative_to(ROOT))] = sha(path)
            licenses[path.name] = {'sha256': sha(path), 'first_line': path.read_text().splitlines()[0]}
        declarations.append({'name': package['name'], 'manifest': str(manifest.relative_to(ROOT)),
                             'license': package.get('license'), 'license_file': package.get('license-file'),
                             'license_texts': licenses})
    for crate in CRATES:
        folder = ROOT / 'crates' / crate
        assert 'Apache-2.0' in tomllib.loads((folder / 'Cargo.toml').read_text())['package']['license']
        assert not (folder / 'LICENSE-APACHE').exists()
        assert not any('Apache License' in p.read_text() for p in folder.glob('LICENSE*'))
    (R / 'before').mkdir()
    for crate in README_EDITS:
        path = ROOT / 'crates' / crate / 'README.md'
        (R / 'before' / (crate + '.README.md')).write_bytes(path.read_bytes())
    run, guards = harness()
    assert not guards()
    cargo = run('cargo-version', ['cargo', '--version'], ROOT)
    rustc = run('rustc-version', ['rustc', '-Vv'], ROOT)
    assert cargo['exit_code'] == rustc['exit_code'] == 0
    url = 'https://www.apache.org/licenses/LICENSE-2.0.txt'
    fetch = run('fetch-apache', ['curl', '--fail', '--location', '--silent', '--show-error',
                '--max-time', '60', '--max-filesize', '65536', '--output', str(R / 'LICENSE-2.0.txt'),
                '--write-out', '%{http_code}\n%{url_effective}\n', url], ROOT)
    assert fetch['exit_code'] == 0 and not fetch['resource_stops']
    canonical = R / 'LICENSE-2.0.txt'
    assert canonical.read_bytes() == (ROOT / 'crates/hyperreal/LICENSE.txt').read_bytes()
    protocol = {'base_revision': base, 'crates': CRATES, 'readme_edits': README_EDITS,
                'contract_sha256': sha(W / 'contract-v1.md'), 'runner_sha256': sha(RUNNER),
                'prepare_sha256': sha(W / 'prepare_v1.py'), 'platform': platform.platform(),
                'canonical_url': url, 'canonical_sha256': sha(canonical),
                'canonical_matches_existing_hyperreal_text': True,
                'unchanged_inputs_sha256': pins, 'declarations_before': declarations,
                'cargo': cargo, 'rustc': rustc, 'fetch': fetch,
                'runtime_output_limit_bytes': 4 * 1024**2,
                'repository_planning_allowance_bytes': 3 * 1024**2,
                'baseline_complete': False}
    dump(R / 'protocol.json', protocol)
    before = {}
    for crate in CRATES:
        before[crate] = capture_inventory(run, 'before', crate)
        assert 'LICENSE-APACHE' not in before[crate]['paths']
        dump(R / 'baseline.json', before)
    assert all(sha(ROOT / p) == digest for p, digest in pins.items())
    assert not guards()
    protocol['baseline_complete'] = True
    dump(R / 'protocol.json', protocol)
    print(json.dumps({'baseline_complete': True, 'packages_missing_text': len(before),
                      'canonical_sha256': sha(canonical)}), flush=True)


if __name__ == '__main__':
    main()
