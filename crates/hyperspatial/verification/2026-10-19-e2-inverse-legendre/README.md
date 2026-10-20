# Native inverse Legendre integrals: verification

Baseline `0171a2a48`, branch `hyperspatial`, 2026-10-19. This increment adds
native `Real::jacobi_amplitude` and `Real::inverse_elliptic_e` for every real
argument and admitted real parameter m < 1. The
[admission](../../../hyperreal/docs/admission-inverse-legendre.md) records
unwrapped period reduction, clipped rational root enclosures, defining-relation
reuse, intrinsic serialized domains, and resource limits. The
[development plan](../../DEVELOPMENT.md) retains Jacobi sn/cn/dn, complex
continuation, ellipsoidal Transverse Mercator and the later Earth/sky stages.

[Commands](commands.json), [source metadata](source-metadata.json), and
[test counts](test-counts.json) identify the executions. Byte-exact logs,
source snapshots, directed inputs and sanitizer corpora are retained in
[raw-logs.tar.gz](raw-logs.tar.gz), indexed by size and SHA-256 in
[raw-log-manifest.json](raw-log-manifest.json). External MPFR is development
support only; runtime dependencies remain native.

## Executed evidence

- Hyperreal's all-feature suite passes **1,151 test executions in 38 suites**,
  including the inventory of all **67 private nodes** and numeric API audit.
  The MSRV inverse suite passes **11 tests**. A later oracle residual guard
  is exercised by the final cache matrix and a focused MSRV oracle rerun.
- Four primitive-cache configurations pass **44 native and 8 spatial tests**
  in release builds. The spatial tests perform **2,640 workflows**, each
  refining both inverse functions before constructing strict ellipsoid/ECEF
  geometry and checking retained physical input qualification.
- All commands in Hyperspatial's `scripts/checks.sh` pass on stable and MSRV,
  with **166 successful test executions per compiler**, formatting, all
  targets/features, strict Clippy, rustdoc, four source consumers, and fuzz
  target builds/lint. After the initial README doctest failure, the corrected
  default doctest is rerun and the remaining commands are completed with the
  retained continuation script; the original failing invocation is not
  relabeled as a passing process.
- Hyperlattice/Hyperlimit library suites pass **261 default and 271 all-feature
  executions**. Hyperreal Clippy passes on stable and MSRV with warnings
  denied. Native rustdoc and Hyperspatial WASM check/Clippy pass; the latter
  establishes library compilation, not a JavaScript binding.
- Four README examples compile and run in an independent source consumer,
  including actual inverse evaluation and retained forward/inverse identities.
  Its dependency guard verifies the native-only direct runtime boundary.
- [Stable](bench.json) and [MSRV](bench-msrv.json) probes each retain **120
  rows**, accepting **120 cold, 1,000 warm and 1,000 MPFR results**. Both new
  APIs also run in the GMP API benchmark. Cold means a new result node;
  input/global constant caches remain available. Warm rows explicitly prime
  the result's enclosure. Timing excludes final row acceptance checks but
  includes the MPFR solver's convergence check. The contracts differ (exact
  native expression plus enclosure versus a finite MPFR point), and the host
  runs concurrent validation, so these are not speed-ratio claims.
- [Process resource measurements](benchmark-resources.json) report **16,556
  KiB peak RSS**, **52.156 seconds elapsed**, and a **2,543,464-byte executable**
  for the standalone stable benchmark. The measurement includes its native
  and MPFR workloads and excludes compilation. It is not an allocation count,
  a production-only binary size, or a native heap/work bound.
- [Directed search](directed-report.json) completes **176 cases**, with 22
  independent family buckets, four candidates, two generations and no
  failures. Forty-four selection events yield **39 distinct inputs**. These
  are cost-discovery samples, not comparative performance measurements.
- [ASan](asan.json) completes **1,928 runs in 901 seconds**, with no failure
  artifacts. The initial corpus has **215 inputs** (176 seeds plus 39
  selections); the final active corpus has **524 entries**, with **565 saved
  files**. Final counters/features are **9,475 / 31,609**, with **745 MiB RSS**
  reported. Inputs shorter than six bytes are ignored but count as fuzzer
  runs. Containment is 10 seconds per input and 2,048 MiB RSS; these limits
  and binary counters do not establish native bounds or source coverage.

[Coverage](coverage.json) passes all five independent 95% line gates:
Hyperspatial **1,875/1,902 (98.58%)**, inverse-isometric **136/140 physical
executable lines (97.14%)**, Carlson **148/151 (98.01%)**, forward Legendre
**122/123 (99.19%)**, and inverse Legendre **170/178 (95.51%)**. The new
inverse subset covers **436/447 regions and 9/9 functions** across its three
implementation files. Shared dispatch/matching is outside those subsets;
branch coverage and the 100% target remain open.

## Diagnostics, changes and limits

The missing-API baseline fails compilation before production edits. Fresh
MPFR inputs use an independent integrand series, AGM complete values, and a
safeguarded series-based inverse with a checked residual. Native tests cover
negative parameters, unwrapped periods, tiny complements, 1e320 arguments,
1e-320 offsets, all 22 scalar families, wrong-kind/parameter non-cancellation,
serde, precision order, cancellation recovery and concurrent readers.

Development regressions caught two missed exact quarter-period forms: binary
scales and the rational coefficient absorbed into complete E. The final
recognizer compares bounded structural rational factors on both sides. It
never recognizes a period from numerical proximity. The spatial harness also
initially required a nonzero interval width; exact circular outputs legitimately
have point enclosures. Its corrected assertion requires an exact rational
certificate whenever the enclosure collapses to a point.

An oracle module was initially included twice; the final code shares the module
and passes strict Clippy. One development cache command used an unqualified
feature name; the complete corrected four-configuration matrix passes. The
new README example initially omitted its error-type annotation; its corrected
doctest and independent consumer are rerun. These diagnostics are retained
separately from passing evidence. The GMP benchmark's generated aggregate
Markdown is archived and restored to baseline, since partial runs cannot
relabel older measurements. Criterion comparisons against earlier development
runs include the added oracle residual check and are not matched performance
comparisons.

Final staging found one extra blank line at the end of the extracted interval
helper. [Source equivalence](source-equivalence.json) records both byte hashes
and verifies that the measured file is exactly the final file plus one newline.
Its measured bytes are retained in the raw archive. Every production statement
and its line number is unchanged; the original campaign/coverage hashes are
preserved. Focused inverse/isometric kernel tests and the 660-workflow spatial
suite pass after this formatting edit, followed by formatting and staged diff
checks. No coverage measurement is relabeled as a test reexecution.

Each Carlson, forward Legendre and inverse Legendre subset has its own 95%
line floor. Gate regressions reject masking in every group and the absence of
any of their nine source files. Extracted rational-interval helpers remain in
the existing inverse-isometric denominator. No numerical threshold, fixture
or native policy is weakened. CI time budgets allow the expanded matrices:
45 minutes for native checks and coverage, 60 for the four cache configurations,
and 125 for the eight directed/ASan targets.

No push was made. The full repository pre-push matrix, published distributions,
new bindings, native wall-time/heap bounds, connected formal proofs, branch
coverage and the 100% coverage target remain open. Exact model arithmetic does
not establish physical Earth accuracy.
