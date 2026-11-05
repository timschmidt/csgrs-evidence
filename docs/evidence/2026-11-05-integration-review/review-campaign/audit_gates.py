"""Audit actual final executions and explicitly unchanged dependency scopes.

Keep original revisions and failures. An unchanged-source proof is not a new
execution. No missing, failed or still-running command counts as a pass.
"""
import hashlib
import json
from pathlib import Path
import subprocess

HERE = Path(__file__).resolve().parent
WORKSPACE = HERE.parents[1]
TREE = WORKSPACE / 'target/brep-integration-review'
BASE = WORKSPACE / 'target/prepush-20261105'

def records(path):
    return [json.loads(line) for line in path.read_text().splitlines()] if path.exists() else []

def latest(rows):
    result = {}
    for row in rows:
        result[row['sequence']] = row
    return result

def effective_command(command):
    if 'cargo install' in command or 'cargo +stable install' in command:
        return command.replace('install --locked', 'install --root "$PREPUSH_TOOL_ROOT" --locked')
    return command

plans = [json.loads((HERE / name).read_text()) for name in ['plan.json', 'lint-plan.json']]
expected = {row['sequence']: row for plan in plans for row in plan}
prior_rows = records(BASE / 'results.jsonl')
current_rows = records(HERE / 'results.jsonl')
prior = latest(prior_rows)
current = latest(current_rows)
for row in prior_rows + current_rows:
    path = WORKSPACE / row['log']
    assert hashlib.sha256(path.read_bytes()).hexdigest() == row['log_sha256'], path

inputs = json.loads((HERE / 'source-inputs.json').read_text())
for path, digest in inputs.items():
    assert hashlib.sha256((TREE / path).read_bytes()).hexdigest() == digest, path

cache_fix = json.loads((HERE / 'release-cache-source-equivalence.json').read_text())
cache_changes = subprocess.check_output(['git', 'diff', '--name-only', cache_fix['base'], cache_fix['revision']], cwd=TREE, text=True).splitlines()
assert set(cache_changes) == set(cache_fix['changes'])
assert set(cache_changes) == {'docs/RELEASE.md', 'scripts/release-check.sh', 'scripts/release-package-cache.sh', 'scripts/test-release-package-cache.sh'}
for path, digest in cache_fix['changes'].items():
    data = subprocess.check_output(['git', 'show', cache_fix['revision'] + ':' + path], cwd=TREE)
    assert hashlib.sha256(data).hexdigest() == digest, path
allowed_revisions = {cache_fix['base'], cache_fix['revision']}
axis = json.loads((HERE / 'axis-production-prefix-proof.json').read_text())
axis_changes = subprocess.check_output(['git', 'diff', '--name-only', axis['base'], axis['revision']], cwd=TREE, text=True).splitlines()
assert axis_changes == [axis['path']]
axis_before = subprocess.check_output(['git', 'show', axis['base'] + ':' + axis['path']], cwd=TREE)
axis_after = subprocess.check_output(['git', 'show', axis['revision'] + ':' + axis['path']], cwd=TREE)
marker = b'#[cfg(test)]\nmod axis_factor_tests'
assert axis_before.count(marker) == axis_after.count(marker) == 1
assert axis_before.split(marker)[0] == axis_after.split(marker)[0]
assert hashlib.sha256(axis_after).hexdigest() == axis['full_after_sha256']
axis_inputs = json.loads((HERE / 'axis-source-inputs.json').read_text())
assert set(axis_inputs) == set(inputs)
assert all(axis_inputs[p] == h for p, h in inputs.items() if p != axis['path'])
assert axis_inputs[axis['path']] == axis['full_after_sha256']
allowed_revisions.add(axis['revision'])

svg = json.loads((HERE / 'svg-test-only-source-proof.json').read_text())
svg_changes = subprocess.check_output(['git', 'diff', '--name-only', svg['base'], svg['revision']], cwd=TREE, text=True).splitlines()
assert svg_changes == ['tests/svg_polynomial_replay.rs']
for path, digest in svg['changes'].items():
    data = subprocess.check_output(['git', 'show', svg['revision'] + ':' + path], cwd=TREE)
    assert hashlib.sha256(data).hexdigest() == digest
