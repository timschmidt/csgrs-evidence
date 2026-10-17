# Native ring-torus STEP continuation

Baseline: `fa541102c93c617cdef28faa0e5451fd0c0c8d25` on `brep`, after
the committed builder-proof optimization. The preceding goal turn made progress;
all 28 work packages remain open/in progress. Upstream `99b88f707` was freshly
fetched at that checkpoint and is already integrated.

Owners: borrowed analytic carrier inspection in `hyperbrep::geometry`; exact
support/parameter/unit mapping in `hyperbrep-io::step::{advanced,write::advanced}`.
The adapter must use native circle incidence and whole-edge image validation,
not introduce another geometric acceptance kernel. Properties P1–P6, P8–P11,
P17–P20, P24, P26–P27, P30, P35–P39; work packages WP03, WP14a/b, WP21, WP23.
No runtime dependency repair is planned outside BREP/IO.

Source review on this revision shows an explicit Torus support rejection in
both advanced reader and writer. The baseline regression must reproduce that
failure before production edits. Cone semi-angle encoding is a distinct exact
representation issue and is not silently rounded to add apparent coverage.

Target domain: validated ring-torus solids and supported planar cuts, represented
by exact circular latitude/meridian edges and finite periodic UV loops, with
`major_radius > minor_radius > 0`. STEP coordinates, radii and projective frame
directions must satisfy the existing exact number/units contract. Imported
supplied pcurves must validate their whole spatial image; both angular coordinates
and opposite seam bounds remain explicit. Unsupported other torus-circle
families and horn/spindle surfaces must diagnose, never be guessed or fitted.

Native construction, exact measures and point classification, export, independent
graph interpretation, reimport, split, archive replay, transforms/reflections,
Booleans and canonical empty continuation form the acceptance path. Exercise
whole tori, longitudinal halves/sectors, axial bands, oblique frames, unit changes,
reversed traversal, both periodic directions and `1/10^12` offsets. Preserve full
existing fixtures and their independently derived set expectations. Validate
numeric certainty, topology and source fidelity separately. Optional OCCT is a
floating-point interoperability oracle, not exact source evidence.

New successful Torus exchange deliberately replaces existing unsupported-result
controls only with complete success assertions and an explicit capability
migration. Preserve Plane/Cylinder STEP bytes and every old exact receipt outside
that declared new domain. Keep malformed geometry, missing angle units, inconsistent
pcurves, unsupported encodings, numeric errors and budget exhaustion distinct.
Input size/work counters and existing precision limits are not total-work or
retained-heap bounds; use external containment, report those open limits, and
test failure followed by recovery without publishing partial models.

Freeze matched baseline executables before production edits. Retain original
17 corpora, iteration counts, policies, materialization and assertions; measure
new completed exchange workflows separately from previously failing inputs.
Keep all raw/adverse observations and source snapshots. Final qualification
includes affected native debug/release/minimal tests, warning-denied Clippy/docs,
native STEP examples and optional independent reader, fuzz-target compilation,
and actual WASM source runtime. Package/MSRV/host-binding/coverage/formal/fuzz
campaign and full pre-push gates remain separate. No push is requested.

