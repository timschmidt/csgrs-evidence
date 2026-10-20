# Decisions

| Idea | Decision | Reason / evidence |
| --- | --- | --- |
| Retain a planar source with affine frame and unit spatial chart | kept | Preserves the original nonlinear cap through strict whole-image validation and downstream solid operations. New complete-work costs are measured separately. |
| Reuse source evaluator, derivative, bounds and inverse | kept | Hypercurve owns the procedural formulas and selected evidence. BRep only performs frame/chart algebra. |
| Use whole-loop winding proof for procedural wires | kept | Reproduced reversed top-cap cold-replay failure; directed endpoint comparison and intrinsic span simplicity must both be proved. |
| Prefer already available native image in existing builders | already-satisfied, retained | Preserves existing native representation and artifacts, including zero-distance square controls. Procedural lift is used when the native image is explicitly unsupported. |
| Treat lazy point coordinates as unavailable mathematics | rejected | Authored scalar queries can use the owning exact evaluator. Selected points without a supported spatial view remain typed. |
| Fit the offset or use display chords | rejected | Would replace exact source authority and violate P1/P15/P17/P19/P29. |
| Validate an edge by endpoints or samples | rejected | An altered frame can preserve endpoints while changing the interior; the negative archive test retains this case. |
| Add a second offset solver in BRep | architecture-inapplicable | Evaluation and planar topology belong to Hypercurve. |
| General selected spatial images and unlike procedural-source ordering | deferred | Need source-bound field/linear-form and ordering evidence; no isolator endpoints or serialized-byte order substitute for geometry. |
| Claim an optimization from former rejection becoming success | rejected | Original UnsupportedPlanarProfile is not a completed-work baseline. Retention is for additional exact workflows; all matched and adverse costs remain visible. |

No new cache, threading, SIMD or approximation path is introduced. The prior
192-case optimization catalogue and earlier adverse observations remain gates
for future optimization work; the finite matched cohorts do not discharge them.
