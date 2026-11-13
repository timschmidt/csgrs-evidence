# Exact rational physical-time evolution

Source commit `6f2c110f3758c5059df7e852536769bc94bcd2b6`, based on `80b2fc0b66d52220eb8b152313705eb5153bac99`.

This increment extends the bounded Picard/evolution baseline with an exact
rational physical clock. It is progress on phase 12, not completion of the
fifteen-phase plan. CONTRACT.md identifies the missing witness and owning
properties before edits. SOURCE_STATE.json, source.patch and COMMIT.json identify
the accepted source independently of the pending legacy motion extraction.

## Representation and proof scope

For exact rational a<b and H=b-a, retain t=a+H*tau and construct the owned graph
for g(tau,x)=H*f(a+H*tau,x). The chain rule maps every certified normalized
solution on [0,1] to the original physical ODE. State coordinates are unchanged.
Hypersolve retains the source, exact affine specification and original-node
mapping, sharing the parameter expression and scale constant. Original source
guards remain reachable even at zero scale. Hyperdynamics consumes this validated
program through the existing field/Jacobian owner; no second ODE proof algorithm
or scalar arithmetic authority is introduced.

The immutable physical report binds normalized proofs to the original field and
exact rational segment intervals. It materializes each physical endpoint and
checks final equality before whole-horizon success. Normalized failure and any
additional mapping failure remain separately inspectable. Only a successfully
materialized prefix exposes prefix evidence; a failed final equality admission
withholds the whole-horizon endpoint even when local certificates reach the end.
Zero duration is explicitly an identity with no ODE existence claim. Empty and
zero-dimensional unit products retain distinct semantics. Step options are in
normalized tau units, explicitly documented in the API, README and shipped
example. Physical time is never rounded into a dyadic endpoint.

Replay serializes the original field and rational endpoints. It validates source
shape/bindings and regenerates the affine graph, derivatives and all local proofs.
Neither generated duration nor success flags are accepted as certificates.

## Admission and accounting

Hyperinterval's borrowed RationalArithmetic shares DyadicBudget. It inspects raw
stored ratio parts before comparison, normalization or arithmetic, then delegates
to Hyperreal. For s(x)=max(stored numerator bits,stored denominator bits), compare
and multiply reserve n=s(a)+s(b), while add/subtract reserve n+1. Comparison costs
4*n^2 and arithmetic 16*n^2 admission units (n clamped to one for charging).
These deterministic weights and coefficient envelopes do NOT bound Hyperreal
GCD steps, CPU work, temporary heap, payload lifecycle or caches. Existing graph
entry/work, native arithmetic and cancellation contracts remain separate; whole
resource closure remains open. No exhaustion is claimed as geometric completion.

The constructor extraction preserves the existing ordering of validation,
binding lookup, Jacobian construction, identity publication and cancellation.
Three pre-change constructor witnesses reproduce exact full dispatch/reducer
snapshots, work counts and serialized source on both revisions. Fixed count
assertions now guard those paths. This strict interval-proof API has no
STRICT/APPROXIMATE_512 policy terminal. The unchanged geometry corpus still runs
its established policy/outcome checks; no policy was changed to obtain success.

## Acceptance and validation

Native rational tests compare 14,161 signed fraction pairs with independent
integer cross-products, compose into dyadic enclosures, and exercise exact/short
shared budgets, large inputs, lazy ratios, cache warmth and retry. Affine-program
tests compare values and Jacobians at 2,401 integer samples, retain shared depth,
and verify zero-scale source guards, cancellation and entry/work exhaustion.

Six physical-clock tests cover 49 uncertain constant flows with endpoint reuse,
exact physical segment coverage, time-affine integrals at positive and negative
starts, Riccati's independent rational solution, 300-bit-close and 512-bit-large
times, identity/empty/unit/invalid distinctions, domain failure, construction and
materialization budgets, partial prefixes, cancellation, retry and fresh-process
replay. Changed clocks are re-executed, invalid source references are rejected,
and bogus serialized derived fields do not establish validity.

All 20 final check groups and eight supplementary groups pass: full native
interval tests (199 including docs), full Hypersolve tests (1,418 including docs),
Hyperdynamics/Hyperpath integration (487), field-only tests (23), rational/dyadic
and program minimal features, default-off builds, Rust 1.95 feature MSRVs, release,
Clippy with warnings denied, docs with warnings denied, WASM, the shipped example,
isolated minimal-package tests (28), and nightly ASan. Supplementary owner/path/
point benches, the 200-row successive corpus, Interface tests (201), and native/
affine ASan checks also pass. Commands, features, environments and durations are
in checks-final.json and supplementary-checks.json. The focused owner run also
passed; broader final coverage supersedes it. No fixture or policy was weakened.

