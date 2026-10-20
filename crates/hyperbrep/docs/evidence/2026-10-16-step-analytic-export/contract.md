# Exact selected analytic STEP export

The preceding goal turn made progress in commit `0ab4bb9af`: supplied analytic
pcurves, exact source maps and a reproduced scalar dependency repair. This
increment starts with a clean `brep` worktree. A fresh upstream fetch still
resolves to `362e157c1`; surrounding-crate implementation remains concurrent
upstream work.

Owners: native HyperBRep for immutable analytic-geometry inspection;
`hyperbrep-io::step::write` for STEP entities, exact representability, encoding
maps and output limits. Properties P1-P3, P6, P8-P9, P15-P20, P25-P30 and P35-P39
apply. The missing workflow is native construction/import, edit/transform,
analytic STEP export, independent reading, exact reimport and continued native
composition. The current faceted writer explicitly rejects circular edges.

Add exact selected advanced BREP output for PLANE/CYLINDRICAL_SURFACE supports
and LINE/CIRCLE edges. Preserve explicit native vertex and edge identities,
oriented uses, outer/inner bounds, face sense and each selected solid occurrence.
Use ordinary EDGE_CURVE/ORIENTED_EDGE/EDGE_LOOP/ADVANCED_FACE records and native
validated topology. Do not tessellate, heal, weld, round or omit unsupported
geometry. Other surfaces/curves, cavity shells and unavailable exact decimal
encodings remain typed failures with source sites. Failure publishes no partial
artifact. Keep the existing faceted encoding and its deterministic receipts.

Expose borrowed native circular/cylindrical geometry views; IO must not inspect
archives or fit geometry to recover exact carrier data. Rename the shared input
selection from `FacetedBody` to `StepBody` and update direct callers, without an
alias. `write_advanced` returns an advanced artifact with explicit source-to-output
vertex, edge, face, wire and directed-use maps, including exact emitted curve
parameter intervals. Existing `write_faceted` remains a distinct supported
encoding, not a compatibility wrapper. Share metadata, decimal encoding and
resource accounting. Native curve/UV parameterizations and unused geometry are
not an interchange archive; state the new charts and retained source mappings.

The [advanced-face schema](https://steptools.com/docs/stp_aim/html/t_advanced_face.html)
admits direct lines and conics as edge geometry; its pcurve requirement is
conditional on using a surface curve. The
[advanced BREP schema](https://www.steptools.com/stds/smrl/data/resources/aic_advanced_brep/aic_advanced_brep.htm)
requires the selected manifold solids' faces to be advanced faces. This permits
exact direct-circle output without serializing a finite-decimal approximation
to a periodic UV seam. It does not establish complete AP conformance or lossless
native chart/history persistence.

Acceptance must inspect the emitted graph independently of the importer,
including exact coordinates/radii, frame and curve sense, shared identities and
bound traversal. Exercise full/partial circles, subdivided native/imported
bodies, reflection, oblique/radical frames, units, repeated/multiple bodies,
native replay and subsequent Boolean/empty composition. Keep explicit
nonterminating/nonrational, unsupported-family, budget, cleanup/recovery and
ambient-approximate controls. Independent OCCT reading is a floating-point
interoperability oracle only. Execute the affected native/minimal and WASM
consumer paths; run strict lint/docs and preserved benchmarks after final edits.

Freeze baseline executables before implementation. Retain failed attempts,
source identities, adverse cost observations and all prior fixtures/policies.
New workflows receive separately named absolute costs. Existing output/resource
limits and solver scopes do not establish total scalar work, retained memory or
cancellation bounds. All work-package, release, binding, runtime fuzz/ASan,
coverage and formal gates retain their existing scope; no push is requested.

The first matched campaign preserves all 115 prior receipts, but identifies
avoidable header-buffer allocation changes in faceted export (for example,
box export grows from 736 to 738 requests and 21,780 to 26,121 requested bytes).
Before the retention edit, preserve that campaign and the new-domain costs.
Restore one static prefix write per selected encoding, keeping metadata,
bytes, exact results and limit semantics. Requalify and compare the full frozen
corpus again; this is a measured IO allocation repair, not a scalar/kernel change.
