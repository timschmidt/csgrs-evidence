# Selected-fiber images and mixed affine coordinate replay

This increment extends WP05a/WP05b prerequisites in Hypersolve and Hypercurve,
consumed through BRep's existing scalar charts, planar spatial images, model
builder and version-10 archive. The original complete surface-section input
and its success assertion remain an explicit failing frontier.

## Implemented contract

`project_algebraic_fiber_rational_image_relation` reuses the selected coefficient
field's local norm and saturation to enumerate images of `N(alpha,y)/D(alpha,y)`.
It does not take a global norm through the base polynomial. Its public report
does not select a source root or certify a denominator: those are consumer
obligations. Hypercurve proves the denominator nonzero, refines outward source
enclosures and isolates/rechecks a unique local image in that same field.

`CurvePointAffineForm2::parameter` now extracts mixed affine coordinates from
admitted `PolynomialFiber` points over algebraic bases. The parameter retains
its original point/form recipe through affine transport and refinement. Existing
`CurveParameter2::affine_form_source` exposes that recipe. The existing BRep
`AffineForm` encoding replays it without a new archive tag or compatibility
adapter. Nested affine point lifts normalize during construction and replay;
the original byte-stability failure remains in the raw record.

The independent identities include `y^3=alpha`, `alpha^2=2`, `z=alpha+y`,
which implies `z^6-6*z^4-18=0`, with positive selected roots. The tests also
retain both fiber conjugates, reducible base carriers, noninjective images,
exact `1/10^12` separation, saturated zero factors and true poles. A norm
enumerates candidates; source enclosures and checked singleton evidence select
the intended image. No approximate midpoint is a coordinate authority.

## Qualification

Six shared groups (three solver, two curve, one BRep) pass natively and in actual zero-import WebAssembly. They verify exact local coefficient identities, both axis conventions, saturation and poles, selected conjugates, mixed affine coordinates, strict/approximate/strict reuse, promotion refusal/recovery and complete BRep edge/scalar-chart/transform/archive replay. Three internal curve tests also pass, including near-pole refinement and retained-source lifetime without a reference cycle. Final all-feature release suites pass 988 solver and 732 BRep/IO tests. The curve suite records 2538 passed, 2 failed and 33 ignored tests across 65 batches. Both failures reproduce on clean 76238cec8: oblique-fillet certainty and the exterior parameter recursive-projective view. Their assertions remain unchanged. Affected all-feature/all-target Clippy and rustdoc deny warnings; BRep fuzz-target compilation and formatting pass. Five preserved assertion-bearing workflows pass on baseline and candidate, including 227 byte-identical BRep archives; the new recipe emits three checked transformed archives. The original mixed affine-form success assertion now passes. The complete original interior-loop surface-section success assertion still fails with UnsupportedIntersection; it is not credited as a completed section.

## Cost and representation

Nine CPU-pinned processes retain three alternating baseline/candidate pairs for five preserved workflows (three complete BRep modeling recipes, polynomial branches and the existing local/global polynomial-image APIs), plus three absolute processes for six new workflows. First and three repeated fresh-input calls retain all assertions, validation and output materialization. The ten matched median phase ratios range 0.984839 to 1.041885; 0 of 30 paired rows increase counted Rust allocation calls and 6 increase requested bytes. Each byte increase is 344 bytes per complete polynomial-branch invocation (about 0.0091% of baseline request traffic); the other preserved workflows have identical allocation calls and requested bytes. The legacy local/global projection recipe retains adverse first/repeated median latency ratios 1.041885/1.010552. Maximum measured process RSS is 23952 KiB. The matched native executable grows by 32336 bytes; all native/WASM artifact sizes and hashes are recorded. All unfavorable samples remain in cost-analysis.json and the raw record. The public Curve2/CurvePoint2/definition layouts remain identical to baseline; optional affine provenance adds one pointer to internal selected-fiber parameter data. Requested allocation traffic excludes foreign allocator internals and is not live heap. Shared-host timings and finite layouts establish neither a general speedup nor a total resource bound. New successful operations have no prior successful-work timing baseline.

## Boundaries

This is an exact selected-scalar and replay extension, not a completed general BRep section. The public solver enumerates local rational images; its caller must exclude poles and select the image of the retained source. The curve extension selects that image and exposes mixed affine forms of admitted PolynomialFiber points. General source-bound rational planar/spatial maps, branch derivatives and regularity, dual surface charts, filled arrangements, trim/material topology and whole-branch replay remain open. The underlying finite-fiber solver still rejects unsupported vertical/nullified components, generic repeated factors and whole boundary components. General rational-map persistence remains unsupported; the existing AffineForm archive covers the implemented affine source recipes. Existing degree caps, refinement/promotion counters and archive admission limits do not bound total arithmetic, coefficient growth, live heap, stack or cancellation latency. Runtime fuzz/ASan/lexicase, formal/coverage, MSRV, installed distributions, production bindings and the full pre-push matrix remain unqualified. All 28 work packages remain open/in-progress. The consumed eaa0cae54 push exception does not authorize publishing this increment.

## Evidence and reproduction

[manifest.json](manifest.json) hashes the bounded record. The
[contract](contract.md), [construction argument](construction-argument.md),
[attempt review](attempt-review.md), [inherited failures](inherited-failures.json)
and [next domains](next-domains.md) separate implementation from open work.
[Outcome records](outcomes.json) distinguish completed recipes, typed controls
and the original unsupported section.
[Raw evidence](raw-evidence.tar.gz) retains commands, logs, per-job source
patches, standalone consumers and dependency locks, full archive fixtures,
all raw cost samples and analysis scripts. Compiled binaries are represented
by hashes and sizes; none are included in the archive.

Reproduction uses separate baseline/candidate worktrees at `76238cec89c6a3a22308f2b9c3e18b5ad58561fd`
and that revision plus the qualified patch. The original commands used Rust
1.99.0, recorded source paths and offline dependencies. Adjust workspace and
tool-cache paths when reproducing elsewhere. Baseline job `source_scope` fields
identify the frozen main checkout; the generic runner's development patch/status
metadata does not describe those baseline jobs. The earlier four-recipe baseline
artifact run is historical; matched costs use the rebuilt five-recipe consumers.
`analyze.py` requires the full expected failure set, unchanged implementation
hashes, all acceptance successes, matching layouts and preserved archive bytes.
The native source-path and Wasmtime consumers do not qualify installed packages
or production bindings. No push was performed for this increment.
