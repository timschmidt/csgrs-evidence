from pathlib import Path
import ast
root=Path(__file__).resolve().parent

def rename(s):
 return s.replace('circle-differentials','__NEXT__').replace('circle_differentials','__NEXT_SCRIPT__').replace('selected-circle-points','circle-differentials').replace('selected_circle_points','circle_differentials').replace('__NEXT__','rational-point-images').replace('__NEXT_SCRIPT__','rational_point_images')
s=rename((root/'archive_circle_differentials_evidence.py').read_text())
s=s.replace("'suites': 92, 'passed': 2859", "'suites': 93, 'passed': 2870").replace("len(report['fixtures']) == 205", "len(report['fixtures']) == 213").replace("'matrix_fixtures': 205", "'matrix_fixtures': 213").replace('Record selected-circle differential qualification','Record retained rational point-image qualification')
updates={
'owner':'Hypercurve point-image admission and identity, rational-form pullbacks, native selected-parameter predicates and exact replay; existing point/line consumers',
'properties':['P15','P18','P19','P20','P26','P29'],
'domain':'Rational maps of native selected rational-curve point images and their finite map chains. Existing exact, polynomial-fiber, similarity and endpoint inputs remain supported. The original selected parameter and shared point/map dependencies remain authoritative; other point fields and full region/operation closure remain open.',
'source_attribution':'All 18 final groups run on one complete frozen source based on S with T/U/V/W and the differential increment included. After qualification and the differential commit, only its three receipt files are imported; every other qualified byte is unchanged. Both the full patch and final parent-relative patch are retained, followed by three checked receipts for this increment.',
'baseline_findings':'A fresh all-feature build of the preceding frozen differential source passes original scalar-query and invalid-pole controls but rejects the original positive point-image/replay/inverse chain as Construction/ImplicitPolynomial/Unsupported. Prototype3 passes all three unchanged original cases. Prototype5 also passes the signed-denominator/order/bounds and fresh-process native line/split cases.',
'change':'Retain a shared rational-map point node with the original source, map, denominator and construction policy. Reuse existing rational query pullbacks, common-field coordinate order, local bounds and homogeneous recursive projective predicates. Existing RationalImage native definitions validate original guards and consume the source graph without a new wire tag. Native selected-parameter predicates reuse retained chart polynomials before optional coordinate materialization. Actual exhaustion is checked before publishing a new image, and qualification survives identity and constant queries and strict native replay.',
'closure_argument':'A rational map of a point whose coordinates are rational functions of the same selected parameter remains a pair of rational functions in that field. Homogeneous pullbacks use a common total degree and preserve numerator/denominator signs. The original map and all source guards remain owned and are validated before cancellation or field reduction. Exact query views and optional field representations never replace the original construction graph. This local representation closure does not prove global arrangement or all modeling-operation closure.',
'qualification':'Eight public cases retain the original exact point-image chain, independent Bernstein circle, unit-circle residual, inverse map, original and downstream removable poles, negative denominators, near-distinct order, exact enclosures, similarities, fresh-process native line replay and a further exact midpoint split/map. Resource cases separately assert the original no-coordinate-promotion chain, inner typed exhaustion at an actually reached ZERO limit, outer reached counters, larger retries and policy certainty. Three private cases check qualified identity/coordinate queries, constant affine queries and strict native replay inside a provisional scope. Existing native point/circle/rational and differential targets remain part of affected checks and the full final suite.',
'attempts':'The original Unsupported baseline and unchanged original source are retained. Prototype1 and2 catch missing exhaustive dispatch cases. Prototype3 passes all original cases. Prototype4 catches a test-only CurveLocation2/CurveParameter2 mismatch; the corrected prototype5 passes all five public cases. A resource observation shows the full point-map/comparison chain reaches a promotion request with4,096 refinements / 0 promotions; a finer probe shows construction itself and scalar guard admission use 64 refinements and 0 promotions, so the promotion belongs to comparison. A positive no-projection assertion preserves that failure. A separate positive baseline proves the constructor returned inner Ok after actual ZERO refinement exhaustion while the outer budget correctly failed. The original policy identity test fails on the initial new wrapper; subsequent policy baseline covers strict replay and constant queries. All raw attempts and original programs are retained. Later focused and final commands must establish the actual completed result before archiving.',
'measured_frontiers':'The named exact map, query and native line consumers complete within their recorded fixture envelopes. Other point fields, arbitrary algebraic arrangements, region admission, repeated offsets and corner edits remain implementation gaps. Shared work counters do not bound total arithmetic or retained memory. No comparative speedup or universal closure claim is made.',
'limitations':['The general algebraic support envelope and other point-image fields, filled-region admission, offsets and corner edits still require implementation and evidence.','Refinement/promotion counters are not total-work, coefficient/expression-size, heap or cancellation bounds; external timeouts are containment only.','Native point/stroke replay is distinct from filled-region archives. Full pre-push and package/binding delivery remain pending for this local increment.','Independent exact expectations establish fixture geometry separately from deterministic serialization; display output is never exact authority.'],
}
for key,value in updates.items():
 marker="    '"+key+"': ";a=s.index(marker);b=s.index('\n',a);s=s[:a]+marker+repr(value)+','+s[b:]
ast.parse(s);(root/'archive_rational_point_images_evidence.py').write_text(s)
s=rename((root/'prepare_circle_differentials_receipt.py').read_text())
a=s.index("text=f'''");b=s.index("p=checkout/'crates/hypercurve/FUTURE_WORK.md'",a)
body='''**Retained rational point-image increment (2026-10-27).** The preceding
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
s=s[:a]+"text=f'''"+body+"'''\n"+s[b:]
s=s.replace("assert '**Selected circle differential increment' not in s", "assert '**Retained rational point-image increment' not in s")
a=s.index("text=f'''The local");b=s.index("p=checkout/'docs/evidence-archive.tsv'",a)
body='''The local `hypercurve-rational-point-images-evidence-2026-10-27` branch ends
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

'''
s=s[:a]+"text=f'''"+body+"''';p.write_text(s.replace(marker,marker+text,1))\n"+s[b:]
s=s.replace('len(manifest)==363','len(manifest)==364').replace('Prepared three differential qualification receipts','Prepared three rational point-image qualification receipts')
ast.parse(s);(root/'prepare_rational_point_images_receipt.py').write_text(s)
print('Prepared guarded archive and receipt controls; no claims published and no commit created.')
