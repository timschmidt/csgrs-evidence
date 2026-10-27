from pathlib import Path
import json
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-horizontal-boundaries')
for prefix,count in [('horizontal-boundary-prototype3',10),('horizontal-boundary-consumer5',6),('horizontal-boundary-chart-prototype1',1),('horizontal-boundary-brep-prototype4',1)]:
    rows=json.loads((root/(prefix+'-results.json')).read_text())
    assert len(rows)==count and all(x['exit_code']==0 and x['source_stable'] for x in rows),prefix
p=checkout/'crates/hypersolve/README.md';s=p.read_text();a='''  Vertical components, repeated generic fibers and whole horizontal boundary
  components remain typed blockers.''';b='''  Simple horizontal components on either closed rectangle boundary remain in
  the original equation and graph. Their contacts are projection events and
  their incidence uses the same closed-fiber counts and separator proofs.
  Vertical components and repeated generic fibers remain typed blockers.''';assert a in s;s=s.replace(a,b)
a='''  none establishes a total scalar-work or heap bound. Hypercurve implicit
  carriers and HyperBRep spatial/dual-chart integration are still required
  before this becomes a general surface-intersection workflow. The diagnostic
  graph records used in tests are not a native BRep archive format.''';b='''  none establishes a total scalar-work or heap bound. This constructor does
  not itself certify filled regions or general surface intersections; consumers
  retain their own admission and image requirements. The diagnostic graph
  records used in tests are not a native BRep archive format.''';assert a in s;s=s.replace(a,b);p.write_text(s)
p=checkout/'crates/hypersolve/FUTURE_WORK.md';s=p.read_text();marker='## Represented-root completeness\n';assert marker in s
s=s.replace(marker,'''### Horizontal boundary components (2026-10-27)

The historical `BoundaryComponent` result above and the original `y+2=0`
fixture are retained in the qualification corpus. The extension on
`5de7f0cb05` keeps a horizontal boundary factor in the original equation,
closed fibers and selected graph. Its identically zero boundary specialization
has no isolated entry events; contacts with other branches already occur in
`resultant(F,F_y)`. Root-free separators and exact closed root counts retain
all incident arcs. No factor or multiplicity is discarded.

Ten focused solver witnesses cover both boundaries, distinct components,
parabola and circle tangencies, partial-domain crossings, algebraic event
parameters, `2^-80` separation, exact source replay and reached budget failure
with larger retry. Independent rational Sturm counts audit closed connection
bands. Hypercurve consumes the result through selected trims, overlaps, further
intersections, reversal and similarity transport. The original BRep boundary
section is now a positive native-replay witness. Its reversed restricted pcurve
exposed a separate directed-chart correspondence bug, fixed in BRep's shared
materialization owner without changing topology validation. A later plane contact also requires a
checked similarity view of the retained rational maps; the original definitions
and denominator guards remain authoritative.

The [Hypercurve qualification ledger](../hypercurve/FUTURE_WORK.md) records
commands, raw evidence and the remaining pre-push gate. Vertical and repeated
components, algebraic coefficient fields and total resource bounds remain open;
this does not adopt the multiplicity reduction discussed above.

'''+marker,1);p.write_text(s)
p=checkout/'crates/hyperbrep/docs/SUPPORT_MATRIX.md';s=p.read_text();marker='`CurveSurfacePoint` exposes `Parameter`, `GeometricPoint3` and\n';assert marker in s
s=s.replace(marker,'''The rational tensor surfaces `S(u,v)=(u,v,v)` and `S(u,v)=(u,v,v-1)` on
`[0,1]^2` now retain their complete horizontal boundary section with `z=0`.
The original boundary blocker fixture remains as a positive witness: both
pcurves, restriction/reversal, whole-image validation, native save/reload,
affine transport/revalidation and a further transverse plane contact complete.
Materialized retained pcurves use their directed parameter endpoints when
forming the affine spatial correspondence. This also fixes reversal of an
already admitted rational source restriction. Rational map definitions that
prove an exact similarity reuse Hypercurve line sections while retaining their
original guards, so the replayed section remains intersectable. The
[implementation record](IMPLEMENTATION_STATUS.json) links the shared solver
qualification; vertical/repeated components and general trimmed arrangements
remain open.

'''+marker,1);p.write_text(s)
p=checkout/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json';record=json.loads(p.read_text());ident='horizontal-boundary-components-2026-10-27';assert all(x['id']!=ident for x in record['increments'])
record['increments'].append({'id':ident,'work_packages':['WP05a','WP05b','WP13','WP21'],'properties':['P11','P15','P17','P18','P19','P20','P25','P35','P36','P37','P39'],'change':'Consume simple horizontal closed-domain components from Hypersolve without removing factors. Preserve directed retained pcurve charts in the shared affine materialization correspondence; the previous ascending-domain formula mapped reversed endpoints to the wrong spatial endpoint.','sources':['../../hypersolve/src/bivariate_topology.rs','../src/geometry.rs','../../hypercurve/src/rational_map.rs','../../hypercurve/src/polynomial_curve.rs','../src/geometry/selected_pcurves.rs','../tests/support/plane_tensor_sections.rs'],'evidence':'../../hypercurve/FUTURE_WORK.md','validation':'The original boundary tensor fixture is promoted to exact success and extended with the upper-boundary counterpart. Restriction, reversal, both pcurves, complete edge-image validation, native archive replay, affine transport/revalidation and subsequent transverse-plane contact pass. An independently constructed rational source-restricted pcurve reproduces the directed endpoint mismatch before the owner fix and passes afterwards, including further restriction and archive replay. Ten solver and six Hypercurve focused witnesses pass; complete local qualification and raw evidence are recorded in the linked Hypercurve ledger. The later transverse-plane query also reproduced a rational-map dispatch blocker; a checked similarity view now reuses the original Hypercurve line-section algorithm without removing the stored maps or denominator guards. General nonlinear/nonuniform maps remain open. The full repository pre-push gate remains separate.','cost_evidence':'This is a completion and correspondence-correctness extension, not a performance-only change. Focused commands retain an external 300-second allowance and raw elapsed observations. Concurrent qualification timings are not a controlled comparison or stable latency claim. Existing adverse performance records are not superseded.','limits':'Vertical/repeated polynomial components, general coefficient fields, complete dual-chart trim arrangements and general curved solid Booleans remain open. The original polynomial, selected topology and multiplicity blockers are preserved. Solver counters and archive metadata limits do not bound total arithmetic, coefficient growth, retained memory or cancellation. Exact graph reconstruction in the separate Hypercurve child-process witness is a diagnostic format, not a new native archive. This increment does not complete all work packages or authorize skipping any pre-push check.'})
record['updated_on']='2026-10-27';p.write_text(json.dumps(record,indent=2)+'\n')
p=checkout/'crates/hypercurve/qualification/capabilities.json';p.write_bytes((root/'horizontal-boundary-prepared-capabilities.json').read_bytes())
print('Applied capability catalog and linked owner documentation; no qualification receipt yet.')