svg_inputs = json.loads((HERE / 'svg-source-inputs.json').read_text())
assert set(svg_inputs) == set(axis_inputs)
assert all(svg_inputs[p] == h for p, h in axis_inputs.items() if p not in svg_changes)
assert all(svg_inputs[p] == h for p, h in svg['changes'].items())
consolidated = subprocess.check_output(['git', 'diff', '--name-only', cache_fix['base'], svg['base']], cwd=TREE, text=True).splitlines()
assert set(consolidated) == set(cache_changes) | {axis['path']}
for path in consolidated:
    reference = axis['revision'] if path == axis['path'] else cache_fix['revision']
    assert subprocess.check_output(['git', 'show', svg['base'] + ':' + path], cwd=TREE) == subprocess.check_output(['git', 'show', reference + ':' + path], cwd=TREE)
allowed_revisions.add(svg['revision'])

scopes = json.loads((HERE / 'unchanged-package-scopes.json').read_text())
for owner, scope in scopes['closures'].items():
    prefixes = ['crates/' + name for name in scope['packages']]
    # Full tracked additions/deletions/edits under every recorded owner and
    # dependency prefix must also be absent, including fixtures and manifests.
    changed = subprocess.check_output(['git', 'diff', '--name-only', scopes['base'], 'HEAD', '--', *prefixes, '.github', '.cargo', 'Cargo.toml', 'Cargo.lock'], cwd=TREE, text=True)
    assert not changed, (owner, changed)
    for path, oid in scope['git_blob_inputs'].items():
        actual = subprocess.check_output(['git', 'hash-object', str(TREE / path)], text=True).strip()
        assert actual == oid, (owner, path)

unchanged = {x['sequence']: x for filename in ['unaffected-checks.json', 'unaffected-lint-checks.json'] for x in json.loads((HERE / filename).read_text())}
missing = []
failed = []
qualified = []
for sequence, item in sorted(expected.items()):
    if sequence in unchanged:
        row = prior.get(sequence)
        if not row:
            missing.append(sequence)
        elif row['exit_code']:
            failed.append(sequence)
        else:
            assert row['revision'] == scopes['base'], (sequence, row['revision'])
            assert row['command'] == effective_command(item['command']), sequence
            qualified.append({'sequence': sequence, 'basis': 'unchanged owner and local dependencies', 'actual_revision': row['revision'], 'record': row['log']})
        continue
    if sequence == 51:
        rows = records(BASE / 'brep-combined-source/results.jsonl')
        curve = next((x for x in rows if x['name'] == 'curve-full'), None)
        if curve is None:
            missing.append(sequence)
        elif curve['exit_code'] or not curve['source_unchanged']:
            failed.append(sequence)
        else:
            before = json.loads((BASE / 'brep-combined-source/source-before.json').read_text())
            assert all(inputs.get(p) == h for p, h in before.items()), 'Parallel curve source differs'
            path = WORKSPACE / curve['log']
            assert hashlib.sha256(path.read_bytes()).hexdigest() == curve['log_sha256']
            assert '--release' in curve['command'] and '--all-features' in curve['command'] and '--no-fail-fast' in curve['command']
            qualified.append({'sequence': sequence, 'basis': 'same Cargo package and features, full CI optimized suite', 'record': curve['log']})
        continue
    row = current.get(sequence)
    if not row:
        missing.append(sequence)
    elif row['exit_code']:
        failed.append(sequence)
    else:
        assert row['source_unchanged'] and row['source_inputs'] == len(inputs), sequence
        assert row['revision'] in allowed_revisions, sequence
        if sequence in {117, 118}:
            assert row['revision'] == cache_fix['revision'], 'Package verification must include the source-cache fix'
        if sequence == 115:
            assert row['revision'] == svg['revision'], 'All-feature suite must include vertical SVG exact-success acceptance'
        if sequence == 123:
            assert row['revision'] == axis['revision'], 'BRep suite must include the exact-success acceptance test'
        # Site assembly has an explicit absolute evidence-output adjustment.
        assert row['command'] == effective_command(item['command']), sequence
        qualified.append({'sequence': sequence, 'basis': 'executed on final compiled inputs', 'actual_revision': row['revision'], 'record': row['log']})

result = {'required_commands': len(expected), 'qualified': len(qualified), 'missing': missing, 'failed': failed, 'records': qualified}
(HERE / 'gate-audit.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps({key: value for key, value in result.items() if key != 'records'}))
raise SystemExit(bool(missing or failed))
