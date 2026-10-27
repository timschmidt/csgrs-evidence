from pathlib import Path
import ast
r=Path(__file__).resolve().parent

def renamed(s):
 return s.replace('fiber-point-order','__W__').replace('fiber_point_order','__WSCRIPT__').replace('circle-replay','fiber-point-order').replace('__W__','selected-circle-points').replace('__WSCRIPT__','selected_circle_points')

s=renamed((r/'archive_fiber_point_order_evidence.py').read_text()).replace("'passed': 2839","'passed': 2846").replace("len(report['fixtures']) == 188","len(report['fixtures']) == 193").replace('Record correlated point and circle predicate qualification','Record selected circle-point angular authority qualification')
a=s.index("(out / 'source.json').write_text");b=s.index("(out / 'retained-files.json')",a)
metadata=r'''(out / 'source.json').write_text(json.dumps({
    'base': qualified_source['revision'], 'commit_parent': base,
    'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypercurve selected-circle angular parameter and common point-field query owners; existing native SVG graph replays those definitions',
    'properties': ['P15', 'P18', 'P19', 'P20', 'P26', 'P27', 'P29'],
    'domain': 'Independently defined incident points whose radial coordinates share a checked rational/algebraic field on a circle with a represented unit frame. Keep the original selected base/fiber, circle, signed radius, half chart and traversal. Demonstrated beta degree7 and gamma degree5 coordinates are not materialized independently.',
    'full_suite': full, 'root_downstream_tests': downstream, 'per_package_tests': package_counts,
    'guard_tests': 16, 'matrix_fixtures': 193, 'commands': results,
    'source_attribution': 'All18 final groups run on the complete identical before/after source based on S, including frozen T/U/V implementations and W. After every group passes and V is committed, reparenting imports only its three receipts and proves all other bytes unchanged. Retain both the full qualified patch against source.json base and the W patch against commit_parent. Three W receipts follow archive creation; no non-receipt source edit follows qualification.',
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': 'Fresh unchanged V-source compilation reproduces the original positive u=beta point-location assertion as Blocked(Unsupported), although its independent squared-radius identity succeeds. The original complete source and all later split/reversal/replay assertions are preserved. The corrected implementation executes that unchanged original program.',
    'change': 'A private mapped IncidentPoint parameter retains the exact point, selected circle, both radial-coordinate forms in their common field, and inherited policy. Existing circle incidence precedes construction. Signed tangent projection selects the half; endpoints retain canonical zero/one ownership. Comparisons against represented chart parameters use exact radial linear forms, and pairs on one half use the strictly monotone normal coordinate. Similarities transport the circle, point and radial forms through the certified linear part. Native HCP4 uses its existing IncidentPoint record and rechecks incidence, half and field after replay; no new tag or scalar coordinate materialization.',
    'closure_argument': 'For n=(P-C).N and b=turn*cross(N,P-C), the half-chart comparison with v in (0,1) has sign r*((1-2v)b-2v(1-v)n). Signed tangent distinguishes the complementary half and zero tangent gives a diameter endpoint. cos(theta) is strictly decreasing on one half, so -sign(r)*sign((P1-P2).N) orders two selected points. Complete common radial authority, original denominator guards and policy are retained before publication. Transport uses certified similarities only. These local identities do not prove general derivative, arrangement or modeling-operation closure.',
    'qualification': 'Five new public cases supplement the seven common-field cases: original nonconstant angular point; independent equal definitions and cuts separated by2^-80 followed by exact restriction, split, reversal and replay; both signed radii/turns, excluded half and nearby off-support points, sqrt2 rotation/scaling and reflection; a fresh process replaying a reversed split before another split at beta/2; actually reached zero work limits and larger retries followed by Certified strict/approximate/strict archive sequences. Two private owner tests preserve inherited frame policy, decline qualified point dependencies, and reprove invalid incidence and half selection. Earlier point, circle and replay targets remain intact.',
    'attempts': 'Prototype1 records missing exhaustive dispatch arms. Prototype2 passes the original/new point cases but regresses an existing fresh-process circular-fillet replay: one projection can cancel fields without supporting every angular query. Prototype3 retains both radial coordinates and passes the unchanged original plus all12 old targets. Prototype4 fails only the new test harness reference to undeclared tempfile; the source now uses the established standard-library temporary-file pattern. Prototype5 passes all12 public cases in211.705seconds and the unchanged original; filesystem quota later interrupts an older replay test and its report, so no overall success is inferred. Prototype6 reexecutes all12 old targets successfully; one private policy assertion fails because a new public-operation scope is missing after explicitly consumed approximation. Prototype7 preserves that direct call as an inherited-qualification check and adds a fresh operation with Certified certainty and the original strict validation assertion. No production behavior changes for this harness correction. Prototype7 and MSRVprobe3 catch a test-only field-versus-method compile error on CurveOutcome certainty; prototype8 corrects that access. The first MSRV probe is interrupted by quota; the second and final fourth probe pass. Storage recovery preserves all raw captures, verifies moved files, and removes only completed task build artifacts.',
    'measured_frontiers': 'Positive downstream probes retain actual Blocked(Unsupported) for the public selected-circle derivative and for admission of a closed correlated-center circle into CurveRegion2, before its repeated round-offset chain. These remain implementation gaps. The close-cut case completes within300seconds but coordinate equality and display projection dominate; diagnostic angular comparisons take milliseconds. There is no comparative speedup or total-work claim.',
    'limitations': [
        'No universal arbitrary-degree algebraic or operation-closure claim follows from this finite corpus. General independent fields, other circle frames, selected-circle derivatives, filled-region admission, offsets and corner edits still need completion evidence.',
        'The work counters cover instrumented refinements/promotions only, not total arithmetic, coefficient growth, expression size, heap use or cooperative cancellation. External timeouts are containment only.',
        'Native stroke replay is distinct from a filled-region archive. Full repository pre-push validation and published-package delivery remain pending for these source bytes.',
        'Exact geometric expectations and deterministic serialization are separate assertions. Display chords never become exact source evidence.'
    ],
}, indent=2) + '\n')
'''
s=s[:a]+metadata+s[b:];p=r/'archive_selected_circle_points_evidence.py';assert not p.exists();p.write_text(s)
s=renamed((r/'prepare_fiber_point_order_receipt.py').read_text());a=s.index("text=f'''");b=s.index("p=checkout/'crates/hypercurve/FUTURE_WORK.md'",a)
body=r'''text=f''' + "'''" + '''**Selected circle-point angular authority increment (2026-10-27).** A fresh
unchanged-source build of the preceding common-field increment `{base[:10]}`
proves the independent unit-circle identity at `u=beta`, but its positive point
location returns `Blocked(Unsupported)`. The original program and all subsequent
split, reversal and replay assertions remain intact. Hypercurve's selected-circle
parameter and shared point-field owners implement this extension under P15,
P18–P20, P26, P27 and P29.

The parameter retains the exact incident point, its selected circle and both
radial-coordinate forms in a common field. Circle incidence and signed half
selection precede publication; diameter endpoints retain canonical ownership.
Exact linear signs order represented chart cuts, while the monotone normal
coordinate orders two points on one half. Similarities transport the shared
radial forms and original point. Native version 4 reuses its checked incident
point record and reconstructs the authority from defining relations; no new
wire tag, independent angular root or coordinate materialization is introduced.
Inherited qualification remains explicit. An earlier one-projection prototype
regressed an existing circular-fillet replay; its unchanged test is retained,
and requiring both radial coordinates resolves that failure.

Five new public witnesses and two private policy/validation tests cover the
original selected point; independent equal definitions and `2^-80` close cuts;
restriction, splitting and reversal; both signed radii and turns; excluded halves
and nearby off-support points; algebraic similarities and reflection; fresh-process
replay before another split; invalid incidence and half selection; reached zero
work limits and larger retries; and Certified strict/approximate/strict requests
when strict evidence suffices. Exact geometry and complete archive determinism
are checked separately. The close-cut fixture completes within 300 seconds, but
ordinary coordinate equality and projection remain measured cost frontiers.

All 18 final groups pass: 2,846 Hypercurve tests in 92 suites with 34 existing
ignored cases, 64 affected root tests in 11 suites, 3,012 tests across six dependent
packages, strict MSRV Clippy across all Hypercurve/CSGRS/Hyperbrep targets/features,
core builds, denied-warning API docs and fuzz Clippy, formatting, 16 matrix guards,
193 capability fixtures, typos, repository budget and diff checks. Evidence is
`{record}`, SHA-256 `{digest}`. Complete before/after source snapshots are identical;
after qualification, only the three parent receipts are imported and all other
bytes are proved unchanged. Both full and parent-relative patches are retained.

The original failed prototypes and interrupted host-quota attempts remain in the
archive. A missing test-harness dependency is corrected without adding a package
or weakening its fresh-process assertions. Interrupted checks are rerun on the
same source after verified storage recovery. Positive downstream probes still
report `Blocked(Unsupported)` for public selected-circle derivatives and for a
closed correlated-center circle's filled-region admission, before its offset
chain. These are implementation gaps, not geometric completion or exhaustion.
General fields, other frames, mixed regions, repeated offsets and corner edits
remain open. Instrumented refinement limits do not bound total work, growth,
heap use or cancellation. Full pre-push qualification and package delivery remain
pending; this finite corpus does not establish universal closure or a speedup.

''' + "'''\n"
s=s[:a]+body+s[b:];s=s.replace("assert '**Correlated point and circle predicate increment' not in s","assert '**Selected circle-point angular authority increment' not in s")
a=s.index("text=f'''The local");b=s.index("p=checkout/'docs/evidence-archive.tsv'",a)
body=r'''text=f''' + "'''" + '''The local `hypercurve-selected-circle-points-evidence-2026-10-27` branch ends at
`{commit}`, adding `{record}`
({int(count):,} files, {int(size):,} bytes), SHA-256 `{digest}`.
It records selected circle-point angular authority, both radial coordinates in
one exact field, signed half selection, ordered close cuts, similarity transport
and native replay. All 2,846 Hypercurve tests, 64 affected root tests, 3,012
consumer tests, strict MSRV/fuzz Clippy, core builds, API docs, 16 matrix guards
and 193 capability witnesses pass; 34 existing ignored cases remain. Original
positive failures, the corrected replay regression, close-cut cost diagnostics,
policy and budget checks, and interrupted quota attempts are preserved. Every
non-receipt source byte matches final qualification. The record is local and
unpushed. Public selected-circle derivatives, correlated-center region admission,
general operation closure, total resource bounds and package delivery remain open.

''' + "''';p.write_text(s.replace(marker,marker+text,1))\n"
s=s[:a]+body+s[b:];s=s.replace('len(manifest)==361','len(manifest)==362').replace('Prepared three V qualification receipts','Prepared three W qualification receipts');p=r/'prepare_selected_circle_points_receipt.py';assert not p.exists();p.write_text(s)
for p in [r/'archive_selected_circle_points_evidence.py',r/'prepare_selected_circle_points_receipt.py']:ast.parse(p.read_text())
print('Prepared W archive and receipt controls, not executed.')