The successive-operations smoke preserves all 200 rows' geometry/outcome and
complexity fields and allocator calls against the archived Jacobian record.
Its concurrent-run timings are not used as a speed claim. The affected constructor
is absent from that modeling benchmark's enabled field features.

## Completed cost and artifacts

The unchanged evolution consumer preserves all 13 complete serialized reports
(nine completed, four stopped): original source, requests/options/policy, every
attempt and local proof value/status, accepted ordering and prefix/final scope.
All resource and allocation rows match; every counting epoch ends at zero live
bytes. The 18 completed plus four stopped timing workloads and 36 exhausted
attempts remain distinct.

Initial unconditioned CBBC ratios were adverse: completed median 1.0710 and range
1.0051–1.1080. Reversing run order substantially changed that result. CPU 0 uses
schedutil and was observed at 1.2 GHz idle. A follow-up used the identical two-
second CPU warm-up before each exec and balanced process ordering, without any
governor change: four runs and 124 timing samples per workload/variant. Retained
direct-helper completed ratios are 0.9205–1.0166, median 0.9936; seven medians are
slower, and per-run ranges overlap on the adverse rows. This does not establish a
speedup or universal no-regression guarantee; it did not reproduce the broad
7–11% slowdown under matched warm starts. All unfavorable raw runs remain here.

A non-retained macro experiment restored old constructor function sizes and
slightly reduced the artifact further, but offered no clear completed-work
benefit over the simpler helper in the balanced comparison. Its patch, build,
timings and artifact record are retained; final source and binary were restored
and checked byte-for-byte. No macro experiment enters the accepted source.

The retained unchanged-consumer release binary shrinks from 4,084,752 to
4,082,872 bytes; sized-function interval union shrinks from 2,065,448 to
2,065,371 bytes. Direct candidate SHA-256 is
7bd292fe9efe1550f68eab693588d8afb34f9188c0d938a58f0f9d775c4f5cd2.
The new rational-clock consumer is 4,028,456 bytes (union 2,023,467); this is an
absolute artifact measurement, not a comparison of different workloads.

The new complete clock/replay probe covers nine cases and 18 timing rows,
including exact physical materialization and destruction. Median times in that
absolute run range from 0.427 to 175.960 microseconds; maximum completed peak
allocation is 15,188 bytes. Replay includes JSON parsing, original-field and
Jacobian reconstruction, affine transformation and normalized Jacobian. Initial
field/clock preparation is excluded from integrate and separately counted in
resource rows. All 36 deliberate integration budget failures remain separate
from success. Twelve native admission checks reject 129-, 4,097- and 131,073-bit
operands with zero allocations before delegated arithmetic. All epochs return
to zero live bytes. These are measured workloads, not total-heap bounds.

## Initial findings and exclusions

The first test drafts needed the existing SymbolRef constructor and the
EnclosedVectorField trait import; the trace draft needed FieldIdentity's
serialization rather than serialization of an executable ExpressionField.
Clippy requested a collapsed conditional in the new affine transform; its
predicate order is unchanged and final checks rerun after the correction.
Rustdoc also required code formatting for the literal interval `[0,1]`; this
documentation-only correction is included in final field validation.
An initial rational-feature MSRV command incorrectly selected Rust 1.88; the
existing Hyperreal dependency requires 1.95. Corrected checks use 1.95. Earlier
logs remain archived, including failures; none is presented as a passing check.

The minimal isolated package required an optional production Hyperreal dependency
for the clock implementation. The external lockfile delta is only that dependency
edge, with package versions unchanged. The accepted minimal manifest, README and
crate overview are captured separately from their staged legacy tails. Source
commit publication preserves all other staged work, then recomputes those three
remaining pending deltas against the new accepted base. No legacy extraction
retention claim follows from this increment.

No push or publication is attempted. RK proposal generation, stronger wrapping
control, broader end covers/reachability, total-resource closure, legacy retention,
platform/HIL work, coordinated releases and the other plan phases remain open.
A finite corpus does not establish universal ODE or algebraic-operation closure.
