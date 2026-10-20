# Normalized-region extrusion acceptance

Baseline: `e2b812fd804be6c5ceacb41fa9707ed4c126eab6`, including upstream
`be2a0c37bfe57799c62a36125a5cb883a5458f00` and conical STEP exchange.

Hypercurve owns the regularized `CurveRegion2`, material/hole ownership,
retained boundary identities and its certified native line/arc view. HyperBRep
owns extrusion into validated manifold solids and the model-owning public
builder. HyperBRep IO owns STEP representation, exact encoding and reimport.
Reuse the existing private region constructor; do not add another arrangement,
fit circles from spline samples, or duplicate a curve proof in IO.

The missing acceptance is a public `builder::extrude_curve_region` entry point.
Reproduce that missing API from an external consumer before implementation.
The preceding original path consumer remains unchanged and incomplete for
round caps; adding this input route does not establish arbitrary rational
extrusion-surface area or change the old path contract.

Relevant properties: P1, P6, P8-P9, P11-P20, P24-P27 and P35-P39. The operation
is the Cartesian product of the represented bounded planar material with a
strictly increasing finite z interval. It returns model-owning bodies, one per
admitted material component; empty material returns canonical empty bodies.
Height validation precedes the empty shortcut. Holes, disconnected components,
authored reversal, exact near-boundary values and retained symbolic measures
must preserve their meaning. Unsupported persistent carriers or measures,
unresolved predicates, invalid height ranges and resource exhaustion remain
typed failures. No weaker policy, tolerance or display geometry is introduced.

The public operation must establish a strict curve scope even inside an ambient
approximate/preview scope and preserve the enclosing solver budget. Selecting
an approximate policy is different from consuming its terminal decision. Test
the policy boundary and inherited qualifications; do not claim that a local
strict operation certifies an earlier approximate source's intent. If exposing
the private constructor reveals a missing source-qualification check, reproduce
it and implement the minimum necessary proof or typed rejection in its owner.

Use the unchanged (0,0)-(3,4) stroke, radius 1 and height 3, butt/round caps and
both traversal directions. The expected volumes are 30 and 30+3*pi; total
boundary areas are 62 and 50+8*pi. Require independent exact measures, incidence,
1/10^12 classifications, translation, cold native replay, exact STEP reimport,
continued Booleans, complete removal and recovery. Add material/hole, multiple
component, empty, invalid-height and failure/retry controls. Assert that native
circle geometry survives on the newly admitted round sides.

Qualify native/IO all and minimal features, focused debug controls, warning-denied
Clippy/docs, examples and the actual standalone WASM consumer. Preserve the
preceding completed workflow/artifact corpus and the old unsupported path
inputs. Record complete-work cost, allocation or process-resource and binary
size evidence proportionate to the added entry point; an old unsupported
result has no successful-work speed comparison. Existing private callers should
retain their implementation and context so this entry point does not add work
to unrelated operations. Broaden measurements if implementation changes do.

Use fixed source snapshots and retain every failed prototype. Solver refinement
and promotion budgets do not bound total work, expression growth, retained heap
or cancellation; externally contain adversarial runs and disclose those limits.
Source-path consumers do not establish published-package/MSRV or actual host
binding delivery. No work package is closed by this increment. Commit locally
after admission; full pre-push requirements still apply before any later push.
