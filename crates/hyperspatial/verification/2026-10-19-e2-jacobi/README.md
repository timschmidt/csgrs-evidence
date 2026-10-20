# Native real Jacobi functions: verification

Baseline `d0aa0d38a`, branch `hyperspatial`, 2026-10-19. This increment adds
`Real::jacobi_sncndn` for real u and admitted real m < 1, including negative
parameters. The [admission](../../../hyperreal/docs/admission-jacobi.md)
records the shared amplitude, positive dn branch, retained square relations,
intrinsic serialized domains and resource limits. The
[development plan](../../DEVELOPMENT.md) retains complex continuation,
ellipsoidal Transverse Mercator/UTM and the remaining Earth/sky stages.

Production remains native and Real-backed. MPFR is development support only.
The tuple retains exact expressions; enclosure precision is separate from
physical model accuracy and from total work or heap bounds.

[Commands](commands.json), [process exits](process-exits.json),
[source metadata](source-metadata.json), and [test counts](test-counts.json)
identify the executions. [Raw logs](raw-logs.tar.gz) retain diagnostics,
source snapshots, directed observations and complete sanitizer corpora, indexed
by byte size and SHA-256 in the [manifest](raw-log-manifest.json).

## Completed evidence

- Hyperreal's all-feature suite passes **1,165 test executions in 39 suites**,
  including all **70 private representation nodes** and the numeric API audit.
  MSRV passes the nine public Jacobi tests, three private Jacobi tests and two
  range-reduction regressions. Strict native Clippy passes on both compilers.
- Hyperlattice/Hyperlimit all-feature library tests pass **271 executions**.
  The affected Hypercurve circle, curve and contour suites pass **68 tests**.
  Native rustdoc and Hyperspatial WASM check/Clippy pass. WASM compilation
  does not establish a JavaScript binding.
- All four primitive-cache configurations pass **360 test executions in 84
  suites**: 324 spatial and 36 native Jacobi executions, followed by strict
  Clippy. The new spatial tests perform **2,640 Jacobi-to-geodesy workflows**
  across those configurations. Optimization level one retains debug assertions
  and overflow checks; no test cases are omitted.
- The complete Hyperspatial check script passes on stable and MSRV, with
  **170 test executions in 43 suites per compiler**, full unoptimized debug
  corpora, formatting, all targets/features, strict Clippy, rustdoc, four
  independent source consumers, and fuzz-target builds/lint. Optimized spatial
  workflow benchmarks also complete on both compilers.
- [Stable](bench.json) and [MSRV](bench-msrv.json) benchmarks each retain **60 rows**, accepting **60 cold,
  500 warm and 500 MPFR triplets** (three components per triplet). The actual
  public API also runs in the GMP API benchmark. Cold means fresh output
  nodes; input and global-constant caches remain available. Warm rows prime
  all three output enclosures. Native exact expressions plus certified
  enclosures and MPFR points have different contracts. Concurrent validation
  also affects timings; no speed ratio is claimed.
- A separate [standalone benchmark process](benchmark-resources.json) reports **11,228 KiB peak RSS**,
  **41.430 seconds elapsed**, and a **2,672,720-byte executable**. It includes
  native and MPFR workloads and excludes compilation. This is not an
  allocation count, production-only binary size, or native work/heap bound.
- [Directed search](directed-report.json) completes **176 cases**, with 22 independent scalar-family
  buckets, four candidates and two generations. Forty-four selection events
  yield **41 distinct inputs**, with no failures. The recorded execution times
  are cost-discovery samples, not comparative performance measurements.
- The initial [ASan run](asan-seed-replay.json) on the final production code completes **306 runs in 971 seconds**
  with no failure artifacts. Its 217 supplied files comprise 176 seeds and
  41 selected inputs. Initialization consumes the 900-second budget, so this
  run establishes seed replay only. The driver budget is extended to 1800
  seconds for a separate mutation campaign. Per-input containment remains
  10 seconds and 2048 MiB; the complete seed domain is retained.
