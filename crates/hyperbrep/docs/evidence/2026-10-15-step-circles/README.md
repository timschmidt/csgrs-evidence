# Exact direct circular STEP mapping

This increment starts from `6ca4b653115821c5000e52032621ae30892d6e5e`, after
upstream `7cf9d82acee6f152047eb37e5ff2e6dcece51a0d` was integrated into `brep`.
The [admission record](admission.md) applies the updated P1–P39 contract and
records the input domain, owning layers, reproduced failures and rejected ideas.
All 28 development-plan work-package gates remain open.

## Behavior and ownership

`hyperbrep-io::step::advanced` maps direct `CIRCLE` and `LINE` spatial edges on
planes/cylinders into the existing native carriers. HyperBRep's ordinary builder
retains topology authority; Hyperreal owns scalar identities and Hyperlimit
owns strict decisions. No alternate kernel, tolerance, float conversion,
implicit repair, source uncertainty allowance or geometry fitting is added.

Source vertex/edge/use identity, circle frame, phase, edge sense and exact
angle-unit conversion survive mapping. A full circular edge has one vertex,
two parameter endpoints and distinct incident uses. Cylinder UV seam lifts are
continuous and remain separate on the two sides. Source parameters use the
normalized directed edge fraction; their numeric period follows the declared
angle scale. Native parameters remain radians/metres. The
[public mapping contract](../../../../hyperbrep-io/docs/STEP_MAPPING.md#direct-circular-edges-and-cylindrical-faces)
and [example](../../../../hyperbrep-io/examples/circular_step.rs) describe use.

The new strict workflow is:

```text
selected exact STEP cylinder
→ native validation, exact area/volume/membership and source maps
→ circular-edge split → archive replay → seam split → reflection → replay
→ disconnected Boolean union → subtraction to empty → resumed composition
```

Native archives retain the exact model. The faceted STEP writer rejects curved
carriers explicitly; there is no curved STEP export/round-trip claim.
Curved `SURFACE_CURVE`/`SEAM_CURVE`, other analytic families, spline exchange,
general trimmed-cylinder shells and whole-document/assembly traversal remain
unsupported or outside the native validation domain. Every selected body must
finish admission before the importer returns success.

## Independent acceptance and reproduction

The original hand-authored `exact-cylinder.step` has radius 5 m, height 7 m and
seam coordinates (3,4). Its expected volume is `175*pi` and total area `120*pi`.
Native tests separately assert manifold incidence/use counts, carrier families,
exact point membership (including radius offsets of `1/10^12`), deterministic
archives, directed source parameters and downstream composition.

Eight shared native/WASM groups additionally exercise partial arcs, reversed
edges/bounds, independently rotated and reversed frames, oblique/radical axes, all seam
quadrants and coordinate axes, reordered loops/faces, independent length/angle scales, a deliberately
nonstandard unit named `degree`, multiple body ownership, complete source
accounting, limit rejection, invalid input, unsupported representations and
recovery after failed admission. They preserve the original OCCT cylinder as
an exact off-carrier rejection; it is never edited to make import succeed.

`occt_read.py` independently reads the new hand-authored source using pinned
optional OCP 7.9.3.1. [Its result](occt-read.json) reports one valid solid,
3 faces, 3 edges and 2 vertices, with the expected floating-point volume/area.
This is interoperability evidence, separate from exact native proof and full
EXPRESS/AP conformance. Five complete frame variants also pass the independent
reader ([results](axis-occt-read.json)); their native acceptance derives exact
measure and point-location assertions from the dimensional recipes, including
height `7*sqrt(2)`. OCP remains outside the production dependency graph.

The promoted scalar regressions cover quarter-turn shifts of signed rational
and pure-quadratic atan arguments and reconstructed periodic interpolation whose rational
coefficient remains expressed using pi and inverse pi. The original runtime
failures are retained; neither a new Unknown nor an approximate policy passes
their assertions. Controls reject nearby offsets, nonrational coefficients,
unrelated atan arguments and non-quarter turns without warming approximation
caches. Small failed recognition budgets do not poison later successful proof.

The scalar witness is the identity
`(cos(atan(x)), sin(atan(x))) = (1, x)/sqrt(1+x*x)`, followed by an exact
integer quarter-turn rotation and the retained sign of the atan term. A
reconstructed angle is admitted only when the shared Laurent reducer proves
that same linear form; no approximate angle comparison selects a quadrant.
The proof uses existing scalar carriers, leaf rational fast paths and bounded
normal-form machinery. It does not change the leaf-only meaning of
`Computable::exact_rational` or add a persistent normalization cache.

`check.py` captures source hashes, exact commands, features, timeout and every
attempt in [attempts.json](attempts.json). `qualify.py` executes affected native,
scalar, predicate, curve, solver, downstream, lint, documentation, example,
fuzz-target compilation and actual WASM checks. Benchmark compilation uses the
recorded `benchmark-build` command. `benchmark.py --name NAME` then runs matched
preserved corpora and absolute new-domain costs, with compiler/test work stopped.
The WASM template is an explicit local-source consumer, not a shipped-package
or JavaScript binding qualification.

## Ideas and cost evidence

| Idea | Decision and evidence |
| --- | --- |
| Preserve native source circle frame and directed source map | Kept for exact source fidelity; native reversal supplies the negative traversal. |
| Anchor every native circle at its first vertex | Rejected: did not resolve split replay and added an unnecessary frame conversion. `focused-5.log` retains the failure. |
| Quarter-turn trigonometric certificates | Kept for exact closure: extend integer-pi identities by exchanging signed sine/cosine numerators for odd quarter turns. No new carrier or archive tag. |
| Laurent coefficient search inside general inverse-trig linear recognition | Rejected: `benchmark-v1` preserves receipts but increases frustum replay by 38.4% and retained arc-witness replay by 65.4%. Its source patch, new files and all completed trials remain. |
| One bounded Laurent projection after cheap trigonometric recognition fails | Kept for native split/archive replay: accepts only a rational constant/pi/one-atan linear form. General scalar sum recognition stays unchanged. Qualification and cost results are recorded below. |
| Full scalar microbenchmark catalogue for this trig change | Initial run interrupted during unrelated million-bit GCD baseline cases. The partial samples are retained and receive no candidate-comparison credit. Later probes name the selected affected groups explicitly. |

The unchanged advanced/faceted import, BREP and arc corpora include complete
output checks/receipts. New circular imports and edit/replay/composition have no
previous successful equivalent: report absolute costs, not a speedup over the
former unsupported result. Fresh-document and reused-document rows distinguish
syntax reuse; both use fresh native models and warm shared constants after an
untimed reference result. Each timed geometry iteration checks the expected
exact geometry, source mapping, topology and fully materialized archive bytes.
The edit workflow additionally decodes/revalidates archives and consumes the
models in Boolean operations. Requested allocator bytes are not peak retained
heap; child-process RSS and executable sizes are separate observations.

The initial broad-candidate cost experiment is rejected, not silently replaced
by favorable measurements. Final qualification and narrower-candidate cost
results must be read from their source-bound records, not inferred from earlier
green tests or this specification.

The [initial series](benchmark-v2/commands.json), the
[single predefined complete geometry repeat](benchmark-v2-repeat/commands.json),
and the [pooled six-pair record](pooled-geometry.json) retain every observation.
The table gives median/max case ratios, candidate divided by frozen baseline:

| Complete corpus | Cases | Initial 3 pairs | Repeat 3 pairs | Pooled 6 pairs |
| --- | ---: | --- | --- | --- |
| Default native BREP | 64 | 1.256921 / 1.340681 | 0.992343 / 1.036984 | 0.997557 / 1.053811 |
| Default arcs, including 256-arc cases | 12 | 0.997553 / 1.142480 | 1.011208 / 1.104945 | 0.998373 / 1.103316 |
| Closed analytic edges | 5 | 0.813755 / 0.945469 | 1.024207 / 1.062303 | 0.984569 / 1.046618 |

The initial native gate failure is not erased. Raw process CPU times shift
between roughly 33 and 26 seconds for both binaries, with the second candidate
crossing between those levels; no hardware or scheduling cause is inferred.
The repeat was declared before execution and was not followed by more sampling.
The pooled cached 256-arc query remains above the default 10% budget: 39.2 to
43.25 ns, ratio **1.103316**. The repeat's cold 256-arc row also exceeds that
budget on its own; its pooled ratio is 0.991284. All inputs, iteration counts
and optional-feature settings remain unchanged. The 64-row native harness
excludes the same two optional tessellation cases on both sides.

Retain the exact import/replay/composition extension as a **new feature baseline**,
with this explicit semantic reason for the timing exception. This is not an
optimization, an all-cohort timing pass or controlled-host performance admission.
The rejected broad fallback's frustum/retained-witness regressions no longer
appear at their former scale in the narrower implementation, but no general
speedup or statistical significance is claimed.

The unchanged six advanced and seven faceted import rows preserve complete
receipts, with median/max ratios 1.020417/1.045933 and 1.000277/1.003196.
Allocation-call counts stay unchanged; inline circular cache data increases
advanced requested bytes about 1–2%. The 134/124 selected scalar/numerical
Criterion probes have median/max ratios 0.997985/1.082050 and
1.001211/1.073026. Their 10-sample, 10 ms warmup, 30 ms requested measurement
settings make these focused probes, not a full scalar catalogue comparison.

New circular imports cost 0.982/0.875 ms for fresh/reused syntax; partial arcs
cost 2.693/2.643 ms, and edit/replay/Boolean continuation costs 10.176 ms.
The [IO performance record](../../../../hyperbrep-io/PERFORMANCE.md#direct-analytic-circles-and-cylinders--2026-10-15)
gives exact allocation totals and timing boundaries. Native/arc/closed-edge
executables grow by 5,424/18,016/5,408 bytes; the new circular benchmark is
25,805,992 bytes. New circular process peak RSS spans 12,116–12,432 KiB.
All executable hashes/sizes and individual child RSS records remain in the two
benchmark directories. None is an operation-wide heap bound.

## Local and downstream qualification

The [manifest](manifest.json) binds the final sources to commands, feature sets,
logs and cost records. Final native/scalar tests include the additional frame
and quadratic cases. Earlier long-running downstream checks exercise identical
library and benchmark code; their later test/example/document differences are
enumerated in the manifest rather than hidden by a new timestamp.

| Check | Passed | Failed | Existing ignored |
| --- | ---: | ---: | ---: |
| Hyperreal all features, release | 1,050 | 0 | 0 |
| Hyperreal minimal features, release | 937 | 0 | 0 |
| Hyperlimit all features / minimal features, release | 365 / 352 | 0 | 0 |
| BREP + IO all features, debug / release | 399 / 399 | 0 | 0 |
| BREP + IO minimal features, release | 391 | 0 | 0 |
| Hypercurve complete default release suite | 2,441 | 0 | 28 |
| Hypersolve release | 974 | 0 | 0 |
| Ten root curve acceptance targets | 141 | 2 | 0 |

Counts overlap across configurations and are not added as unique coverage.
The root failures are the same 16/32-segment strict-drill composition cases
recorded before this increment: `PredicateUndecided` at `strict_drilled_workflows.rs:89`.
They remain failures with unchanged policy and input resolution. The complete
curve suite retains all 28 pre-existing ignores; no new ignore or filter was
introduced to obtain its passing result.

Strict all-target Clippy passes for scalar, predicate, native/IO, curve and the
affected root curve configuration, including minimal-feature native checks.
Warning-denied docs, the circular import example, the predicate allocation
example, fuzz-target compilation, formatting and code/documentation diff checks
pass. The unrestricted staged check reports original whitespace in raw logs,
saved patch context and the byte-identical OCCT fixture; the
[classified diagnostics](preserved-data-whitespace.json) retain that exit-2
result without rewriting evidence bytes. Rust 1.99
initially rejected the allocation example's deprecated atomic API; the retained
relaxed compare/exchange loop preserves its saturation behavior without a newer
API requirement. The eight-iteration example run is a smoke check, not a matched
performance claim or MSRV qualification.

The actual [Wasmtime result](wasm-runtime-2.log) executes all eight shared groups
with zero host imports; the artifact is 17,044,479 bytes. This is native/WASM
local-source parity, not a published JavaScript API or packaging claim.

## Remaining gates

Importer counts and solver refinement/promotion allowances do not bound all
scalar work, coefficient size, native geometry work, retained heap, elapsed time
or cancellation. External containment protects these checks; it is not an
internal resource guarantee. Detailed end-to-end receipts/provenance, general
shell completeness, broader exporter corpora, curved export, package release,
MSRV and real public C/C++/Python/JavaScript consumers remain open. No new
coverage percentage, formal proof, ASan/fuzz/lexicase campaign, complete pre-push
matrix or whole-project completion is claimed. No push is performed.
