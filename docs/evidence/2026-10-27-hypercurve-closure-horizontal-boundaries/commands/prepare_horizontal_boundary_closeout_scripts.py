from pathlib import Path
import textwrap
root=Path(__file__).resolve().parent

def adapt(source):
    return source.replace('polynomial-regions','horizontal-boundaries').replace('polynomial-region','horizontal-boundary').replace('polynomial_region','horizontal_boundary')

s=adapt((root/'archive_polynomial_region_evidence.py').read_text())
s=s.replace('len(results) == 15','len(results) == 16').replace("'passed': 2754", "'passed': 2743").replace("len(report['fixtures']) == 107", "len(report['fixtures']) == 96")
s=s.replace("full = test_counts", "solver = test_counts(root / 'horizontal-boundary-final-solver-suite.log')\nassert solver == {'suites': 24, 'passed': 1223, 'failed': 0, 'ignored': 0}, solver\nfull = test_counts",1)
s=s.replace("for name in ['tests/horizontal_boundary_admission.rs']:\n    copy(checkout / 'crates/hypercurve' / name, Path('source') / name)", "for name in ['crates/hypersolve/tests/bivariate_boundary_components.rs', 'crates/hypercurve/tests/polynomial_boundary_components.rs', 'crates/hyperbrep/tests/support/plane_tensor_sections.rs']:\n    copy(checkout / name, Path('source') / name)")
start=s.index("(out / 'source.json').write_text")
end=s.index("(out / 'retained-files.json')",start)
s=s[:start]+textwrap.dedent('''\
(out / 'source.json').write_text(json.dumps({
    'base': base, 'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypersolve finite-fiber topology projection and existing closed-fiber adjacency, consumed by Hypercurve and HyperBRep',
    'properties': ['P11', 'P15', 'P17', 'P18', 'P19', 'P20'],
    'domain': 'Rational finite-fiber polynomial zero sets with simple generic fibers in a closed rational rectangle, including simple horizontal factors lying on either horizontal boundary. Original equations, factors, branch selections and closed-domain incidence remain authoritative.',
    'solver_suite': solver, 'full_suite': full, 'root_downstream_passed': 43, 'dependent_package_tests': dependent,
    'dependent_packages': ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack'],
    'guard_tests': 16, 'matrix_fixtures': 96, 'commands': results,
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': [
        'Two positive witnesses reproduce BoundaryComponent on committed 5de7f0cb05: the original y+2=0 graph on [-2,2]^2 and y^2-4=0 retaining both boundary components.',
        'The original HyperBRep boundary-section fixture still expected the old BoundaryComponent rejection. Its original tensor surface is retained and promoted to exact section and whole-image/native-replay assertions, with the upper-boundary counterpart added.',
        'The first Hypercurve consumer build failed due to test-only integer parameter conversions and an unavailable JSON dependency. Explicit Real conversion and a dependency-free diagnostic exact-source encoding resolved those compile errors; all raw attempts are retained.',
    ],
    'closure_argument': 'When F(x,b) vanishes identically, y-b is a retained factor of F. A simple generic boundary graph persists across each projection slab. A contact with another branch makes F_y vanish at that point and is already a resultant event. Existing exact closed-fiber isolation retains the boundary root; root-free separators and closed strip counts prove its event incidence. No factor is removed, no new geometry carrier is introduced, and no multiplicity or vertical-component blocker is bypassed.',
    'qualification': 'Ten solver witnesses use original lower/upper boundary cases, distinct boundary components, tangent parabola and circle contacts, partial-domain crossings, algebraic event fibers, 2^-80 separation, independent rational closed Sturm counts, source replay and actual budget failure/retry. Five Hypercurve witnesses exercise selected degree-five trims, different ordered branches, finite contacts and overlaps, retained singular endpoint incidence, reversal, rotated vertical images and diagnostic exact-source replay in a fresh process followed by further operation. The original HyperBRep surface fixture exercises both pcurves, whole-image validation, native archive replay and affine transport/revalidation.',
    'limitations': [
        'This is bounded A1 progress; vertical components, generic repeated components and algebraic coefficient fields remain open. The original polynomial is never square-free reduced by this change.',
        'Diagnostic equation/domain replay is not a new native Hypercurve archive format. HyperBRep native replay applies only to its admitted section witnesses, not general region/solid closure.',
        'This increment is based on the point-location branch and excludes the parallel shared-region increment. Its full repository pre-push qualification remains pending.',
        'Counted refinement/promotion work, degree/refinement controls and external 300-second fixture containment do not bound total arithmetic, coefficient growth, retained memory or cancellation.',
        'Concurrent qualification timings and process peak RSS are observations, not controlled performance comparisons or aggregate memory bounds.',
    ],
}, indent=2) + '\\n')
''')+s[end:]
s=s.replace('Record selected polynomial shared-region qualification','Record closed horizontal boundary component qualification')
(root/'archive_horizontal_boundary_evidence.py').write_text(s)

