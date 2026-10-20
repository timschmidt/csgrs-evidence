# Native complex Jacobi functions: verification

Baseline `5261beba6`, branch `hyperspatial`, 2026-10-19. This increment adds
`Complex::jacobi_sncndn` for finite complex arguments and admitted real m<1,
including negative parameters. Production remains native and Real-backed;
MPFR is development support only. The
[complex contract](../../../hyperlattice/docs/admission-complex-jacobi.md),
[scalar relation contract](../../../hyperreal/docs/admission-jacobi-rational-relations.md),
[Carlson bound](../../../hyperreal/docs/admission-carlson-mean-enclosure.md) and
[spatial contract](../../docs/admission/e2-complex-jacobi.md) distinguish exact
values, optional proofs, numerical enclosures and inherited qualification.
Thompson/Lee rectification, selected inverse maps and the remaining Earth/sky
stages stay open in the [development plan](../../DEVELOPMENT.md).

[Commands](commands.json), [process exits](process-exits.json),
[source metadata](source-metadata.json) and [test counts](test-counts.json)
identify the executions. [Raw logs](raw-logs.tar.gz) retain final logs,
diagnostic failures, source snapshots and sanitizer corpora; the
[manifest](raw-log-manifest.json) records byte sizes and SHA-256 hashes.

## Completed evidence

- Hyperreal's all-feature suite passes **1,188 executions in 39 suites**,
  Hyperlattice **218 in 21**, Hyperlimit **366 in 19**, and the affected
  Hypercurve circle/curve/contour suites **68 in three**. Hyperreal's library
  passes **943 tests** on each compiler. MSRV also passes public complex
  tests and Hyperlimit's private-node predicate inventory.
- Strict all-target/all-feature Clippy passes for Hyperreal, Hyperlattice,
  Hyperlimit and Hyperspatial on both compilers. Native rustdoc and
  Hyperspatial WASM check/Clippy pass. WASM compilation does not establish
  a JavaScript binding or published distribution.
- All four primitive-cache configurations pass **456 test executions in 96
  suites**, followed by strict Clippy. These include every spatial test,
  public real and complex Jacobi tests and all **70 Hyperlimit node recipes**.
  The new complex consumer performs **4,600 workflows** across these
  configurations: all 484 positive and 484 negative ordered pairs, 176
  family/regime cases and retained regressions in each. Optimization level
  one preserves debug assertions and overflow checks.
- Stable and MSRV each pass **184 spatial test executions**, including ten
  doctests, across the no-default and all-feature configurations. Both pass
  the five independent README source consumers, fuzz-target check/Clippy
  and spatial benchmarks. MSRV combines the retained 87 successful initial
  no-default tests with the complete resumed commands described below.
- [Stable](bench.json) and [MSRV](bench-msrv.json) complex benchmarks each
  pass **45 rows**, accepting **75 cold, 75 warm and 15 MPFR tuples**, with six
  enclosures per tuple. Every native component is materialized and every row
  validates after timing. Cold rows reconstruct outputs; input and global
  scalar caches can be warm. Algorithms and contracts differ, and concurrent
  validation affects timing; no speed ratio is claimed. Carlson benchmarks
  also complete on both compilers.
- A [standalone benchmark process](benchmark-resources.json) reports
  **15,572 KiB peak RSS**, **11.723 seconds elapsed** and a
  **2,945,056-byte executable**. It includes native and MPFR workloads and
  excludes compilation. This is not an allocation count, production-only
  binary size or native work/heap bound.
- [Directed search](directed-report.json) completes **176 cases** across
  **22 independent family buckets**, retaining **37 distinct selected inputs**
  with no failures. All **200 source hashes** match the final tree.
- The final [ASan campaign](asan.json) passes **746 runs in 1,804 seconds**,
  with mutation after initialization and **no new failure artifacts**.
  Its 217 supplied files retain the full 176-seed domain, original/reduced
  regressions and selected inputs. Final counters/features are
  **11,723 / 39,739**, the active corpus has **324 entries**, **352 files**
  remain on disk and RSS reaches **1,117 MiB**. All **208 source hashes**
  match the final tree. The original ten-second input timeout and 2,048 MiB
  RSS limit remain unchanged. Short inputs are ignored by the workload but
  count as fuzzer runs; binary counters are not source coverage.

[Coverage](coverage.json) passes all eight independent 95% line floors:

| Scope | Covered / executable lines | Coverage |
| --- | ---: | ---: |
| Hyperspatial | 1875 / 1902 | 98.58% |
| Inverse isometric, physical executable lines | 136 / 140 | 97.14% |
| Carlson | 232 / 235 | 98.72% |
| Forward Legendre | 122 / 123 | 99.19% |
| Inverse Legendre | 170 / 178 | 95.51% |
| Jacobi and log-argument helper | 191 / 196 | 97.45% |
| Complex Jacobi | 54 / 54 | 100.00% |
| Native relation helpers | 737 / 765 | 96.34% |

