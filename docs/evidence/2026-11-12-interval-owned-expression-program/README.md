# Owned expression programs: accepted prerequisite, evolution still open

Source commit: `32dea45c8e4f7aac347a808f05095d3d6a3cb50a`.
Qualified against base `25a0e578e240bf02140c2be5bd6caab768b070a9` with the
pending dynamics extraction present. `qualified-full.patch`, `SOURCE_STATE.json`,
`accepted-source.patch`, dependency locks and toolchain records identify the
actual source. The dynamics extraction is still unaccepted.

## Implemented boundary

The opt-in Hypersolve `expression-program` feature owns flat definitions for
all 17 Expr constructors, with ordered distinct bindings, full source metadata,
validated backward graph references, immutable program sharing, exact scalar
evaluation, typed graph/scalar errors, cooperative cancellation and graph-size
and graph-work limits. It preserves guards even under zero multiplication or
zero powers. Optional serde replays definitions through validation; it never
loads an executable program from a validity flag. The scalar/Jacobian example
uses the existing symbolic derivative authority and reproduces oscillator
point values after replay. No existing solver or dynamics consumer is switched.

`CONTRACT.md` records ownership and the missing witness; `INVARIANTS.md` states
the graph argument, corrected ownership dispatch and remaining resource gaps.
The interface is experimental, including its unversioned serde format.

## Executed qualification

All 10 commands in `checks-final.json` and all 9 in
`qualification-final.json` passed. Their exact command lines and raw output
are retained. Distinct owner coverage includes 627 library tests, 211 smoke
tests, two README tests, four prior derivative regressions and 14 program tests.
The program corpus includes 400 generated shared DAGs with independent i128
expectations, all operators, domain/error ordering, malformed replay, explicit
binding order, fresh-process scalar replay, every insufficient work allowance
for the small witness, cancellation/retry, and a 20,000-deep source on a 128 KiB
stack. The 14 tests also pass on Rust 1.95, in optimized release mode and under
AddressSanitizer. Feature-only compilation/testing passes without serde or
tracing. The matched fresh-process warm trace is fixed at 11 dispatch events
and zero rational temporaries, GCDs or sign queries.

Hyperdynamics/Hyperpath local downstream coverage is 454 tests in this command's
feature configuration. Strict all-feature/all-target owner Clippy, warning-free
docs, stable WASM checking, formatting, diff checking and retention-budget
checks pass. The standalone example and external consumer allocation probe
also pass. This is not full workflow, hosted OS, firmware/HIL or push validation.
No push occurred.

## Measurements

The 12 Criterion cases complete compilation, replay including definition
cloning, or exact evaluation including output checking and destruction, for
Horner polynomials of degree 1, 8, 32 and 128. The run uses 20 samples, one-second
warmup and one-second measurement; raw samples and confidence intervals are
under `criterion/` and `timings.json`. Medians range from 0.389 microseconds
(degree-1 replay) to 47.577 microseconds (degree-128 evaluation). These are
absolute local measurements, not a speedup or validated-field performance claim.
There were no concurrent task builds during timing.

The external probe reuses the existing Hypersolve allocation counter unchanged
(`allocator-reuse.txt`), with eight warmups and 32 measured iterations per case.
All 28 completed/exhausted rows return to zero live bytes. Degree-128 compile,
replay and evaluation peak at 74,028, 49,476 and 45,424 measured live bytes
respectively. Caller inputs and prior scalar cache materialization are outside
that epoch. This does not establish a universal heap bound or leak proof.

The new Criterion executable is 7,046,936 bytes and the external allocation
consumer is 3,006,632 bytes. Hashes, sized-function range unions, unsized symbol
records and raw symbols are in `artifacts.json`. These are artifact identities,
not a before/after code-size claim. No existing owner/downstream performance
or size gate is credited from these new workload measurements.

## Adverse evidence and disposition

Initial logs retain a missing type annotation, a test's nonexistent Default
implementation, module formatting order, unmatched cache-state comparisons,
and test interference from shared small scalars. A real avoidable clone in the
initial evaluator changed scalar ownership dispatch; final-use moves repaired
it. The full trace equality assertion remains, now measured in an isolated
fresh process with matched warm state and fixed counts. No mathematical fixture
or prior test was weakened. Final qualification passed after those corrections.

The source commit adds only this prerequisite, its feature/dependency metadata,
example, benches and tests. Its isolated commit index avoided including pending
dynamics changes. A byte-for-byte pending-patch assertion noticed the expected
Cargo.lock blob-header change after the serde addition; inspection proves that
all other pending patch bytes are identical. `COMMIT.json` records both hashes.
Interface's pending patch remains byte-identical to the prior turn; Firmware
is unchanged. Earlier dynamics size/timing evidence remains historical.

## Next work toward the unchanged goal

Bounded symbolic derivative construction, proof-linked interval field images
and Jacobians, complete-domain checks and total scalar-resource accounting are
still missing. Then implement the plan's constant/affine validated Euler/Picard
baseline, existence/uniqueness receipts, bounded halving, exact final time,
retained failed attempts, flow tubes and end enclosures; keep oscillator and
Riccati/domain-stress fixtures. No Phase 12 completion is claimed. Pending
Phase 11 extraction qualification and all other unfinished plan requirements
remain part of the goal.
