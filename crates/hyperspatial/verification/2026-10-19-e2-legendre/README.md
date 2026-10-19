# Legendre elliptic prerequisites: verification

Baseline `8b4acb6eb`, branch `hyperspatial`, 2026-10-19. This increment adds
native complete K/E and incomplete F/E with parameter m < 1 and unwrapped
real amplitudes. The [admission proof](../../../hyperreal/docs/admission-legendre-integrals.md)
defines the domain, positive second-kind formulas, period reduction,
serialization and resource limits. The
[development plan](../../DEVELOPMENT.md) retains inverse Legendre/Jacobi,
ellipsoidal Transverse Mercator and the later Earth/sky stages as open work.

## Evidence

[Commands](commands.json) identify the checks; [source metadata](source-metadata.json)
identifies source hashes, compilers and host. Byte-exact logs are retained in
[raw-logs.tar.gz](raw-logs.tar.gz), with sizes and SHA-256 hashes in
[raw-log-manifest.json](raw-log-manifest.json). Oracle tool/cache paths are
development environment details, not runtime dependencies.

All final checks passed:

- Hyperreal's all-feature suite: **1,138 test executions**, 37 suites,
  including numeric API and the inventory of all 65 private nodes. No audit
  exclusion was added. The native Legendre suite passes **11 tests** on MSRV.
- Hyperspatial's complete `scripts/checks.sh` on stable and MSRV: **160 test
  executions each**, plus formatting, all targets/features, Clippy with warnings
  denied, rustdoc, all three README consumers, fuzz-target builds and lint.
- Four primitive-cache configurations: **44 native and 8 spatial test
  executions** in release builds. The spatial tests complete **2,640 full
  workflows**, each consuming both Carlson and Legendre outputs in separate
  strict ellipsoid/ECEF constructions.
- Hyperlattice/Hyperlimit library suites: **261 default and 271 all-feature
  executions** pass. Native Clippy and rustdoc use warnings as errors; the
  WASM library check and Clippy pass. These are build checks, not a JS runtime
  consumer or a new binding.
- Three README examples build and run in an independent source consumer,
  including a meridian-quadrant scalar calculation. The dependency guard
  confirms the native-only direct runtime boundary. This is local source
  consumption, not a published-package claim.
- [Stable](bench.json) and [MSRV](bench-msrv.json) benchmark probes each retain
  120 rows and accept **120 cold, 1,000 warm and 1,000 MPFR results**. GMP API
  benchmarks additionally execute all four public functions. The native
  output is an exact expression plus enclosure; the MPFR reference computes
  a finite-precision pair of integrals and selects one point value. These
  different workloads and concurrent host load do not support a speed ratio.
- [Directed search](directed-report.json) completes **176 cases** across 22
  independent representation buckets, with no failures. Forty-four selection
  events yield **37 distinct inputs**. Compressed observations accompany the
  report; these are cost-discovery samples, not performance comparisons.

[Coverage](coverage.json) passes all four independent 95% line gates:
Hyperspatial **1,875/1,902 lines (98.58%)**, native inverse **136/140 physical
executable lines (97.14%)**, Carlson **148/151 lines (98.01%)**, and the three
new Legendre files **112/113 lines (99.12%)**. Legendre has 245/246 regions
and 11/11 functions covered. Shared dispatch/matching is outside the native
subsets; branch coverage and the 100% target remain open. The coverage job has
a 30-minute timeout for the expanded instrumented workload.

[ASan](asan.json) completes **501 runs in 906 seconds** with no new failure
artifacts. It starts with 213 inputs (176 seeds and 37 selections), finishes
with 235 active corpus entries and 274 saved files, and reports 833 MiB RSS,
9,598 counters and 29,453 features. These are instrumented-binary observations,
not production source coverage. Inputs shorter than six bytes are ignored by
the target and still count as fuzzer runs. Containment remains 10 seconds per
input and 2,048 MiB RSS; this does not establish native resource bounds.

`zizmor --pedantic --strict-collection .`, Python compilation, shell syntax
and whitespace checks pass.

## Retained diagnostics and scope

The baseline missing-API test fails with eight compiler errors before code is
added. Independent binomial-integrand and AGM oracles check the new functions;
exact identities separately cover circular limits, seams, symmetry and periods.
Tests include nonzero odd-quarter reductions, unresolved zero amplitudes,
typed unresolved parameter boundaries, offsets of 1e-320 and amplitudes of
1e320, serialization, precision order, abort recovery and concurrent readers.

A review of the first development workload found that its noncircular
amplitudes mostly used even quarter-periods. The final workload adds an odd
quarter offset controlled by byte 3 in its unwrapped regime; a separate
512-bit independent oracle regression checks both sides of that quarter.
Superseded compiler/coverage/ASan runs were explicitly interrupted with SIGINT
and are retained as diagnostics, not final passing evidence. Earlier completed
test and search records also remain distinguishable from the expanded runs.

Coverage tooling (P35/P36) received a separate regression: combining Carlson
136/151 lines with Legendre 150/150 would pass a combined 95% floor while
Carlson itself fell to 90.07%. The final reporting helper preserves the
original Carlson denominator and adds a separate Legendre denominator. Its
regressions reject masking in either direction and missing source files.
The full instrumented run was already in progress when reporting was split.
[Collected measurements](coverage-measured.json) retain its original per-file
LLVM results; `coverage-gates.py --report ... --output ...` verifies their
production source hashes and applies all four independent floors. This replay
does not reexecute tests or change measured counts. The final report records
the input digest and this distinction explicitly.

The initial short Criterion sampling budget produced a duration warning;
the final one-second budget completes without that warning. Both raw runs
are retained. The generated aggregate benchmark Markdown is archived and
restored to its baseline because a partial benchmark run cannot relabel older
rows as new evidence. No numeric threshold, fixture or native policy was weakened.

No push was made. The full repository pre-push matrix, published distributions,
new bindings, native wall-time/heap bounds, connected formal proofs and 100%
coverage remain open. Exact numerical evaluation of an ellipsoid model does
not establish physical Earth accuracy.
