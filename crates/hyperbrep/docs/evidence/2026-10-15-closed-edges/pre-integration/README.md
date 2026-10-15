# Closed circular and elliptic edges — 2026-10-15

Partial WP03 work against `f653f1ed2`, enabling later analytic STEP mapping.
All 28 development-plan gates remain open. `ModelBuilder::edge` now retains
one vertex at both ends of a circle or ellipse spanning exactly one period.
Its existing positive-radius and independent-axis checks prove regularity;
the edge still checks both actual endpoint images. Other closed families return
`UnsupportedClosedEdge`; an incomplete analytic period returns
`ClosedEdgePeriodMismatch`. Vertex adjacency records the edge once, while edge
uses and the two parameter endpoints stay distinct.

The shared planar repair is in Hypercurve: `CurveString2` applies its zero-chord
guard to lines. Full circles already have a native `CircularArc2` carrier.
This admits their composition into `Contour2` and the single `CurveRegion2`
carrier without weakening the arc's own validity or exact-consumer checks.
Known zero-length unchecked lines remain rejected. See the
[contract](../../ARCHITECTURE.md#closed-edges-and-periodic-seam-uses) and
[research](../../ALGORITHM_RESEARCH.md#native-closed-edges-before-analytic-step-mapping-2026-10-15).

## Correctness and scope

Seven new native tests cover a two-vertex, three-edge, three-face cylinder;
shifted seams and reversed canonical curves; distinct parameter endpoints and
quarter-period round trips; cold/warm queries; complete archive equality;
circle and shared-seam subdivision; reflection; coincident-cylinder Booleans;
standalone full ellipses; exact period and endpoint failures; unsupported
constant splines; and six forged archive mutations. Two new Hypercurve tests
cover full-circle winding, area and first moment, mixed open strings, Boolean
composition, an annular difference, outward offset and offset reversal.

`commands.json` records the exact scope and exits of native debug/release,
Hypercurve default-feature tests, strict Clippy, warning-denied rustdoc,
fuzz-target compilation, WASM execution, formatting and diff checks.
`wasm-runtime.json` records seven executed groups with zero host imports.
Runtime execution is not production JavaScript ABI coverage. The debug and
release suites overlap and are not additive unique coverage.

Five faults in `controls/` are rejected at runtime and restored with matching
source digests: ban closed edges, duplicate adjacency, omit the exact period
proof, omit closed-edge endpoint proof, and restore the arc zero-chord guard.
The period fault checks the specific admission diagnostic; it does not claim
that removing this guard alone would publish an invalid solid. `verify.py`
also rejects missing, duplicated and changed-result rows in both existing
benchmark formats.

`initial/` retains the original runtime `DegenerateEdge` rejection and the
subsequent Hypercurve `ZeroLengthLine` failure. The localization backtrace came
from a temporary diagnostic, restored before qualification. Two fixture setup
compile failures (nonexistent `Point2::default` and polynomial Bézier names)
were corrected; they are not credited as runtime fault detection.

Standalone ellipse edge admission does not add ellipse/plane pcurve proofs.
General closed splines, chart gluing, singular poles/apices, general curved
shells, whole-model tessellation and analytic STEP mapping remain unfinished.
The original independent OCCT cylinder in the adjacent research bundle remains
unchanged and off-carrier in exact decimal arithmetic; this increment does not
import or heal it. No runtime fuzz/ASan/lexicase campaign, full workspace or
pre-push verification, industrial importer corpus or release completion is
claimed. The historical archive-admission timing gate remains open.

## Costs and reproduction

`kernel-costs.json` compares all **64 default-feature** BREP rows in three
alternating CPU-0 pairs. Both binaries omit the same two optional tessellation
rows. `arc-costs.json` compares all **12** unchanged Hypercurve arc cases,
including the default 256-arc workloads. That harness has eleven result tails
(counts/checksums, plus the printed warm result) and one timing-only row; its
receipts are not a complete geometry-output oracle. No rows, iterations or
hard cases are reduced. `baseline-*-artifacts.jsonl` records the original
feature sets; frozen executable digests are checked before candidate builds.

`closed-costs.json` records five new allocation-instrumented cases over three
fresh CPU-0 processes: construction, archive replay, circle split, seam split,
and reversed/shifted replay. Exact measurements/classifications, output counts,
serialization and complete archive equality are inside timing. Expected output
preparation, a replay check and input preparation are outside timing. Inputs
and their warmed caches are reused within a process. Each case publishes its
archive length and fingerprint; all three processes preserve these facts and
allocation requests. These are absolute costs of a previously unsupported
capability, not a speedup comparison against failed construction.

The adjacent C launcher uses child `wait4` for process peak RSS, avoiding
inherited launcher peaks. Allocation figures count Rust allocation/reallocation
requests, not foreign allocations, retained heap or stack. Builds and tests do
not run concurrently with measurements. Binary sizes are whole executables,
not isolated function sizes. Detailed measurements and limitations are in
[BREP performance](../../../PERFORMANCE.md) and
[Hypercurve performance](../../../../hypercurve/PERFORMANCE.md).

From the repository root, using the toolchain/environment in `environment.json`:

```sh
python3 crates/hyperbrep/docs/evidence/2026-10-15-closed-edges/controls.py
python3 crates/hyperbrep/docs/evidence/2026-10-15-closed-edges/qualify.py
python3 crates/hyperbrep/docs/evidence/2026-10-15-closed-edges/benchmark.py
python3 crates/hyperbrep/docs/evidence/2026-10-15-closed-edges/collect.py
python3 crates/hyperbrep/docs/evidence/2026-10-15-closed-edges/verify.py
```

Benchmark reproduction requires the two default-feature baseline executables
built at `f653f1ed2` and frozen at the paths in `baseline-kernel.json` and
`baseline-arc.json`. Optional Wasmtime is pinned by the existing
[`fetch_oracles.py`](../2026-10-15-step-faceted/fetch_oracles.py) evidence.
The standalone probe is copied to `/tmp` for building. Cargo commands are
locked and offline after dependencies are cached. The baseline arc build
fetched missing locked dev dependencies; production dependency versions and
the repository lockfile are unchanged. `collect.py` binds sources and artifacts;
`verify.py` checks their hashes, exits, controls, complete receipts and open
ledger gates without rebuilding.
