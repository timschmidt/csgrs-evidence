from pathlib import Path
import json
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-query-fibers'
def edit(name,old,new):
 p=w/name;s=p.read_text();assert s.count(old)==1,(name,old);p.write_text(s.replace(old,new,1))
for source,target in [('selected_query_fiber_depth_tests.rs','crates/hypersolve/tests/selected_polynomial_root_discovery.rs'),('selected_query_fiber_brep_tests.rs','crates/hyperbrep/tests/selected_query_archive.rs')]:
 p=w/target;s=(c/source).read_text();assert s not in p.read_text();p.write_text(p.read_text()+s)
edit('crates/hypercurve/src/polynomial_curve.rs',
'''/// General dependent fibers without such a rational base chart remain blocked.''',
'''/// Source-bound rational queries over retained selected fields also supply
/// abscissas. Their fibers use the shared ordered-field Sturm solver and retain
/// the original query, polynomial, singleton and branch ordinal. Native rational
/// base charts keep their existing pullback path; no global coordinate projection
/// is required. Geometric point-ordered charts without a scalar recipe remain blocked.''')
edit('crates/hypercurve/src/polynomial_point/joint.rs',
'//! Joint query points preserve sources as well as their common scalar field.',
'//! Joint point values retain their source recipe and common selected field.')
edit('crates/hypercurve/CHANGELOG.md','## [0.4.0] - Unreleased\n', '''## [0.4.0] - Unreleased

- Polynomial graph evaluation consumes source-bound rational queries over
  retained selected fields. Dependent fibers preserve their original equation,
  parameter recipe and selector through further queries and native replay;
  branch evaluation honors the configured subdivision-depth limit.
''')
edit('crates/hypercurve/CHANGELOG.md','### Breaking\n','''### Breaking

- `CurvePointDefinition2::PolynomialFiber::parameter` is now `CurveParameter2`.
  Convert existing `BezierParameter2` values with `.into()`; borrow their native
  view with `as_bezier_parameter()` when required. SVG fiber records and HyperBRep
  planar archives accept retained query-parameter references in that field.
''')
edit('crates/hypersolve/CHANGELOG.md','## [0.4.0] - Unreleased\n','''## [0.4.0] - Unreleased

- Add configured-depth use of the complete ordered-field Sturm isolator.
  Separation and singleton refinement share the same implementation as the
  unrestricted API. Reached local depth limits return `BudgetExhausted` with
  no partial roots, while shared work accounting remains active.
''')
edit('docs/MIGRATIONS.md','## Region query certainty after approximate construction\n','''## Polynomial fibers over retained query parameters

`CurvePointDefinition2::PolynomialFiber::parameter` now takes `CurveParameter2`
so that a generated selected-field query can become the base of another fiber.
Wrap existing `BezierParameter2` arguments with `.into()`. Code matching the
native representation should use `parameter.as_bezier_parameter()`; absence
of that view does not mean the exact parameter is invalid.

Native SVG path graph version 4 retains its existing fiber record (tag 14),
whose parameter reference may now name a checked query parameter (tag 27).
The same source recipe is retained by HyperBRep's planar fiber archive field.
Readers for the earlier restricted schema can reject these new dependencies;
they cannot reconstruct them by extracting independent coordinates. Existing
native-base records retain their geometry and encoding. Replay validates the
original source guards and root selector, including the retained base field.

This extends selected graph evaluation and point composition. It does not
establish general implicit-region offsets, corner edits or topology closure.

## Region query certainty after approximate construction
''')
p=c/'selected-query-fibers-contract.json';d=json.loads(p.read_text());d['resource_followup']='The first geometric extension passed the original exact chain but failed a zero subdivision-depth witness (fix2). Hypersolve now owns optional configured-depth enforcement in the same complete Sturm implementation; no partial roots are published. Unrestricted discovery remains unchanged.';p.write_text(json.dumps(d,indent=2)+'\n')
