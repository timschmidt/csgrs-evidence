# Decisions

| Decision | Status | Evidence and interaction |
| --- | --- | --- |
| Own affine queries in Hypercurve, retaining one point and coefficients | kept | Six owner groups and the spatial tests use shared roots and normal-sheet predicates. No BRep copy of offset or polynomial elimination formulas. Capability extension; costs are reported separately. |
| Compare selected trim definitions and exact chart endpoints | kept | Cold replay now succeeds; changing only a selected pcurve's distance yields `EdgeUseSupportMismatch`. Prior full-image and scalar trim checks remain. |
| Use an existing complete prism certificate for selected-vertex slab operations | kept | Original cap split/replay/cut/reunion/empty workflows now complete with independent set and point expectations. This does not infer a product from endpoint levels. |
| Reassemble adjoining parallel pieces for proof views | kept | Exact source, direction and adjacency plus owner injectivity are required. Exterior nodal and interior-cusp controls prevent borrowing a unit-domain certificate or hiding a singular join. Original model topology stays intact. |
| Independent scalar coordinates for each selected spatial point | rejected | The baseline fails `UnsupportedSelectedEvaluation`; the required root has no scalar view. Source-bound affine queries preserve the correlation needed by later operations. |
| Treat an enclosure or two matching endpoints as an image proof | rejected | Bounds only enclose. Whole-definition forgery controls require rejection before topology admission. |
| Fit procedural curves or merge near points | architecture-inapplicable | Authoritative topology preserves exact sources and exact 1e-12 separation. Approximation remains an explicitly separate future operation. |
| Reimplement normal-sheet sign selection in BRep | already-satisfied | Hypercurve already owns the radical and denominator proof. The existing axis predicate now delegates to its generalized linear-form implementation. |
| Call a faster old rejection an optimization | rejected | The old mixed selected-point control is an explicit error-to-success migration and has no matched latency ratio. All raw observations are retained. |

The fixed-source reports supply the finite cost measurements and admission
results. None of these decisions establishes complete CAD, installed release
availability, formal verification or a global resource bound.