s=adapt((root/'prepare_polynomial_region_receipt.py').read_text()).replace('len(results)==15','len(results)==16')
a=s.index("text=f'''**Polynomial shared-region increment")
b=s.index("p=checkout/'crates/hypercurve/FUTURE_WORK.md'",a)
s=s[:a]+textwrap.dedent('''\
text=f\'''**Horizontal boundary-component increment (2026-10-27).** On committed
`{base[:10]}`, the original `y+2=0` graph in `[-2,2]^2` and both components
of `y^2-4=0` reproduced `BoundaryComponent`. Hypersolve now keeps a horizontal
boundary factor in the original equation and closed fibers. Such a component
has no discrete boundary-entry event. Contacts with other branches are already
zeros of `resultant(F,F_y)`; existing root-free separators and closed strip
counts establish event incidence. P11, P15 and P17–P20 remain owned there.

Ten solver witnesses cover the original lower/upper cases and the documented
circle-plus-boundary fixture, tangent parabola/circle contacts, crossings with
one side outside, algebraic event fibers, `2^-80` distinct components, checked
source replay, and actual counted exhaustion/retry. Independent rational Sturm
counts include closed endpoints. Five Hypercurve witnesses consume these graphs
through degree-five selected trims, finite intersections and overlap, point
location, singular endpoint incidence, reversal, similarity transport and
fresh-process diagnostic source replay followed by another operation. The
original HyperBRep boundary tensor is retained as a positive section witness,
with both pcurves, whole-image validation, native archive replay and affine
transport/revalidation; its upper-boundary counterpart also completes.

Final checks pass: 1,223 Hypersolve tests (24 suites), 2,743 Hypercurve tests
(81 suites, 34 existing ignored), 43 root downstream tests and {passed:,} tests
across six dependent packages ({ignored} existing ignored). Strict
all-target/all-feature MSRV Clippy for Hypersolve, Hypercurve and HyperBRep,
formatting, 16 matrix guards, 96 capability witnesses, typos, repository budget
and diff checks pass. All failed attempts remain. Raw evidence is in
`{record}`, SHA-256 `{digest}`. All non-receipt bytes match the qualified
snapshot after this receipt.

No factor or multiplicity is discarded. Vertical/repeated components, broader
coefficient fields and general algebraic operations remain open. The diagnostic
source encoding is not a native Hypercurve archive format. This increment does
not include the separately qualified polynomial region work. Counted work and
external timeouts do not bound every arithmetic operation, coefficient growth,
retained byte or cancellation. No performance improvement is claimed; full
repository pre-push qualification remains pending.

\'''
''')+s[b:]
s=s.replace("assert '**Polynomial shared-region increment' not in s", "assert '**Horizontal boundary-component increment' not in s")
a=s.index("text=f'''The separate local")
b=s.index("marker='## Follow-on records",a)
s=s[:a]+textwrap.dedent('''\
text=f\'''The local `hypercurve-horizontal-boundary-evidence-2026-10-27` branch
ends at `{commit}`, adding `{record}`
({int(files):,} files, {int(size):,} bytes), SHA-256 `{digest}`.
It records complete closed horizontal boundary components in the existing
finite-fiber topology, with original equations and branch incidence retained.
1,223 Hypersolve tests, 2,743 Hypercurve tests, 43 root downstream tests,
{passed:,} dependent-package tests, strict MSRV Clippy, formatting, 16 matrix
guards and 96 capability witnesses pass. Selected trims, overlap and further
intersection, exact source replay in a fresh process, and the original BRep
boundary section through native/affine replay are covered. Earlier failed
attempts remain archived. Vertical/repeated components, algebraic coefficient
fields and general closure remain open. This record is local and unpushed;
the full repository pre-push validation of this increment remains pending.

\'''
''')+s[b:]
(root/'prepare_horizontal_boundary_receipt.py').write_text(s)
for src,dst in [('close_polynomial_region_increment.py','close_horizontal_boundary_increment.py'),('persist_polynomial_region_increment.py','persist_horizontal_boundary_increment.py')]:
    s=adapt((root/src).read_text()).replace('len(results) == 15','len(results) == 16').replace('Admit selected polynomial branches to the shared region arrangement','Retain horizontal boundary components in exact curve topology')
    (root/dst).write_text(s)
for name in ['archive_horizontal_boundary_evidence.py','prepare_horizontal_boundary_receipt.py','close_horizontal_boundary_increment.py','persist_horizontal_boundary_increment.py']:
    p=root/name;compile(p.read_text(),str(p),'exec');print('Prepared only:',name)