- The extended [ASan campaign](asan.json) completes **730 runs in 1804 seconds**, including
  initialization and mutations, with no failure artifacts. Final counters and
  features are **9843 / 31836**, the active corpus has **279 entries**, and
  **321 files** are retained on disk. Reported RSS reaches **1016 MiB**.
  All **178 source hashes** match the final tree. Inputs shorter than six bytes
  are ignored but count as fuzzer runs; binary counters are not source coverage.

[Coverage](coverage.json) passes all six independent 95% line floors:

| Scope | Covered / executable lines | Coverage |
| --- | ---: | ---: |
| Hyperspatial | 1875 / 1902 | 98.58% |
| Inverse isometric, physical executable lines | 136 / 140 | 97.14% |
| Carlson | 148 / 151 | 98.01% |
| Forward Legendre | 122 / 123 | 99.19% |
| Inverse Legendre | 170 / 178 | 95.51% |
| Jacobi and its log-argument helper | 188 / 194 | 96.91% |

The Jacobi subset also covers **514/542 regions** and **20/20 functions**.
These are the four listed implementation files, not whole-Hyperreal coverage.
The full instrumented driver completes, including its 881 scalar library tests.

## Diagnostics, changes and limits

Independent numerical references invert a high-precision integrand series
at fresh rational arguments. Separately sampled amplitudes and AGM half-period
values test negative parameters and extreme complements. Native acceptance
also exercises all 22 scalar families, exact quarter-period endpoints,
1e320 periods, 1e-320 offsets, mismatched identities, serialization, precision
order, cancellation recovery and concurrent readers. Spatial consumers refine
all three components, require a retained exact unit norm, and use positive dn
to construct strict ellipsoid/ECEF outputs while preserving input qualification.

Development failures exposed missing square normalization and log-argument
recovery in retained relations. Their fixes are bounded optional recognition;
failure to recognize retains the exact expression. Tests use exact rational
normal-form certificates for mathematical identities. Public `PartialEq`
continues to compare carriers. Imported dn recovers its positive structural
certificate through the normal fact cascade; an immediately populated cache
is not promised. A warmed imported log residual may strengthen a previously
unknown coefficient identity without changing the value.

The huge-period test also exposed an existing generic range-reduction bug:
dividing two fixed-precision point approximations can lose arbitrarily many
periods. The shared helper now refines the exact quotient. A direct signed
1100-bit regression fails on the previous implementation and passes after the
fix. That correction exposed an existing panic when an optional exponential
binary scale exceeds i32; reduction now declines and preserves the lazy exact
exponential. Existing serialized indices and imported meanings remain intact;
equivalent newly constructed expressions may differ from older revisions.

Initial compilation errors, relation/serde diagnostics, the original long
huge-period run, and superseded validation processes are retained separately
from successful final-source evidence. The initial full native run found the
exponential-scale panic; it is not relabeled as passing. The GMP benchmark's
partial generated aggregate Markdown is archived separately and restored to
baseline rather than replacing historical rows.

The first unoptimized four-cache driver was superseded while its first
configuration was running. Its replacement still executes every spatial test
and the native Jacobi suite in each configuration, with test-profile
optimization level one, debug assertions and overflow checks enabled. Separate
stable/MSRV checks retain the complete unoptimized debug runs. Neither inputs,
policies, numerical thresholds nor required successful outcomes are relaxed.
CI allows 90 minutes for native checks and coverage, 60 for the cache matrix,
and 155 for directed/sanitizer work. Strict pedantic zizmor reports no findings
after the final workflow edit.

Coverage keeps six independent 95% line floors. The Jacobi denominator has
four implementation files; existing inverse-isometric, Carlson, Legendre and
inverse-Legendre denominators remain independent. Shared dispatch and generic
range reduction are outside the Jacobi subset. Gate regressions reject masking
and the loss of any of the 13 elliptic/Jacobi source files. Branch coverage,
connected formal proofs and the 100% target remain open.

No push was made. The full repository pre-push matrix, hosted workflows,
published distributions, new bindings, native wall-time/heap bounds and the
remaining development stages are not claimed complete.
