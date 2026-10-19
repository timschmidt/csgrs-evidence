# Ellipsoidal Mercator evidence

The [admission record](../../docs/admission/e2-ellipsoidal.md) defines the
operation, supported compositions, actual evidence and remaining limits.
All runs began from `5fb8fc570` plus the working-tree extension. Report source
digests identify the measured code; the base Git revision alone does not.

- `missing-api.log`: the new analytic consumer failed to compile before the
  production API existed. It does not assert a preexisting spherical bug.
- `analytic-domain.log`, `representations-oracles.log`: initial analytic/domain,
  484 ordered representation-pair and pinned 63-input WGS84 oracle checks.
- `stable-checks.log`, `msrv-checks.log`: the complete Hyperspatial check script
  on stable and Rust 1.95, including independent README consumers, documentation,
  Clippy and the separate fuzz manifests.
- `cache-matrix.log`: all integration tests and all-target Clippy in four
  native scalar cache configurations.
- `coverage.log` and `coverage.json`: full production denominator and the
  separate native inverse denominator, with the existing 95% gates intact.
- `directed-initial/` and `directed-spherical-initial/`: the selections supplied
  to the ASan seed corpora. Their warming-description field incorrectly named
  bit 1; the actual projection workloads use bit 2. The first ellipsoidal run
  also precedes the new benchmark's manifest stanza. Workload code is unchanged.
- `directed-final/` and `directed-spherical-final/`: repeated selections with
  corrected metadata and final source/manifest digests. Each has 176 observations
  and 44 bucket selections. These final selections are not credited as ASan
  replayed inputs; the sanitizer reports inventory the actual initial seeds.
- `asan-shared/`: completed spherical Mercator ASan mutation campaign after the
  shared orchestration change. Reports retain before/after input bytes and
  failure-artifact inventories.
- `asan-ellipsoidal/`: the 900-second ellipsoidal campaign, including full seed
  initialization and coverage-increasing mutations, with no new failure artifact.
- `benchmarks.log`: all native release benchmarks, including the qualified
  ellipsoidal comparison. `oracle-benchmark-bound-failure.log` preserves its
  original accuracy failure. Comparator timing rows with zero accepted samples
  do not establish an exact-contract performance result.
- `benchmark-manifest.json`, `fresh-process-benchmark.log`: compiler, source
  and executable digests, input/cache semantics, fresh-process time, whole-child
  peak RSS and executable size. Other validation ran concurrently.
- `wasm.log`, `zizmor.log`: native WASM lint/compilation and offline CI auditing.
- `commands.json`: observed command exit codes, including the retained initial
  missing-API and comparator-accuracy failures. `msrv-benchmarks.log` separately
  records all release benchmarks on Rust 1.95.

The package is unpublished. Source-consumer compilation is not a published
installation test, WASM compilation is not a JS runtime test, and fuzz counters
are not production line or branch coverage. No push, hosted artifact upload,
or full repository pre-push matrix is claimed.
