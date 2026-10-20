# Exact prism admission without represented measurements

This increment starts from `85412a30fb5fa93454faaabddb2511990c627c6c` on `brep`.
It admits exact rational-profile prisms whose area integral is not represented,
through the region and path constructors, native validation/replay, supported
composition, and STEP import/export. Measurement queries retain
`UnsupportedMeasurement`. It is a finite capability extension; no general
integration or complete CAD kernel is claimed.

The [contract](contract.md) records ownership, the input domain and failures
reproduced before the corresponding fixes. [Proof ownership](proofs.md) separates
exact native evidence from the external numerical reader. The
[idea ledger](ideas.md) records retained and rejected approaches.

## API and ownership

- Hypercurve adds `CurvePath2::simple_loop_orientation()` and
  `CurveLoopOrientation2`. It reuses complete carrier-pair topology and existing
  winding decisions after proving a single unpinched chain of injective spans.
  Authored retracing must not disappear during this proof. Open paths fail;
  unsupported or unresolved simplicity/winding remains typed. Periodic carriers
  can require subdivision. Selected roots remain selected roots.
- HyperBRep makes the internal prism profile area optional. Wire, cap and shell
  admission consumes exact orientation, incidence, nesting and transverse
  translation evidence. All five relevant front doors are exercised:
  `extrude_curve_region`, `extrude_path`, `extrude_path_region`,
  `extrude_path_regions`, and `planar_face`. The optional certificate is not
  serialized, and cold replay reconstructs its proofs.
- HyperBRep also proves complete plane containment when every coefficient of
  a rational Bezier's Bernstein plane numerator is strictly zero, including
  every Bezier span of a NURBS. Nonzero higher-degree equations still return
  `UnsupportedIntersection`; endpoints alone do not establish containment.
- HyperBRep IO consumes the lower-layer loop orientation when an area is absent.
  Native whole-edge, face and shell validation still controls publication.

Existing represented integrals and their error paths remain. Only an absent
integral (`Ok(None)`) takes the new fallback. Predicate errors while attempting
an available integral are still propagated; fully deferred metrics and certified
integration remain WP12 work. No sampled orientation, fake positive volume,
trusted archive bit, endpoint materialization or adapter-owned geometry proof
is introduced. Exact prism classification, supported affine transforms, splitting,
cold archive replay, empty identities and repeated same-profile slab composition
remain available without a represented measure.

## Exact acceptance

The native quintic has controls `(0,0),(1,-1),(2,-1),(3,-1),(4,-1),(5,0)` and
weights `1,2,3,4,5,1`, closed through `(5,2),(0,2),(0,0)` and extruded to height 3.
The independent Bernstein midpoint is `(295/107,-105/107)`. The separately
authored STEP fixture has midpoint `(22/107,-412/107)`. Exact offsets of
`1/10^12` distinguish interior from exterior. Bezier/NURBS, reversed authoring,
nonunit knots, metre/mm units, holes, disconnected components and a determinant
−12 affine image are exercised. Measurements remain explicitly unavailable.

Seven shared native/IO groups cover whole-image incidence and off-plane controls,
all construction front doors, full inward/corrupted archives, replay, splitting,
empty accumulation, repeated cut/restoration, independent STEP import and
reimport, malformed direction/weights, and exact knot-budget exhaustion followed
by recovery. Three additional Hypercurve groups exercise orientation, retained
non-materializable endpoints, strict→approximate→strict receipts, and rejection
of open, pinched, crossing, retracing and overlapping paths.

The original cubic diagnostic already completed successfully and still does,
with its represented volume. All seven original retained-profile diagnostics
remain unchanged: two native completions and five typed unsupported outcomes.
Those five include four selected parabola cases and a nonlinear parallel cap;
this increment does not provide their missing spatial representation bridge.
The old four path controls retain two butt completions and two unsupported round
measurements. Neither failure set is counted as newly completed work.

## Final source qualification

[Commands and every attempt](attempts.json) bind logs to source snapshots.
[Qualification](qualification-driver.json) distinguishes successful final-source
checks from initial checks and the recorded storage recovery.
Copied helpers are not credited as executed checks; the attempt records and cost
trial records identify the commands actually run.

