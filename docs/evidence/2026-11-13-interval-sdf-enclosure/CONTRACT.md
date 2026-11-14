# Hypersdf whole-cell source enclosure admission

Previous turn: progress, retained program composition in 62b8676bc and ledger
aede1a20b. All fifteen phases remain active. This step addresses phase 13's
explicit F-rep whole-cell classification adoption, not a new geometry kernel.

Owner: Hypersdf interpretation/compilation of retained field expressions;
Hypersolve owns program evaluation, regularity and Taylor remainder proofs;
Hyperinterval owns dyadic enclosures. P1/P6/P8-P10/P19/P20/P27/P35-P37.
Missing witness on target: native retained sine/cosine fields have no whole-cell
interval route. Add independent full-cell positive/negative and unresolved
examples, polynomial dependency reduction and output as next-operation input.

Add an opt-in enclosure-program feature. Compile constant, coordinate, linear,
arithmetic, sqrt, sine/cosine/tangent, complement, offset and translation nodes
without dropping source guards. Keep unsupported primitive, piecewise or affine
source forms explicit; do not change or narrow their existing APIs. An owning
Arc<Sdf> and generated source preserve the interpretation association; rebuilding
from the authoritative Sdf is replay, generated graph flags alone are not.

Use an iterative traversal and caller-owned graph budget; check aggregate
entries and charge stack work, emission, validation and publication. Retain
native scalar/payload/heap exclusions. No ambient budget, cache, rounded input,
unsupported-to-empty conversion or geometrical metric claim. Dyadic input cells
have explicit empty semantics; zero-containing ranges remain unresolved except
identically zero. Full-domain native checks and stronger Taylor regularity apply.
No source tree is cloned or recursively traversed by this adapter.

Proportional gates: reproduce missing API, independent exact expectations and
native old/new-source evaluation, root/domain/empty/resource/cancellation/retry,
consumer chaining and source replay, full owner tests, strict Clippy/docs/features,
WASM and owner cost/artifact checks. Full default downstream requalification only
if the optional feature changes its active graph. No pre-push claim or push.
Preserve original 41-path main extraction and eight Interface edits.