The full instrumented driver passes **1,057 test executions in 29 suites**.
The complex subset covers **117/125 regions and 2/2 functions**; the relation
helpers cover **1,377/1,519 regions and 33/33 functions**. These are the listed
production subsets, not whole-Hyperreal or whole-Hyperlattice coverage.

## Regressions and ownership

The complex construction uses complementary/reciprocal real Jacobi functions
and one nonnegative denominator, so removable quarter-period singularities
do not become poles. The independent MPFR interval oracle integrates the
three-function differential system with a 512-degree Taylor polynomial and
an explicit whole-tail bound. It shares no rectangular, inverse-amplitude
or elliptic-integral implementation with production. Public tests require
overlapping enclosures, each narrower than 2^-200; this is separate from
physical model accuracy.

Exact relation tests require rational certificates for all three complex
norm identities. The spatial workload consumes a unit norm as ellipsoid
axis and height and a zero imaginary norm as latitude, requiring exact ECEF
x=4 and preserving qualified input receipts. All six components are refined.
Serialization tests independently replay imported component values and
inverse domains before identities; caches are absent from the unchanged
wire format.

The initial implementation exposed proof gaps for quadratic parameter
inverses and norm-to-geodesy composition. Hyperreal now admits guarded
triangular native relations, compacts quadratic inverses only with nonzero
rational norms, and retains completed rational proofs in the existing exact
reduction cache. Unknown/budget declines preserve the expression and give no
negative fact. Degree 12, 8,192 outer work charges and all inverse obligations
remain unchanged in the final negative-quadratic fix. Directed input
`[0,120,113,108,1,0]` and reduced `[0,10,0,0,1,0]` also fail on the saved
pre-Carlson binary; both remain fixtures beside the complete negative matrix.

A separate logarithm stack overflow on `[7,19,2,2,0,0]` came from treating an
inexact magnitude hint as a range certificate. The logarithm owner now uses
certified magnitude information for recursive rewrites. Minimized hint
regressions and the original symbolic consumer remain. Completed zero proofs
also reach generic sine/cosine endpoints, with cancellation retained.

The initial ASan campaign timed out on `[21,6,127,39,1,4]` and retained slow
unit `[12,12,66,201,7,1]`. Fixed-input replays do not enforce libFuzzer's
mutation timeout; their timings are diagnostic only. The kept Carlson RF
change bounds the whole remaining integral using its mean and quadratic
spread, uses one quotient/remainder division and checks the stopping bound
every fourth duplication. Independent repeated-argument, uncertain-interval
and near-diagonal tests preserve the strict enclosure contract. RD retains
its original bound. Exact functions and serialized definitions stay the same;
finite midpoint bits can change within the existing error contract.

The optimization record retains unfavorable probes: quotient/remainder reuse
alone stayed near 13 seconds, and checking both old and new bounds remained
near the timeout. Final complete fixed-input diagnostics were about 7.3–7.6
seconds; the passing mutation campaign supplies acceptance under the unchanged
limit. These measurements do not establish a general speed ratio or native
wall-time guarantee.

Broader validation found Hyperlimit's outdated 60-node inventory. It now
contains all 70 recipes and runs in every cache configuration. Rust 1.99 also
deprecated the allocation examples' atomic update helper. Equivalent relaxed
compare-exchange loops preserve saturating counters and compile on MSRV;
complete one-iteration outputs match the originals byte for byte.

## Execution limits

Failing intermediate runs and superseded partial drivers are archived as
diagnostics. An early cache run exited 127 after its running shell script was
edited; its replacement ran the complete unchanged final script. Four long
drivers were later stopped after the sanitizer finding to validate one frozen
production source. Old timeout/slow-unit artifacts remain and are explicitly
identified as preexisting by the passing sanitizer campaign.

A temporary checkout for the next increment filled `/tmp`. All **87 MSRV
no-default-feature integration tests** had passed, but three doctest links
failed with linker bus errors. The checkout was moved to the larger filesystem.
The [recovery record](msrv-recovery.json) retains the failed driver and identifies
the replay of every no-default doctest and all remaining check-script commands.
The original failed process is not relabeled as passing.

Coverage uses test optimization level one with assertions and overflow checks.
Separate stable/MSRV checks retain the full unoptimized spatial corpus. The
five new relation files and complex API have separate 95% floors; shared
polynomial arithmetic, generic trig/log constructors and structural matching
remain outside those two new subsets, with affected regressions and native
suites still exercised. Gate regressions preserve every prior denominator.
Stable branch coverage and the 100% target remain open.

CI allows 180 minutes for native checks, 60 for the cache matrix, 185 for
directed/sanitizer work and 120 for coverage. Pedantic strict zizmor 1.31.1
reports no findings after the final workflow edit; its offline mode omits
network-dependent audits. Native total work/heap bounds, connected formal
proofs and physical observational accuracy remain open. No push was made.
The complete repository pre-push matrix, hosted workflows, published
distributions and new bindings are not claimed complete.