| Check | Final result |
| --- | --- |
| HyperBRep + IO release, all features | 625 passed, none failed or ignored |
| HyperBRep + IO release, no default features | 617 passed, none failed or ignored |
| New debug acceptance | 10 passed |
| Affected Hypercurve release suites | 96 + 4 winding + 62 successor tests passed |
| Affected all-target Clippy, all/minimal features | Passed with warnings denied |
| Rustdoc; nine STEP examples; formatting | Passed |
| Fuzz targets | Compiled; no campaign claim |
| Source-path native consumers | New 7, preceding 9 and 14 groups, original 8 full workflows and retained controls passed |
| Actual `wasm32-unknown-unknown` consumers | 7 + 9 + 14 + 138 = 168 groups, all with zero imports |
| Deterministic prior artifacts | 211 + 58 + 8 = 277 byte-identical |
| New deterministic artifacts | 12 agree across two fresh processes |
| Independent OCCT 7.9.3.1 reader | All 8 new STEP input/output cases valid with one solid |

[Consumer metadata](consumers.json), [new/prior artifact comparison](artifacts.json),
[211 older artifact comparison](artifact-comparison.json), and
[continuation admission](continuation-admission.json) retain the complete recipes.
The original 24 prism outcomes and 81 native continuation diagnostics are
preserved. The older OCCT prism exercise also passes its 20 retained rows.

[OCCT observations](quintic-occt.json) compare its adaptive Gauss–Kronrod volumes
with independently implemented 50/80-digit Decimal Romberg quadrature of the
fixture's rational Bernstein Green integral. Both numerical integrations agree
on about `69.174347420592885...` in authored millimetre units cubed. Metre inputs
scale volume by `10^9`. Quadrature convergence is numerical evidence, not a
certified integration bound or a native exact measurement. The bare independent
file uses representation #96; exported files use ordinary product roots.

[Retained failures](attempt-review.md) include the reproduced capability gaps,
consumer/test corrections, and three final-source checks interrupted by full
`/tmp` storage. Only this task's rebuildable compiler outputs were removed.
Those three commands passed on the same source with `CARGO_INCREMENTAL=0`;
other valid final-source checks were reused explicitly. The two preserved round
controls intentionally retain their earlier unsupported outcomes.

## Costs, reproducibility and open gates

[Cost observations](costs.md) retain all 192 original receipts and original
iterations across 22 corpora. Seven directly affected corpora use three
alternating paired processes; the other 15 use one pair as preservation probes.
The six preceding native and nine preceding spline groups have separate three-
pair comparisons. Seven new full groups have absolute costs from three fresh
processes, with no ratio against a former error. All unfavorable observations,
allocation requests and executable sizes remain in the [resource review](resource-review.md).
No task build or test overlaps these timed stages. The host is shared; single
pairs are not reliable latency estimates, and no general speedup is claimed.

[Package membership](package-members.json) checks include the new fixture and
regressions and exclude historical evidence. `cargo package --list` is not a
built package or an installed-consumer test. Native/WASM consumers here use
source paths. Registry delivery, MSRV, production binding delivery, the full
pre-push workflow matrix, formal verification, coverage, ASan/lexicase/fuzz
campaigns and operation-wide work/heap/cancellation bounds remain open.
Historical cost regressions remain attached to their original revisions.

[Source reconstruction](source-reconstruction.json) binds every checked epoch to
the baseline and retained source overlays. The [manifest](manifest.json) binds
raw evidence and documentation; the [audit](audit.json) checks those records.
All 28 work packages remain open or in progress. Upstream corrections fetched
at `540074a8c` are pending a separate merge and BRep requalification after this
increment is committed. Unrelated concurrent-thread work remains with its owner.

The [staged whitespace check](staged-whitespace.json) retains eleven raw Cargo log
EOF-blank-line observations. Source, tests, fixtures and documentation pass the
separate non-log check. Raw output is preserved; the full staged whitespace check
is not reported as passing.
