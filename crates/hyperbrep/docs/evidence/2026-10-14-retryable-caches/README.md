# Retryable exact BREP caches

The change repairs a P4 violation: curve, surface and model bounds retained
`PredicateUnresolved` permanently even when their shared scalar later obtained
a strict ordering certificate. Four caches now retain successful values only;
face contours use the same publication helper. Errors retain their original
types and are returned to the requesting caller.

The [baseline control](baseline-control.json) records an assertion failure on
`be5c6f6ba` with the [regression patch](baseline-regression.patch). An exact
positive difference of exponentials is initially unresolved. After explicit
scalar refinement certifies its sign, all three old caches still fail. The
candidate recovers and verifies every bound corner, including shared clones.
The [candidate log](candidate-regression.log) records that focused pass;
[tests.log](tests.log) includes it and the concurrency regression.

The concurrency test controls the publication order with barriers. A pending
failed calculation must use another reader's already published certificate;
a warm query must not invoke its initializer. It is a deterministic schedule,
not an exhaustive concurrency verification.

[OnceLock's fallible initializer](https://doc.rust-lang.org/std/sync/struct.OnceLock.html#method.get_or_try_init)
is unstable in the recorded Rust toolchain. The private helper computes before
entering the stable publication initializer, then retains one successful
value. Concurrent cold readers may duplicate calculation. Repeated failures,
including stable unsupported cases, repeat work; the change does not add a
failure taxonomy or negative-result cache.

The [rejected contour fixture](rejected-contour-fixture.patch) exhausted a
solver scope before asking for a cuboid's line contours. That operation needs
no instrumented solver work and succeeded. Its
[assertion failure](rejected-contour-fixture.log) does **not** reproduce a
transient contour-cache defect. It is excluded from regression coverage;
the contour cache changes by shared policy and code review.

[commands.json](commands.json) records exit codes for qualification and three
paired release trials, alternating order on CPU 0. The benchmark source is
unchanged. [comparison.json](comparison.json) retains all 66 rows, checksums,
timing samples and process resource measurements. The baseline executable is
the candidate retained by the
[ownership experiment](../2026-10-14-model-ownership/executables.json).
Measurements use that experiment's tested
[C launcher](../2026-10-14-model-ownership/measure.c), avoiding the rejected
Python high-water RSS floor documented there. RSS is process peak memory,
not allocation counts or a memory bound.

To replay, build both revisions with the recorded command, preserve separate
executables, and compile the measurement helper. Adjust the absolute paths in
[qualification.py](qualification.py), using a fresh output directory. Apply
the baseline regression patch only to the recorded baseline. The retained
test has subsequent formatting changes without a change in assertions.

[manifest.json](manifest.json) binds source and artifacts. This is a
correctness repair, not a claimed optimization. Shared operation budgets,
full certainty receipts and the remaining work packages are still open.
WASM compilation and fuzz-target compilation do not establish runtime,
ASan, lexicase or whole-workspace qualification.
