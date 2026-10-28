from pathlib import Path
import hashlib,json,subprocess
root=Path(__file__).resolve().parent;checkout=Path('/tmp/hypercurve-closure-circle-differentials')
base=json.loads((root/'selected-circle-points-final-commit.json').read_text())['commit']
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=checkout,text=True).strip()==base
results=json.loads((root/'circle-differentials-final-results.json').read_text());assert len(results)==18 and all(row['exit_code']==0 and row['source_stable'] for row in results)
files=json.loads((root/'circle-differentials-final-files-before.json').read_text());assert files==json.loads((root/'circle-differentials-final-files-after.json').read_text())
receipts=['crates/hypercurve/FUTURE_WORK.md','docs/evidence-archive.md','docs/evidence-archive.tsv']
transition=json.loads((root/'circle-differentials-parent-transition.json').read_text());assert transition['new']==base and transition['all_non_receipt_bytes_unchanged']
for name,mode,digest in files:
 if mode in ['file','executable']:
  if name in receipts:assert (checkout/name).read_bytes()==subprocess.check_output(['git','show',base+':'+name],cwd=checkout)
  else:assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
archive=json.loads((root/'circle-differentials-evidence-archive.json').read_text());record,count,size,digest=archive['manifest_row'].split('\t');commit=archive['commit']
assert archive['parent']==json.loads((root/'selected-circle-points-evidence-archive.json').read_text())['commit']
text=f'''**Selected circle differential increment (2026-10-27).** A fresh build of the
preceding selected-point source `{base[:10]}` reproduces a positive exact
first-derivative magnitude assertion as `Blocked(Unsupported)`, while its point,
split and replay control passes. Hypercurve's rational derivative recurrence,
selected-circle chart and shared point-image owners resolve this witness under
P15, P18–P20, P25 and P29. The unchanged independent magnitude assertion passes.

The existing rational Leibniz recurrence now shares its field-mapping boundary.
Original chart polynomials are differentiated before selected-field reduction.
A represented circle frame supplies a center-free rational chart; its retained
incident point supplies both radial forms and a guarded rational angular inverse.
The center stays constant even when its coordinates and the queried angle share
a selected base root. Exact joint vector images preserve magnitude, source-chart
restriction/reversal semantics, original denominator guards and inherited frame
qualification. One shared guarded angular point feeds all derivative maps,
retaining the map chain without expanding its inverse into every derivative.
Existing point definitions and native graph records consume these images; no new public carrier, independent angular root or wire tag is required.

Twelve public witnesses and one private policy test cover exact first magnitude,
three higher orders from an independent complex formula, eight orders at chart
endpoints/midpoint with signed radii/turns, invalid domains, zero order, retained
restriction/reversal, algebraic similarities, checked point definitions, and a
derivative image consumed by a line whose fresh-process native replay precedes
another exact split. Frame qualification survives center cancellation. An
oversized-output positive witness first reproduces a capacity panic; shared
checked count/allocation guards now return a typed implementation blocker.

Initial budget-test assumptions were incorrect: the retained derivative and
its exact vector comparison complete with zero charged work. Both successes
are now required, while the complete incidence-to-derivative-to-comparison chain
reaches the actual zero limit and succeeds on repeated larger retries. Original
failed assertions remain archived. No artificial charge, weaker geometric
expectation, or false exhaustion was introduced. Instrumented counters do not
bound all rational arithmetic, expression growth, heap use or cancellation.

Two bounds witnesses preserve the original rational denominator guards when the
initial isolator crosses a pole. Exact endpoint comparisons validate the retained
enclosure. Curve and path caches retain only a successful strict enclosure, so an
actually exhausted ZERO attempt can retry with a larger budget and a later warm
ZERO query reuses the exact result. The cache holds one entry per immutable owner;
this is not a heap-byte or total-work bound. Original failed bounds, cached-error
and compiler attempts, plus the interrupted prototype6 capture, remain archived.

The original cold replay also exposed avoidable scalar-image reconstruction in
cardinal coordinate ordering. A 607-second externally stopped attempt, its exact
native SVG and read-only stacks are retained; no completion is inferred from it.
The coordinate-order owner now reuses the existing common-field linear proof.
Both independently mapped equal points and signed `2^-80` differences are tested
with ZERO counters, including public affine-form equality. The original replay
fixture retains its 300-second envelope.
A broader review reproduces recursive source alignment for distinct selected
fibers. The shortcut now consumes maps/wrappers before comparing unmapped sources
through their retained scalar selections. Both original failing polynomial-point
targets and a minimized same-beta/distinct-fifth-root case remain in the corpus.

All 18 final groups pass: 2,859 Hypercurve tests in 92 suites with 34 existing
ignored cases, 64 affected root tests in 11 suites, 3,012 tests across six consumer
packages, strict MSRV Clippy across all Hypercurve/CSGRS/Hyperbrep targets/features,
core builds, denied-warning API docs and fuzz Clippy, format, 16 matrix guards,
205 capability fixtures, typos, repository budget and diff checks. Evidence is
`{record}`, SHA-256 `{digest}`. Final source snapshots match; importing only the
three parent receipts preserves every other qualified byte. Full and final
parent-relative patches, original programs and all failed attempts are retained.

The demonstrated domain uses represented circle frames and represented or
shared polynomial-point angular authority. Other point-image fields and frames,
correlated-center filled-region admission, repeated offsets and corner edits
remain open. This finite corpus is not universal closure, a total resource bound
or a speedup claim. Full pre-push and package delivery remain pending.

'''
p=checkout/'crates/hypercurve/FUTURE_WORK.md';s=p.read_text();assert '**Selected circle differential increment' not in s
pos=s.index('**Open, in dependency order:**',s.index('## 8. Polynomial-branch sections'));p.write_text(s[:pos]+text+s[pos:])
p=checkout/'docs/evidence-archive.md';s=p.read_text();marker='## Follow-on records\n\n';assert marker in s and commit not in s
text=f'''The local `hypercurve-circle-differentials-evidence-2026-10-27` branch ends at
`{commit}`, adding `{record}`
({int(count):,} files, {int(size):,} bytes), SHA-256 `{digest}`.
It records the shared rational derivative recurrence, selected-circle chart
inversion and exact joint vector images. All 2,859 Hypercurve tests, 64 affected
root tests, 3,012 consumer tests, strict MSRV/fuzz Clippy, core builds, API docs,
16 matrix guards and 205 capability fixtures pass; 34 existing ignored cases
remain. Independent derivative formulas, source-chart transport, inherited
qualification, fresh-process native consumers, true reached-limit retries and
successful uncharged exact queries are separately asserted. The original
Unsupported witness, capacity panic and all failed harness assumptions remain
in the archive. All non-receipt source bytes match final qualification. This
record is local and unpushed; other fields/frames, region admission, complete
operation closure, total resource bounds and package delivery remain open.

''';p.write_text(s.replace(marker,marker+text,1))
p=checkout/'docs/evidence-archive.tsv';excluded=[row for row in p.read_text().splitlines() if row.startswith('excluded:')];assert len(excluded)==4
manifest=subprocess.check_output(['python3','scripts/evidence_archive.py','manifest','/tmp/csgrs-closure-evidence.git',commit],cwd=checkout,text=True).splitlines();assert len(manifest)==363 and not any(row.startswith('excluded:') for row in manifest)
p.write_text('\n'.join(manifest+excluded)+'\n')
for name,mode,digest in files:
 if name not in receipts and mode in ['file','executable']:assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
(root/'circle-differentials-receipt-prepared.json').write_text(json.dumps({'archive':archive,'parent':base,'receipt_files':receipts,'qualified_snapshot_preserved':True},indent=2)+'\n')
print('Prepared three differential qualification receipts; all non-receipt bytes unchanged.')
