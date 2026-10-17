"""Supply declared Apache terms and verify the resulting package membership."""
import json
import subprocess
import sys
from pathlib import Path

sys.dont_write_bytecode = True
from prepare_v1 import CRATES, R, README_EDITS, ROOT, W, dump, harness, sha
from prepare_v2 import capture_inventory


def main():
    assert not (R / 'result.json').exists()
    protocol = json.loads((R / 'protocol-v2.json').read_text())
    before = json.loads((R / 'baseline-v2.json').read_text())
    assert protocol['baseline_complete'] and set(before) == set(CRATES)
    assert sha(W / 'prepare_v1.py') == protocol['prepare_sha256']
    assert sha(W / 'prepare_v2.py') == protocol['prepare_v2_sha256']
    assert sha(W / 'contract-v1.md') == protocol['contract_sha256']
    assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip() == protocol['base_revision']
    subprocess.run(['git', 'diff', '--quiet'], cwd=ROOT, check=True)
    subprocess.run(['git', 'diff', '--cached', '--quiet'], cwd=ROOT, check=True)
    run, guards = harness()
    assert not guards()
    canonical = (R / 'LICENSE-2.0.txt').read_bytes()
    assert sha(R / 'LICENSE-2.0.txt') == protocol['canonical_sha256']
    assert canonical == (ROOT / 'crates/hyperreal/LICENSE.txt').read_bytes()
    assert all(sha(ROOT / p) == h for p, h in protocol['unchanged_inputs_sha256'].items())
    for crate, row in before.items():
        assert all(sha(ROOT / 'crates' / crate / p) == h for p, h in row['physical_sha256'].items())
    replacements = {}
    for crate in README_EDITS:
        path = ROOT / 'crates' / crate / 'README.md'
        text = path.read_text()
        assert path.read_bytes() == (R / 'before' / (crate + '.README.md')).read_bytes()
        if crate in ['hyperlimit', 'hypertri']:
            old = (crate.capitalize() + ' is available under either the MIT License or the Apache License 2.0,\n'
                   'as declared in [`Cargo.toml`](Cargo.toml). The repository\'s [`LICENSE`](LICENSE)\n'
                   'contains the MIT terms.')
            new = (crate.capitalize() + ' is available under either the [MIT License](LICENSE) or the\n'
                   '[Apache License 2.0](LICENSE-APACHE), as declared in [`Cargo.toml`](Cargo.toml).')
        else:
            old = 'Licensed under the [Apache License 2.0](LICENSE).'
            new = 'Licensed under the [Apache License 2.0](LICENSE-APACHE).'
        assert text.count(old) == 1, crate
        replacements[str(path.relative_to(ROOT))] = text.replace(old, new).encode()
    for crate in CRATES:
        path = ROOT / 'crates' / crate / 'LICENSE-APACHE'
        assert not path.exists()
    for crate in CRATES:
        with (ROOT / 'crates' / crate / 'LICENSE-APACHE').open('xb') as stream:
            stream.write(canonical)
    for path, content in replacements.items():
        (ROOT / path).write_bytes(content)
    implementation = {str(Path('crates') / crate / 'LICENSE-APACHE'): protocol['canonical_sha256'] for crate in CRATES}
    implementation.update({p: sha(ROOT / p) for p in replacements})
    dump(R / 'applied.json', {'apply_sha256': sha(W / 'apply_v1.py'),
                             'implementation_sha256': implementation,
                             'manifest_or_existing_license_changed': False})
    after = {}
    comparison = {}
    for crate in CRATES:
        row = capture_inventory(run, 'after', crate)
        after[crate] = row
        dump(R / 'after.json', after)
        assert set(row['paths']) - set(before[crate]['paths']) == {'LICENSE-APACHE'}
        assert not set(before[crate]['paths']) - set(row['paths'])
        assert row['generated_or_absent_paths'] == before[crate]['generated_or_absent_paths']
        changed = sorted(p for p, h in before[crate]['physical_sha256'].items() if row['physical_sha256'][p] != h)
        assert changed == (['README.md'] if crate in README_EDITS else [])
        assert row['physical_sha256']['LICENSE-APACHE'] == protocol['canonical_sha256']
        comparison[crate] = {'added_members': ['LICENSE-APACHE'], 'removed_members': [],
                             'changed_existing_members': changed,
                             'before_member_count': len(before[crate]['paths']),
                             'after_member_count': len(row['paths']),
                             'existing_physical_files_verified': len(before[crate]['physical_sha256'])}
    for path, content in replacements.items():
        assert (ROOT / path).read_bytes() == content
        assert '(LICENSE-APACHE)' in content.decode()
    assert all(sha(ROOT / p) == h for p, h in protocol['unchanged_inputs_sha256'].items())
    fmt = run('fmt', ['cargo', 'fmt', '--all', '--', '--check'], ROOT,
              {'CARGO_HOME': '/home/tim/.cargo', 'CARGO_NET_OFFLINE': 'true'})
    whitespace = run('whitespace', ['git', 'diff', '--check', '--', *sorted(implementation)], ROOT)
    assert fmt['exit_code'] == whitespace['exit_code'] == 0
    assert not fmt['resource_stops'] and not whitespace['resource_stops']
    for path, digest in implementation.items():
        assert sha(ROOT / path) == digest
        text = (ROOT / path).read_text()
        assert all(line == line.rstrip() for line in text.splitlines())
        assert text.endswith('\n') and not text.endswith('\n\n')
    assert not guards()
    dump(R / 'result.json', {
        'complete': True, 'output_closed': True, 'package_file_lists_passed': True,
        'packages': comparison, 'license_texts_exactly_match_official_bytes': True,
        'official_sha256': protocol['canonical_sha256'], 'readme_links_checked': README_EDITS,
        'implementation_sha256': implementation,
        'original_manifests_lockfiles_and_license_texts_unchanged': True,
        'all_other_listed_source_files_unchanged': True,
        'original_helper_failure_preserved': True, 'fmt': fmt, 'whitespace': whitespace,
        'runtime_tests_rerun': False, 'full_cargo_matrix_qualified': False,
        'package_archives_built': False, 'dependency_or_fixture_provenance_audited': False,
        'license_grants_changed': False, 'legal_compliance_claimed': False,
        'external_consumer_qualified': False, 'release_qualified': False,
        'cache_index_admitted': False, 'full_plan_complete': False})
    print(json.dumps({'packages_verified': len(comparison), 'license_files_added': len(CRATES),
                      'readmes_corrected': len(README_EDITS), 'fmt_exit_code': fmt['exit_code'],
                      'release_qualified': False}), flush=True)


if __name__ == '__main__':
    main()
