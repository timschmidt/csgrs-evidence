from pathlib import Path
import hashlib
import json
import subprocess

root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-native-replay')
base = 'dca62335496d074239a403ad5ba08dd917a6a24a'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'native-replay-final-results.json').read_text())
assert len(results) == 17 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
files_before = json.loads((root / 'native-replay-final-files-before.json').read_text())
assert files_before == json.loads((root / 'native-replay-final-files-after.json').read_text())
for name, mode, digest in files_before:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name
archive = json.loads((root / 'native-replay-evidence-archive.json').read_text())
record, files, size, digest = archive['manifest_row'].split('\t')
commit = archive['commit']
assert archive['parent'] == '8b0caa9be41bdacd1f40bd9f60b7b9da3f339962'
downstream = archive['root_downstream_tests']['passed']
text = f'''**Selected native source replay increment (2026-10-27).** On committed
`{base[:10]}`, an authored quadratic restricted at the selected positive root
of `2t^2-1` fails native SVG export. The unchanged library also rejects finite
projection of the retained line range `[1/4,3/4]`, whose independent endpoints
are `(2,0)` and `(6,0)`. Both failures and the library digest are retained.
The owning layers are Hypercurve exact interchange and finite path projection;
the root SVG adapter transports typed failures. P15, P18–P20 and P28–P30 apply.

Version 4 stroke metadata records native sources, selected parameters, original
domains and traversal in dependency order. Selected roots carry their defining
polynomials and isolators; projective charts reference the original selected
root. Replay re-establishes each definition through existing STRICT constructors
before assembling the path. Invalid, forward, cyclic and wrong-kind references
are rejected, including invalid definitions followed by an empty path. Local
allocation keys preserve existing sharing but are never serialized or treated
as mathematical equality. Authored-only paths still emit version 3, and both
versions remain readable. Finite projection consumes the existing retained
source spans through its fragment sampler; display commands never replace the
authoritative metadata. The existing maximum SVG segment count is checked
before publication, and exact replay errors retain their kernel category.

Nine curve witnesses include a separate-process reload followed by exact point
incidence, further restriction, another archive and reversed overlap; shared
degree-seven roots and projective charts; algebraic coefficients; similarity
and replay; rational trims of all eight authored families; invalid selectors,
ranges, references and chart poles; actual byte/segment limits with retry; and
exact finite-projection endpoints and traversal. Two root adapter witnesses
exercise public replay and typed invalid geometry paired with an empty path.
The all-family witness uses rational trims; selected algebraic trim success
is limited to the named cases.

Final checks pass: 2,790 Hypercurve tests (87 suites, 34 existing ignored),
{downstream:,} root tests across seven affected suites, and 3,010 tests across six
dependent packages, none ignored. Strict Hypercurve/CSGRS all-target/all-feature
MSRV Clippy, the no-default-feature Hypercurve build, both API documentation
builds with warnings denied, formatting, 16 matrix guards, 142 capability
witnesses, typos, repository budget and diff checks pass. Raw failures, exact
commands and source snapshots are in `{record}`,
SHA-256 `{digest}`. All non-receipt source bytes
remain unchanged after this receipt. The initial compilation errors, projection
failures and lint failure are retained; no existing test or hard fixture was
weakened.

This is a per-path authored-source restriction format. Other generated supports,
selected or joint fibers, filled-region native replay, cross-path sharing and
shared scalar-expression DAG serialization remain open. Byte and segment limits
do not bound total arithmetic, coefficient growth, memory or cancellation. No
performance improvement or universal closure is claimed. Full repository
pre-push qualification and published-package delivery remain pending for this
increment; checks on the earlier publication candidate do not validate these
source bytes.

'''
p = checkout / 'crates/hypercurve/FUTURE_WORK.md'
s = p.read_text()
assert '**Selected native source replay increment' not in s
pos = s.index('**Open, in dependency order:**', s.index('## 8. Polynomial-branch sections'))
p.write_text(s[:pos] + text + s[pos:])
p = checkout / 'docs/evidence-archive.md'
s = p.read_text()
text = f'''The local `hypercurve-native-replay-evidence-2026-10-27` branch ends at
`{commit}`, adding `{record}`
({int(files):,} files, {int(size):,} bytes), SHA-256 `{digest}`.
It records exact native source restrictions, selected-root and projective-chart
replay, retained-domain finite projection and root adapter error transport.
All 2,790 Hypercurve tests, {downstream:,} root tests, 3,010 dependent-package tests,
strict MSRV Clippy, the build without optional features, API documentation,
formatting, 16 matrix guards and 142 capability witnesses pass. The Hypercurve
suite retains 34 existing ignored cases. Original export/projection failures,
failed prototypes and qualification, source snapshots and fresh-process replay
evidence are retained. This record is local and unpushed. Full pre-push checks,
broader generated/filled-region replay and general algebraic closure remain open.

'''
marker = '## Follow-on records\n\n'
assert marker in s and commit not in s
p.write_text(s.replace(marker, marker + text, 1))
p = checkout / 'docs/evidence-archive.tsv'
excluded = [row for row in p.read_text().splitlines() if row.startswith('excluded:')]
assert len(excluded) == 4
manifest = subprocess.check_output(['python3', 'scripts/evidence_archive.py', 'manifest', '/tmp/csgrs-closure-evidence.git', commit], cwd=checkout, text=True).splitlines()
assert len(manifest) == 356 and not any(row.startswith('excluded:') for row in manifest)
p.write_text('\n'.join(manifest + excluded) + '\n')
receipts = ['crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv']
for name, mode, digest in files_before:
    if name not in receipts and mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name
(root / 'native-replay-receipt-prepared.json').write_text(json.dumps({'archive': archive, 'parent': base, 'receipt_files': receipts}, indent=2) + '\n')
print('Prepared three qualification receipts; all non-receipt bytes unchanged.')
