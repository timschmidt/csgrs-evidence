from pathlib import Path
import hashlib
import json
import subprocess

root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-point-replay')
base = json.loads((root / 'chord-replay-final-commit.json').read_text())['commit']
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'point-replay-final-results.json').read_text())
assert len(results) == 18 and all(row['exit_code'] == 0 and row['source_stable'] for row in results)
files = json.loads((root / 'point-replay-final-files-before.json').read_text())
assert files == json.loads((root / 'point-replay-final-files-after.json').read_text())
for name, mode, digest in files:
    if mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name
archive = json.loads((root / 'point-replay-evidence-archive.json').read_text())
record, count, size, digest = archive['manifest_row'].split('\t')
commit = archive['commit']
assert archive['parent'] == json.loads((root / 'chord-replay-evidence-archive.json').read_text())['commit']
text = f'''**Selected point graph replay increment (2026-10-27).** Committed
`{base[:10]}` exports a selected chord but rejects both the retained line
and complete circular fillet from a degree-seven selected corner. The original
positive assertions, exact cut expectations, commands, qualified-library digest
and committed-source attribution remain in the evidence. This increment resolves
the retained line. The unchanged complete-circle assertion still fails with an
unsupported generated-curve definition. Hypercurve point construction and native
SVG replay own the geometric work; Hyperbrep owns its planar-point archive and
record admission. P15, P18–P20, P27 and P28–P30 apply.

Version 4 adds polynomial-fiber, rational-image, exact-similarity and unique
supporting-line-intersection point definitions, plus shared chord-displacement
recipes and endpoint selections. Replay retains the correlated base parameter,
re-proves the selected fiber, checks original denominator guards and reconstructs
similarities and unique intersections. Chord displacements preserve the directed
source, signed tangent or left-normal distance, optional origin and exact
translation. A native line or selected chord supplies the original support;
independent scalar materialization is unnecessary. The existing owner validates
the construction, including inherited policy. Invalid unused definitions fail.

The graph writer visits point dependencies iteratively. Local address keys own
their immutable inputs and do not define mathematical equality. Reusing shared
map prefixes emits 14, 26 and 50 native records for the named 4, 8 and 16-span
fixtures; these measurements concern serialization growth, not total memory or
speed. A new configurable point-definition depth limit is propagated through
chord and endpoint indirection. Byte and depth exhaustion are typed and permit a
larger-budget retry. The decoder reuses only prior checked immutable definitions;
public point reconstruction continues to validate its dependencies.

Hyperbrep's new planar-point variant delegates to the same geometry owner. Its
resource pass counts the source and optional origin before scalar parsing. It
retains the existing nested point format. Explicit native-line and selected-chord
source syntax both replay. The API, SVG tags and archive variant are documented
in `docs/MIGRATIONS.md`; existing inputs remain supported. The SVG fuzz target
now exercises both metadata versions under its existing input limits.

Ten public Hypercurve witnesses cover fresh-process replay of the original
fillet-trimmed line before exact midpoint splitting and another archive;
correlated fiber/map/algebraic-similarity relations; independent selected
supporting lines and exterior intersections; invalid references, selectors,
matrices and original poles; reached depth and byte limits with retry; shared
map prefixes; signed tangent and normal displacements with source reversal,
zero distance, arbitrary origin and translation; and shared endpoint recipes.
A unit witness checks inherited approximate-policy rejection and strict recovery.
One CSGRS SVG test repeats the trimmed-line composition. Two public Hyperbrep
archive tests preserve exact displaced points and the original selected fillet
cut through reload and further split, with deterministic serialization checked
separately from those geometric expectations.

All 18 final groups pass: 2,820 Hypercurve tests across 90 suites, retaining 34
existing ignored cases; 63 root tests across ten affected suites; 3,012 tests
across six dependent packages; strict all-target/all-feature Hypercurve,
Hyperbrep and CSGRS MSRV Clippy; Hypercurve and Hyperbrep builds without optional
features; all three API documentation builds with warnings denied; fuzz-target
Clippy; formatting; 16 matrix guards; 170 capability witnesses; typos, repository
budget and diff checks. Evidence is in `{record}`, SHA-256
`{digest}`. All non-receipt source bytes remain
identical after qualification. Failed prototypes and their source snapshots are
retained. Those records distinguish construction/codec gaps from invalid fixture
setup, compile failures and filesystem exhaustion. The native-source fixture
now uses its intended native constructor without dropping its view assertion,
exact point expectations or budget checks.

Generated circles, auxiliary contact and other cusp-derived definitions,
general joint parameter charts, broader generated and filled-region archives,
scalar-expression DAGs and cross-path sharing remain open. The finite corpus is
not a universal closure proof. Point nesting, bytes and existing archive limits
do not bound all arithmetic, coefficient growth, native prefix-vector allocation,
temporary/retained memory or cancellation. Full repository pre-push checks and
published-package delivery remain pending for this increment.

'''
p = checkout / 'crates/hypercurve/FUTURE_WORK.md'
s = p.read_text()
assert '**Selected point graph replay increment' not in s
pos = s.index('**Open, in dependency order:**', s.index('## 8. Polynomial-branch sections'))
p.write_text(s[:pos] + text + s[pos:])
p = checkout / 'docs/evidence-archive.md'
s = p.read_text()
marker = '## Follow-on records\n\n'
assert marker in s and commit not in s
text = f'''The local `hypercurve-point-replay-evidence-2026-10-27` branch ends at
`{commit}`, adding `{record}`
({int(count):,} files, {int(size):,} bytes), SHA-256 `{digest}`.
It records exact selected point dependency graphs, source-preserving chord
displacements, shared map prefixes, checked point-depth limits and Hyperbrep
planar-point archive admission. All 2,820 Hypercurve tests, 63 root tests,
3,012 dependent-package tests, strict MSRV and fuzz-target Clippy, builds without
optional features, API documentation, formatting, 16 matrix guards and 170
capability witnesses pass. The Hypercurve suite retains 34 existing ignored
cases. Committed-parent failures, failed prototypes, source snapshots and
fresh-process replay before further operations are preserved. This record is
local and unpushed. Complete selected circles and broader generated/filled-region
replay, total resource bounds, full pre-push checks and published-package delivery
remain open.

'''
p.write_text(s.replace(marker, marker + text, 1))
p = checkout / 'docs/evidence-archive.tsv'
excluded = [row for row in p.read_text().splitlines() if row.startswith('excluded:')]
assert len(excluded) == 4
manifest = subprocess.check_output(['python3', 'scripts/evidence_archive.py', 'manifest', '/tmp/csgrs-closure-evidence.git', commit], cwd=checkout, text=True).splitlines()
assert len(manifest) == 359 and not any(row.startswith('excluded:') for row in manifest)
p.write_text('\n'.join(manifest + excluded) + '\n')
receipts = ['crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv']
for name, mode, digest in files:
    if name not in receipts and mode in ['file', 'executable']:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name
(root / 'point-replay-receipt-prepared.json').write_text(json.dumps({'archive': archive, 'parent': base, 'receipt_files': receipts}, indent=2) + '\n')
print('Prepared three qualification receipts; all non-receipt bytes unchanged.')
