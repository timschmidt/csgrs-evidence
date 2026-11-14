# Polynomial primitive adoption in native SDF enclosure programs

Retained production source: 01f8b858bc9370ff9c6bf2247b104aaa557b7639.
Supplemental independent Jacobian witness: fa51fd2e232cc92e83662d1c02129ca35032ad8d.
Baseline: 03d28081d4f5f9e21cb1cce1f0dce4cbc2b6f050. CONTRACT.md preceded
implementation; missing-primitive.log reproduces rejection of a valid sphere.
The complete retained patch and final source hashes bind the implementation.
The source-only implementation is unchanged by the supplemental test commit.

## Ownership and capability

Hypersdf owns the retained implicit field and its parameter interpretation.
Its original radius_squared_domain, torus_domain and require_domain helpers
perform strict parameter admission, in their existing order. New Source errors
retain SdfEvaluationError, including invalid versus undecided and source().
Hypersolve owns program evaluation, derivatives and Taylor proofs; Hyperinterval
owns enclosures. No new predicate or enclosure kernel is introduced.

| Source | Admission | Native program operations | Replay/remaining scope |
| --- | --- | --- | --- |
| Plane | Original normal-dot-point plus offset semantics, including constant degenerate forms | Exact values, whole-cell range, derivatives and Taylor | Recompile original field; no metric promotion |
| Sphere | Strictly certify squared radius >= 0 | Shared exact squared differences, exact values/ranges, Jacobian/Taylor and composition | Algebraic center fixture and zero-radius/empty-query coverage |
| Torus, each axis | Strictly certify major squared radius > 0 and minor squared radius >= 0 | Exact quartic support, native squared factors, Jacobian/Taylor and composition | Zero minor radius admitted; invalid/undecided parameters remain typed |
| Translation/arithmetic of these sources | Existing source interpretation and all primitive guards retained | Generated source remains native input to subsequent operations | Immutable original Arc<Sdf> remains authoritative |
| Other primitives, piecewise and affine nodes | Unsupported on this optional route | Existing SDF APIs remain available | Further lowering remains an implementation gap |

Compilation preserves the primitive supporting polynomial, not merely sampled
membership. Coordinates and exact scalar definitions remain native graph nodes.
For a sphere, emit sum((center_i-x_i)^2)-r². For a torus, with radial rho²,
axial z² and admitted squared radii R²,r², emit
(rho²+z²+R²-r²)^2-4R²rho². Integer power nodes retain repeated-factor correlation
in interval images. Plane lowering reuses the original Linear emitter: the
emitted nodes, charges and call order are unchanged. Independent exact geometry
and polynomial expectations check these translations, including algebraic data.
The original source object and native program remain associated by a private,
immutable constructor; allocation identity is not a definition of equality.

All original invalid-domain obligations survive zero multiplication, source
composition and empty queries. Static parameter admission occurs before the
program is published; successful empty query images do not validate invalid
geometry. Strict construction does not consume approximate terminal evidence.
No range proof is promoted to Euclidean distance, smooth zero-set topology or
mesh validity. Native Taylor regularity/remainder rules remain mandatory.
Replay reconstructs the authored source recipe and its exact parameter and
regenerates the proof in a fresh process. This does not add generic SDF serde.

## Independent witnesses and resource accounting

Across 125 integer points, independent formulas check plane, shifted sphere and
all three torus axes (625 field values), and also check original scalar source
values. An algebraic-center sphere produces an exact zero point Taylor image.
A translated sphere on a full cell has exact range [-4,-1]. The torus Jacobian
at (3,0,4) independently gives value 640 and derivatives (240,0,448), and native
source composition gives the expected squared value on a subsequent operation.

For the torus R²=4,r²=1, take x in [7/4,9/4] and y,z in [-1/4,1/4]. Natural
interval evaluation gives [-11583/256,4617/256] and cannot classify the sign.
With u=x-2 and A=u²+y²+z², the exact polynomial is
-15-8u+14u²-2y²+14z²+8u*A+A². Separate monomial bounds give
[-35/2,-2775/256], wholly negative. The fourth-order Taylor fixture returns
exactly that interval with zero remainder and proves the complete cell inside.
This is a completed exactness/completeness use case, not a sampling argument.

The compiler checks actual selected expansion sizes (including one result):
11 additional records for plane, 14 for sphere, 21 for torus. Standalone exact
entry thresholds 18/21/28 and one-less failures are maintained assertions.
Graph work includes each domain-admission call and every emitted node. Native
scalar/predicate refinement, source ingestion/destruction, scalar payload and
heap-byte exclusions remain explicit; an entry count is not a total memory/time
bound. Exact work thresholds, cancellation, late failure, cleanup and independent
retry remain tested. No failed program or permanent failed cache is retained.

