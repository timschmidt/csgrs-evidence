# Builder admission proof reuse: proposed contract

Baseline: `79e807edf3c267712f5fe3ddc3757b2a7b00fe89`, on `brep` after
merging upstream `99b88f707b04053de7f40a86d6d029e3c07460d9`. The latest
fetch at the start of this increment found no further upstream changes. The
preceding goal turn made progress: prism continuation and two upstream merges
were committed with their qualification records. All 28 work packages remain
open or in progress. No release, general BREP completion, or whole-stack
acceptance is claimed.

Owner: `hyperbrep::topology::ArenaModelBuilder`, specifically solid admission
and finalization. Relevant properties are P2–P6, P8–P11, P17–P20, P24, P27,
P35–P39. This is a performance-only proposal: preserve all exact answers,
supported compositions, typed failures, topology, provenance, deterministic
archive and STEP bytes. No representation migration is allowed in this trial.
The other crates are being developed upstream; this trial changes no runtime
code outside BREP.

Source review on the baseline reproduces discarded work: `solid` constructs
sphere, sphere-pair, revolution, cylinder, cone and torus certificates, and
conditionally sweep/loft certificates, but stores `None` in the builder's
retained-certificate vector. `finish` reconstructs these facts. The recent
Plane/Cylinder prism proof must still be constructed even when a cylinder
certificate already exists. The fraction of end-to-end time attributable to
this repeated work is not yet measured; the preceding adverse costs remain
open until new matched evidence establishes otherwise.

The proposed reuse domain consists only of positive strict admission proofs
owned by this builder and bound to its successfully admitted solid. A complete
certificate transferred from an already validated immutable model has different
semantics: its absent families remain absent, as before. An admission record is
partial: an absent family means retry the existing recognizer during finalization,
not a proof of impossibility. Retain the original family eligibility conditions.
Outer-shell facts cannot certify a solid with cavities: reuse sphere/cylinder
whole-solid facts directly, but reuse shell-only families only where the old
finalizer allows them. For a revolution without voids, the whole-solid recognizer
is the same oriented outer-shell proof; with voids it must still derive the
whole-solid certificate. Loft reuse must not override a newly found prism.

The key is the solid's index in this builder, together with its owned immutable
geometry and topology; there are no process-global or pointer keys. Lifetime
ends when the builder is consumed or dropped. There is at most one record per
successfully admitted solid, with no eviction, configurable disable switch,
precision-specific entry, or cross-thread shared mutation. This count does not
bound heap bytes: certificates retain exact expressions and profiles. Precision,
total work, retained heap and cancellation remain separate, existing open
resource contracts. Failed admission must publish neither a solid nor a proof.
All orientation, shell ownership, boundary image, nesting and orphan checks
remain in place. Existing model edits invalidate model certificates and replay
through a new builder; this change must not bypass that invalidation.

Mutation audit: public builder operations append records. The private
`wire_with_simplicity_certificate` can replace line pcurves only when every
participating edge use is unowned and the pcurve has exactly one use in the
builder. It therefore cannot change a pcurve reachable from an admitted solid.
The analytic recognizers restrict their claims to the solid's own shell/face
boundaries. One sweep helper does traverse global edge adjacency, but filters
every candidate through its explicit `shell_faces` set before consuming geometry.
Appending uses on other faces therefore cannot change its proof. Confirm this
scope in tests and review; do not treat an append-only API name as a substitute
for that invariant.

Missing focused acceptance coverage: admission proofs surviving subsequent
independent solids, cavities, failed operations and finalization; preservation
of secondary prism facts; mutation and replay invalidation; equality with a
fresh derivation where the positive reuse is deliberately removed in a test.
Tests must also use independently derived exact measures and point tables,
since two executions of one recognizer are not an independent semantic oracle.
Keep all existing malformed/inward-shell, two-semicircle annulus, imported
half-cylinder/bore recuts, split/replay, empty, near-coincident, loft and spline
regressions. Native and WASM consumers remain required. No new uncertainty or
exhaustion may replace an existing exact success.

Before production edits, build and freeze matched baseline executables with
the original features, 17 complete corpora and 167 cases from the preceding
prism campaign. Retain cold/fresh and reused-document states, original iteration
counts, independent semantic assertions and output materialization. Run three
alternating baseline/candidate pairs per corpus without simultaneous test/build
load. Compare exact receipts, deterministic sizes/checksums, allocations,
process resources and binary size; retain all failures and adverse rows.
These are local matched measurements, not a controlled-host or cross-library
speedup claim. Extend with meaningful correctness coverage before evaluating
the optimization. Record kept/rejected decisions and interactions with previous
conic reuse and prism-capability changes. Run affected debug/release/minimal
tests, Clippy, docs, examples, fuzz compilation and WASM after the final edit.

Inherited failures remain distinct: the two scalar zero-factor checks, root
format-only rustdoc's unresolved `curve` link, and the broader upstream
resource/storage/release gates are not repaired by this trial. The preceding
81-case frontier includes five undecided and two exhausted outcomes; it is not
81 successful workflows. The 15 preceding workflows and 24 prism diagnostics
(18 native, six unsupported) retain their individual outcomes and evidence.
