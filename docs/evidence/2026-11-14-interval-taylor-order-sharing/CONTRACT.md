# Shared prepared trajectory orders

Owner Hyperdynamics trajectory Taylor preparation; Phase13/10.7 demanded
coefficients and wrapping portfolios; P1/P3/P5/P6/P19/P20/P35-P39.
Missing witness: no prepared FlowTaylorProgram can supply a lower order without
repeating the original field's Lie-derivative construction.

Add restrict_order(order,budget) to a prepared program. Domain: usize order no
larger than the supplied prepared order, including zero. Output is an ordinary
FlowTaylorProgram with exactly stages1..order+1: the last is still the original
normalized Lie remainder coefficient, not a discarded polynomial term.
All stages/guards/source identity must match independent preparation at that
order. Existing certify_step and whole-horizon consumers accept the result.
No prepared stage or shape may be treated as proof of ODE existence/analyticity.
Those original checks remain unchanged at use. Higher-than-prepared requests
are typed invalid restrictions, not exhaustion or silently prepared work.

Reuse Arc-backed exact expression and derivative programs; clone only bounded
stage handles and fixed-size output indices. No polynomial differentiation,
Real arithmetic, scalar predicate, graph reconstruction or source demotion.
Keep existing public representations and every existing method body unchanged.
Finite aggregate structural entries and conservative copy work are charged to
the caller's existing budget; scalar work is unchanged. Cancellation and actual
work/entry exhaustion publish no result and leave the source reusable. Shared
input graph storage, atomic reference-count machinery, Real payload and total
heap bytes remain outside a claimed total-resource bound. Output handle storage
is O((order+1)*(N+1)); graph storage is shared. A same-order request may share the
complete immutable stage vector. Do not deserialize a derived proof.

Acceptance: baseline E0599; exact stage/source/guard identity and equal complete
step proof artifacts at every prefix, with independent constant/polynomial and
rational-solution expectations; low/zero/high order and empty/unit domains;
invalid and singular source controls; two-step consumption; limits, cancellation,
retry and zero dispatch. Fresh-process reconstruction from source/max/order and
proposal; actual example and packaged consumer. Both toolchains owner/all-feature
checks, downstream new consumer, strict lint/docs, feature compilation, completed
multi-order cost/allocation evidence. Existing default bodies unchanged; no
universal performance claim. Automatic adaptive-controller preparation remains
separate until it consumes this API with its own history/resource migration.

Work is isolated from the41 staged extraction paths and8 Interface edits. No push.
