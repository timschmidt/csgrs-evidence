from pathlib import Path
import hashlib, json, subprocess
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-chord-replay')
base='2eb55c5dd5a17dd7b9fb5731ea02b0ac62b38431'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=checkout,text=True).strip()==base
results=json.loads((root/'chord-replay-final-results.json').read_text())
assert len(results)==17 and all(r['exit_code']==0 and r['source_stable'] for r in results)
files=json.loads((root/'chord-replay-final-files-before.json').read_text())
assert files==json.loads((root/'chord-replay-final-files-after.json').read_text())
for name,mode,digest in files:
 if mode in ['file','executable']:assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
archive=json.loads((root/'chord-replay-evidence-archive.json').read_text())
record,count,size,digest=archive['manifest_row'].split('\t')
commit=archive['commit']
assert archive['parent']=='368840d8c3c4e3ca489870a56f8642c10122ff42'
text=f'''**Selected chord replay increment (2026-10-27).** Committed
`{base[:10]}` passes procedural-parallel export but rejects a degree-seven
selected chord after exact construction, midpoint incidence and split. On its
unchanged qualified library, exact incidence queries also change the same path's
finite projection from 82 to 83 points at tolerance 0.01. The original programs,
commands, library digest and source attribution are retained. Hypercurve chord
and point definitions, native SVG interchange and finite projection own this
increment; P15, P18–P20, P27 and P28–P30 apply.

Version 4 adds shared point, supporting-chord, selected-range and curve-endpoint
records. Replay covers exact coordinates, rational source images, rational
expressions and native parallel evaluations at Bezier scalar or selected-root
parameters. The chord owner proves support incidence and strict coordinate
order, then retains the supplied chart and directed endpoints. Valid exterior
ranges and alternative charts survive. The original support remains distinct
from its finite selection; a storage reversal flag alone cannot recover a
split reversed chord's chart. Invalid unused definitions still fail before an
empty final path. Local address keys retain their immutable owners and never
become serialized identities or mathematical equality.

A prior-curve endpoint reference preserves known incidence. Projection uses the
requested analytic-point refinement independently of stronger cached predicate
bounds, including through lazy endpoints. Exact predicates retain their existing
cache. No tolerance, source definition or acceptance assertion was weakened.
The new graph tags, shared retained-curve records and affected display bytes are
an explicit serialization migration in `docs/MIGRATIONS.md`; existing version 3
and version 4 inputs remain supported.

Nine public curve witnesses cover separate-process degree-seven replay before
incidence, overlap, reversal, split and another archive; algebraic-coordinate
region construction and round offset; hand-built chart and exterior-range
records; invalid unused supports and references; correlated rational-expression
endpoints; mixed parallel/chord source and selector sharing with independent
exact coordinates; reached byte limits and retry; original denominator poles;
and mixed native/generated boundaries with a circular hole and disconnected
material through reconstruction, Boolean identities and offset. A direct unit
witness retains the original cold/warm projection failure and checks
coarse/fine/coarse requests. One root SVG adapter test consumes a reloaded
selected chord in split and a second archive. Finite point expectations alone
do not prove the entire intended offset set.

All 17 final groups pass: 2,809 Hypercurve tests across 89 suites, retaining 34
existing ignored cases; 62 root tests across nine affected suites; 3,010 tests
across six dependent packages; strict all-target/all-feature Hypercurve/CSGRS
MSRV Clippy; a Hypercurve build without optional features; both API documentation
builds with warnings denied; formatting; 16 matrix guards; 160 capability
witnesses; typos, repository budget and diff checks. Evidence is in `{record}`,
SHA-256 `{digest}`. Non-receipt source bytes
are unchanged after qualification. The initial mistaken point-variant setup
assertion is retained but not counted as a geometry failure. Failed prototypes
preserve the original SVG assertion; the curve endpoint reference alone did not
fix it, and the independent parent probe identified the bounds-cache cause. The initial
mixed-topology setup mistook the native-circle wire for a missing path; its
recovery consumes both exact carriers and retains every geometric assertion.

Recursive point definitions, selected joint fibers, auxiliary chord contacts,
generated circles, filled-region archives, scalar-expression DAGs and cross-path
sharing remain open. The projection regression qualifies the named analytic
endpoint domain, not canonical output for every equivalent parameterization.
Byte, segment and depth limits do not bound all arithmetic, coefficient growth,
expression size, temporary/retained memory or cancellation. Metadata growth is
observed only for the named repeated-piece fixture; no general performance or
closure claim follows. Full repository pre-push checks and published-package
delivery remain pending for this increment.

'''
p=checkout/'crates/hypercurve/FUTURE_WORK.md';s=p.read_text();assert '**Selected chord replay increment' not in s
pos=s.index('**Open, in dependency order:**',s.index('## 8. Polynomial-branch sections'))
p.write_text(s[:pos]+text+s[pos:])
p=checkout/'docs/evidence-archive.md';s=p.read_text();marker='## Follow-on records\n\n';assert marker in s and commit not in s
text=f'''The local `hypercurve-chord-replay-evidence-2026-10-27` branch ends at
`{commit}`, adding `{record}`
({int(count):,} files, {int(size):,} bytes), SHA-256 `{digest}`.
It records exact selected-chord replay, shared point/source/root and endpoint
relations, validated support charts, and deterministic analytic endpoint
projection after exact queries. All 2,809 Hypercurve tests, 62 root tests,
3,010 dependent-package tests, strict MSRV Clippy, the build without optional
features, API documentation, formatting, 16 matrix guards and 160 capability
witnesses pass. The Hypercurve suite retains 34 existing ignored cases.
Committed-parent failures, failed prototypes, source snapshots and fresh-process
replay before further operations are preserved. This record is local and
unpushed. Broader generated and filled-region replay, total resource bounds,
full pre-push checks and published-package delivery remain open.

'''
p.write_text(s.replace(marker,marker+text,1))
p=checkout/'docs/evidence-archive.tsv';excluded=[row for row in p.read_text().splitlines() if row.startswith('excluded:')];assert len(excluded)==4
manifest=subprocess.check_output(['python3','scripts/evidence_archive.py','manifest','/tmp/csgrs-closure-evidence.git',commit],cwd=checkout,text=True).splitlines()
assert len(manifest)==358 and not any(row.startswith('excluded:') for row in manifest)
p.write_text('\n'.join(manifest+excluded)+'\n')
receipts=['crates/hypercurve/FUTURE_WORK.md','docs/evidence-archive.md','docs/evidence-archive.tsv']
for name,mode,digest in files:
 if name not in receipts and mode in ['file','executable']:assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
(root/'chord-replay-receipt-prepared.json').write_text(json.dumps({'archive':archive,'parent':base,'receipt_files':receipts},indent=2)+'\n')
print('Prepared three qualification receipts; all non-receipt bytes unchanged.')
