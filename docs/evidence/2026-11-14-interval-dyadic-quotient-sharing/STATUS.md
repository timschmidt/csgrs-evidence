# Dyadic quotient sharing rejected; independent regressions retained

Source d8d524297ca55fb802e0b2ca2e985e4f72e2276f retains three private-kernel acceptance tests and a
scoped performance disposition. No production arithmetic is changed. The only
addition to dyadic.rs is cfg(test) inclusion of the new test module. Original
production bodies are byte-identical; both restored release probe executables
are byte-identical to their corresponding baselines.

Two single-division implementations were tested after baseline witnesses passed.
The first used signed truncating quotient/remainder, then corrected one endpoint.
The second kept unsigned magnitudes until constructing directed outputs, following
the backend's existing floor/ceiling method. Both pass the frozen differential
result/error/work corpus and independent small integer controls. The initial test
harness needed explicit BigInt type annotations; its compiler diagnostic is kept.
No numerical counterexample was found in this finite corpus.

The signed candidate grows native size by 432 bytes under the workspace-derived
lock (num-bigint 0.4.6), and by 1,008 under the external resolution (0.4.8). The
magnitude candidate shrinks the pinned executable by 1,224 bytes and function
address union by 446, but grows the external executable by 104 bytes and function
address union by 254. Both algorithms therefore fail the unchanged refactoring
gates across the demonstrated dependency contracts. No dependency range or size
criterion is narrowed to accept the favorable pinned result.

Fifteen completed public-operation probes per lock cover signed/large/exact
quotients, rational conversion, roots, exp/log/atan/sin/cos/tan, rational powers
and split division. The magnitude candidate matches exact serialized output,
domain qualification and remaining work in all of them; allocation requests do
not increase. These single probes are not a completed timing campaign, owner
benchmark matrix, cross-policy solver report or downstream successive_operations
qualification. Those later cost gates were not run after decisive size rejection.
All favorable and adverse artifacts/sources/locks are retained without binaries.

The permanent tests use 11,390 small signed integer cases and 880 large-limb
multiplication inequalities, exact resource thresholds and error precedence,
huge-shift refusal before allocation, retry, and a zero Real-dispatch assertion.
The frozen duplicated legacy implementation stays only in this evidence stage,
not production or permanent tests. Full owner all-feature tests/doctests report
229 passes in 42 summaries, zero ignored. Strict all-target/all-feature Clippy,
no-default-feature tests, formatting and diffs pass. Main focused tests report
three passes; formatting, staged/unstaged diffs and retention budget also pass.
No new fuzz, coverage, platform, MCU or whole-application cost claim is made.

All 41 pending extraction paths retain their exact original patch. Interface's
eight pending paths and firmware remain unchanged. All 51 prior frozen records
verify unchanged. The whole interval plan remains active: this evidence rejects
one optimization boundary and strengthens future acceptance, but does not complete
scalar migration, downstream integration, performance or release requirements.
No push or publication occurred.
