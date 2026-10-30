from pathlib import Path
import hashlib
import json
import subprocess
import time

root = Path(__file__).resolve().parent
checkout = root / 'normal'
workspace = Path('/home/tim/Documents/GitHub/workspace/csgrs')
bare = Path('/home/tim/Documents/GitHub/workspace/csgrs-evidence.git')
record = json.loads((root / 'publication-final-commit.json').read_text())
validation = json.loads((root / 'validation-status.json').read_text())
payload = json.loads((root / 'publication-payload-audit.json').read_text())
persisted = json.loads((root / 'publication-receipt-persisted.json').read_text())
receipts = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
code_remote = 'git@github.com:timschmidt/csgrs.git'
evidence_remote = 'https://github.com/timschmidt/csgrs-evidence.git'
code_branch = 'refs/heads/main'
evidence_branch = 'refs/heads/hypercurve-closure-2026-10-26'
targets = json.loads((root / 'publication-targets.json').read_text())
code_base = targets['published_code_base']
evidence_base = targets['published_evidence_base']


def output(command, cwd=None):
    return subprocess.check_output(command, cwd=cwd, text=True).strip()


def user_state():
    return {
        'head': output(['git', 'rev-parse', 'HEAD'], workspace),
        'status': output(['git', 'status', '--porcelain'], workspace),
        'diff_sha256': hashlib.sha256(subprocess.check_output(['git', 'diff', '--binary'], cwd=workspace)).hexdigest(),
    }


def remote_head(remote, branch):
    fields = output(['git', 'ls-remote', '--heads', remote, branch]).split()
    assert len(fields) == 2 and fields[1] == branch, fields
    return fields[0]


def gate():
    release_sources = json.loads((root / 'release-source-audit.json').read_text())
    assert release_sources['all_passed'] and len(release_sources['groups']) == 2
    assert release_sources['source_revision'] == record['qualified_code']
    assert validation['source_revision'] == record['qualified_code']
    assert validation['completed_successfully'] == 328
    assert validation['execution_complete'] and validation['source_attribution_complete']
    assert not validation['pending_record_closeout']
    assert len(validation['attribution']) == 328 and validation['historical_results_reused'] == 0
    assert record['clean'] and record['nonreceipt_bytes_unchanged']
    assert record['qualified_groups'] == 328 and record['archive_records'] == targets['expected_archive_records']
    assert set(record['receipt_only_changes']) == receipts
    assert persisted['code'] == record['head'] and persisted['evidence'] == record['evidence']
    assert persisted['persisted'] and persisted['user_worktree_unchanged']
    assert payload['head'] == record['evidence']
    assert payload['already_published_parent'] == evidence_base
    assert not payload['credential_pattern_findings']
    checks = json.loads((root / 'publication-receipt-checks.json').read_text())
    assert {check['name'] for check in checks} == {'fmt', 'typos', 'budget', 'diff', 'archive'}
    assert all(check['exit_code'] == 0 for check in checks)
    assert output(['git', 'rev-parse', 'HEAD'], checkout) == record['head']
    assert not output(['git', 'status', '--porcelain'], checkout)
    assert set(output(['git', 'diff', '--name-only', record['qualified_code'], record['head']], checkout).splitlines()) == receipts
    assert output(['git', '--git-dir=' + str(bare), 'rev-parse', 'refs/heads/' + record['evidence_branch']]) == record['evidence']
    subprocess.run(['git', 'merge-base', '--is-ancestor', code_base, record['head']], cwd=checkout, check=True)
    subprocess.run(['git', '--git-dir=' + str(bare), 'merge-base', '--is-ancestor', evidence_base, record['evidence']], check=True)


before = user_state()
assert before['head'] == '904e5408e128a4f4b35ed0ce028f176023d7eadd'
assert before['diff_sha256'] == 'de4406085e56ad8915ef588bf1b9b1d18a44853f48ce5c3ce610edcc1af48570'
gate()
current_code = remote_head(code_remote, code_branch)
current_evidence = remote_head(evidence_remote, evidence_branch)
assert current_code in {code_base, record['head']}, current_code
assert current_evidence in {evidence_base, record['evidence']}, current_evidence
preflight = {'code': current_code, 'evidence': current_evidence, 'recorded_epoch': time.time()}
(root / 'publication-remote-preflight.json').write_text(json.dumps(preflight, indent=2) + '\n')
for label, current, target, command in [
    ('evidence', current_evidence, record['evidence'], ['git', '--git-dir=' + str(bare), 'push', evidence_remote, record['evidence'] + ':' + evidence_branch]),
    ('code', current_code, record['head'], ['git', 'push', code_remote, record['head'] + ':' + code_branch]),
]:
    gate()
    assert before == user_state()
    if current == target:
        continue
    started = time.time()
    with (root / ('publication-push-' + label + '.log')).open('w') as log:
        result = subprocess.run(command, cwd=checkout, stdout=log, stderr=subprocess.STDOUT)
    receipt = {'command': command, 'exit_code': result.returncode, 'elapsed_seconds': time.time() - started, 'target': target}
    (root / ('publication-push-' + label + '.json')).write_text(json.dumps(receipt, indent=2) + '\n')
    assert result.returncode == 0, label
assert remote_head(code_remote, code_branch) == record['head']
assert remote_head(evidence_remote, evidence_branch) == record['evidence']
assert before == user_state()
result = {'main': record['head'], 'evidence': record['evidence'], 'main_remote': code_remote, 'evidence_remote': evidence_remote, 'evidence_branch': evidence_branch, 'qualified_groups': 328, 'archive_records': record['archive_records'], 'user_worktree_unchanged': True, 'recorded_epoch': time.time(), 'pushed': True}
(root / 'push-receipt.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result), flush=True)
