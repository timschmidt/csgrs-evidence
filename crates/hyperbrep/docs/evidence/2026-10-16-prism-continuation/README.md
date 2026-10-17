# Exact prism continuation

Retained for the exact capability and correctness extension described below.
This record does not establish release or work-package completion.

The [contract and reproduced failures](contract.md) identify the BREP owners,
exact Cartesian-product domain, dependent operations and necessary scalar
blockers before their corresponding implementation changes. The implementation
baseline is `5495a63e07abee7c769969330975a4332d7c1cf4`; the source base for this
increment is merge `90a5c258eb2387d6a2f84fcf1e6ed420da1c4622`, including upstream
`3b69af324a9642d1f71b9cc38de58b59a236f740`.

## Implemented domain and ownership

- BREP region extrusion borrows Hypercurve's certified native line/arc view
  while retaining the original `CurveRegion2` as region authority. Authored
  paths and region extrusion share the persistent extrusion conversion.
- Prism validation derives cap area from retained native conic integrals when
  available. Signed analytic volume retains cap orientation through admission,
  including two-semicircle annuli whose chord fan has zero volume. It does not
  replace an inward-shell rejection with an absolute volume.
- A subtraction whose source axial interval is contained in the cutter's
  interval reuses the native planar difference and extrusion. Union still
  requires its existing equal-slab condition; partial overlaps are outside
  this shortcut. Validated right prisms and cylinders can continue in a proved
  common orthonormal frame. Skew prisms and nonparallel axes are excluded.
- BREP IO encodes exact line extrusions as `PLANE` and normal circular
  extrusions as `CYLINDRICAL_SURFACE`. The ordinary prism validator admits
  these imported sides only with exact rectangular trim images, matching
  axial bounds and parallel cap/translation proofs. All ordinary geometry,
  topology, orientation and nesting checks remain.
- Hyperreal owns the two necessary expression rules: principal rational
  reciprocal `atan`, and half angles of retained principal `atan` with a
  rational hypotenuse. Eligibility uses an exact perfect-square test within
  the existing size guard. Other fields and branches retain their fallback.
  The BREP failure and the rejected intermediate scalar trials are retained;
  this is the only production change outside BREP/IO.

## API and representation migration

`Surface::extrusion_profile_and_direction` is a borrowed inspection API.
`WrittenSurfaceParameters` now includes an affine `origin`, and
`WrittenAdvancedFace::orientation` reports the orientation actually emitted
relative to the output surface. Chart reversal can change that orientation
relative to the source face. Callers use these fields directly; no compatibility
adapter is provided.

Native line/circle preservation and the analytic cap metric intentionally
change some geometry and exact scalar expression representations. This is a
capability and correctness extension, not a performance-only patch. Existing
archives remain subject to the same untrusted replay checks and admission
limits. No schema version or tolerance is introduced. The complete benchmark
campaign retains both sides of every changed receipt for individual review;
independent set, topology and continuation checks remain separate from hashes.
The [prism artifact migration review](representation-migrations.json) retains
all ten original files and accounts for seven intentional changes. Their saved
selection tables are empty on both sides; this does not establish general
durable Boolean input lineage.

The [STEP mapping](../../../../hyperbrep-io/docs/STEP_MAPPING.md) describes chart
offsets, units and orientation. Exact finite-decimal output remains the boundary:
diagonal radical coordinates still return `NonRational`. Unsupported spline or
oblique circular extrusion surfaces remain typed failures.

## Acceptance evidence

The new native tests use independently derived volumes and areas, material
point tables with exact `1/10^12` offsets, opposite paired edge uses, both
reconstruction orders, recuts, canonical-empty recovery, subdivision,
reflection/scaling and untrusted archive replay. They retain the original
40-unit cutters, rational and radical rotations, holes and off-axis bores.
The exact upper-gap planar result remains material where the cutter ends
below the source. Malformed STEP images and orientation retain distinct errors;
an entirely inward annular shell is rejected.

The [24-case baseline](baseline-frontier.json) contains 18 unsupported outcomes
and six native results, with four successful STEP files retained verbatim.
The full original continuation inventory, fifteen preceding workflows, 22 old
STEP artifacts and all 159 preceding benchmark cases remain required. Native
diagnostic success and replay alone are not independent semantic admission.
Optional OCCT checks are a separate floating-point interoperability oracle.

[Every attempted command](attempts.json) records its source snapshot, external
timeout, exit status and raw log, including failed prototypes and the initial
incorrect malformed-input assertion. The corrected assertion names the
existing precise error category; production rejection behavior was not relaxed.
The check recorder also retains nested child attempts instead of overwriting
them with the enclosing process record.

## Evidence and delivery limits

