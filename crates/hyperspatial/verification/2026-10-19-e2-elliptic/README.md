# Native elliptic prerequisites: verification

Baseline `891e35453`, branch `hyperspatial`, 2026-10-19. This increment adds
Hyperreal's exact, refinable Carlson RF/RD integrals and their native spatial
consumers in development tooling. The [admission proof](../../../hyperreal/docs/admission-elliptic-integrals.md)
defines the domain, interval algorithm, serialization and resource limits.
Ellipsoidal transverse rectification remains open in the
[development plan](../../DEVELOPMENT.md).

## Final evidence

All final local checks passed. [summary.json](summary.json) records counts;
[source-metadata.json](source-metadata.json) identifies sources, compilers and
host. The byte-exact logs are in [raw-logs.tar.gz](raw-logs.tar.gz), indexed by
size and SHA-256 in [raw-log-manifest.json](raw-log-manifest.json).

| Check | Result |
| --- | --- |
| Hyperreal `cargo test --all-features` | 1,125 test executions, including numeric API and private-node inventories; no audit exclusions added. |
| Hyperspatial `scripts/checks.sh`, stable 1.99 and MSRV 1.95 | 158 test executions each; formatting, all targets/features, Clippy, rustdoc, both README source consumers, fuzz compilation and lint pass. |
| Native elliptic suite on MSRV | 8 tests pass, including independent MPFR checks and `1e±320` scale composition. |
| Four primitive-cache configurations | 29 native and 8 spatial test executions; the spatial tests complete 2,640 workflows across 22 families, four regimes, cold/warm states and 484 ordered pairs per configuration. [Commands and durations](matrix.json). |
| Hyperlattice/Hyperlimit library tests | 261 default and 271 all-feature executions pass. |
| Native Clippy, docs and target | Hyperreal stable/MSRV all-target all-feature Clippy and native rustdoc pass with warnings denied; Hyperspatial WASM check and Clippy pass. |
| Optimized benchmarks | All Hyperspatial benches and the completion-checked elliptic probe pass on stable/MSRV. The workspace benchmark dispatcher and GMP RF/RD circular-limit rows also execute. |
| Source consumer and schedule preservation | Two isolated consumers produce 8 byte-identical serialized models; all 32 precision enclosures overlap. [Comparison](consumer.json). This validates local sources, not a published package. |
| CI/tooling checks | `zizmor --pedantic --strict-collection .`, shell syntax and Python compilation pass. The affected workspace adversarial command is covered by the complete Hyperspatial test runs; unchanged CSGRS workloads were not rerun. |

[Coverage](coverage.json): Hyperspatial remains at **1,875/1,902 lines (98.58%)**,
2,576/2,754 regions and 201/201 functions. The three dedicated elliptic production
files reach **148/151 lines (98.01%)**, 305/314 regions and 16/16 functions.
The existing inverse-isometric subset remains 136/140 physical executable lines.
All three 95% line gates pass. Elliptic shared dispatch/matching is outside its
reported subset; branch coverage and connected formal proofs are unmeasured.
The 100% coverage target remains open.

[Directed search](directed-report.json) completes **176 total cases**, four
candidates over two generations in each of 22 independent family buckets.
Its 44 selection events yield 38 distinct inputs and no failures; compressed
dispatch observations accompany the report. These are cost-discovery samples.

[ASan](asan.json) starts with 214 inputs: 176 regime seeds and 38 selections.
It completes **1,115 runs in 908 seconds**, including mutation, with no new
failure artifacts. Final reported RSS is 658 MiB; 8,496 counters and 25,087
features are instrumented-binary observations, not source coverage. The final
active corpus has 366 inputs; 422 files remain in the saved corpus. Inputs
shorter than six bytes are ignored by the target and still count as fuzzer runs.
The unchanged containment limits are 10 seconds/input and 2,048 MiB RSS.

## Refinement schedule and retained diagnostics

The initial kernel started every evaluation on a 32-bit grid. The retained
version starts with twice the requested fractional accuracy plus guards; both
return only after the same enclosure-width test. Five cold trials on three
complete RF cases retain every accepted/rejected count in
[initial](benchmark-initial.json) and [final](benchmark-final.json) records.
Each probe accepts all 150 cold, 1,500 warm and 1,500 MPFR rows. Moderate-case
cold medians fall from about 3.84 ms to 0.72–0.81 ms; the `2^-128` complement
changes from about 10.22 ms to 9.41 ms. These are single-host probes under
concurrent check load, not isolated performance estimates. Native enclosures
and MPFR point values have different contracts; no cross-library speed ratio
is claimed. Exact model serialization is checked separately.

The archive preserves the missing-API baseline, initial coarse-grid kernel,
benchmark records, and the numeric-API/private-node inventory failures and
their corrections. Initial coarse-grid spatial, coverage and ASan runs were
explicitly interrupted with SIGINT when superseded; they are not final passing
evidence. The final campaigns rerun the complete declared inputs. An incidental
benchmark closure type error is also retained. The GMP runner's generated
aggregate Markdown is archived and restored in the workspace because that
partial run must not relabel older benchmark rows as fresh evidence.

The existing ellipsoidal-Mercator comparator rejection remains visible in the
spatial benchmark logs: its binary64 result does not meet the fixed acceptance
criterion. No threshold or fixture was relaxed for this increment.

No push was made, and the full repository pre-push matrix was not executed.
Native wall-time/heap bounds, published distributions, bindings, Jacobi
functions, exact ellipsoidal transverse mapping and the later Earth/sky stages
remain open. This bundle establishes the named scalar prerequisite and checks.
