# Native Jacobi epsilon: verification

Baseline `5bd072da7`, branch `hyperspatial`, 2026-10-19. This increment adds
`Real::jacobi_epsilon`, `Real::jacobi_sncndn_epsilon` and
`Complex::jacobi_epsilon` for finite arguments and admitted real m<1, including
negative parameters. Production remains native and Real-backed. MPFR supplies
only development oracles and benchmarks. The
[native admission](../../../hyperlattice/docs/admission-jacobi-epsilon.md) and
[spatial admission](../../docs/admission/e2-jacobi-epsilon.md) state the domains,
pole diagnostics, exact identities and resource limits. Thompson/Lee mapping,
its selected inverse maps and the remaining Earth/sky stages remain open.

[Commands](commands.json), [process exits](process-exits.json),
[source metadata](source-metadata.json), the [source freeze](source-freeze.json)
and [test counts](test-counts.json) identify the final executions. All 722
frozen runtime, test and tooling files remained unchanged during validation.
[Raw evidence](raw-logs.tar.gz) retains logs, failed and stopped diagnostics,
source snapshots, before/after serialization and complete sanitizer corpora;
the [manifest](raw-log-manifest.json) records their sizes and SHA-256 hashes.

## Completed checks

- Stable and Rust 1.95.0 each pass **192 spatial test executions** across
  no-default and all-feature configurations, including twelve doctests.
  Both pass all six independent README source consumers, strict all-target
  Clippy, rustdoc, fuzz-target check/Clippy and spatial benchmarks.
- Hyperreal's all-feature suite passes **1,199 executions in 40 suites**,
  Hyperlattice **229 in 22**, Hyperlimit **366 in 19**, and the affected
  Hypercurve circle/curve/contour suites **68 in three**. Hyperreal's library
  passes **947 tests** on both compilers. MSRV also passes the five scalar
  integration suites (46 tests), complex Jacobi/epsilon (23), and Hyperlimit's
  six representation-inventory tests.
- All four primitive-cache configurations pass **532 executions in 108
  suites**, followed by strict Clippy. Every configuration retains the full
  spatial corpus and public scalar/complex tests. Epsilon's three spatial
  tests exercise **1,144 workflows** per configuration: 484 positive pairs,
  484 negative pairs and 176 family/regime cases. Optimization level one
  retains debug assertions and overflow checks.
- All-target/all-feature Clippy passes for Hyperreal, Hyperlattice, Hyperlimit
  and Hyperspatial on both compilers. Native rustdoc and Hyperspatial WASM
  check/Clippy pass. WASM compilation does not establish a JavaScript binding
  or published distribution.
- [Stable](bench.json), [MSRV](bench-msrv.json) and
  [standalone](bench-standalone.json) epsilon benchmarks each pass **45 rows**:
  75 cold, 75 warm and 15 MPFR evaluations accepted, with both components
  materialized and verified after timing. Cold rows reconstruct output
  expressions; input/global scalar caches may already be warm. All affected
  Carlson, Legendre, inverse-Legendre, Jacobi and complex-Jacobi benchmarks
  also pass, together with the focused GMP API cases.
- The [standalone process](benchmark-resources.json) takes **15.853 seconds**,
  peaks at **17,132 KiB RSS**, and uses a **2,970,344-byte executable**. It
  includes native and MPFR workloads and excludes compilation. These are not
  allocation counts, production-only binary size, native work/heap bounds or
  evidence of a cross-library speed ratio.
- [Directed selection](directed-report.json) completes **176 cases in 22
  independent family buckets** for each of epsilon and complex Jacobi,
  retaining 41 and 38 selected inputs respectively, without failures. Each
  report's 203 source hashes matches the final tree.
- The [ASan campaigns](asan.json) complete actual mutations after seed replay.
  Epsilon advances **INITED 330 → DONE 519**; complex Jacobi advances
  **322 → 680**. Each takes 1,807 seconds and exits successfully. The supplied
  corpora contain 230 and 224 files; 279 and 314 files remain afterward.
  Active corpora finish at 243 and 283 entries, with RSS 1,073 and 1,092 MiB.
  No new crash or timeout is reported. New slow artifacts remain, as described
  below. The 1,800-second campaign budgets, ten-second input limit and
  2,048 MiB RSS limit are unchanged. Short ignored inputs still count as
  fuzzer runs; binary coverage counters are not source coverage.

[Coverage](coverage.json) passes all nine independent 95% line floors:

| Scope | Covered / executable lines | Coverage |
| --- | ---: | ---: |
| Hyperspatial | 1875 / 1902 | 98.58% |
| Inverse isometric, physical executable lines | 136 / 140 | 97.14% |
| Carlson | 232 / 235 | 98.72% |
| Forward Legendre | 137 / 138 | 99.28% |
| Inverse Legendre | 170 / 178 | 95.51% |
| Jacobi and log-argument helper | 234 / 237 | 98.73% |
| Complex Jacobi/epsilon | 103 / 103 | 100.00% |
| Shared square quotient | 40 / 40 | 100.00% |
| Native relation helpers | 737 / 765 | 96.34% |

