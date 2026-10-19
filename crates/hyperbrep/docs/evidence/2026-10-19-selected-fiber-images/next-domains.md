# Continue from selected-fiber images

Preserve the unchanged full interior-loop BRep section assertion and all previous complete graph, branch, selected-point and archive recipes. The original section still needs complete implementation.

1. Build source-bound rational planar maps in Hypercurve using the selected base/fiber image relation. Store the original branch and N/D maps, share source identity across coordinates, certify denominators and mapped regularity over the admitted branch domain, and expose typed singular/pole outcomes. The current public affine recipe does not serialize arbitrary rational image expressions. Benchmark reversible affine/shear construction against the general local norm before changing its algorithm; preserve exact outputs and source recipes.
2. Add derivative/tangent evidence using F_y and -F_x in the retained field. A projection-critical event with F_y=0 can remain geometrically regular when F_x!=0. Prove a nonzero gradient and handle genuinely singular endpoints separately. Keep range membership, coincidence, branch restrictions and downstream arrangement consumption exact; CurveRegion2 remains the filled-region owner.
3. Connect both original surface charts and the spatial image through one intersection authority. For plane/tensor sections, first reuse BRep's existing `Curve3::planar_image` with a retained rational map into the plane frame; that avoids requiring a new general spatial carrier just for the first section domain. General patch pairs still need tensor-surface spatial images. Reuse surface domain and denominator certificates; positive weights alone are not a proof outside their source domain. Preserve isolated, empty, disconnected, singular and common components distinctly.
4. Add whole-branch and rational-image archive replay under the existing graph and metadata limits: equation/domain/decomposition controls, branch selector, exact restriction and map definitions. Recompute the complete source graph, validate indices/ranges and denominator/image claims, and reject forged or exhausted inputs before publication. Scalar AffineForm records do not provide a whole-branch certificate.
5. Admit the original interior-loop section only when complete component inspection, spatial/both chart checks, split/reverse/transform, native replay and further supported consumption all pass. Preserve the full original circle patch and include general rational patches; a special conic recognizer is insufficient.
6. Continue vertical/nullified/common components, generic repeated factors, trim/material arrangements and general patch-pair intersections with their owners. Preserve explicit failures until complete independent proof expands support. Complete total-work/heap/stack/cancellation contracts, directed fuzz/ASan/lexicase, formal and measured coverage, MSRV, installed distributions, actual production bindings and the full workflow matrix. All 28 work packages and publication gates remain open.

## Concrete BRep integration blockers inspected on this revision

`geometry.rs::intersect_plane_rational_bezier_surface` currently tries linear
tensor graphs and then the 2-by-2 bilinear special case. Its non-bilinear
fallback is the original interior-loop blocker. Put the general source graph
construction in a focused `geometry/polynomial_section.rs` module, keeping the
existing admitted fast paths and their full regression corpus. Tensor basis
conversion and polynomial arithmetic must reuse or extend their owning solver
utilities rather than introduce an independent root algorithm in BRep.

`geometry/planar_image.rs::Curve3::planar_image` already retains selected source
charts and checks both source endpoints. A plane section can therefore lift
the rational plane-coordinate map of the retained UV branch in that existing
carrier. Prove the complete polynomial plane residual and the source-domain
denominator, then keep the original UV branch as the tensor pcurve. This is an
implementation route to test, not an admitted section capability.

The immediate BRep boundary still needs work even after maps exist:
`SurfaceIntersectionPcurve::point_at` accepts `Real` and extracts stored
`Point2` coordinates, while its retained-curve materializer requests represented
range endpoints. Migrate these paths to `Parameter`, `CurvePoint2` and selected
range comparisons, matching the existing spatial point API. Update callers
directly; an explicit stored-coordinate view may remain fallible, but must not
be the authoritative evaluator. Exercise materialization, reversal, selected
subdivision, operand swap and exact chart correspondence together.

`Surface::point_at` also currently consumes stored `Point2` coordinates and
returns stored `Point3` coordinates. A retained chart point needs a surface
evaluation path that preserves its joint UV authority and returns
`GeometricPoint3`; independently extracting and rebuilding two coordinates is
not that path. Keep the whole-image correspondence certificate separate from
individual point queries, and exercise both through public consumers.

`SurfaceSurfaceIntersection::{Point,Points}` and the mixed-component point list
currently store `Point3`. Isolated algebraic images need the existing
`GeometricPoint3` authority through this public boundary. Also make section
incidence explicit: projection-slab branches can meet at critical or singular
endpoints, whereas the current `Curves` documentation promises disjoint curves.
Do not publish a collection of pieces as disjoint or forget which event joins
them. Preserve source graph/event identity and qualify this direct API change
against every existing analytic and spline section consumer.

An affine-first section domain is worth testing before requiring general
rational coordinate maps: a tensor patch whose two Cartesian coordinates are
an invertible affine function of `(u,v)`, with a rational height and a certified
nonzero weight. A plane transverse to the height axis determines the third
coordinate affinely on its exact residual zero set. Its spatial section can
then lift the existing polynomial branch directly. This includes arbitrary
admitted height equations, not only the original circle. Prove the coordinate
identities over the complete patch, keep both authored charts and all graph
events, and preserve the original full fixture; no shape recognizer or sampled
trace establishes that contract. General rational maps and patch pairs remain
required later work. This is an unimplemented design candidate, not a support
claim or a substitute for selected chart and archive closure.
