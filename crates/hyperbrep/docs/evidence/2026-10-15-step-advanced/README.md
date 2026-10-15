# Exact planar advanced STEP import — 2026-10-15

Partial WP14a implementation on baseline `60e789d04`; all 28 plan gates remain
open. The selected-representation API now admits planar `ADVANCED_FACE` bodies
with explicit line edges, including spatial-only curves and `SURFACE_CURVE`
representations with one or two planar line pcurves. Existing faceted import
uses the same `import_representation` entry point; callers were migrated
directly with no compatibility wrapper. See the
[normative mapping](../../../../hyperbrep-io/docs/STEP_MAPPING.md) and
[primary-source research](../../ALGORITHM_RESEARCH.md#advanced-planar-step-and-distinct-parameterizations-2026-10-15).

Every explicit source vertex and edge retains its identity. Native topology is
never welded by coordinates or endpoints. Whole-line incidence and positive
velocity scaling prove agreement of all curve representations; source endpoint
parameters and the declared master remain queryable. A nonmaster discrepancy
is rejected, rather than hidden by the preferred representation. Bound reversal
changes both use order and direction. Winding and native validation identify
outer/inner bounds without requiring `FACE_OUTER_BOUND` or outer-first ordering.

Selected geometry is native and editable. Interchange provenance remains in the
import report; native archives preserve native geometry and certificates, not
the original STEP document/report. Imported bodies are published only after
the complete selected representation succeeds. Unselected records remain raw
and accounted for. Curved analytic/spline mapping, closed-circle edges, periodic
trims, void exchange, assemblies, full AP conformance and explicit healing are
unfinished. Counts limit named parser/import resources, not all scalar work,
heap or elapsed time. Unknown exact predicates never become approximate authority.

## Checks and independent evidence

- `commands.json` records ten successful commands: **373** combined debug
  results (324 core, 49 IO), all **49 IO** results in release, the end-to-end
  example, optional OCCT reader, strict IO all-target/all-feature Clippy,
  warning-denied rustdoc, WASM build/execution, workspace formatting and diff
  checks. Debug/release results overlap; these are not 422 distinct tests.
- Seven new integration tests cover independent original boxes and a holed
  solid; all source/use/parameter maps; hole-first bounds; edits and replay;
  positive affine reparameterizations under all three master choices; reversed
  edge sense; mismatched alternate images/sense; explicit identity substitutions;
  multiple bodies; resource limits and no partial publication; exact coordinates
  above `2^53`; nonunit direction ratios; parametric context variants; and an
  off-line point under an ambient approximate policy. Invalid contexts,
  association cardinalities and definitional representations are diagnosed.
- `wasm-runtime.json` records six executed Wasmtime 38.0.0 groups with zero
  host imports: original imports/native replay, split/reflection,
  reparameterization, alternate-curve rejection, strict gap rejection and a
  directed-use limit. This is runtime evidence, not production JS ABI coverage.
- The [fixture recipes](../../../../hyperbrep-io/tests/fixtures/README.md) use
  OCCT 7.9.3.1 to generate original simple geometry, without third-party CAD
  assets. Original exporter whitespace and numeric lexemes remain intact.
  `occt-read.json` verifies those three inputs and four native exports under
  `exports/`, including the split-and-reflected hole. Expected unique counts and
  volumes come from the recipes. The public `advanced_step` example reimports
  every export exactly before saving it. Faceted output retains this planar
  line geometry; it does not retain original source curve parameterizations.
  OCCT is a floating-point interoperability oracle, not an exactness proof.
- `controls/` records six deliberate faults rejected at runtime: omit line
  incidence, alternate sense, declared master, a source map, edge sense or bound
  order. Every source is restored and its digest checked. `verify.py` also
  rejects missing, duplicated and changed benchmark receipts.
- `initial/` preserves the first test's incorrect expected diagnostic entity
  (the reversed bound visits edge 56 first) and rustdoc's unescaped `[0,1]`
  link failure. Both were corrected; final checks pass. These were test/doc
  errors, not evidence of a previously accepted invalid solid.

No runtime fuzz/ASan/lexicase campaign, whole-workspace/pre-push validation,
general industrial importer corpus or work-package completion is claimed.
The historical archive-admission timing gate remains open.

## Costs and reproduction

`advanced-costs.json` reports six new absolute-cost cases over three CPU-0
processes. `import-costs.json` reports seven existing faceted cases over three
alternating baseline/candidate pairs. All receipts and full geometry outputs
are preserved. Existing allocation request counts agree; larger provenance
records increase requested bytes for geometry rows. See
[PERFORMANCE.md](../../../../hyperbrep-io/PERFORMANCE.md) for exact scope,
measurements and the distinction between new capability costs and speedups.
RSS uses child `wait4` through the adjacent `measure.c`, avoiding inherited
Python-launcher peaks. No benchmark runs concurrently with qualification builds.

`baseline-executable.json` and `baseline-artifacts.jsonl` bind the faceted
binary frozen at `60e789d04` before candidate compilation. The faceted harness
diff is exactly one public method rename. `executables.json` binds the candidate
binaries. Seven underlying kernel source trees and manifests remain unchanged;
production dependency versions, sources and checksums are identical. Only the
IO lock entry adds the already-locked Hyperlimit dependency.

From the repository root, using `environment.json`:

```sh
python3 crates/hyperbrep/docs/evidence/2026-10-15-step-advanced/controls.py
python3 crates/hyperbrep/docs/evidence/2026-10-15-step-advanced/qualify.py
python3 crates/hyperbrep/docs/evidence/2026-10-15-step-advanced/benchmark.py
python3 crates/hyperbrep/docs/evidence/2026-10-15-step-advanced/collect.py
python3 crates/hyperbrep/docs/evidence/2026-10-15-step-advanced/verify.py
```

The optional oracle wheels are pinned by the adjacent
[`fetch_oracles.py`](../2026-10-15-step-faceted/fetch_oracles.py) and its evidence.
The qualification script copies its standalone WASM probe into `/tmp`. Native
Cargo commands are offline and locked. Benchmark reproduction first needs the
faceted executable built at `60e789d04` and copied to
`/tmp/hyperbrep-before-advanced`; the script checks its recorded digest before
building the candidate. `collect.py` binds source and artifact hashes;
`verify.py` checks them, command exits, runtime/oracle results, restored faults,
every cost receipt and the still-open ledger gates without rebuilding.
