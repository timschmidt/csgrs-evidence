from pathlib import Path
import hashlib, json, os, subprocess, time

root = Path(__file__).resolve().parent
checkout = root / 'normal'
publication = json.loads((root / 'publication-source.json').read_text())
head = publication['head']
assert not (root / 'publication-final-commit.json').exists()
subprocess.run(['python3', str(root / 'audit_validation.py'), '--require-complete'], check=True)
archive = json.loads((root / 'validation-evidence.json').read_text())
assert archive['parent'] == publication['evidence']
record, count, size, digest = archive['manifest_row'].split('\t')
commit = archive['commit']
receipts = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}

def git(*args):
    return subprocess.check_output(['git', *args], cwd=checkout, text=True).strip()

assert git('rev-parse', 'HEAD') == head
assert not git('status', '--porcelain')
names = git('ls-files').splitlines()
before = {name: hashlib.sha256((checkout / name).read_bytes()).hexdigest() for name in names if (checkout / name).is_file()}
p = checkout / 'docs/evidence-archive.tsv'
excluded = [row for row in p.read_text().splitlines() if row.startswith('excluded:')]
assert len(excluded) == 4
manifest = subprocess.check_output(['python3', 'scripts/evidence_archive.py', 'manifest', '/tmp/csgrs-closure-evidence.git', commit], cwd=checkout, text=True).splitlines()
assert len(manifest) == 351 and archive['manifest_row'] in manifest
p.write_text('\n'.join(manifest + excluded) + '\n')

text = f'''**Combined pre-push qualification (2026-10-27).** The source revision
`{head}` combines the qualified closure increments through
polynomial/rational sections with the unchanged-write voxel test correction.
All 328 required command groups pass in fresh executions: 131 locally executable
workflow groups, 196 strict Clippy groups and the CI security audit. The full
Hypercurve suite, downstream consumers, feature combinations, documentation,
benchmarks, WASM/demo builds and both release/package checks are included.
All 13 address-sanitized fuzz campaigns pass with recorded mutation evidence.
Stable 1.99.1, MSRV 1.95.0 and nightly-2026-10-27 are recorded with the commands.
The sanitizer launch wrapper was interrupted, while its original workflow child
continued the unchanged campaigns. That child's actual OS exit status and every
full-budget campaign outcome are retained separately from the wrapper failure.

The complete inventory, original unsuccessful attempts, source attribution and
hosted-action review are in `{record}`,
SHA-256 `{digest}`.
No historical command results count toward this run. The four archive exclusion
receipts are preserved, and all 350 archived records verify. This receipt changes
only three documentation files; every other tracked byte matches the qualified
revision. Formatting, typos, repository budget, diff and archive verification
are rerun after the receipt edit. Earlier statements that this combined code
still awaited pre-push qualification describe its incremental qualification
history and are superseded by this record.

Hosted configuration, uploads and deployment actions were inspected rather than
executed; local packaging does not establish publication or deployment. Timing
under concurrent load is not a performance claim. Later point-location,
polynomial-region, horizontal-boundary, algebraic-similarity and integration work
is excluded from this revision. The full exact-closure plan and the unsupported
capabilities in the matrix remain open.

'''
p = checkout / 'crates/hypercurve/FUTURE_WORK.md'
s = p.read_text()
marker = '**Open, in dependency order:**'
pos = s.index(marker, s.index('## 8. Polynomial-branch sections'))
assert '**Combined pre-push qualification (2026-10-27).**' not in s
p.write_text(s[:pos] + text + s[pos:])
p = checkout / 'docs/evidence-archive.md'
s = p.read_text()
text = f'''The combined publication archive ends at `{commit}` with 350 records.
Its new record `{record}` contains
{int(count):,} files and {int(size):,} bytes, SHA-256
`{digest}`. It records fresh, source-attributed
success for all 328 pre-push command groups on `{head}`:
131 locally executable workflow groups, 196 strict Clippy groups and the CI
security audit. All 13 ASan campaigns include successful mutation evidence.
Stable 1.99.1, MSRV 1.95.0, nightly-2026-10-27, both release/package checks and the
hosted-action review are retained. All 350 record digests verify; four historical
third-party archive exclusions remain unchanged. The three documentation files
carrying this receipt are checked separately; all other tracked bytes equal the
qualified revision. This completes the publication candidate's local pre-push
qualification and supersedes earlier pending status for its included increments.
Later point-location, polynomial-region, horizontal-boundary, algebraic-similarity
and integration changes are excluded. Hosted actions and actual
publication/deployment are not established by local validation.

'''
marker = '## Follow-on records\n\n'
assert marker in s and commit not in s
p.write_text(s.replace(marker, marker + text, 1))
assert set(git('diff', '--name-only').splitlines()) == receipts
assert not git('ls-files', '--others', '--exclude-standard')
for name, expected in before.items():
    if name not in receipts:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == expected, name
commands = [
    ('fmt', ['cargo', '+1.99.1', 'fmt', '--all', '--', '--check']),
    ('typos', ['typos']),
    ('budget', ['scripts/check-repository-budget.sh']),
    ('diff', ['git', 'diff', '--check']),
    ('archive', ['python3', 'scripts/evidence_archive.py', 'verify', '/tmp/csgrs-closure-evidence.git', commit]),
]
results = []
for label, command in commands:
    started = time.time()
    with (root / ('publication-receipt-' + label + '.log')).open('w') as out:
        result = subprocess.run(command, cwd=checkout, stdout=out, stderr=subprocess.STDOUT)
    row = {'name': label, 'command': command, 'exit_code': result.returncode, 'elapsed_seconds': time.time() - started}
    results.append(row)
    (root / 'publication-receipt-checks.json').write_text(json.dumps(results, indent=2) + '\n')
    print(row, flush=True)
    assert result.returncode == 0, label
subprocess.run(['git', 'add', '--', *sorted(receipts)], cwd=checkout, check=True)
for label, command in [('staged-budget', ['scripts/check-repository-budget.sh', '--staged']), ('staged-diff', ['git', 'diff', '--cached', '--check'])]:
    with (root / ('publication-receipt-' + label + '.log')).open('w') as out:
        subprocess.run(command, cwd=checkout, stdout=out, stderr=subprocess.STDOUT, check=True)
subprocess.run(['git', 'commit', '-m', 'Record complete Hypercurve closure publication qualification'], cwd=checkout, check=True)
assert not git('status', '--porcelain')
assert set(git('diff', '--name-only', head, 'HEAD').splitlines()) == receipts
result = {'head': git('rev-parse', 'HEAD'), 'qualified_code': head, 'evidence': commit, 'evidence_branch': publication['evidence_branch'], 'code_branch': publication['code_branch'], 'qualified_groups': 328, 'archive_records': 350, 'receipt_only_changes': sorted(receipts), 'nonreceipt_bytes_unchanged': True, 'clean': True, 'pushed': False, 'recorded_epoch': time.time()}
(root / 'publication-final-commit.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result), flush=True)
