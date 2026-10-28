from pathlib import Path
import ast,json
r=Path(__file__).resolve().parent

def renamed(s):
 return s.replace('selected-circle-points','__NEW__').replace('selected_circle_points','__SCRIPT__').replace('fiber-point-order','selected-circle-points').replace('fiber_point_order','selected_circle_points').replace('__NEW__','circle-differentials').replace('__SCRIPT__','circle_differentials')
def save(name,s):
 p=r/name;assert not p.exists(),p;ast.parse(s);p.write_text(s)

s=renamed((r/'run_selected_circle_points_qualification.py').read_text());a=s.index('for prefix, indices in ');b=s.index('evidence.save_json(',a)
s=s[:a]+'''rows = json.loads((root / 'circle-differentials-prototype6-results.json').read_text())
assert len(rows) == 5 and all(row['exit_code'] == 0 and row['source_stable'] for row in rows)
assert json.loads((root / 'circle-differentials-msrv-probe2.json').read_text())['exit_code'] == 0
'''+s[b:]
save('run_circle_differentials_qualification.py',s)
for source,target in [
 ('reparent_selected_circle_points.py','reparent_circle_differentials.py'),
 ('close_selected_circle_points_when_qualified.py','close_circle_differentials_when_qualified.py'),
 ('close_selected_circle_points_increment.py','close_circle_differentials_increment.py'),
 ('persist_selected_circle_points_increment.py','persist_circle_differentials_increment.py'),
]:
 s=renamed((r/source).read_text()).replace('Retain exact selected points as circle angular authority','Evaluate exact selected-circle chart derivatives in their joint field')
 save(target,s)
s=renamed((r/'archive_selected_circle_points_evidence.py').read_text()).replace("'passed': 2846","'passed': 2854").replace("len(report['fixtures']) == 193","len(report['fixtures']) == 200").replace("'matrix_fixtures': 193","'matrix_fixtures': 200").replace('Record selected circle-point angular authority qualification','Record selected-circle differential qualification')
updates={
 'owner':'Hypercurve rational derivative recurrence, selected-circle chart and shared point-field image owners; existing point and native graph consumers',
 'properties':['P15','P18','P19','P20','P25','P29'],
 'domain':'Represented unit circle frames, signed radii and selected half charts. Represented angular parameters and retained incident points whose two radial coordinates have a shared polynomial-point field. Demonstrated degree7/5 dependencies remain jointly selected and are not materialized into independent scalar coordinates. Other frame and point-image carriers remain implementation gaps.',
 'source_attribution':'All18 final groups execute on identical complete before/after source based on S, including T/U/V/W and this differential extension. After qualification and W commit, only three W receipts are imported; every other source byte remains identical. Preserve the full qualified patch and the final delta against W. Three differential receipts follow archiving; no non-receipt edit follows qualification.',
 'baseline_findings':'A fresh all-feature build of frozen W reproduces the original positive exact derivative magnitude assertion as Blocked(Unsupported), while its point-location/split/replay control succeeds. The original program and independent expected derivative map remain unchanged. Prototype2 completes the same original magnitude assertion in12.073seconds.',
 'change':'Factor the existing rational derivative Leibniz recurrence into a shared field-mapping helper; the original algebraic-root path retains its reducer and image constructor. Selected-circle derivatives use a center-free homogeneous chart and the guarded rational inverse of an incident point, reusing its existing radial forms where retained. Composition publishes exact joint vector point images with frame and parameter qualification. Represented parameters are normalized into the same circle chart. Checked count/allocation guards prevent a reproduced oversized-request capacity panic without mislabeling an implementation limit as work-budget exhaustion.',
 'closure_argument':'For unit N, radius r and turn s, the center-free rational chart has homogeneous controls(rN,1),(rs*perp(N),0),(-rN,1). Its original polynomials are differentiated with the existing recurrence before field-value reduction. For incident radial projections n,b, u=b/(r+n+b), with the alternate(r-n)/(r-n+b) at the excluded endpoint. Original radial and inverse denominators are checked before applying derivative functions in the original field. The center is held constant even when the query parameter shares its selected base root. Restriction/reversal retain the source chart; similarities act by their linear part on vectors. These local identities do not establish global arrangement or operation closure.',
 'qualification':'Seven new public cases cover the original exact magnitude; independent complex closed-form orders1..3 at signed selected points; orders1..8 at endpoints/midpoint with both radius signs/turns; invalid domains and zero order; restriction/reversal and sqrt2 similarities; checked point definitions; differential-point line construction and fresh-process native replay followed by another exact split; actual chain budget exhaustion and retry; strict/approximate/strict certainty; and typed oversized-output rejection. A private owner test retains qualified frame evidence after center cancellation. The15 earlier point/circle/replay/differential targets and derivative unit cases are retained, followed by the full suite and downstream packages.',
 'attempts':'Prototype1 reports private vector constructor visibility; its internal visibility is corrected. Prototype2 passes the unchanged original magnitude and point control. Prototype3 catches a test-only Real::from(usize) conversion, corrected to checked u128. Prototype4 passes independent higher orders171.8seconds, scalar endpoints0.3seconds, and restriction/reversal/similarity47.6seconds. Its assumed derivative-only exhaustion is incorrect because the exact query completes with zero charged work. Prototype5 confirms its exact vector comparison also completes uncharged; neither success is converted into exhaustion. Both ZERO successes are asserted, and a source-attributed whole incidence->derivative->comparison probe reaches the real ZERO limit and succeeds on two larger retries. The original failed assertions and full raw output remain retained. MSRVprobe1 reports a test-only missing qualified enum import; corrected probe2 passes. The positive usize::MAX witness first reproduces a capacity panic before its shared allocation guard is fixed.',
 'measured_frontiers':'Original exact first-derivative magnitude, higher derivatives and transformations complete within the named fixture envelopes. General independent point-image fields and nonrepresented circle frames remain gaps. The previous positive closed correlated-center region probe still identifies admission before repeated round offsets as an open consumer. Work counters do not bound retained rational arithmetic. No comparative speedup or universal closure claim is made.'
}
for key,value in updates.items():
 marker="    '"+key+"': ";a=s.index(marker);b=s.index('\n',a);s=s[:a]+marker+repr(value)+','+s[b:]
