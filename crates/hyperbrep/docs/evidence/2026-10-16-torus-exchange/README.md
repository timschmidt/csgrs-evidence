# Exact ring-torus STEP continuation

This increment adds selected `TOROIDAL_SURFACE` exchange and repairs the native
composition and scalar facts needed to consume its results repeatedly. The
baseline is `fa541102c93c617cdef28faa0e5451fd0c0c8d25`; upstream `99b88f707`
was already integrated and remained current at the recorded fetch. The
[contract](contract.md), [proof review](review.md),
[capability migration](capability-migration.md) and
[final manifest](manifest.json) distinguish implementation from open gates.

Final native/IO suites pass 526 tests with all features and 518 with
minimal features. The source-path WASM runtime passes 90 probe groups; dependency
library suites preserve 3,508 passes and six ignored tests. The inherited
zero-factor debug failure remains. This exact feature extension carries adverse
costs: 15 existing timing rows exceed 10% (maximum ratio 1.807459), and 35 rows
increase allocation calls or requested bytes. The [performance record](../../../PERFORMANCE.md#exact-ring-torus-exchange-2026-10-17)
lists all adverse timing rows and the follow-up work.

## Delivered source domain

`Surface::toroidal_geometry()` exposes a borrowed native frame and radii.
`hyperbrep-io` reads and writes exact ring tori, selected circular
latitude/meridian trims and both angular coordinate maps. Native whole-image
admission remains authoritative. Unit changes, reversal, reflections, separate
source offsets/scales, periodic lifts and seam identities are exercised.
Positive horn/spindle radii remain unsupported; nonpositive radii are invalid.
Finite-decimal encoding failures remain explicit. General toroidal traces,
extra chart subdivision and cone exchange are not added here.

The R=10, r=5, z>=3 fixture initially failed before STEP export and again during
subdivision/archive replay. Retained planar affine contacts, exact rational
split normalization, positive circle-map certificates and periodic endpoint
lifting repair native continuation. Hyperreal owns the necessary shared
principal-angle normal form. Its regression includes the actual serialized
second-split phase pair, independent right triangles, signed quadratic
tangents, wrong quadrants and nearby unequal values. Four native split/reload
cycles preserve independent exact measures. No BREP-specific trigonometric
reducer or approximate terminal is retained.

## Reading the evidence

- [Qualification](qualification-summary.json) names commands, source snapshots,
  test counts and the actual WASM runtime. [All attempts](attempts.json) retains
  every failed prototype, diagnostic and lint result.
- [Dependency comparison](dependency-summary.json) retains all named outcomes
  in the Hyperreal, Hyperlimit, Hypersolve and Hypercurve library suites. The
  inherited zero-factor debug failure reproduces on baseline and candidate in
  both tested feature configurations. It remains a failure.
- [Growth observations](growth-summary.json) bind five complete native archives
  to their public subdivision/reload probe. Serialized node occurrences and
  coefficient bit lengths are distinct from live DAG sharing and retained heap.
  Area preservation follows from the independent initial total and 36 exact
  face-area equalities; four aggregate scalar comparisons remain undecided.
- [Frontier review](frontier-migration.json) records two former undecided sectors
  that now construct and replay. The [independent native probe](frontier-extension-summary.json)
  checks their original full-size geometry through further composition. Its
  torus volume equality needs exact division of both sides by positive pi; the
  direct unscaled comparison remains unresolved and its failed probes remain.
- [Benchmark summary](benchmark-summary.json) retains the full original BREP,
  curve and STEP workloads plus separate absolute costs for new torus workflows.
  [Dependency microcosts](dependency-costs-v1/summary.json) supplement those
  completed-workflow receipts; Criterion alone supplies no exact-completion or
  allocation receipt.
- [Archive representation review](approved-receipt-migrations.json) accounts
  for five changed benchmark receipts; 162 old receipts are unchanged. All 173
  captured archive pairs reproduce the timed checksums. 113 pairs are identical;
  the other 60 differ only in 238 exactly equal pcurve start-coordinate scalars.
  Every equality is direct and strict, and every non-scalar field agrees. The
  [binding check](receipt-artifact-binding.json) and [separate admission](receipt-review.json)
  retain the original failed no-migration gate and every old/new byte sequence.
- [Retention decision](retention-decision.json) records the reviewed costs and
  limitations. The [idea ledger](idea-ledger.json) includes rejected alternatives.
  The [source reconstruction](source-reconstruction.json) and [audit](audit.json)
  bind every preserved source variant and final artifact.

The seventeen original BREP benchmark executables were frozen before feature
edits. The supplementary scalar baseline was reconstructed after the blocker
was found by restoring only the scalar owner from the pinned baseline; it is
not a prospective measurement. All failed experiments and unfavorable samples
remain. [Analysis notes](analysis-notes.md) disclose recorder corrections.

The final scalar patch removes incidental formatting from an included source
fragment. [Canonical-format comparison](scalar-format-review.json) proves its
equivalence to the earlier qualified bytes. Preserved full debug/dependency
checks keep their original snapshots and explicit source admissions. Final
release/minimal consumers, focused scalar checks, lints, documentation,
boundaries and retained cost builds use the reduced patch. Dependency checks
also explicitly identify BREP test-module wiring they did not consume.

## Observed archive growth

The full native band keeps nine faces while subdivision adds one edge and vertex
per cycle. These are serialized occurrences, not live shared-node counts:

| Split/reload cycles | Archive bytes | Computable occurrences | Maximum Computable depth |
| ---: | ---: | ---: | ---: |
| 0 | 91,506 | 780 | 16 |
| 1 | 98,792 | 946 | 16 |
| 2 | 109,941 | 1,223 | 16 |
| 3 | 124,656 | 1,604 | 16 |
| 4 | 142,937 | 2,089 | 18 |

The observed serialized `RationalWire` numerator/denominator maxima remain
4/3 bits. These five states establish no arbitrary-depth or retained-heap bound.
Volume equality is checked directly in every cycle. Area follows from the
independent initial analytic total and all nine component equalities per later
cycle, with the unresolved aggregate predicate retained in the log.

## Reproduction and limits

`check.py` records tool environment, source maps, overlays, command arguments,
timeouts and exit codes. `qualify.py` runs the native/IO feature matrix, examples,
optional OCCT reads, fuzz compilation and source-path WASM probe. The
`analysis-recipes` directory retains diagnostic continuation, growth,
dependency-cost, comparison and final audit drivers. Historical `/tmp` paths
need local setup; this is not a portable package installation recipe.

Independent exact volume, area, classification and set-composition assertions
test semantics. Deterministic artifacts test a separate contract. OCCT is a
floating-point interoperability check; the WASM probe uses workspace path
dependencies and does not claim a shipped JavaScript binding.

Input-count limits and solver refinement/promotion budgets do not bound total
work, coefficient growth or heap bytes. External timeouts are containment,
not an internal cancellation contract. Allocation requests and process RSS are
observations. Earlier performance/resource exceptions, unrelated upstream
failures, package/MSRV/actual-binding delivery, instrumented coverage, formal
proof, runtime fuzz/ASan/lexicase and the full pre-push matrix remain open.
All 28 work packages remain open or in progress. No push is performed.

The [future cone note](future-cone-exchange.md) is research for a separate
increment; it establishes no implemented cone exchange capability.
The [angular-certificate cost experiment](future-angle-costs.md) identifies
shared proof paths to measure against this complete feature baseline. Its
hypotheses are not isolated causes or retained optimizations.
