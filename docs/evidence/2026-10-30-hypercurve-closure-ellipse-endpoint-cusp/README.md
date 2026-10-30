# Elliptical holes and offset cusps at span ends

Source: CSGRS `18577f3f36` (elliptical hole witness) and `884790f27b`
(endpoint cusp contacts) on `31b949ea79`; `source.patch` holds both commits.
Release builds, Rust 1.99.1.

## Contract

Closure-plan corpus items "nonrational ellipse offsets" and "offsets with
cusp/normal-reversal events" (P12, P15, P17-P19). Owner: Hypercurve analytic
parallels and their supporting-line relation in the shared arrangement.

## Elliptical holes

The ellipse is the unit disk scaled by 2 along x, removed from a 16x16 square
frame. On `08556d2d10` (before the hole-dilation change) the dilated frame kept
the hole at the minor semi-axis; the witness fails there. After the change the
hole closes at 1 and 3/2, and surviving holes at 1/4 and 3/4 equal the ellipse
eroded by the same distance (disjoint, union equal to the rounded frame).

## Cusp at a span end

At distance 1/2, the smallest radius of curvature b^2/a, the inner parallel has
cusps exactly at the half-arc ends (+-2, 0). On `18577f3f36` both the eroded
ellipse and the dilated frame failed (`witness-on-previous-source.log`):
`Invalid(Offset, RationalBezier, Topology("parallel supporting-line root lies
outside the unit domain"))`. A band chord meets the parallel at the cusp; the
pointwise derivative scale 1 - d k vanishes, the tangent sign is undecided, and
`parallel_line_neighbor_sign` has no exterior side inside the retained range.

The fix asks the range's singularity analysis whether every parallel cusp and
source singularity lies at a range end; only then is the interior scale sign
used as the one-sided limit. The first version used the interior sign
unconditionally; `selected_parallel_arrangement_splits_interior_cusps`, whose
queried range contains interior cusps, then regularized to an empty region
(`rejected-unconditional-interior-sign-*.log`). It was replaced before commit.

## Qualification (`final-qualification.log`)

Strict Clippy with all targets and features on 1.99.1 and MSRV 1.95.0; the full
Hypercurve release suite (3,064 passed, 34 existing ignored); HyperCircuit (105)
and HyperDRC (1,670) release suites; the eight disappearance-chain witnesses.
