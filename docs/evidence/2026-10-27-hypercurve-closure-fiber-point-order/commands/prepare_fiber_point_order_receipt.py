from pathlib import Path
import hashlib,json,subprocess
root=Path(__file__).resolve().parent;checkout=Path('/tmp/hypercurve-closure-fiber-point-order')
base=json.loads((root/'circle-replay-final-commit.json').read_text())['commit']
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=checkout,text=True).strip()==base
results=json.loads((root/'fiber-point-order-final-results.json').read_text());assert len(results)==18 and all(row['exit_code']==0 and row['source_stable'] for row in results)
files=json.loads((root/'fiber-point-order-final-files-before.json').read_text());assert files==json.loads((root/'fiber-point-order-final-files-after.json').read_text())
receipts=['crates/hypercurve/FUTURE_WORK.md','docs/evidence-archive.md','docs/evidence-archive.tsv']
transition=json.loads((root/'fiber-point-order-parent-transition.json').read_text());assert transition['new']==base and transition['all_non_receipt_bytes_unchanged']
for name,mode,digest in files:
 if mode in ['file','executable']:
  if name in receipts:assert (checkout/name).read_bytes()==subprocess.check_output(['git','show',base+':'+name],cwd=checkout)
  else:assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
archive=json.loads((root/'fiber-point-order-evidence-archive.json').read_text());record,count,size,digest=archive['manifest_row'].split('\t');commit=archive['commit']
assert archive['parent']==json.loads((root/'circle-replay-evidence-archive.json').read_text())['commit']
text=f'''**Correlated point and circle predicate increment (2026-10-27).** The
preceding selected-circle increment `{base[:10]}` retains a probe whose
correlated degree-seven/five center imports and evaluates exact endpoints, but
whose midpoint query returns `Blocked(Ordering)`. A fresh unchanged-source build
reproduces that original positive assertion. The existing rational-query API
already proves the radius squared exactly one; oblique affine comparison also
fails before this change. Hypercurve's common point-field authority, circle
incidence and half chart, and chord-direction replay own these changes under
P15, P18–P20, P27, P29 and P30.

Public rational-query arithmetic and geometric predicates now share the same
checked source pullback and common-field alignment. Both selected coordinates
retain their base/fiber relation. Oblique projections subtract before independent
coordinate refinement; circle residuals use nonzero checked denominators and a
positive squared denominator. Original map and operand guards remain owned.
When a certified incident point's displacement reduces to exact constants in a
represented normal frame, the existing rational half-chart inverse consumes
those displacements directly. Signed radii, traversal, diameter endpoints and
complementary-half ownership keep their established meaning. This is not an
algorithm for every independent selected angular field.

A reflected oblique-frame witness also reproduces loss of a compact rational
unit direction during native replay: geometry, metadata and viewBox agree, while
one display coordinate changes after reconstruction through an equal radical
expression. Source/cold/warm probes distinguish this from query mutation. The
existing checked unit-direction record is now omitted only when the ordinary
chord owner reconstructs identical scalar definitions. Readers retain validated
incoming components even when another vector is equal in value. Exact length,
parallelism and orientation predicates still establish validity; byte identity
only decides whether an encoding can omit a definition. No new wire tag or
format version is introduced.

Seven maintained witnesses cover the original selected center without independent
coordinates; exact oblique dot products in both operand orders; midpoint location
and evaluation followed by subdivision, reversal and another native archive;
both signed radii and traversal directions, diameter endpoints, quarter points,
excluded halves and `2^-80` separation; negative denominator maps and original
zero-pole rejection; algebraic similarities and reflected complete SVG replay;
and actually reached zero work budgets followed by successful 512-refinement,
zero-promotion retries. Strict/approximate/strict requests remain Certified when
these exact proofs suffice. Exact geometry and deterministic serialization are
separate assertions. The original external positive program succeeds unchanged,
and the earlier replay corpus remains intact.

All 18 final groups pass: 2,839 Hypercurve tests across 92 suites with the same
34 existing ignored cases, 64 affected root tests across 11 suites, 3,012 tests
across six dependent packages, strict MSRV Clippy for all targets/features of
Hypercurve/CSGRS/Hyperbrep, builds without optional features, denied-warning API
docs and fuzz Clippy, formatting, 16 matrix guards, 188 capability witnesses,
typos, repository budget and diff checks. Raw evidence is `{record}`,
SHA-256 `{digest}`. The qualification ran on a frozen complete source snapshot
while the preceding increment completed its independent checks. Afterwards,
reparenting imported only the three parent receipts and proved all other source
bytes unchanged. Both the full qualified patch and the final parent-relative
patch are retained; receipt checks follow the final ledger edits.

A host filesystem quota interrupted one Hypercircuit command and its report.
The truncated attempt is retained without inferring success. After verified
storage recovery, the complete command and all remaining groups ran on unchanged
source; the first nine complete source-attributed records remain intact.

Original failures remain available, including the initial harness search-path
error, the distinct angular-inversion blocker after incidence was fixed, and
the reflected display assertion. General independent fields, nonconstant angular
inversion, other generated circle frames, repeated-offset chart transport and
filled-region native archives remain open. Counted refinements/promotions do
not bound total arithmetic, coefficient growth, expression size, heap use or
cancellation. A finite corpus does not prove universal closure or performance.
Full repository pre-push qualification and published-package delivery remain
pending for these bytes.

'''
p=checkout/'crates/hypercurve/FUTURE_WORK.md';s=p.read_text();assert '**Correlated point and circle predicate increment' not in s
pos=s.index('**Open, in dependency order:**',s.index('## 8. Polynomial-branch sections'));p.write_text(s[:pos]+text+s[pos:])
p=checkout/'docs/evidence-archive.md';s=p.read_text();marker='## Follow-on records\n\n';assert marker in s and commit not in s
text=f'''The local `hypercurve-fiber-point-order-evidence-2026-10-27` branch ends at
`{commit}`, adding `{record}`
({int(count):,} files, {int(size):,} bytes), SHA-256 `{digest}`.
It records shared-field linear/circle predicates, exact half-chart inversion of
proved constant displacements, and checked direction-definition replay. All
2,839 Hypercurve tests, 64 affected root tests, 3,012 dependent-package tests,
strict MSRV and fuzz Clippy, core builds, API docs, formatting, 16 matrix guards
and 188 capability witnesses pass; 34 existing ignored cases remain. Original
positive failures, corrected-source probes, exact geometric expectations,
source/cold/warm replay diagnostics, reached budgets and retry are retained.
Qualification and parent-transition records prove every non-receipt source byte
unchanged. This record is local and unpushed. General selected angular fields,
filled-region archives, total resource bounds, full pre-push qualification and
published-package delivery remain open.

''';p.write_text(s.replace(marker,marker+text,1))
p=checkout/'docs/evidence-archive.tsv';excluded=[row for row in p.read_text().splitlines() if row.startswith('excluded:')];assert len(excluded)==4
manifest=subprocess.check_output(['python3','scripts/evidence_archive.py','manifest','/tmp/csgrs-closure-evidence.git',commit],cwd=checkout,text=True).splitlines();assert len(manifest)==361 and not any(row.startswith('excluded:') for row in manifest)
p.write_text('\n'.join(manifest+excluded)+'\n')
for name,mode,digest in files:
 if name not in receipts and mode in ['file','executable']:assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
(root/'fiber-point-order-receipt-prepared.json').write_text(json.dumps({'archive':archive,'parent':base,'receipt_files':receipts,'qualified_snapshot_preserved':True},indent=2)+'\n')
print('Prepared three V qualification receipts; all non-receipt bytes unchanged.')
