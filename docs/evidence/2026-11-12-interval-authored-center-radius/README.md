# Independently authored center/radius forms — 2026-11-12

Source `87c0b59c4907fe9ac2403c6655b13cde45583647`; baseline, source patch digest and clean source state in
SOURCE.json. initial-state.json records all four clean managed repositories.
The committed INTERVAL_REFACTOR_PROGRESS.md entry describes the admission,
mathematical argument, checks, measurements, decisions and remaining scope.
No Interface or firmware source changed, and no push was attempted.

## Contract and scope

CenteredVector and CenteredMatrix retain independently authored exact singleton
centers and nonnegative singleton radii, all in one IntervalArithmetic backend.
Empty/nonpoint/negative components fail typed; explicit empty is distinct from
the zero-dimensional unit. Valid construction transfers the source without
endpoint arithmetic. The explicit enclosure computes shared subtraction,
addition and hull, preserving the exact definition through overflow/exhaustion.
The precondition r >= 0 proves c-r <= c+r. Outward scalar bounds and their hull
therefore enclose the defined box. Serialization revalidates components; it
never accepts flags as evidence. Existing midpoint/radius decompositions and
scalar/predicate algorithms are unchanged. unchanged-source.json checks 56 old
source files byte-for-byte, excluding the changed export/error modules.

Heterogeneous center/radius arithmetic and authored-form exact affine-source
integration remain open. This is an additive capability, not a consumer
migration, a completed Phase 6, or a completed 15-phase goal. All prior solver,
Interface, firmware and later-phase blockers remain in scope.

## Reproduction and checks

- ADMISSION.md precedes source edits. baseline-missing.log reproduces the missing
  API at the exact baseline detached worktree. external-witness.rs, its manifest
  and lock record the passing external Rust 1.88 consumer; substituting the
  baseline path reproduces the failed import.
- checks.py / checks.json retain 18 commands, exit codes, elapsed times and
  check-*.log. These include both owning and downstream suites, no_std ARM,
  Wasm, feature combinations, Clippy, documentation and root formatting.
- final-focused.py / focused-checks.json retain seven checks after the final
  explicit empty-matrix replay and diagnostic tests: Rust 1.88/1.95/stable,
  release, strict Clippy, ASan and coverage. They pass eight tests on 1.88 and
  nine with all features. ASan's exact target directory/RUSTFLAGS are recorded.
- owner-final.log is `cargo +1.95.0 test --locked -p hyperlattice-interval
  --all-features`: 78 tests/doctests pass. clippy-stable-final.log is
  `cargo +stable clippy --locked -p hyperlattice-interval --all-features
  --all-targets -- -D warnings`, exit 0. The downstream Hyperlattice all-feature
  suite passes 248 tests/doctests (check-12.log), including its longer elliptic
  reference tests. No live process was restarted because of an observation wait.
- Coverage: final-focused command 6 and coverage-report.py recreate the report.
  centered.rs has 59/61 lines, 82/86 regions, 10/10 functions and 300/329 compiled
  instantiations covered. Branch instrumentation has no denominator. No claim
  of 100% coverage. The archived JSON retains all functions mapped to this
  module; unrelated linked functions are filtered. coverage-retention.json
  records full-export digests, sizes, retained counts and local full copies.
  Initial coverage is retained separately; the empty-matrix replay addition
  strengthens semantic coverage without pretending it closes all metrics.
- Initial logs retain an unused-import warning, fixed without suppression.
  All existing assertions remain. final-fmt.log, final-diff.log and
  repository-budget.log cover the committed source. Root formatting is also
  check-15.log. No CI configuration changed; no pre-push matrix was claimed.

The six-backend corpus has 25,704 vector/matrix fixture pairs with independent
integer bounds and subsequent affine/set/linear operations. There are 84 full
signed-range/scale cases, IEEE subnormal and adjacent-endpoint cases, malformed
replay, arbitrary dimension 64, fresh-process exact replay, and every insufficient
dyadic work budget below a successful projection's cost. Component promotion
recovers exact bounds after fixed projection overflow. Resource errors never
publish a partial result or poison the retained source.

## Completed cost/resource probes

native-measure.py runs the committed centered_cost example after other checks
finish. It records 960 samples: six backends, dimensions 4/64, four actions,
20 samples/action, 128 completed operations/sample, 32 warmups. CPU 0 is pinned;
frequency/governor and other host activity are not controlled. It is a short
sequential local probe, not a matched global no-regression or speedup claim.
Both projection paths are checked against complete independent expected bounds
before timing. Raw timings/allocations, summaries, layouts, binary digest and
GNU size are retained. All primitive paths allocate zero; ownership round trips
allocate zero for the measured prepared fixtures in every backend. At N=64,
rational projection uses 240 allocations / 9,600 bytes; dyadic uses 792 / 6,336,
matching the direct three-operation control. The new type's inline size equals
its component pair on this host. Peak temporary stack, retained arbitrary-
precision heaps and whole-stack monomorphized growth are not measured.
The all-backend probe is 1,553,688 bytes; its GNU text is 1,040,289 bytes.

wasm-check.py uses the dedicated Python environment with Wasmtime; exact tool
versions are in tool-versions.txt. The maintained zero-import module is built
from conformance/centered-wasm. Independent Python integers check all returned
endpoints: 7,992 cases (4,373 success, 2,455 negative-radius rejection, 1,164
overflow), 18,955 returned calls plus two invalid-selector traps. Empty/unit
semantics and the unqualified IEEE environment are also checked. Unexpected
status -99 is rejected. The module is 47,864 bytes; digest and maximum returned
fuel 4,688 / per-call allowance 1,000,000 are in wasm-summary.json. Fuel is not
wall time or MCU cycles. Raw modules/binaries are reproducible from source and
are not duplicated into the evidence archive. No browser/HIL/fuzz claim.