Source is on physical ext4; the Cargo target/cache are on physical tmpfs. The
bounded [storage-identity probe](storage-identity.json) exercises distinct reads,
hard links, replacement and executable loading in that target. It does not
repair or qualify upstream's historical nested-FUSE artifacts. Preserved
executable bytes alone do not establish the dependency bytes used to build them.

The two inherited scalar zero-factor failures remain failed gates. Scalar
library tests and the 2,600 passing curve/predicate/solver library tests do not
establish full scalar/workspace admission. Six existing ignored consumer tests
remain unexecuted, as detailed in the
[consumer summary](scalar-consumer-summary.json).

Measurements retain complete successful operations, exact assertions, output
materialization and allocation requests. Newly completed workflows have
absolute costs; their former failures are not speedup baselines. Shared-host
samples do not establish controlled-host performance, an operation-wide work
bound, retained-heap bounds or cancellation. Prior timing exceptions remain
open.
The [follow-up cost investigation](performance-investigation.md) identifies
repeated BREP certificate construction as a proposed experiment; its share of
the observed costs has not been isolated.

All 28 work packages remain open or in progress. General curved-shell embedding,
nonparallel and partial-slab Boolean closure, cone/torus STEP exchange, mandatory
operation-wide provenance/certainty and complete resource accounting remain
unfinished. The WASM consumer uses local source paths. Package/MSRV, actual
C/Python/JavaScript bindings, runtime fuzz/ASan, lexicase, coverage, formal proof,
full workspace and pre-push gates are not established. No push is performed.

The [pending upstream review](upstream-pending-review.json) is separate from this
source-frozen candidate. Its corrections must be merged and checked at the next
clean checkpoint; this record does not claim that an unmerged revision was used.

## Final qualification and retention

BREP/IO debug and release each pass 512 all-feature tests; minimal release passes 504, with none failed or ignored. Both warning-denied all-target Clippy configurations, rustdoc, six examples, eleven preceding optional OCCT checks, fuzz-target compilation and 83 zero-import source-path WASM groups pass (71 preserved plus 12 new). The necessary scalar extension passes 45 targeted atan tests, 908 all-feature and 837 minimal library tests; its curve/predicate/solver consumers pass 2600 library tests with six pre-existing ignored tests unexecuted. Both inherited scalar zero-factor reproductions still fail with FACTORS > 0; they remain failed gates, not pre-push exemptions. All 15 preceding workflows complete. The full 81-slot diagnostic frontier records 74 native results, five undecided and two resource-exhaustion outcomes, preserving every previously native body count. Diagnostic success/replay does not by itself admit new semantics. The 24 prism cases have 18 native results and six typed unsupported controls; all 14 emitted STEP samples pass optional OCCT validity, topology and mass-property checks. Independent native assertions cover metrics, material points, topology, replay, split, transforms and continued operations. All 22 preceding STEP artifacts stay byte-identical; all ten original prism artifacts remain, with seven explicit representation migrations and three unchanged files.

The complete 96-process campaign measures 159 preserved cases in fifteen corpora and eight new completed workflows. 8 old case receipts and 1 fixture-fact records have individually reviewed migrations. Maximum preserved-case median latency ratio is 1.713776; 19 rows exceed 10%. 68 rows change allocation observations, including 60 increases in calls or requested bytes. All raw samples, adverse rows, output receipts, process resources and executable sizes remain. Native harness size changes range from 4336 to 67920 bytes; the WASM harness grows 492304 bytes and includes twelve new test groups. Shared-host observations do not establish a general speedup, controlled-host performance, isolated scalar primitive costs, shipped binary size or closure of earlier cost gates.

Retain the exact capability and correctness extension under the governing ladder: the original rational/radical prism cuts, bore continuation, two-semicircle annulus orientation, split/archive replay and supported STEP compositions now complete their independent exact assertions, while every preceding supported workload remains. This is not retained as an optimization. The 19 preserved-case median ratios above 1.10 (maximum 1.713776), 60 allocation increases and harness growth are adverse outcomes and remain open cost work. Eight old case receipts and one fixture-fact record change intentionally; four complete old/new archives prove equality of all 115 changed scalar values and identity of all non-scalar fields. Seven prism artifacts have separate documented carrier/chart migrations. Neither migration substitutes for semantic tests. Retain the bounded extension with these disclosed costs; merge upstream next, then investigate repeated BREP certificate construction against this complete feature baseline without weakening validation or moving unrelated work out of its owning thread. No broader work-package, release, resource-bound or pre-push gate is closed.

The [manifest](manifest.json), [receipt review](receipt-review.json), [source reconstruction](source-reconstruction.json), [lossless source overlays](source-overlays.tar.gz), [complete cost rows](benchmark-summary.json) and [final audit](audit.json) retain the source identities, raw evidence and limitations.