The instrumented driver passes **1,082 executions in 32 suites**. Complex
Jacobi/epsilon covers 202/212 regions and 4/4 functions; the new quotient helper
covers 59/59 regions and 2/2 functions. These are the named production subsets,
not whole-Hyperreal or whole-Hyperlattice coverage. The existing denominators
remain independently gated; stable branch coverage and the 100% target stay
open.

## Exact meaning, failures and retained changes

Real epsilon is E(am(u|m)|m), using the continuous unwrapped amplitude. Complex
continuation uses the complementary or reciprocal real triplet and a single
nonnegative denominator, preserving finite quarter-period points and additive
quasi-periods. The independent MPFR Taylor-ODE oracle extends its differential
system with epsilon'=dn² and an explicit whole-tail bound; it does not use the
production rectangular or E(am) construction. Public tests cover both parameter
signs, axes, near poles, huge periods, tiny arguments, serialization,
precision order, cancellation/recovery and concurrent readers.

The spatial workload refines both complex components, uses the real square
plus two as an ellipsoid axis and the imaginary component as height, then
requires exact ECEF x=axis+height, anchored local round trips and preservation
of qualified input receipts. Real epsilon also retains the exact certificate
F(inverse_E(epsilon(u|m)|m)|m)=u. Numerical closeness does not replace those
composition assertions.

Initial quarter-period tests exposed a missing complete-integral certificate.
The scalar Legendre constructor now retains F and E at integer multiples of
pi/2, with near-quarter offsets kept distinct. The initial spatial inputs
`[0,0,2,2,0,0]`, `[0,0,2,2,1,0]` and `[0,7,127,39,0,0]` exposed an exact
shared-square quotient proof gap. Hyperreal now reduces a²/a only for the
same owned node, with a certified nonzero divisor and compatible cancellation
signals. Private guard tests cover both factor shapes and orders, unknown/zero
and independently owned operands, every removed wrapper's signal and retained
descendants. These inputs remain sanitizer seeds and the full matrices remain.

Those endpoint and quotient rules intentionally change the representation of
some newly constructed values. Old wire tags and decoded mathematical meanings
are unchanged. This migration is distinct from the subsequent amplitude-sharing
change, which preserves **264 exact serialized rows / 1,152,886 bytes** byte
for byte, SHA-256
`9b2db4a04521f488c0e0bb1bac7224ae380866a916be3d8a090235056b0a2876`.
The [comparison](sharing-serialization.json), separate-call identities and
prepared-output tests establish that narrower contract.

The initial sanitizer run completed only seed initialization: INITED and DONE
were both 310, taking 1,912 seconds. Its successful process exit was insufficient
acceptance. The fuzz driver now requires DONE greater than INITED, and three
parser regressions reject the actual seed-only log, incomplete/fixed-input
logs and malformed ordering. Shared real triplet/epsilon outputs avoid building
and refining duplicate amplitudes. The full seed domains, assertions, precision
and campaign limits remain unchanged.

The retained initial slow input `[3,10,127,39,1,0]` was already in the complete
family/regime matrix. Matched [fixed-input diagnostics](sharing-fixed-input-diagnostics.json)
took 11.785/11.460 seconds before sharing and 7.056/7.423 afterward, with roughly
594/556 thousand KiB RSS respectively. These are complete single-input
measurements, not timeout enforcement or a supported-domain speed claim.
The accepted mutation campaigns, rather than that fixed replay, supply the
sanitizer acceptance evidence. Superseded source snapshots and
[binary hashes](superseded-binaries.json) remain available; the large original
executables are retained locally, not embedded in the archive.

The final epsilon campaign retains new slow input `[2,9,127,39,1,0]`, logged
at ten seconds, and complex Jacobi retains `[5,5,21,75,7,1]`, logged at eleven.
The latter demonstrates that libFuzzer's configured ten-second input limit is
not an exact 10.000-second wall-clock guarantee. The old complex timeout
`[21,6,127,39,1,4]`, slow input `[12,12,66,201,7,1]` and initial epsilon slow
input remain in the archived evidence. No claim is made that slow artifacts
have disappeared or that the native evaluator has a wall-time bound.

## Execution limits

Four superseded long drivers and the obsolete sanitizer stage were stopped
after the initial seed-only result. Their exit statuses, logs and old source
remain diagnostic evidence; they are not relabeled as successful checks.
Final validation ran against one frozen runtime/tooling source. The historical
GMP report in Hyperreal was retained; the focused generated report is archived
instead of replacing that broader report with a truncated run.

CI allows 180 minutes for native checks, 60 for the cache matrix, 225 for
combined directed/sanitizer work and 120 for coverage. Pedantic strict zizmor
1.31.1 reports no findings; offline mode omits network-dependent audits.
Native total-work/heap bounds, connected formal proofs and physical model
accuracy remain open. No push was made. The complete repository pre-push
matrix, hosted workflows, published distributions and new bindings are not
claimed complete.