Full trace assertions compare native sphere and torus admission with the same
provider calls, including the torus's explicit exact coefficient 4 construction.
Both the existing Linear source and new Plane source assert zero construction
dispatch and default rational counters. Existing trace assertions are preserved.
The previous valid sphere Unsupported fixture is retained as a stronger exact
success assertion, and an AABB remains in the unsupported fixture set.

## Qualification and development history

The final owner suite passes 133 tests, with two separately invoked replay
children; the default suite passes 114 tests. Strict all-target/all-feature
Clippy, strict rustdoc, WASM, workspace formatting and diff checks pass. The final
ASan/leak-checking run covers 18 maintained enclosure tests plus replay children;
its standard-library sysroot is not instrumented. The supplemental Jacobian
assertion reran the full owner suite, strict Clippy and ASan. Main-closeout logs
record acceptance and formatting on the merged workspace. The indexed source
budget is checked after retention. No whole-workflow or pre-push claim is made.

Retained development failures include the original unsupported sphere, a test
array that incorrectly required DyadicInterval: Copy, and a trace-control fixture
that initially omitted construction of the explicit torus coefficient 4. The
full expected trace now includes that exact constructor and rational temporary;
comparison remains exact and earlier assertions are unchanged. The external
primitive probe initially assumed Point3: Default, then used a private module
path; both failed sources/logs remain, followed by the successful public Point3
constructor. An ASan driver start raced its creation and was retried after the
file existed. No production algorithm or acceptance guarantee was relaxed to
resolve these development/tooling failures.

## Completed-workload cost evidence and accepted tradeoffs

The actual default classification benchmark is byte-for-byte identical to
baseline: 8,102,576 bytes, SHA-256
be7d09278a800c3623335e196ec26bb172198cfa849ec25097f1a1607b6c9afc,
with 4,467,244 bytes in the merged readelf function-address union. All 46 smoke
cases pass. Readelf inspection does not mutate these artifacts. The default
route is unchanged; no new default runtime speedup is claimed.

An identical standalone legacy harness covers polynomial, trigonometric and
Linear compilation, natural range, Taylor range, subdomain reuse and late
exhaustion. Its 21 definition/result/allocation rows match exactly across
baseline and both candidates. The harness uses the prior allocator unchanged,
eight warmups, 32 complete-result/drop allocation epochs, five batches of 128
operations, CPU 0, ASLR disabled, a fixed executable path and a two-second CPU
warmup. No compilation/profiling ran during timing. Initial BCCB and final CBBC
runs are retained separately; changing enum placement keeps existing error
variants in their original order but does not remove the trig slowdowns.

Final median candidate/control ratios are 1.0143 for trig natural range, 1.0081
for trig Taylor and 1.0243 for trig reuse; every candidate batch exceeds every
control batch for those cases in the final run. Linear compilation has an
adverse 1.0167 median ratio with overlapping batch ranges. These are observed
local slowdowns, not dismissed as noise. The optional legacy-consumer executable
grows 6,560 bytes (3,797,008 to 3,803,568), and its function union grows 3,138
bytes (1,960,025 to 1,963,163). This extension is retained for demonstrated new
primitive completion while preserving exact existing results and resource
records; performance/binary neutrality is not claimed. These costs must remain
visible in further optimization and release qualification. The unchanged
actual owning default benchmark separately satisfies its artifact gate.

The new sphere and full-cell torus workloads complete native natural and Taylor
images and subsequent reuse. Final median compile/natural/Taylor/reuse times
are 1.073/14.209/179.422/9.749 microseconds for the sphere and
1.537/23.977/657.039/33.160 microseconds for the torus. Largest observed temporary
peak is 51,700 bytes for torus Taylor construction. Every successful-result/drop
and late-exhaustion epoch has zero signed live-byte delta. These warmed,
instrumented observations define a small measured completion envelope, not
universal latency/memory guarantees, cold-cache claims or competitive ODE results.
The new primitive executable is measured separately, not as an incremental
feature-size comparison. Binaries live outside the source/evidence archives;
commands, hashes, symbols, source and raw results are retained.

## Remaining scope

Piecewise primitive and affine lowering, broader F-rep adoption, full resource
closure, wrapping/QR, competitive dynamics, release and prior plan obligations
remain open. No new full root/browser/Interface/firmware/hardware, coverage/fuzz
or complete pre-push campaign is claimed. The thirteen preceding immutable
stages verify unchanged. Main's 41-path staged extraction patch remains exactly
unchanged from this turn's baseline; Interface's eight pending edits remain
unchanged and firmware is clean. No push occurred. Phase 13 and the full
fifteen-phase objective remain active.