a=s.index("    'limitations': [");b=s.index('\n    ],',a)+len('\n    ],')
s=s[:a]+"    'limitations': "+repr([
 'The general algebraic domain, other field/frame carriers, filled-region admission, repeated offsets and corner edits need further implementation and completion evidence.',
 'Instrumented refinement/promotion counts are not bounds on total arithmetic, coefficient or expression growth, heap use, or cancellation. External timeouts are containment only.',
 'A typed output-allocation implementation blocker is not completed geometry or a declared work-budget exhaustion.',
 'Native point/stroke replay is distinct from filled-region archives. Full pre-push and package/binding delivery remain pending for this increment.',
 'Independent exact geometry assertions are separate from deterministic serialization; display values never become exact source.'
])+','+s[b:]
save('archive_circle_differentials_evidence.py',s)
s=renamed((r/'prepare_selected_circle_points_receipt.py').read_text());a=s.index("text=f'''");b=s.index("p=checkout/'crates/hypercurve/FUTURE_WORK.md'",a)
body='''**Selected circle differential increment (2026-10-27).** A fresh build of the
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
qualification. Existing point definitions and native graph records consume these
images; no new public carrier, independent angular root or wire tag is required.

Seven public witnesses and one private policy test cover exact first magnitude,
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

All 18 final groups pass: 2,854 Hypercurve tests in 92 suites with 34 existing
ignored cases, 64 affected root tests in 11 suites, 3,012 tests across six consumer
packages, strict MSRV Clippy across all Hypercurve/CSGRS/Hyperbrep targets/features,
core builds, denied-warning API docs and fuzz Clippy, format, 16 matrix guards,
200 capability fixtures, typos, repository budget and diff checks. Evidence is
`{record}`, SHA-256 `{digest}`. Final source snapshots match; importing only the
three parent receipts preserves every other qualified byte. Full and final
parent-relative patches, original programs and all failed attempts are retained.

The demonstrated domain uses represented circle frames and represented or
shared polynomial-point angular authority. Other point-image fields and frames,
correlated-center filled-region admission, repeated offsets and corner edits
remain open. This finite corpus is not universal closure, a total resource bound
or a speedup claim. Full pre-push and package delivery remain pending.

'''
s=s[:a]+"text=f'''"+body+"'''\n"+s[b:];s=s.replace("assert '**Selected circle-point angular authority increment' not in s","assert '**Selected circle differential increment' not in s")
a=s.index("text=f'''The local");b=s.index("p=checkout/'docs/evidence-archive.tsv'",a)
body='''The local `hypercurve-circle-differentials-evidence-2026-10-27` branch ends at
`{commit}`, adding `{record}`
({int(count):,} files, {int(size):,} bytes), SHA-256 `{digest}`.
It records the shared rational derivative recurrence, selected-circle chart
inversion and exact joint vector images. All 2,854 Hypercurve tests, 64 affected
root tests, 3,012 consumer tests, strict MSRV/fuzz Clippy, core builds, API docs,
16 matrix guards and 200 capability fixtures pass; 34 existing ignored cases
remain. Independent derivative formulas, source-chart transport, inherited
qualification, fresh-process native consumers, true reached-limit retries and
successful uncharged exact queries are separately asserted. The original
Unsupported witness, capacity panic and all failed harness assumptions remain
in the archive. All non-receipt source bytes match final qualification. This
record is local and unpushed; other fields/frames, region admission, complete
operation closure, total resource bounds and package delivery remain open.

'''
s=s[:a]+"text=f'''"+body+"''';p.write_text(s.replace(marker,marker+text,1))\n"+s[b:];s=s.replace('len(manifest)==362','len(manifest)==363').replace('Prepared three W qualification receipts','Prepared three differential qualification receipts')
save('prepare_circle_differentials_receipt.py',s)
print('Prepared qualification, archive, receipt, reparent, commit, watcher and durable persistence controls; none executed.')
