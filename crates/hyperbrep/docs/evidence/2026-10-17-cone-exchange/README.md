# Exact conical STEP exchange

Native `ConicalRevolution` recognizes a line revolved around a unit axis,
retains its source and both branches, and provides exact chart correspondence.
HyperBRep IO maps the selected `SURFACE_OF_REVOLUTION`/`LINE` subset, retains
per-face source parameters and uses exact finite anchors when the apex cannot
be encoded as a finite decimal. Native coverage also admits a single periodic
side face and independently lifted rectangular cone partitions.

Baseline: `490ed3421a471ef010d647def63c083138e45633`. Production changes are
confined to HyperBRep and HyperBRep IO. Geometry/topology proofs remain native;
IO owns syntax, units, source accounting and exact decimal encoding.

Native/IO debug and release suites each pass 552 tests; minimal features pass 544. The four dependency libraries pass 3525 all-feature tests with six existing ignored cases and 3419 minimal tests with one existing ignore. Native/dependency Clippy, rustdoc, all STEP examples, optional OCCT reads, fuzz-target compilation and Cargo formatting pass. The corrected WASM consumer passes 111 groups with zero imports and a warning-denied build. Its only late change adds a source-map check; all native consumed crate/test inputs remain byte-identical. The two inherited zero-factor debug failures remain reproduced and unfixed.

All 175 preceding main benchmark cases retain their exact receipts across 18 preserved corpora. One new complete cone exchange workflow adds absolute cost, for 19 corpora and 111 processes. 1 existing timing rows exceed a 1.10 ratio; maximum 1.123806. 40 rows increase allocation calls or requested bytes. The dependency supplement preserves all 196 cases in 18 processes, with 2 ratios above 1.10 and maximum 1.223467.

The original full-size 5-to-2 height-6 cone, exact (3/5,4/5)-rotated 40-unit
cutter, halves, band/remainder and both reunion orders now complete exchange,
cold replay, recuts and empty recovery. Independent source formulas, exact
integrated measures, incidence and 1/10^12 classifications remain required.
The height-7 nonterminating apex, independent manual LINE files, supplied
pcurves, source reversals/units, similarities/reflections and failure recovery
have separate controls. The original cone rejection fixtures become stronger
positive tests; B-spline, invalid, unresolved, small-budget and irrational-vertex
controls remain. No tolerance, fitting or topology rounding is introduced.

All 81 preceding diagnostic outcomes and 61 STEP byte artifacts are preserved.
The separate public consumer also completes six exact line/circle subdivision
cases through exchange, native replay, measures, Booleans and empty recovery.
All ten example artifacts and six subdivision outputs pass an independent OCCT
reader. That reader is floating-point interoperability evidence only.

## Evidence and reproduction

- [Contract](contract.md), [proof/prototype review](review.md), [ideas](idea-ledger.json),
  [fixture origins](fixture-origin.json) and [all attempts](attempts.json).
- [Qualification](qualification-summary.json), [WASM correction](wasm-consumer-correction.json)
  and its [source-binding rule](final-review/source_binding.py). The original
  warning and consumer sources are retained; only WASM needed requalification.
- [Preserved diagnostics](continuation-frontier.json), [exact artifacts](preserved-artifacts.json),
  [continuation inputs](continuation-inputs.json) and [subdivision consumer](final-review/rational_split.rs).
- [Main costs](benchmark-summary.json), [dependency costs](dependency-costs-v1/summary.json)
  and [compiler feature graphs](feature-graph-admission.json) retain prospective
  baselines, all raw samples, allocations, process resources and binary sizes.
- [Source reconstruction](source-reconstruction.json), [manifest](manifest.json)
  and [audit](audit.json) bind failed prototypes and admitted inputs.

`analysis-recipes/qualify.py` executes the local/downstream matrix.
`final-review/finish_checks.py` runs the preserved diagnostics and public
subdivision consumer, then isolated main and dependency measurements. The
original WASM warning and its stronger consumer correction are documented
separately. No task compilation or tests overlap a timed campaign. Historical
temporary paths require local setup; they are not package installation recipes.

The measured consumer costs include newly retained face maps and extended
independent graph/formula evaluation. They are not pure-kernel timings or a
speedup claim. Shared-host timing ratios, allocation requests, process RSS and
harness sizes do not establish retained-heap bounds or shipped package size.
The WASM group inventory is larger than the baseline, with explicit migration
of original cone rejection checks; its total runtime is qualification evidence.

## Remaining scope

The finite conical LINE-revolution subset is admitted separately from general cone/revolution exchange and Boolean closure. Direct CONICAL_SURFACE, B-spline generators, arbitrary cone trims and apex-ending solids remain open. Irrational vertices can remain exact native geometry while unencodable by the writer. Parser/output cardinalities and solver counters do not bound total work, retained heap or cancellation. Source-path native/WASM tests and optional OCCT reads do not establish package/MSRV/actual C-Python-JS delivery, formal proof, coverage, runtime fuzz/ASan/lexicase, release or the full pre-push gate. All 28 work packages remain open or in progress; no push. Fetched upstream be2a0c37b is pending a separate integration and requalification; this evidence belongs to the pinned cone increment.

The [next-domain obligations](next-domains.md) keep further native geometry,
provenance, resource and delivery work separate. The [upstream observation](upstream-observation.json)
records the fetched changes without attributing this pinned evidence to them.
