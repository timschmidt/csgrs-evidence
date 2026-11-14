# Automatic QR evolution admission

Owner: Hyperdynamics owns finite-window frame selection and composition; Hypersolve
retains exact QR, coordinate/source reconstruction and inverse authority;
Hyperinterval/Hyperlattice retain midpoint, interval and Cartesian arithmetic.
Plan 10.7/Phase13, P6/P8-P10/P19/P30/P35-P37. The current revision has certified
caller-chosen QR frames and direct chart transport, but no automatic evolution
consumer. Reproduce absence of CoordinateField::integrate_qr before production edits.

Add an opt-in qr-evolution consumer. Input is an existing exact source-bound chart,
native initial box and singleton dyadic forward horizon. Each finite window selects
an exact frame from the current local midpoint and an enclosed local Jacobian:
M=midpoint(J), B=A*(I+h*M), c_new=c+A*midpoint(initial). M is a proposal only, not
claimed to be the exact Jacobian or a variational-flow enclosure. Q/R and inverse
are independently certified from exact B by the existing QR algorithm. Direct
validated chart transport outer-encloses the initial set in the new frame. Existing
native evolution certifies every trajectory segment; no proposal is promoted to an
existence proof. Source projections are outputs, never fed back as authoritative
initial state. The next window consumes the retained new-chart endpoint.

Keep every completed frame selection, exact basis/origin, Jacobian/midpoint inputs,
QR/inverse/transport records and native attempts. Singular/undecided QR, original
field/domain/resource errors, cancellation and actual window/native limits remain
typed; no silent identity fallback or incomplete whole-horizon success. The native
qualified prefix and whole-request endpoint remain distinct. Empty and zero-duration
inputs validate settings/time before identity handling. N=0 is the unit product.
One shared budget spans selection, construction, transport, integration and output;
aggregate record checks include retained windows/native attempts. Existing exact
scalar refinement/payload, transformed graph sharing, vector capacity and whole heap
exclusions remain explicit. Replay exact source/chart/request/options, never flags.

Tests: independently solvable constant, affine and rotation fields; uncertain inputs;
selected exact basis/origin relations; chart output as subsequent input; singular
frame proposal and original domain failure; invalid input paired with empty; empty,
unit, zero duration; final-window horizon capping; bounded window/native limits;
all small work cutoffs, cancellation and fresh larger-budget retry; fresh-process
replay; zero-dispatch getters. Measure completed whole flows versus fixed-chart
native evolution under identical initial sets/horizons and declared output quality,
including selection/preparation/transport/destruction costs. Preserve adverse cases.
No blanket width/runtime improvement, exact reachable-set equality, optimal frame,
global-error bound or complete arbitrary-field support is claimed.

No existing kernel dispatch/order is rewritten. Preserve main's41 staged paths,
Interface's8 pending edits and all37 frozen stages. New work lives in an isolated
checkout and mutable stage until correctness/cost/downstream qualification permits
retention. This contract and implementation progress alone are not acceptance.

The initial two-window rotation fixture completed but failed its width<1 obligation
at native maximum_step=1/16. Preserve that input, horizon, settings and assertion.
Use the existing native displacement-based proposal path for new QR windows; it
inflates candidate growth rather than the entire inherited box width. Existing
Picard authority/verification remains unchanged. Share the original source-projection
wrapper via a private constructor so both native search variants use one transport
implementation. Preserve the old fixed-chart call/validation/transport order and
qualify its controls; do not introduce another geometry or differential kernel.

Displacement-only windows still failed the unchanged rotation width<1 criterion
(measured first endpoint coordinate width approximately3.05386677658). Preserve
both failed variants and logs. Final strategy options explicitly select Picard
(None) or certified trajectory Taylor endpoints (Some(order), default3). Taylor
adds its existing whole-tube analyticity requirement; Picard remains available
without that added requirement. Coefficients are prepared once per selected frame,
all native attempts and Taylor remainders persist, and source projections are
materialized from the chosen certified tube/end. No silent fallback. The original
fixed-chart implementation is restored byte-for-byte; its proposed extraction
wrapper is no longer needed. All changes remain opt-in.

The first Taylor run revealed an oracle defect: requiring a narrow certified
endpoint to contain every point of a coarse decimal approximation bracket is not
mathematically necessary. The original equations, initial values, horizons, steps
and width<1 assertion are unchanged. Preserve the original test source and failure.
The repaired oracle uses twelve rational alternating-series terms and the exact
next-term bound for cos/sin at the same two times. It independently verifies the
original coarse decimal brackets, then requires the computed output to contain
the tighter rigorous analytic bracket. This tests the actual analytic trajectory
instead of mistaking a display bracket for the full mathematical solution set.

The added uncertain rotating-line fixture (same oscillator, initial[-1,1]x{0},
horizon3/2, two3/4 windows, native cap1/16, Taylor order3) fails the declared
width<10 envelope under unconditional frame adoption. Preserve that candidate and
failure; do not change the fixture. Selection now evaluates both the incumbent
chart and certified QR proposal over the same exact incoming source set (the
proposal retains its explicit outer transport). Both complete proofs and all source
projections are retained. An exact dyadic comparison of maximum source-coordinate
endpoint widths chooses the smaller, with ties choosing the proposed recentered
chart. This is a bounded, local certified-enclosure portfolio, not proof of globally
optimal framing. Every branch must complete; typed failures are not hidden by a
fallback. The next window consumes the chosen chart's native endpoint, never its
source-coordinate display/projection. Graph accounting includes both branches and
comparison records. A stopped cost-build was intentionally interrupted (exit130)
after this correctness/quality failure changed the candidate; it is not evidence
for final-source cost. Final builds must use the corrected portfolio source.

The final additional fixture is the exact zero equilibrium of the tilted linear
field J=[[7,24],[24,-7]]/25 over7/4, windows and native cap7/8, Taylor3.
The fixed chart certifies4segments; both selected QR windows certify1segment each.
Both produce exact zero. This demonstrates automatic-frame step capacity, not
lower total work: both branch proofs, proposals and transports are still paid.
The existing constant/uncertain-rotation fixtures are unchanged. Preserve their
two-fixture measurements before adding this third benchmark.