The Part 42 torus definition uses two angular parameters with radii and an
orthonormal placement. Its positive-radius entity permits a broader domain
than the native ring torus; native admission remains authoritative.
[Primary specification](https://www.steptools.com/stds/smrl/data/resource_docs/geometric_and_topological_representation/sys/4_schema.htm#toroidal_surface).
No reference implementation is copied.

## Native continuation blocker found before exchange

`torus-2.log` retains the full R=10, r=5, z>=3 Boolean failure before
export: `FaceInteriorWitnessUnavailable { face: FaceId(0), reason: Some(RealSign) }`.
`band-probe-1.log` reproduces it through graph selection. A face boundary mixes
`pi/2-acos(3/5)` and `atan(3/4)` for one latitude. Native clipping retains both
the canonical spatial preimage and its certified UV contact; affine edge
subdivision currently discards the latter, while circular subdivision consumes it.
The owner is `hyperbrep::topology::edit::edge`, P2/P15/P18/P19. Preserve the
retained contact's affine preimage for all incident uses of the same canonical
edge, with the original edge parameter/domain and seam ownership unchanged.
Do not add an inverse-trigonometric identity or a tolerance in a consumer.
The native regression and full IO fixture must both complete under strict policy.
Upstream was fetched again before this repair: `99b88f707` remains current and
is already an ancestor of `brep`; no surrounding-crate change is needed.

`native-band-1.log` then completes construction but cannot certify the test's
cross-family scalar identity `asin(3/5) = atan(3/4)`. The volume oracle is
re-expressed directly from its independent disk-segment antiderivative using
`asin(3/5)`; its exact numerical value, full input and strict equality assertion
are unchanged. The area oracle keeps `atan(3/4)`, from the independent angular
surface integral. This is not a scalar-identity repair or an approximate check;
the original unresolved comparison remains retained evidence.

`band-chart-1.log` diagnoses an imported loop spanning U=[-pi/2,0] while its
neighbors use the native [0,tau] chart. STEP loop reconstruction now preserves
the continuous lift and translates a whole torus loop by an exact period when
needed. It never merges 0 and tau; a loop requiring additional periodic
subdivision is explicitly unsupported. Temporary lossy coordinates were
diagnostic logging only and were removed before qualification.

`band-replay-1.log` locates the next failure after splitting the reimported
edge, during native archive replay. `band-replay-stage-1.log` identifies face
image admission; `band-replay-phase-1.log` proves equal frames, directions and
phase under strict policy even though separately expanded trig coordinates are
undecided. The lowest owner is BREP's shared circle-parameterization comparator
(P2/P10/P18/P19). Add that sufficient positive certificate before the retained
rotated-frame proofs; absence of this proof must not become a negative answer.
All temporary replay instrumentation is removed. No archive proof flag is
trusted and no replay validation is skipped.

The full band then reaches repeated Boolean graph construction (`torus-5.log`,
`band-flow-1.log`) and fails again. `baseline-conic-endpoint-1.log` minimizes
the problem to a native circle/plane contact at the atan-authored start of the
arc, independently of STEP. The owner is native geometry's periodic parameter
lifting (P2/P15/P18/P19). If scalar phase ordering is undecided, equality of
both sine and cosine with an authored endpoint is a sufficient exact modulo-tau
certificate. Reuse the native lift enumerator so full-circle seam ends remain
distinct. Keep the original error if that positive proof is unavailable.
The regression also covers ellipses, reversed traversal, a 100-turn chart shift,
tangent contacts and distinct 1/10^12 near-endpoint planes.

`expanded-exchange-2.log` retains two test-oracle mistakes: missing angular
units are `Expected("plane-angle unit for angular mapping")`, not `Unsupported`;
and zero `WorkBudget` solver refinements/promotions need not reject analytic
imports that use neither. Assert that exact success separately from the
independent `ImportLimits` exhaustion failures. No production resource contract
is changed or generalized to a total-work/heap bound.

The first broad native run also exposes archive replay failures in the new
native rational band and the preserved sphere–torus partition regression.
Investigate native circle-image admission before retaining the affine contact
change. Both cases must replay under the original strict contract; an archive
flag, weaker predicate policy or accepting a new failure is not a repair.
The suspected boundary is angular-span equality between independently
represented inverse-trig expressions. Any additional periodic proof must certify
the whole affine map and distinguish spans differing by a full turn.

The primary Part 42 schema gives both torus radii as positive length measures;
it permits positive horn/spindle radii outside the native ring-torus domain.
The STEP owner must distinguish unsupported non-ring surfaces from invalid
nonpositive radii (P6/P26). Add format-domain tests before refining this new
importer's error mapping; the native constructor's contract remains unchanged.

`replay-spans-diagnostic.log` reproduces the band span's strict scalar failure
and separately certifies equal sine/cosine and a difference strictly between
-tau and tau. Those facts prove equality of the angular rates, not merely
agreement at sampled points. Add this sufficient native image certificate only
after ordinary equality is undecided, preserving the original failure when
the certificate is unavailable. A public image regression must also reject
extra turns and distinct 1/10^12 endpoints in both directions.
The same diagnostic shows larger affine expressions in the old sphere–torus
case that lack that certificate. Reject the generalized affine-contact change:
retain the preimage only for the planar-cut domain addressed here, preserving
the old canonical representation for other intersection families. Wider contact
retention requires its own replay/composition admission.

`native-replay-stage-1.log` proves initial native replay now succeeds, but a
subsequent midpoint subdivision fails at angular-span admission. The proposed
multiple-angle fallback alone is rejected by `native-replay-multiple-1.log`:
all tested multiples remain undecided. `native-replay-expressions-1.log` exposes
an unreduced affine fraction nested inside each interpolated UV coordinate.
`native-replay-fraction-1.log` certifies that fraction as exactly 1/2 using the
existing Hyperreal rational-normal-form API. Normalize a represented rational
pcurve split parameter at its native topology owner before subdivision; retain
nonrational and selected-root parameters unchanged. Do not add a scalar reducer
or recognize a test-specific expression in the adapter. Recheck the complete
old corpus and archive bytes before deciding whether that representation choice
can be retained.

After that normalization, `native-replay-normalized-1.log` certifies equal sine
and cosine for twice the split span. The shared native angular-value proof now
tries the nine fixed multipliers 1, 2, 4, ..., 256, always proving the *scaled*
difference lies strictly between -tau and tau. This finite sufficient-proof
cascade covers the regression's dyadic subdivisions without treating congruence
as equality or claiming a general identity solver. The same proof is used for
equal-frame phase admission, so repeated splits do not lose it at replay.
Extend the native band to four split/reload cycles and the independent public
image matrix to divisors 1, 2, 4, 16 and 256. No unavailable certificate becomes
false, no archive-supplied flag is trusted, and all temporary logging is removed.

The second split still fails (`native-repeated-stage-1.log`,
`native-repeated-phase-1.log`): its phase has a 3/4 coefficient, beyond the
attempted BREP trigonometric recognizers. Source review locates the actual shared
owner in Hyperreal's `pi_acos_linear_form`: an existing atan-to-asin certificate
recognizes only the particular tangent sqrt(35)/35. Generalize that existing
certificate to rational or pure quadratic tangents t for which
sqrt(t^2/(1+t^2)) is exactly rational, with principal-branch sign retained.
P1–P3/P6/P10/P18/P19 require exact sign, no guessed root and no new numeric carrier.
Reproduce rational right-triangle identities and the actual serialized second-
split phases in a scalar regression before editing production scalar code.
This is the necessary dependency exception authorized by the user: repeated
native BREP archive composition remains blocked without the shared proof.
Reevaluate and remove the BREP-specific attempted repairs when the shared
certificate suffices. Keep all failed prototypes and their source snapshots.

`scalar-angles-2.log` confirms the general tangent certificate handles 3/4 but
still misses its reciprocal 4/3 and the retained serialized phase. Complete the
same scalar normal form with the exact first-quadrant identity
acos(a)+acos(b)=pi/2 when a,b>=0 and a^2+b^2=1, and reuse its existing bounded
Laurent projection for reconstructed rational scales. Retain the existing
recognition budgets and inverse-domain checks. These are value certificates;
neither a new floating-point terminal nor a global expression rewrite is added.

## Retained candidate and dependency qualification

The nine-multiplier BREP recognizer above is a rejected intermediate experiment,
not the retained implementation. `shared-scalar-owner-1.log` evaluates removal
of all native repairs after the shared scalar change: distant endpoint lifts,
archive subdivision and independently expressed area still fail. The retained
native facts are the planar contact preimage, normalization of an exactly
rational affine split parameter, positive same-frame/phase circle-map admission,
and exact endpoint sine/cosine congruence for at-most-one-turn conics.
`shared-native-proofs-1.log` passes with those facts and the shared scalar proof.
`final-focused-1.log` additionally passes four native split/reload cycles through
the public torus workflow and the scalar quadratic-tangent/wrong-quadrant matrix.
These focused results do not substitute for final downstream qualification.

The dependency exception is limited to the existing scalar normal form in
`hyperreal/src/computable/node/algebra.rs` and its deterministic tests. Add a
separate reconstructed dependency baseline by restoring that production file
from `fa541102c93c617cdef28faa0e5451fd0c0c8d25` in `dependency.py`; always restore
the candidate in `finally`. This extra baseline is collected after discovery
of the blocker and must not be described as prospectively frozen. The original
seventeen BREP/STEP baseline executables were frozen before feature edits.
Compare Hyperreal, Hyperlimit, Hypersolve and Hypercurve library suites on both
versions, preserving and reporting any inherited failures. Sample the unchanged
scalar/predicate benchmark bodies in three alternating pairs, with raw Criterion
samples, feature/binary identities and process resources. They supplement the
completed BREP workflows' exact receipts and allocation measurements, not replace
them. No unrelated dependency repair, overall speedup, total-work/heap bound or
package-delivery claim follows from this experiment.

A fresh upstream fetch on 2026-10-17 03:49 UTC still resolves `origin/main` to
`99b88f707b04053de7f40a86d6d029e3c07460d9`, already an ancestor of `brep`.

Final warning checks (`native-clippy-2.log`, `native-minimal-clippy-1.log`)
reject duplicate test-support module inclusions. Consolidate the new consumers
through one torus helper tree and reuse its sector/seam modules. Preserve every
fixture and assertion; do not suppress `duplicate_mod`. This changes test-module
wiring only, with no further production or dependency source edit. Requalify the
affected BREP tests/benches/WASM consumers; dependency checks may retain their
prior source snapshot only with an explicit unchanged-consumed-input audit.

The user's 2026-10-17 clarification explicitly permits supporting changes in
other crates to implement HyperBRep features while preserving crate boundaries.
Unrelated breakage remains with the concurrent thread. The exact-angle normal
form above is necessary BREP feature work in its scalar owner; the independently
reproduced zero-factor debug failure is unrelated and is not repaired here.

After the complete native/WASM qualification, remove 33 incidental formatting
hunks from the included scalar fragment, retaining its four semantic hunks.
`scalar-format-review.json` binds the exact before/after hashes and verifies
byte-identical canonical rustfmt output. Preserve the full debug/dependency
results on their original bytes with this explicit nonsemantic admission; rerun
final release/minimal consumers, focused scalar tests, lints, docs, exchange,
fuzz compilation and WASM on the reduced patch. All retained cost binaries must
be rebuilt from those final bytes. No mathematical edit is exempted by this
formatting-only comparison.
## Reviewed canonical-expression migration

The original final benchmark gate rejects five changed archive checksums after
all 105 measured processes complete. Preserve that failed gate and the complete
old/new outputs. The separately reviewed exact feature migration covers the
longitudinal torus band, sector similarity matrix and all three oblique rows.
All 173 captured archive pairs reproduce every timed receipt. Of these, 113 are
byte-identical and 60 change only 238 affine pcurve start-coordinate scalars;
each changed value has direct strict equality and every non-scalar field agrees.
Both versions of each changed archive revalidate and serialize identically on
the candidate. Original independent geometry/composition assertions remain.

The [explicit decision](approved-receipt-migrations.json) changes the canonical
expression-byte contract for exactly that subset under the existing schema.
It is not a performance-only change or a waiver for another receipt. The other
162 benchmark receipts and all 54 separately retained STEP/prism artifacts stay
byte-identical. The retrospective probe's first dependency-lock failure and its
corrected measured-version inputs remain alongside the proof and raw timings.
