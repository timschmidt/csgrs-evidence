# Integrate concurrent upstream CSGRS corrections

The BREP analytic-export increment is committed as `5027ba731`. A checkpoint
fetch found `f1dab2248` (exact Hilbert trimming) and `72cd216cc` (typed gear/airfoil
failures). Preserve both histories with a merge, and preserve both parked
stashes. Do not rewrite the previous source-bound export evidence.

Owners: upstream CSGRS grammar owns the new sampled-constructor and infill API
corrections; Hypercurve remains the curve/trim authority. Local development
continues in HyperBRep/IO. P6, P8-P9, P15-P20, P25-P27 and P35-P39 apply.
No committed BREP, scalar, predicate, curve, solver, lattice, mesh, manifest or
lockfile changes appear in this upstream range. AGENTS.md, properties.md and
admission.md are unchanged. The upstream contracts reference separately pending
native work elsewhere; that is not admitted or imported by these two commits.

Before merging, pin both parents and every relevant crate tree. Preserve the
exact qualified BREP implementation and its historical artifact/benchmark claims.
Inspect merged ledger ownership; only update the HyperBRep current-work entry.
Run the BREP/IO debug/release/minimal and strict lint/docs checks, its examples,
fuzz-target compilation and real WASM consumer after the merge. Exercise the
new root Hilbert and gear/airfoil acceptance tests and their benchmark/example
callers with the original feature selections. No surrounding implementation
repair is authorized merely by this merge; a BREP blocker must be reproduced.

The implementation/inputs of BREP and its dependencies remain unchanged, so
this integration does not claim a fresh timing campaign or repeat unrelated
scalar/kernel work. Verify retained executable/source identities where relevant
and record the actual checks, limitations and source differences. Full release,
bindings, resource, runtime fuzz/ASan, coverage, formal and pre-push gates remain
open; no push is requested.
