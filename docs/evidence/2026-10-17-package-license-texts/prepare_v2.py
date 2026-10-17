"""Retain v1's diagnostic failure and recognize Cargo's generated lock member."""
import gzip
import json
import subprocess
import sys
from pathlib import Path

sys.dont_write_bytecode = True
from prepare_v1 import CRATES, R, README_EDITS, ROOT, W, dump, harness, sha


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
    assert set(generated) <= {'.cargo_vcs_info.json', 'Cargo.toml.orig', 'Cargo.lock'}
    return {'command': result, 'paths': sorted(listing), 'physical_sha256': actual,
            'generated_or_absent_paths': generated}


def main():
    assert not (R / 'baseline.json').exists() and not (R / 'protocol-v2.json').exists()
    protocol = json.loads((R / 'protocol.json').read_text())
    assert not protocol['baseline_complete']
    assert sha(W / 'prepare_v1.py') == protocol['prepare_sha256']
    assert sha(R / 'LICENSE-2.0.txt') == protocol['canonical_sha256']
    assert all(sha(ROOT / p) == h for p, h in protocol['unchanged_inputs_sha256'].items())
    assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip() == protocol['base_revision']
    subprocess.run(['git', 'diff', '--quiet'], cwd=ROOT, check=True)
    failed = json.loads((R / 'before-hyperbrep/result.json').read_text())
    assert failed['exit_code'] == 0 and not failed['resource_stops']
    paths = gzip.decompress((R / 'before-hyperbrep/stdout.gz').read_bytes()).decode().splitlines()
    absent = sorted(p for p in paths if not (ROOT / 'crates/hyperbrep' / p).is_file())
    assert absent == ['.cargo_vcs_info.json', 'Cargo.lock', 'Cargo.toml.orig']
    dump(R / 'prepare-v1-failure.json', {
        'command': ['python3', 'target/properties/package-license-texts/prepare_v1.py'],
        'observed_exit_code': 1, 'failed_function': 'capture_inventory',
        'assertion': "set(generated) <= {'.cargo_vcs_info.json', 'Cargo.toml.orig'}",
        'observed_absent_source_members': absent, 'cargo_package_exit_code': 0,
        'package_source_changes_applied': False,
        'reason': 'The diagnostic helper omitted Cargo.lock from the generated-member vocabulary.',
        'cargo_documentation': 'https://doc.rust-lang.org/cargo/commands/cargo-package.html',
        'correction': 'Recognize Cargo.lock as generated when absent; retain all original command output.'})
    for crate in README_EDITS:
        assert (ROOT / 'crates' / crate / 'README.md').read_bytes() == (R / 'before' / (crate + '.README.md')).read_bytes()
    run, guards = harness()
    assert not guards()
    before = {}
    for crate in CRATES:
        before[crate] = capture_inventory(run, 'before-v2', crate)
        assert 'LICENSE-APACHE' not in before[crate]['paths']
        dump(R / 'baseline-v2.json', before)
    assert all(sha(ROOT / p) == h for p, h in protocol['unchanged_inputs_sha256'].items())
    assert not guards()
    protocol.update(baseline_complete=True, prepare_v2_sha256=sha(W / 'prepare_v2.py'),
                    original_protocol_sha256=sha(R / 'protocol.json'),
                    original_diagnostic_failure_preserved=True)
    dump(R / 'protocol-v2.json', protocol)
    print(json.dumps({'baseline_complete': True, 'packages_missing_text': len(before),
                      'canonical_sha256': protocol['canonical_sha256']}), flush=True)


if __name__ == '__main__':
    main()
