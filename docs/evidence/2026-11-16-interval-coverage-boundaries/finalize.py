from pathlib import Path
import datetime, gzip, hashlib, json, platform, subprocess, time

s = Path('/tmp/interval-refactor/interval-coverage-review')
r = Path('/mnt/development/csgrs')
q = Path('/mnt/development/interval-coverage-review/csgrs')
base = 'b8bcc1155498d018330cd00e7f987696bc4f85bd'
snapshot = '6b54e0538456c2b574d5ee49fb318c09309caf94'
def read(name):
    return json.loads((s/name).read_text())
def write(name, data):
    (s/name).write_text(json.dumps(data, indent=2)+'\n')
def git(*args):
    return subprocess.check_output(['git', *args], cwd=r)
def sha(data):
    return hashlib.sha256(data).hexdigest()

assert git('rev-parse', 'HEAD').decode().strip() == base
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=q).decode().strip() == snapshot
assert not subprocess.check_output(['git', 'status', '--porcelain'], cwd=q)
files = git('diff', '--name-only', base, snapshot).decode().splitlines()
assert len(files) == 3 and all(f.startswith('crates/hyperinterval/tests/') for f in files)
assert all((r/f).read_bytes() == (q/f).read_bytes() for f in files)
assert sha(git('diff', '--binary', base, snapshot)) == read('source-snapshot.json')['patch_sha256']
assert (s/'qualified.patch').read_bytes() == (s/'corrected/source.patch').read_bytes()
assert sha((s/'qualified.patch').read_bytes()) == read('corrected/test-command.json')['patch_sha256']
checks = {}
for name in ['tests-1.95.0', 'tests-stable', 'tests-1.88.0', 'clippy-1.95.0', 'clippy-stable', 'clippy-1.88.0', 'docs-1.95.0', 'fmt-1.95.0']:
    entry = read('corrected-'+name+'.json')
    assert entry['exit_code'] == 0
    checks[name] = entry
for name in ['typos-workflow', 'typos-documents', 'diff-check', 'repository-budget']:
    assert read(name+'.json')['exit_code'] == 0
assert read('corrected/test-command.json')['exit_code'] == 0
artifacts = read('corrected-artifacts.json')
assert len(artifacts) == 4 and all(a['exit_code'] == 0 for a in artifacts)
assert all(a['runtime_exit_code'] == 0 for a in artifacts if a['kind'] == 'test')
comparison = read('artifact-comparison-corrected.json')
assert comparison['all_incremental_cumulative_caps_pass']
assert comparison['all_production_trig_cost_binaries_byte_identical']
for row in comparison['comparisons']:
    for metric in row['metrics'].values():
        assert metric['growth_bytes'] <= metric['byte_cap']
        assert metric['growth_percent'] <= metric['percent_cap']
old = json.loads(git('show', base+':docs/research/interval-size-accounts.json'))
new = json.loads((r/'docs/research/interval-size-accounts.json').read_text())
assert len(old['accounts']) == 54 and len(new['accounts']) == 57
assert new['accounts'][:54] == old['accounts']
assert new['accepted_changes'][:len(old['accepted_changes'])] == old['accepted_changes']
assert new['baseline_commit'] == old['baseline_commit']
assert len({a['artifact'] for a in new['accounts']}) == 57
coverage = read('coverage-final-comparison.json')
assert coverage['denominators_unchanged'] and coverage['all_file_counts_non_decreasing']
assert coverage['final']['lines']['covered'] == 4695
assert coverage['final']['lines']['count'] == 4740
assert read('corrected/profile-review.json')['all_owner_metrics_reproduce']
assert read('corrected/profile-review.json')['warnings_match_baseline']

tools = {}
for compiler in ['1.88.0', '1.95.0', 'stable']:
    tools[compiler] = subprocess.check_output(['rustc', '+'+compiler, '-vV'], text=True)
llvm = Path(subprocess.check_output(['rustc', '+1.95.0', '--print', 'sysroot'], text=True).strip())/'lib/rustlib/x86_64-unknown-linux-gnu/bin/llvm-cov'
tools['llvm-cov'] = subprocess.check_output([str(llvm), '--version'], text=True)
write('tool-versions.json', {'platform': platform.platform(), 'versions': tools})
write('primary-fmt.json', {'command': ['cargo', 'fmt', '--all', '--', '--check'], 'cwd': str(r), 'exit_code': 0, 'tool_session': 46807, 'note': 'Completed with empty output; source matches the separately logged qualified snapshot.'})
compressed = []
for p in sorted(s.glob('*/export.json')):
    data = p.read_bytes()
    encoded = gzip.compress(data, compresslevel=9, mtime=0)
    assert gzip.decompress(encoded) == data
    dest = p.with_suffix('.json.gz')
    assert not dest.exists()
    dest.write_bytes(encoded)
    compressed.append({'plaintext_path': str(p.relative_to(s)), 'plaintext_bytes': len(data), 'plaintext_sha256': sha(data), 'archive_path': str(dest.relative_to(s)), 'compressed_bytes': len(encoded), 'compressed_sha256': sha(encoded)})
    p.unlink()
assert len(compressed) == 3
write('compressed-exports.json', {'codec': 'gzip, lossless, mtime zero', 'files': compressed, 'replay': 'Decompress copies into a new working directory under each plaintext_path before running scripts that read export.json. Never mutate the frozen archive.'})
write('verification.json', {'qualified_snapshot': snapshot, 'primary_parent': base, 'test_file_hashes': {f: sha((r/f).read_bytes()) for f in files}, 'production_unchanged': True, 'final_checks': checks, 'coverage': coverage, 'all_caps_pass': True, 'original_accounts_preserved': 54, 'total_accounts': 57, 'final_release_tests_pass': 3, 'production_artifact_byte_identical': True, 'patch_sha256': sha((s/'qualified.patch').read_bytes()), 'failed_attempts_preserved': True, 'no_comparative_timing': True, 'no_push': True})
write('progress.json', {'time_utc': datetime.datetime.now(datetime.timezone.utc).isoformat(), 'disposition': 'Qualified test-only witnesses retained; final primary commit follows frozen evidence receipt.', 'qualified_snapshot': snapshot, 'scope': 'Three new tests plus one extended test; no production edits. Phases 3/5 and section 14 obligations advance but remain open.', 'remaining': 'All fifteen phases, 45 measured uncovered lines, branch coverage, broader downstream migrations, full current-revision CI, resource closure, firmware flash and HIL remain open.', 'archive_record': 'docs/evidence/2026-11-16-interval-coverage-boundaries', 'size_account_change': 'Three host test targets; all 54 prior accounts unchanged.', 'qualification': 'QUALIFICATION.md'})
write('build-barrier/result.json', {'terminal': True, 'time': time.time(), 'reason': 'All coverage-stage builds and checks terminal. Qualified test additions match primary; no timing queued for unchanged production. Stage ready for immutable archive.'})
print('Verified final qualification; compressed', sum(x['plaintext_bytes'] for x in compressed), 'bytes into', sum(x['compressed_bytes'] for x in compressed), 'bytes without information loss.')
