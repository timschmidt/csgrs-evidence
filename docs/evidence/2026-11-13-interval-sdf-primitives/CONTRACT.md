# Polynomial primitive source lowering

Previous turn: progress, retained SDF enclosure program and resource correction,
registered at 03d28081d. The full fifteen-phase objective remains active.
Phase 13 F-rep adoption: close the plane/sphere/torus polynomial-source gap.
Owner: Hypersdf retains field interpretation and native primitive-domain checks;
Hypersolve owns exact evaluation/Jacobian/Taylor proofs; Hyperinterval encloses.
Properties P1/P4/P6/P8-P10/P19/P20/P27/P35-P37. No second predicate kernel.

Domain: exact retained plane, sphere and each axis of torus, including algebraic
centers/parameters, translations and arithmetic compositions. Plane means its
existing scalar normal-dot-point plus offset, including constant degenerate
forms. Sphere squared radius is nonnegative; torus major squared radius is
strictly positive and minor squared radius nonnegative. Reuse original strict
radius_squared_domain/torus_domain and require_domain helpers in their existing
order. Retain invalid versus undecided failures through a typed Source cause;
empty queries cannot bypass source admission. This does not extend piecewise
primitives or affine transforms in this step, nor change their existing routes.

Lower supporting polynomials directly into shared graph nodes, not expression
trees. Native integer powers preserve the repeated-factor correlation of exact
squares. Keep the original Arc<Sdf>, full scalar definitions and guards; selected
zero sets, metric claims and certainty are not promoted. Construction is not
proof of every future image or Taylor regularity. Generated output must compose
and admit native exact/Jacobian/Taylor reuse within explicit budgets.

Before implementation reproduce current Unsupported on valid primitive input.
Add independent integer formulas over all torus axes, algebraic centers, invalid
and undecided radii, successful empty cells, degenerate parameters, translations,
nonlinear composition, Taylor remainder and resource/cancellation/retry witnesses.
Keep the original sphere fixture as a stronger exact-success check rather than
dropping it when it leaves the unsupported set. No existing assertion is loosened.

Graph entry/work counters include polynomial nodes, traversal and each parameter
admission call; original scalar/predicate refinement/payload and heap exclusions
remain explicit. Bound entry reservation by the selected primitive's actual
expansion. Before retaining, qualify owner/default tests, Clippy/docs/WASM,
sanitizer, old-path artifact and completed-workload cost/allocation evidence.
Preserve pending main 41-path and Interface eight-path changes. No push.
