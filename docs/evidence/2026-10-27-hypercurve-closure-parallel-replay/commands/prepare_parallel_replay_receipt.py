from pathlib import Path
import hashlib
import json
import subprocess

root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-parallel-replay')
base = '8eea456ceec297833e727212183581e3cd43527b'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'parallel-replay-final-results.json').read_text())
assert len(results) == 17 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
files_before = json.loads((root / 'parallel-replay-final-files-before.json').read_text())
assert files_before == json.loads((root / 'parallel-replay-final-files-after.json').read_text())
for name, mode, digest in files_before:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name
archive = json.loads((root / 'parallel-replay-evidence-archive.json').read_text())
record, files, size, digest = archive['manifest_row'].split('\t')
commit = archive['commit']
assert archive['parent'] == 'e0d8165fae971704511ba1f27fd6286eff408f6b'
downstream = archive['root_downstream_tests']['passed']
text = f'''**Procedural parallel replay increment (2026-10-27).** Committed
`{base[:10]}` passes the authored-restriction replay control but rejects a
regular parabola parallel during SVG export. Its qualified unchanged library
also rejects finite projection of an ellipse parallel and an exterior `[2,3]`
line-parallel range. All three failures, source attribution, compiler commands
and the library digest are retained. Hypercurve exact interchange and finite
parallel projection own these changes; P15, P18–P20 and P28–P30 apply.

Version 4 adds shared source/normal-distance supports and selected finite range
records. Replay uses existing strict constructors to re-establish roots,
ascending ranges, denominator and normal guards, and interior cusp exclusions.
Every finite range is checked even when unused by an empty final path. Existing
version 3 and version 4 records remain supported. Local immutable allocation
keys retain sharing but are never serialized or treated as mathematical
equality. Explicit range order matters: the generic curve-range constructor
admits traversal in either direction and cannot certify an ascending domain.

Finite projection now evaluates interval bounds on the original retained range,
including exterior domains, and subdivides inconclusive Ordering enclosures
under the existing depth bound. Every accepted chord still needs a certified
box. Other error outcomes remain explicit, and display points never replace the
native source. A pole inside a retained rational range preserves the existing
typed Boundary blocker; it is not relabeled as invalid or counted as completion.

Nine curve witnesses cover parabola, nonrational ellipse, PH cubic and stationary
zero-distance sources with independently derived exact midpoint expectations;
shared cusp boundaries; separate-process reload before region admission,
Booleans and round offset; invalid references and singular/nonascending ranges;
rational pole guards and exterior domains; exact finite line-parallel endpoints;
reached byte limits and retry; algebraic trim, reflected algebraic similarity
and another archive; and distinct distances sharing one source. One root SVG
adapter witness consumes the replayed result in exact point incidence. The cap
fixture checks specified exact relations and operation consumption; its finite
membership assertions do not independently prove the entire expanded set.

Final checks pass: 2,799 Hypercurve tests (88 suites, 34 existing ignored),
{downstream:,} root tests across eight affected suites, and 3,010 tests across six
dependent packages, none ignored. Strict Hypercurve/CSGRS all-target/all-feature
MSRV Clippy, the no-default-feature Hypercurve build, both API documentation
builds with warnings denied, formatting, 16 matrix guards, 151 capability
witnesses, typos, repository budget and diff checks pass. Raw failures, exact
commands and frozen source snapshots are in `{record}`,
SHA-256 `{digest}`. All non-receipt source bytes
remain unchanged after this receipt. Failed compilation attempts, the original
projection failures and the descending-range replay failure remain available;
no existing test or hard fixture was weakened. The first downstream build failed
before tests when ccache attempted read-only storage. Its logs are retained;
a task-owned cache resolved the environment failure, and the remaining twelve
groups resumed on unchanged source. The first five passed groups keep their
original command and environment attribution.

Other generated supports, selected or joint fibers, filled-region archives,
cross-path sharing and scalar-expression DAG serialization remain open. Existing
byte, segment and subdivision-depth limits do not bound total arithmetic,
coefficient growth, temporary/retained memory or cancellation. No performance
improvement or universal closure is claimed. Full repository pre-push checks
and published-package delivery remain pending for this increment; the earlier
pushed candidate does not qualify these source bytes.

'''
p = checkout / 'crates/hypercurve/FUTURE_WORK.md'
s = p.read_text()
assert '**Procedural parallel replay increment' not in s
pos = s.index('**Open, in dependency order:**', s.index('## 8. Polynomial-branch sections'))
p.write_text(s[:pos] + text + s[pos:])
p = checkout / 'docs/evidence-archive.md'
s = p.read_text()
text = f'''The local `hypercurve-parallel-replay-evidence-2026-10-27` branch ends at
`{commit}`, adding `{record}`
({int(files):,} files, {int(size):,} bytes), SHA-256 `{digest}`.
It records native procedural-parallel replay, retained source/range/normal-side
relations and finite projection on exterior or subdivided intervals.
All 2,799 Hypercurve tests, {downstream:,} root tests, 3,010 dependent-package tests,
strict MSRV Clippy, the build without optional features, API documentation,
formatting, 16 matrix guards and 151 capability witnesses pass. The Hypercurve
suite retains 34 existing ignored cases. Committed-parent export/projection
failures, failed prototypes, source snapshots and separate-process replay before
further region operations are retained. This record is local and unpushed.
Full pre-push checks, broader generated/filled-region replay, general algebraic
closure and total resource bounds remain open.

'''
marker = '## Follow-on records\n\n'
assert marker in s and commit not in s
p.write_text(s.replace(marker, marker + text, 1))
p = checkout / 'docs/evidence-archive.tsv'
excluded = [row for row in p.read_text().splitlines() if row.startswith('excluded:')]
assert len(excluded) == 4
manifest = subprocess.check_output(['python3', 'scripts/evidence_archive.py', 'manifest', '/tmp/csgrs-closure-evidence.git', commit], cwd=checkout, text=True).splitlines()
assert len(manifest) == 357 and not any(row.startswith('excluded:') for row in manifest)
p.write_text('\n'.join(manifest + excluded) + '\n')
receipts = ['crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv']
for name, mode, digest in files_before:
    if name not in receipts and mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name
(root / 'parallel-replay-receipt-prepared.json').write_text(json.dumps({'archive': archive, 'parent': base, 'receipt_files': receipts}, indent=2) + '\n')
print('Prepared three qualification receipts; all non-receipt bytes unchanged.')
