# Principal complex atanh: verification

Baseline `7042b1ef2`, branch `hyperspatial`, 2026-10-19. This increment adds
native `Complex::atanh` on its principal analytic branch, extends checked
`Real::atan2` quadrant completion and preserves the root cancellation signal
in deferred `atan`. Production components remain `Real` expressions; MPFR is
a development oracle. The [complex admission](../../../hyperlattice/docs/admission-complex-atanh.md),
[scalar admission](../../../hyperreal/docs/admission-atan2-right-half-plane.md)
and [spatial contract](../../docs/admission/e2-complex-atanh.md) state the domains
and acceptance obligations. Thompson/Lee inversion and later Earth/sky stages
remain open.

[Commands](commands.json), [process exits](process-exits.json),
[source metadata](source-metadata.json), the [source freeze](source-freeze.json)
and [test counts](test-counts.json) identify the completed executions. All 732
frozen runtime, test, README and tooling files match the integrated tree and
remained unchanged during final validation. The [integration record](integration.json)
and [root checks](root-validation.json) record reproduction on the target
revision and thirteen passing integration checks. [Raw evidence](raw-logs.tar.gz)
retains logs, failed diagnostics, source snapshots, serialized comparisons and
complete campaign corpora, with sizes and SHA-256 hashes in the
[manifest](raw-log-manifest.json).

## Completed checks

- Stable and Rust 1.95.0 each pass **200 spatial test executions in 49 suites**
  across no-default and all-feature configurations, including fourteen
  doctests. Both pass seven independent README source consumers, strict
  all-target Clippy, rustdoc, fuzz-target check/Clippy and spatial benchmarks.
- Hyperreal passes **1,207 executions in 41 suites**, Hyperlattice **239 in
  23**, Hyperlimit **366 in 19**, and the affected Hypercurve suites **68 in
  three**. Hyperreal's library passes **947 tests** on both compilers. The
  MSRV run additionally passes six scalar integration suites (54 tests),
  three complex suites (33) and six Hyperlimit representation-inventory tests.
- All four primitive-cache configurations pass **616 executions in 120
  suites**, followed by strict Clippy. Each retains the complete spatial
  corpus and scalar/complex tests. The three new spatial tests exercise
  **1,144 workflows**: 484 local pairs, 484 reciprocal pairs and 176
  family/regime cases across all 22 scalar families. Test optimization retains
  debug assertions and overflow checks.
- Both compilers pass all-target/all-feature Clippy for Hyperreal,
  Hyperlattice, Hyperlimit and Hyperspatial. Native rustdoc and Hyperspatial
  WASM check/Clippy pass. WASM compilation does not establish a JavaScript
  binding or published distribution.
- [Stable](bench.json), [MSRV](bench-msrv.json) and
  [standalone](bench-standalone.json) complex atanh benchmarks each complete
  **45 rows**: 75 cold, 75 warm and 15 MPFR evaluations accepted, with both
  components materialized and verified after timing. Cold rows reconstruct
  output expressions; input/global scalar caches may already be warm. The
  affected Carlson, Legendre, inverse-Legendre, Jacobi, complex-Jacobi and
  epsilon benchmarks and focused GMP API cases also pass.
- The [standalone process](benchmark-resources.json) takes **0.064708 seconds**,
  peaks at **16,820 KiB RSS** and uses a **2,873,912-byte executable**. It
  includes native and MPFR workloads and excludes compilation. These are not
  allocation counts, production-only binary size, native work/heap bounds or
  evidence of a cross-library speed ratio.
- [Directed selection](directed-report.json) completes **176 cases in 22
  independent family buckets**, retaining 38 selected inputs without
  failures. All 205 report source hashes match the final tree.
- The final [ASan campaign](asan.json) advances **INITED 260 → DONE 7,521**,
  exits successfully after 61 seconds and reports no new crash, timeout or
  slow artifact. There are 214 supplied and 704 final corpus files; the
  fuzzer's active corpus ends at 652 entries and RSS at 640 MiB. The existing
  ten-second input and 2,048 MiB RSS limits remain external containment.
  Short ignored inputs still count as runs; fuzzer counters are not source
  coverage. The earlier successful preliminary campaign is archived separately.

[Coverage](coverage.json) passes all twelve independent 95% line floors:

| Scope | Covered / executable lines | Coverage |
| --- | ---: | ---: |
| Hyperspatial | 1875 / 1902 | 98.58% |
| Inverse isometric, physical executable lines | 136 / 140 | 97.14% |
| Complete changed Real atan2 functions, physical lines | 42 / 43 | 97.67% |
| Deferred atan constructor, physical lines | 13 / 13 | 100.00% |
| Carlson | 232 / 235 | 98.72% |
| Forward Legendre | 137 / 138 | 99.28% |
| Inverse Legendre | 170 / 178 | 95.51% |
| Jacobi and log-argument helper | 234 / 237 | 98.73% |
| Complex Jacobi/epsilon | 103 / 103 | 100.00% |
| Shared square quotient | 40 / 40 | 100.00% |
| Native relation helpers | 737 / 765 | 96.34% |
| Complex elementary / atanh | 36 / 37 | 97.30% |

The instrumented driver passes **1,103 executions in 35 suites**. Complex
atanh covers 62/76 regions and its one function; Hyperspatial covers 2576/2754
regions and 201/201 functions. These are the named production subsets, not
whole-Hyperreal or whole-Hyperlattice coverage. Existing denominators remain
independently gated. Stable branch coverage and the 100% target remain open.

## Meaning, composition and retained failures

The principal branch excludes real cuts (-infinity,-1] and [1,infinity).
Exact poles return Infinity, other real cut points return NotANumber and
unresolved membership returns Exhausted. The implementation uses nonnegative
log1p arguments when a real-part sign is already known, an exact logarithmic
quotient otherwise, and checked atan2 for the imaginary component. The
independent MPFR interval power-series oracle uses a whole-tail bound and
reciprocal continuation on its stated comparison domain. Native tests also
cover axes, near poles and cuts, unknown signs, huge and tiny inputs,
conjugation/parity, forward tanh composition, serialization, precision order,
cancellation/recovery and concurrent readers.

Spatial consumers refine both components, use the real square plus two as an
ellipsoid axis and the imaginary component as height, then require exact
equatorial ECEF and anchored ENU/NED round trips. Qualified input receipts
must survive; numerical closeness does not replace exact composition.

Before integration, the missing complex method, positive-x atan2 regression
and isolated deferred-atan cancellation defect fail on `7042b1ef2`. The full
cancellation regression also fails earlier at the old atan2 constructor;
that diagnostic is retained separately from the isolated signal proof.
Positive x now permits atan(y/x) without resolving y's sign. Unknown x with
known nonzero y reuses the existing checked Computable half-angle path.
Negative-axis and unresolved-origin obligations retain typed exhaustion.
Deferred atan preserves its input's root signal; this does not combine
arbitrary distinct descendant controllers.

The [atan2 comparison](atan2-serialization.json) preserves **1,936 serialized
rows / 792,156 bytes** byte for byte, SHA-256
`1df7bc76298bd02879fb431aa97ed38649c9f8d3e0057b4a88b490188c2d7f9b`.
No scalar node or wire tag is added. Initial tests incorrectly expected
1e-320 offsets to remain unresolved despite the existing -2048-bit sign
floor; the final suite retains these certified successes and uses 1e-1000
offsets for verified unresolved cases. The floor is unchanged.

Focused atan2 coverage first failed at 39/43 lines. Cold post-refinement axis
cases now exercise the missing branches; no floor or exclusion was relaxed.
The first README consumers incorrectly demanded structural equality for two
different logarithm carriers, then an unavailable exp/log cancellation.
Both failed logs remain. The example now checks a certified residual against
ln(5)/4 while retaining exact imaginary-component and geometry/receipt checks.
Three coverage-parser regressions and three sanitizer-mutation parser
regressions pass; an exit-zero seed-only campaign is still rejected.

## Execution limits

Pedantic strict zizmor 1.31.1 reports no findings; its offline mode omits
network-dependent audits. The historical Hyperreal GMP report is unchanged;
the focused generated report is archived. Final validation uses one frozen
runtime/tooling source. Separate projection/root-proof experiments are not
part of this increment or its evidence.

Native total-work/heap bounds, connected formal proofs and physical model
accuracy remain open. No push was made. The complete repository pre-push
matrix, hosted workflows, published distributions and new bindings are not
claimed complete.
