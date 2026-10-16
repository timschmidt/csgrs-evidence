# Supplied analytic STEP pcurves

This increment extends the exact selected advanced-STEP mapper on BREP
`a9ee2a2863539a1ec330056e108da04090a1e488`, over upstream
`362e157c1dfb39701749ed2c154b0edff717fec0`. Two upstream fetches during this work
found no newer revision. Implementation is in `hyperbrep-io`, with a narrowly
reproduced scalar dependency exception. The unrelated scalar prototype remains
parked in stash `96c308f87af6f3491828ada3e9b8e92cec858cf1`.

The [contract](contract.md), [mapping/API specification](../../../../hyperbrep-io/docs/STEP_MAPPING.md#supplied-analytic-pcurves),
[machine-readable admission record](manifest.json) and [source snapshot](final-source.json)
define the scope. The evidence directory began on October 15; qualification and
the final record continued on October 16. All 28 work packages remain open.

## Admitted behavior and ownership

`SURFACE_CURVE` may associate spatial `LINE`/`CIRCLE` geometry with one or two
supported `PCURVE`s. Each alternate must agree in image and sense regardless of
the selected master. The result retains the master identity and exact directed
maps for the surface curve, spatial curve and every pcurve.

The new tuples are planar circular pcurves, constant-height cylindrical lines
for circles, and axial cylindrical lines for spatial lines. Planar-circle
placements use normalized two-dimensional frames. Cylinder U uses the actual
angle unit and V uses the length unit; neither a degree label nor a near-period
decimal becomes symbolic pi. The existing planar-line specialization retains
its oriented infinite-line proof and deterministic native artifact contract.

The IO mapper derives candidate parameters and delegates complete curved-image
proof to native `ModelBuilder::validate_edge_image`. Final face charts, shells
and models validate independently. Candidate pcurves can remain as unused
native geometry. Maps refer to the immutable imported revision; neither edits
nor native archive replay automatically preserve the external STEP accounting
object. There is no duplicate topology carrier or compatibility layer.

`SEAM_CURVE` now decodes and checks both associations and their common basis.
For the admitted cylinder boundary check, the two axial pcurves must have U=0
and U=tau. Duplicate U=0 maps fail; the original decimal near tau fails exact
support validation even under an ambient approximate scope. This is rejection
coverage, not a successful exact finite-decimal seam import. Other seam
families, spline/trimmed pcurves, general shell completeness and curved STEP
export remain open.

The standalone [authored fixture](../../../../hyperbrep-io/tests/fixtures/supplied-cylinder.step)
and [runnable example](../../../../hyperbrep-io/examples/supplied_step.rs) exercise
the public importer. Tests cover all master selectors, each source map,
full/partial arcs, reversed edges/bounds, reordered faces/loops, omitted 2D
reference direction, independent unit prefixes and an authored decimal degree
factor. Independent exact source-coordinate checks supplement the native
whole-image certificate. Split, archive replay, reflection, disjoint Boolean
composition, subtraction to empty and resumed composition consume the result.
Invalid alternate radius, height, slope, sense and plane, malformed associations,
unsupported geometry, source accounting, budget failure and recovery remain
separate controls.

## Reproduced blocker and rejected attempts

The first baseline test had a temporary-borrow compile error; its source is
retained as [test-support-v1.rs](test-support-v1.rs). The corrected baseline
reproduces the absent capability: spatial circle entity 24 is unsupported
inside a supplied surface curve. The next implementation admits that geometry
but fails an independent partial-arc source-map equality at
`atan(4/3) + pi/4`. Its expected coordinates are exactly `(-1,7)/(5*sqrt(2))`.

Two importer parameter-normalization attempts leave that equality unresolved.
Their [first patch](candidate-v1.patch), [later patch](candidate-v3.patch) and
intermediate pcurve sources remain archived. The direct-circle parameter
expressions were restored; no fixture, predicate policy or successful old
geometry was weakened.

New direct scalar regressions reproduce the same failure. The sufficient owner
is Hyperreal's bounded retained inverse-trigonometric certificate. It now
recognizes odd integer `k*pi/4 +/- atan(x)` after the existing quarter-turn path,
and applies exact angle-addition identities with denominator
`sqrt(2*(1+x*x)) > 0`. Nonzero constant offsets, other atan coefficients and
unrecognized forms remain outside that certificate. The repair adds no cache,
refinement or floating-point approximation. It is limited to two scalar proof
files and their tests; surrounding-crate work otherwise remains upstream.

One private scalar test incorrectly expected a rational leaf for a composed
quadratic square. It now asks the bounded Laurent value certificate for the
same exact values 49/50 and 1/50, while preserving the sign and empty-refinement
cache checks. This corrects a representation assertion, not the expected
mathematics. The original [scalar candidate](scalar-candidate-v1.patch) and
failed logs remain. An initial broad run overlapped formatting and reports
`source_unchanged: false`; it is not credited. Subsequent qualification checks
bind unchanged source snapshots to each command.

Malformed old supplied encodings now reach their missing referenced definitions.
Their original bytes remain unchanged; tests require exact `MissingEntity(92)`
and `MissingEntity(91)` diagnostics in place of the old unsupported-family guard.
This diagnostic frontier change is explicit in the mapping specification.

## Qualification and cost evidence

The final [manifest](manifest.json) enumerates every command, source identity,
test count, failure and timing observation. [All attempts](attempts.json) include
the rejected and invalidated runs. [qualify.py](qualify.py) runs affected native
and downstream configurations; [check.py](check.py) checks source identity before
and after each externally contained command. These checks do not establish
internal total-work, retained-byte or cancellation bounds.

The final test commands all pass. Feature configurations overlap; these counts
must not be added as distinct cases.

| Configuration | Passed | Failed | Ignored |
| --- | ---: | ---: | ---: |
| Scalar all features, release | 1,072 | 0 | 0 |
| Scalar minimal, release | 958 | 0 | 0 |
| Predicates all features, release | 365 | 0 | 0 |
| Predicates minimal, release | 352 | 0 | 0 |
| BREP/IO all features, debug | 412 | 0 | 0 |
| BREP/IO all features, release | 412 | 0 | 0 |
| BREP/IO minimal, release | 404 | 0 | 0 |
| Curves, release | 2,441 | 0 | 28 |
| Solver, release | 974 | 0 | 0 |
| Ten selected root acceptance suites | 143 | 0 | 0 |

The 28 inherited curve ignores remain unexecuted and unchanged. Strict scoped
Clippy configurations, warning-denied rustdoc, the supplied/circular STEP and
predicate-allocation examples, BREP fuzz-target compilation, workspace formatting
and code whitespace checks pass. Fuzz compilation is not a runtime campaign.

[WASM execution](wasm-runtime-1.log) passes all 18 groups in a zero-import module:
the 13 preceding BREP/STEP groups plus five supplied-pcurve groups. The local
probe is not a published-package or JavaScript binding qualification.
[OCCT 7.9.3.1](occt-reader-1.log) independently accepts the authored fixture as one
valid solid with three faces, three edges and two vertices. Its floating-point
volume and area agree with 175*pi cubic metres and 120*pi square metres after
the reader's millimetre conversion. This checks interoperability, not exactness
or complete STEP conformance.

The [matched measurements](benchmark-v1/commands.json) use three alternating
baseline/candidate pairs on CPU 0, with the same features and no concurrent
compiler or test campaign. The [frozen baseline](baseline-binaries.json) was
copied and verified before edits. All 100 preserved geometry cases retain their
required receipts and fixture facts across 36 processes. Two selected scalar
Criterion probes add 258 cases and 12 processes; those are short probes, not a
full scalar catalogue. Raw samples, executable identities, feature lists,
toolchain/host metadata, allocation counters and process resources are retained.

| Corpus | Cases | Median candidate/baseline ratio | Largest ratio |
| --- | ---: | ---: | ---: |
| Advanced STEP | 6 | 1.017804 | 1.088301 |
| Faceted STEP | 7 | 1.003410 | 1.038994 |
| Native BREP | 64 | 0.999319 | 1.035266 |
| Arcs | 12 | 0.999745 | 1.041956 |
| Closed edges | 5 | 1.006168 | 1.014471 |
| Direct circular STEP | 6 | 0.999882 | 1.066265 |
| Scalar microprobe | 134 | 0.999396 | 1.086301 |
| Numerical microprobe | 124 | 0.999164 | 1.076740 |

Every observed ratio is below 1.10 in this comparison. This is descriptive
shared-host evidence for the named revision pair, not a general speedup or
discharge of earlier performance exceptions. All slower samples remain visible.
Four successful advanced-STEP cases use 108–228 fewer allocation calls and
6,048–12,768 fewer requested bytes per iteration. The alternate-sense rejection
uses six fewer calls but **944 more requested bytes**. Other measured allocation
rows are unchanged. Executables grow by 3,048–25,768 bytes. Process peak RSS
ranges across all trials are 8,968–42,316 KiB for the baseline and
9,204–42,972 KiB for the candidate; this combines different processes/workloads
and is not a retained-heap bound.

The [new-domain costs](new-pcurve-costs/summary.json) are three separate absolute
trials, with successful and invalid-input outcomes kept distinct. Each process
executes the five acceptance groups before timing. Timed successful imports
materialize native output, check volume and source-map ownership, and serialize
and hash the model. Fresh includes syntax parsing; reused keeps parsed syntax
and reconstructs the native result. Process/scalar caches are not globally reset.

| Workflow | Outcome | Median ms/iteration | Allocation calls | Requested bytes |
| --- | --- | ---: | ---: | ---: |
| Full circle, fresh | Certified | 1.275624 | 3,205 | 424,885 |
| Full circle, reused syntax | Certified | 1.200703 | 3,148 | 303,481 |
| Partial arcs, fresh | Certified | 3.251227 | 9,987 | 991,817 |
| Partial arcs, reused syntax | Certified | 2.704441 | 9,930 | 870,413 |
| Edit/replay/composition | Certified | 3.658999 | 14,159 | 1,939,419 |
| Reject non-master height | Invalid input | 0.209943 | 660 | 165,948 |

The first four and rejection rows run 100 iterations each; composition runs 20.
New-process peak RSS is 12,380–12,508 KiB. Allocation requests count calls and
requested sizes, including reallocations, rather than live or retained bytes.
These measurements establish a local feature baseline, not an optimization or
complete resource guarantee. All 28 final qualification/build/measurement
commands return zero and use the exact final source snapshot.

## Remaining limits

No general CAD release, full STEP conformance or whole work-package completion
is claimed. Source-point samples, a floating-point external reader and output
checksums each have narrower authority than exact full-image admission.
Detailed operation provenance/receipts, full resource contracts, clean published
packages/MSRV, real C/C++/Python/JavaScript consumers, runtime fuzz/ASan/lexicase,
coverage and executable formal proofs remain open. Earlier archive and cached-arc
timing exceptions retain their original scope. No full pre-push workflow matrix
was run and no push was performed. The [audit](audit.json) checks owned changes,
local documentation links, JSON and preserved raw-evidence whitespace separately.
