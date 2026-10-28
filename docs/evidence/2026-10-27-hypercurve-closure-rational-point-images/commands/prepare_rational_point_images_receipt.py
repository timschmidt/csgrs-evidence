from pathlib import Path
import hashlib,json,subprocess
root=Path(__file__).resolve().parent;checkout=Path('/tmp/hypercurve-closure-rational-point-images')
base=json.loads((root/'circle-differentials-final-commit.json').read_text())['commit']
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=checkout,text=True).strip()==base
results=json.loads((root/'rational-point-images-final-results.json').read_text());assert len(results)==18 and all(row['exit_code']==0 and row['source_stable'] for row in results)
files=json.loads((root/'rational-point-images-final-files-before.json').read_text());assert files==json.loads((root/'rational-point-images-final-files-after.json').read_text())
receipts=['crates/hypercurve/FUTURE_WORK.md','docs/evidence-archive.md','docs/evidence-archive.tsv']
transition=json.loads((root/'rational-point-images-parent-transition.json').read_text());assert transition['new']==base and transition['all_non_receipt_bytes_unchanged']
for name,mode,digest in files:
 if mode in ['file','executable']:
  if name in receipts:assert (checkout/name).read_bytes()==subprocess.check_output(['git','show',base+':'+name],cwd=checkout)
  else:assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
archive=json.loads((root/'rational-point-images-evidence-archive.json').read_text());record,count,size,digest=archive['manifest_row'].split('\t');commit=archive['commit']
assert archive['parent']==json.loads((root/'circle-differentials-evidence-archive.json').read_text())['commit']
text=f'''**Retained rational point-image increment (2026-10-27).** The preceding
source `{base[:10]}` passes scalar-query and original-pole controls but rejects
an exact native selected-point map as `Blocked(Unsupported)`. The unchanged
positive witness now completes its map, checked replay and inverse map. The
owners are Hypercurve point images, selected-parameter predicates, rational
query pullbacks and native replay under P15, P18–P20, P26 and P29.

Each shared immutable image retains its original selected source and rational
map, including the original denominator. Queries reuse the existing common
field and homogeneous projective machinery. Native predicates use retained
chart polynomials before optional coordinate materialization. Original poles
remain invalid even when cancellation is possible. Existing native point graph
records preserve these dependencies; no new public type or wire version is
required. Qualification survives identity and constant queries, and native
replay remains strict inside a provisional scope. Actual work exhaustion is
reported before a point is published.

Eight public cases use an independent rational Bernstein unit-circle point,
its defining equation and an exact rational inverse. They cover repeated maps,
negative denominators, nearby distinct points, bounds, similarities, original
and downstream removable poles, and a generated line whose fresh-process
native replay precedes another exact midpoint split and rational map. Original
positive no-projection and inner-publication budget failures remain in the
corpus, with actual reached counters and larger retries. Three private policy
cases preserve qualification. A request for approximate policy alone does not
weaken certified evidence.

All 18 final groups pass: 2,870 Hypercurve tests in 93 suites with34 existing ignored
cases, 64 affected root tests in 11 suites, 3,012 tests across six consumer packages,
strict MSRV all-target/all-feature Clippy, core builds, denied-warning docs and
fuzz Clippy, formatting,16 matrix guards, 213 capability fixtures, typos, repository
budget and diff checks. Evidence `{record}` has SHA-256 `{digest}`. Final source
snapshots match; importing only the three parent receipts changes no other
qualified byte. Original programs, compile failures, resource observations and
policy regressions remain archived.

The finer resource probe distinguishes construction, which already used no
coordinate promotions, from the later comparison that requested one. The
original failed constructor also returned inner success after reaching a ZERO
refinement limit; the outer scope correctly reported exhaustion. Neither is
counted as completed geometry. These are instrumented refinement/promotion
limits, not bounds on total arithmetic, expression growth, heap or cancellation.
Other fields, arbitrary algebraic region/operation closure and published package
delivery remain open. Full pre-push qualification is pending for this increment.

'''
p=checkout/'crates/hypercurve/FUTURE_WORK.md';s=p.read_text();assert '**Retained rational point-image increment' not in s
pos=s.index('**Open, in dependency order:**',s.index('## 8. Polynomial-branch sections'));p.write_text(s[:pos]+text+s[pos:])
p=checkout/'docs/evidence-archive.md';s=p.read_text();marker='## Follow-on records\n\n';assert marker in s and commit not in s
text=f'''The local `hypercurve-rational-point-images-evidence-2026-10-27` branch ends
at `{commit}`, adding `{record}`
({int(count):,} files, {int(size):,} bytes), SHA-256 `{digest}`. It records shared
rational point images, original guards, native parameter predicates, qualification
and typed exhaustion. All 2,870 Hypercurve tests,64 root tests,3,012 consumer tests,
strict MSRV/fuzz Clippy, core builds, docs,16 matrix guards and213 fixtures pass;
34 existing ignored cases remain. Independent circle/inverse identities, cold
native line reconstruction, exact splitting, original poles and reached-limit
retries are asserted separately. Original failed witnesses and all attempts are
retained. Every non-receipt byte matches final qualification. This local record
is unpushed; complete algebraic operation closure, total resource bounds and
package delivery remain open.

''';p.write_text(s.replace(marker,marker+text,1))
p=checkout/'docs/evidence-archive.tsv';excluded=[row for row in p.read_text().splitlines() if row.startswith('excluded:')];assert len(excluded)==4
manifest=subprocess.check_output(['python3','scripts/evidence_archive.py','manifest','/tmp/csgrs-closure-evidence.git',commit],cwd=checkout,text=True).splitlines();assert len(manifest)==364 and not any(row.startswith('excluded:') for row in manifest)
p.write_text('\n'.join(manifest+excluded)+'\n')
for name,mode,digest in files:
 if name not in receipts and mode in ['file','executable']:assert hashlib.sha256((checkout/name).read_bytes()).hexdigest()==digest,name
(root/'rational-point-images-receipt-prepared.json').write_text(json.dumps({'archive':archive,'parent':base,'receipt_files':receipts,'qualified_snapshot_preserved':True},indent=2)+'\n')
print('Prepared three rational point-image qualification receipts; all non-receipt bytes unchanged.')
