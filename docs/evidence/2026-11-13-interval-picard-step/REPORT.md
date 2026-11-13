# Source-bound dyadic Picard step admission

Source f6c48522d2784b6bbd4adf4dbeae6466758b3aec, parent
188bafa1c5bee0131f7a5acbfef7368b8943e19b. This increment advances phase 12;
it does not finish the fifteen-phase goal. CONTRACT.md identifies owners,
properties, domains and the missing acceptance witnesses before implementation.
SOURCE_STATE.json and source.patch identify all twelve changed source paths.

## Contract and implementation

Hypersolve's `JacobianProgram::enclose_regular` retains exact source, selected
variables, immutable input domain, precision, source images and partials.
Original full-domain elementary evaluation establishes continuity. Reached
source nodes dependent on selected variables additionally require strict smooth
sqrt/asin/acos/acosh operand domains. Other existing full-domain guards exclude
singularities; generated partials also must evaluate. State-independent temporal
sqrt may touch zero. Conservative failure is `RegularityNotCertified`, not proof
of nondifferentiability. Original native domain failures remain typed. No live
cache or serialized flag supplies a regularity proof.

Hyperlattice-interval adds vector `scale` through its existing native scalar
multiplication authority and shared context. It encloses the Cartesian image of
a common interval scalar; it does not claim retained cross-coordinate correlation.
Empty products and the nonempty zero-dimensional unit remain distinct.

Hyperdynamics accepts an exact dyadic singleton start/end, initial box X0 and an
explicit caller-supplied candidate Y. It validates forward time even when X0 is
empty. Otherwise it proves X0 subset Y, source/state regularity on T x Y,
P = X0 + [0,h]F(T,Y) subset Y, and h*upper(||J||infinity)<1. For each initial
point, Picard's integral operator contracts on continuous Y-valued curves;
state-local regularity additionally supports ordinary local uniqueness along
the path. P encloses the entire trajectory and X0+hF encloses the endpoint.
The final endpoint materialization and inclusion check precede certification.
No Taylor term is dropped: this is a full integral enclosure, not an exact point
trajectory or a claim that rounding error is zero. Native outward images include
arithmetic rounding. The mathematical argument is recorded, not machine-verified.
Primary reference: https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/ODE/PicardLindelof.html

Private immutable reports retain source identity, proposal, policy, completed
intermediate stages and typed status. Failed stages do not expose a certified
endpoint/tube. Empty initial states produce explicit empty success. Exact source
and proposal replay reruns construction and verification; proof flags are not
serialized. The shipped expression-field example consumes a certified endpoint
in a second time-dependent step using one mutable budget.

## Validation

All 21 commands in checks-final.json pass after the final source edit:
876 Hypersolve owner tests, 473 dynamics/path tests, 80 Cartesian interval tests,
minimal-feature and default-off checks, Rust 1.95 field/program tests and Rust
1.88 fixed/dyadic lattice tests, release tests, strict all-feature/all-target
Clippy, strict docs, Wasm compilation, shipped example, isolated field package,
AddressSanitizer, all 12 point benchmark smoke cases, external field build,
workspace formatting and diff checks. Supplementary checks cover the staged
diff and repository retention budget. This is affected validation, not the full
pre-push workflow matrix; nothing was pushed and registry/platform delivery
remains unqualified.

Nine added tests plus extensions to existing tests cover four strict primitive
domains and continuous inactive boundaries, constant sqrt(0), independently
expected polynomial derivatives, 49 uncertain constant-field cases with chained
endpoints, affine/time-affine/nonsymmetric coupled systems, oscillator analytic
bounds, Riccati and temporal-sqrt integrals, domain/regularity/self-map/contraction
rejections, empty/unit/invalid inputs, exact and one-unit-short budgets, a failure
after endpoint materialization, aggregate shared budgets, cancellation/retry,
fresh-process symbolic sqrt(2) replay, source/proposal mutation and native scale
across four scalar families. Existing no-allocation assertions remain intact.
No production test, policy, fixture or assertion was weakened.

Initial compile diagnostics and external probe corrections remain in the record.
The external candidate was rebuilt after correcting preserved file timestamps
that had made Cargo reuse the baseline. Its empty-case dimension was made
explicit. A probe incorrectly expected scalar budget 16 to exhaust an empty step;
the final probe preserves that budget as an explicitly successful case and tests
the actual measured work-minus-one exhaustion boundary. Production code was
unchanged by these probe corrections. The failed original run is retained.

## Cost and limits

picard-cost.json records 15 completed timing rows (including successful empty,
unit, replay and a two-step chain), three typed proposal rejection rows, 21
exhaustion-boundary rows and seven explicit budget-16 trials. Each completed
endpoint has an independent expected enclosure. CPU-0 release measurements use
eight warmups, 32 allocation iterations and 31 samples of eight calls, including
full output materialization and destruction. Verification includes proposal
cloning; replay includes source parsing, validation and Jacobian construction.
Source/proposal preparation and preexisting field construction are excluded from
verification as documented. Completed medians span 0.565–20.172 microseconds;
peak measured temporary allocation is 3,312 bytes. Every allocation epoch ends
at zero live-byte delta, including failures. These are focused ordinary workloads,
not a universal resource envelope or cross-library speed claim.

The unchanged field probe completes 35 existing workloads and separately checks
21 exhaustion cases against saved parent executables at matched paths, lockfile,
compiler, policy and CPU. All allocation, peak-memory and graph/scalar-work rows
are identical; maximum temporary peak remains 173,660 bytes. CBBC initially had
ratios 0.9185–1.1657. Reverse BCCB repeats were added because unaffected
constructor paths also varied. Both orders and every adverse sample are retained.
Pooled 124-sample medians range 0.9553–1.1134 (overall median 1.0198); operation
median ratios are construct 1.0377, replay 1.0198, image 0.9995, Jacobian 1.0334,
pipeline 1.0351. Twenty-one rows are slower. No speedup or regression-free timing
claim is made. This is a capability extension, not a behavior-preserving refactor
or performance optimization. Higher-priority completed proof capability is the
reason for retention; the observed timing cost remains explicit.

Artifact capture retains hashes, ELF sections and sized function interval unions.
Existing field consumer: 3,934,184 -> 3,931,664 bytes; function union
1,992,586 -> 1,991,490 bytes. Point benchmark: 7,047,768 -> 7,047,760 bytes,
unchanged 3,150,521-byte function union and identical .text/.rodata; relocation
metadata differs. New Picard probe: 4,022,968 bytes at its final recorded hash,
with a 2,037,790-byte sized function union. It is a different workload, so this
is an absolute artifact measurement, not an incremental linked-feature cost.

General symbolic refinement, scalar payload lifecycle/ingress and total heap
accounting retain their existing exclusions; graph/native scalar counters do not
constitute a whole-work bound. Strict primitive checks can reject differentiable
composites with removable singularities. Arbitrary rational time endpoints,
automatic bounded halving and candidate generation, horizon integration, complete
flow-tube provenance/aggregation, stronger wrapping control and broader completed
resource qualification remain open. The legacy dynamics extraction retention gate
and all other plan obligations remain open. Its 40-path staged patch and the
Interface patch are byte-preserved; Firmware and the isolated core are clean.
