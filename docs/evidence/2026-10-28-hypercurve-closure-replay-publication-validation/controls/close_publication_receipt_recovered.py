from pathlib import Path
import hashlib, json, os, subprocess, time

root = Path(__file__).resolve().parent
checkout = root / 'normal'
publication = {**json.loads((root / 'publication-source.json').read_text()), **json.loads((root / 'publication-targets.json').read_text())}
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
manifest = subprocess.check_output(['python3', 'scripts/evidence_archive.py', 'manifest', '/home/tim/Documents/GitHub/workspace/csgrs-evidence.git', commit], cwd=checkout, text=True).splitlines()
archive_records = len(manifest) - 1
assert archive['manifest_row'] in manifest
assert archive_records == len([row for row in p.read_text().splitlines() if not row.startswith('excluded:')])
p.write_text('\n'.join(manifest + excluded) + '\n')

text = f'''**Replay publication pre-push qualification (2026-10-28).** The frozen
source `{head}` includes the qualified closure and native replay increments
through retained fiber-point order. All 328 required command groups pass in
fresh executions: 131 locally executable workflow groups, 196 strict Clippy
groups and the CI security audit. The full Hypercurve suite, downstream
consumers, feature combinations, documentation, benchmarks, WASM/demo builds
and both release/package checks are included. All 13 address-sanitized fuzz
campaigns pass with recorded mutation evidence. Stable 1.99.1, MSRV 1.95.0 and
nightly-2026-10-27 are recorded with the commands.

The complete inventory, source attribution, fresh unsuccessful attempts and
hosted-action review are in `{record}`, SHA-256 `{digest}`. No historical
command results count toward this run. A host restart removed the earlier
in-flight runs; all required commands were rerun after recovery. The first
recovered normal attempt exposed outer Cargo workspace discovery, so the
checkout was relocated and every normal phase rerun on identical source bytes.
All {archive_records} archived records verify; four historical third-party
archive exclusion receipts remain. This receipt changes only three documentation
files, with every other tracked byte equal to the qualified revision. Formatting,
typos, repository budget, diff and archive verification are rerun afterward.
Earlier pending pre-push statements for the included increments describe their
incremental history and are superseded by this record.

Hosted configuration, uploads and deployment actions were inspected rather than
executed; local packaging does not establish publication or deployment. Timing
under concurrent validation is not a performance claim. Selected-circle point
queries, circle differentials, rational point images and the later region,
compound replay, contact and corner increments are excluded from this candidate.
The full exact-closure plan and outstanding capability gaps remain open.

'''
p = checkout / 'crates/hypercurve/FUTURE_WORK.md'
s = p.read_text()
marker = '**Open, in dependency order:**'
pos = s.index(marker, s.index('## 8. Polynomial-branch sections'))
assert '**Replay publication pre-push qualification (2026-10-28).**' not in s
p.write_text(s[:pos] + text + s[pos:])
p = checkout / 'docs/evidence-archive.md'
s = p.read_text()
text = f'''The replay publication archive ends at `{commit}` with {archive_records} records.
Its new record `{record}` contains {int(count):,} files and {int(size):,} bytes,
SHA-256 `{digest}`. It records fresh source-attributed success for all 328
pre-push command groups on `{head}`: 131 locally executable workflow groups,
196 strict Clippy groups and the CI security audit. All 13 ASan campaigns include
successful mutation evidence. Stable 1.99.1, MSRV 1.95.0, nightly-2026-10-27, both
release/package checks and the hosted-action review are retained. Lost runs from
before the host restart are not credited. All {archive_records} record digests
verify, and four historical archive exclusions remain unchanged. Only three
receipt files differ from the qualified code; they are checked separately.
This supersedes earlier pending pre-push status for the included increments
through retained fiber-point order. Later selected-circle points, differentials,
rational point images, region/replay/contact and corner work are excluded.
Hosted actions and publication/deployment are not established by local checks.

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
    ('archive', ['python3', 'scripts/evidence_archive.py', 'verify', '/home/tim/Documents/GitHub/workspace/csgrs-evidence.git', commit]),
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
subprocess.run(['git', 'commit', '-m', 'Record complete replay publication qualification'], cwd=checkout, check=True)
assert not git('status', '--porcelain')
assert set(git('diff', '--name-only', head, 'HEAD').splitlines()) == receipts
result = {'head': git('rev-parse', 'HEAD'), 'qualified_code': head, 'evidence': commit, 'evidence_branch': publication['evidence_branch'], 'code_branch': publication['code_branch'], 'qualified_groups': 328, 'archive_records': archive_records, 'receipt_only_changes': sorted(receipts), 'nonreceipt_bytes_unchanged': True, 'clean': True, 'pushed': False, 'recorded_epoch': time.time()}
(root / 'publication-final-commit.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result), flush=True)
