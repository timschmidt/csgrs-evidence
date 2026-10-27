from pathlib import Path
import hashlib
import json
import subprocess

root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-circle-replay')
base = json.loads((root / 'point-replay-final-commit.json').read_text())['commit']
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'circle-replay-final-results.json').read_text())
assert len(results) == 18 and all(row['exit_code'] == 0 and row['source_stable'] for row in results)
files = json.loads((root / 'circle-replay-final-files-before.json').read_text())
assert files == json.loads((root / 'circle-replay-final-files-after.json').read_text())
for name, mode, digest in files:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name
archive = json.loads((root / 'circle-replay-evidence-archive.json').read_text())
record, count, size, digest = archive['manifest_row'].split('\t')
commit = archive['commit']
assert archive['parent'] == json.loads((root / 'point-replay-evidence-archive.json').read_text())['commit']
text = f'''**Selected circle frame replay increment (2026-10-27).** The preceding
point-graph increment `{base[:10]}` can replay the line cut from the original
degree-seven fillet, while the complete generated circle still fails export.
The unchanged-source baseline and its original positive assertion are retained.
A separate baseline also rejects the independent retained circle point before
serialization. Hypercurve owns circle frames, selected angular domains, exact
point incidence and retained chord directions; native SVG and the CSGRS adapter
consume those owners. P15, P18–P20, P27 and P28–P30 apply.

Version 4 now preserves chord-normal circle frames with their exact center,
directed source chord, nonzero signed radius and orientation. Scalar angular
parameters, signed normal contacts and independently incident points select
finite ascending ranges with explicit traversal. The original point and shared
source definitions remain authoritative; there is no coordinate fitting or
forced independent scalar materialization. Replay proves the literal signed
normal relation, radius, incident-point equation and selected half. Every unused
record is checked, including typed references and cross-circle parameter owners.

Transported oblique chord frames retain a represented unit-direction witness.
The chord owner proves unit length, perpendicular equality and positive directed
displacement before retaining it. Supports and finite chord ranges remain
distinct. Represented endpoint directions already reconstructed by the ordinary
constructor keep their existing wire form. This restores the construction fact
needed for deterministic projection after algebraic similarities. Construction
tangent flags are not serialized; the retained normal relations and existing
arrangement predicates re-establish applicable contacts. A changed-neighbor
witness confirms both transverse roots instead of inheriting tangency.

Eleven public curve witnesses cover the complete original fillet in a fresh
process before exact incidence, splitting, reversal and a second archive;
algebraic rotation/scaling and reflection; region admission, all four empty-set
Boolean operations and boundary reconstruction; mixed native/generated boundaries
with a hole and disconnected material; two changed-neighbor crossings in both
orders; invalid unit directions and signed contacts; finite-arc clipping and
`2^-80` separation; malformed frames, selectors and ranges; and reached depth
and byte limits followed by larger retries. A unit witness checks consumed
approximate-policy barriers. The CSGRS SVG adapter repeats complete circle
replay followed by split, reversal and another archive. Exact expectations are
checked separately from deterministic complete SVG bytes.

All 18 final groups pass: 2,832 Hypercurve tests across 91 suites, with the same
34 existing ignored cases; 64 root tests across 11 affected suites; 3,012 tests
across six dependent packages; strict all-target/all-feature Hypercurve,
Hyperbrep and CSGRS MSRV Clippy; builds without optional features; API docs with
warnings denied; fuzz Clippy; formatting; 16 matrix guards; 181 capability
witnesses; typos, repository budget and diff checks. Evidence is in `{record}`,
SHA-256 `{digest}`. All non-receipt bytes remain
identical after qualification. A host filesystem quota truncated extraction of
a required Gerber fixture during the first consumer attempt. Its positive
coverage assertion failed; the full consumer command was rerun successfully on
unchanged source after storage recovery. No fixture or assertion was changed.
Original failures and every prototype source
snapshot are retained, including the selected angular-record gap, missing unit
direction evidence, support/range reference distinction, unchanged older chart
assertion and proved-invalid contact classification. No hard geometry assertion
was replaced by a blocker expectation.

Other generated circle frames, general mapped contacts, repeated-offset angular
transport and filled-region native archives remain required work. A separate
correlated degree-seven/five fiber-center probe imports and evaluates exact
endpoints, but its independently mapped midpoint returns `Blocked(Ordering)`.
That preserved positive failure is an implementation gap, not exhausted work or
completed support. This finite corpus is not a universal algebraic closure proof.
Frame dependency depth and extension bytes do not bound total solver work,
coefficient or scalar-expression growth, temporary/retained memory or cooperative
cancellation. Full pre-push qualification and published-package delivery remain
pending for this increment.

'''
p = checkout / 'crates/hypercurve/FUTURE_WORK.md'
s = p.read_text()
assert '**Selected circle frame replay increment' not in s
pos = s.index('**Open, in dependency order:**', s.index('## 8. Polynomial-branch sections'))
p.write_text(s[:pos] + text + s[pos:])
p = checkout / 'docs/evidence-archive.md'
s = p.read_text()
marker = '## Follow-on records\n\n'
assert marker in s and commit not in s
text = f'''The local `hypercurve-circle-replay-evidence-2026-10-27` branch ends at
`{commit}`, adding `{record}`
({int(count):,} files, {int(size):,} bytes), SHA-256 `{digest}`.
It records exact selected circle frames, signed contacts, independent incident
selectors, checked chord unit directions and downstream point/region operations.
All 2,832 Hypercurve tests, 64 root tests, 3,012 dependent-package tests, strict
MSRV and fuzz Clippy, builds without optional features, API docs, formatting,
16 matrix guards and 181 capability witnesses pass. The suite retains the same
34 existing ignored cases. Original failures, prototype snapshots and fresh
process replay before further operations are preserved. This record is local
and unpushed. General circle charts, correlated-fiber midpoint ordering,
repeated-offset chart transport, filled-region archives, total resource bounds,
full pre-push checks and published-package delivery remain open.

'''
p.write_text(s.replace(marker, marker + text, 1))
p = checkout / 'docs/evidence-archive.tsv'
excluded = [row for row in p.read_text().splitlines() if row.startswith('excluded:')]
assert len(excluded) == 4
manifest = subprocess.check_output(['python3', 'scripts/evidence_archive.py', 'manifest', '/tmp/csgrs-closure-evidence.git', commit], cwd=checkout, text=True).splitlines()
assert len(manifest) == 360 and not any(row.startswith('excluded:') for row in manifest)
p.write_text('\n'.join(manifest + excluded) + '\n')
receipts = ['crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv']
for name, mode, digest in files:
    if name not in receipts and mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name
(root / 'circle-replay-receipt-prepared.json').write_text(json.dumps({'archive': archive, 'parent': base, 'receipt_files': receipts}, indent=2) + '\n')
print('Prepared three qualification receipts; all non-receipt bytes unchanged.')
