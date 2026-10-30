# Dilation of regions with holes and disappearance chains

Source: CSGRS `9617bf0eac` ("Close holes when dilation crosses their medial
axis") on `08556d2d10`; `source.patch` is that commit. Release builds, Rust
1.99.1. `probes/` holds the base defect probe and its output on the previous
and fixed source; `qualification.log` and `capability-matrix/` hold the checks.

## Contract

Properties P12-P14 and P17-P19; closure-plan corpus item "holes,
nested/disconnected components, disappearing features, canonical empty-set
identities". Owner: Hypercurve exact region offsets. Regularized dilation by a
disk of radius d must equal the Minkowski sum, including when a hole closes
wholly or in part.

## Reproduced defect

Before the change, `CurveRegion2::offset` dilated every region by its raw
boundary walk. A hole whose inward parallels cross keeps its orientation after
trimming (a half-turn of a hole is still a hole), so winding regularization
reported a surviving hole:

| Region | Distance | Base result | Exact set |
| --- | --- | --- | --- |
| annulus, radii 1 and 3 | 1 | `Invalid(Offset, Topology("certified retained boundary chain requires nonempty fragments"))` | disk of radius 4 |
| annulus | 3/2, 2 | area 20 pi, 24 pi; center outside | disks, 81/4 pi and 25 pi |
| square hole of half-width 1 | 3/2, 2 | center outside | no hole |
| 6x2 slot hole | 3/2, 2 | center outside | no hole |
| dumbbell hole, width-2 channel | 3/2, 3 | channel outside | channel closed |
| dumbbell hole | 2 | lobe centers on the boundary | lobes vanish |
| square hole with a cut corner | 2 | differs from the exact set | 4x4 square hole |

Material erosion past the inradius and closing a slot in a material loop were
already correct; contraction subtracts exact boundary bands.

## Change

A positive offset of a region with a hole loop uses the same exact boundary
bands as contraction, applied by union. Two exact certificates keep the cheaper
walk for holes that provably survive: every fragment on one supporting circle
(read from the retained circle certificate when present) with r^2 > d^2, or a
strictly convex polygon whose inward-shifted edges all keep positive length in
their original direction. Undecided signs and inspection failures select the
bands. Roles computed for the routing decision are passed to the walk.

## Witnesses

`tests/disappearance_chains.rs`, seven tests with independently authored exact
regions compared by empty symmetric difference. `probes/witnesses-on-base.log`:
on the unchanged source four fail (annulus, polygonal holes, convex cut edge,
dumbbell) and three controls pass (empty composition, disconnected component,
corner styles on a surviving hole).

## Cost (`timing/`)

Median of 15 fresh constructions per case, measured beside a running
validation campaign. Base (01, 05) against final (06):

| Case | Base | Bands for every hole (02) | Final |
| --- | --- | --- | --- |
| square frame, round | 0.51-0.77 ms | 7.9 ms | 0.52 ms |
| square frame, miter | 0.59-0.60 ms | 3.8 ms | 0.64 ms |
| square frame, bevel | 0.54-0.55 ms | 4.5 ms | 0.66 ms |
| annulus at 1/2 | 1.00-1.09 ms | 16.0 ms | 1.00 ms |
| square pad with a circular hole | 0.43-0.44 ms | 12.2 ms | 0.43 ms |

Holes that close or are not certified now pay the band route. No performance
improvement is claimed; the final row shows no regression for certified
surviving holes at this scale.
