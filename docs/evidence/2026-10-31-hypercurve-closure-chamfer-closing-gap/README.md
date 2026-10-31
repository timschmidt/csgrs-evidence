# Closing a chamfered ellipse dilation: reproduced gap and rejected fix

Source: CSGRS `3e17c60608` (on `main` `d463ef96a5`). Release builds, Rust
1.99.1. No source change is proposed; this record documents a reproduced
composition gap and two candidate changes that were rejected.

## Contract

Closure-plan M1/M3 acceptance: "every output ... can be passed to ... another
offset, an applicable fillet or chamfer", and the fixture "noncircular ellipse
offset: cut, fillet or chamfer, then reoffset". Owners: Hypercurve offset band
assembly (`bezier_region/offset_joins.rs`) and the algebraic chord pair kernel
(`bezier_offset/algebraic_chord`).

## Workload

`probes/ellipse_variants.rs`, run with `probes/run_probe_bg.sh`. E is the unit
disk scaled by 2 along x. The chain is E dilated by 1/2, intersected with
x <= 1, then the corner at the cut line's start chamfered with setbacks 1/8
(variant `chamfer`); `both` also fillets the other corner with radius 1/8. Each
variant then dilates by 1/16 and erodes by 1/16. The region is convex
throughout, so the closing must equal the input exactly.

| Variant | Unchanged source | Both changes |
| --- | --- | --- |
| cut only | 21.7 s, equal | 26.7 s (4 parallel runs), equal |
| fillet only | 30.3 s, equal | 35.8 s (4 parallel runs), equal |
| chamfer | not finished after 30 min (`logs/variant-chamfer-long.log`) | 296 s alone, equal |
| chamfer and fillet | not finished after 300 s | 218 s (4 parallel runs), equal |
| plain E cut at x = 1 and chamfered | 61 s, equal | 73-76 s, equal |
| circle analogue (radius 3/2) chamfered | 0.63 s, equal | 0.63 s, equal |

## Diagnosis

Stack samples place the stall in the erosion's band arrangement:
`chord_intersections` -> `pair_sides_by_refinement` ->
`recursive_support_tangent_cross_sign`, refining recursive quadratic fields with
growing bignums. `logs/chord-pairs*.log` (from `probes/chord_trace_patch.py`)
and `probes/offset_probe.rs` show the cause:

- The dilated region's chamfer edge is a clean normal offset of the chamfer
  chord, but none of its nine boundary junctions shares one point object
  between the adjacent fragments.
- Erosion builds one band per span between the +-1/16 offsets. At each smooth
  junction the two adjacent bands produce the same normal connector from
  different endpoint representations: a selected-circle point on the round
  join, and a chord-parallel point on the edge.
- The band offset of the edge composes back to the chamfer chord at distance
  zero, represented by zero-distance parallel points that still carry the unit
  normal's square-root extension.
- No structural relation links these representations, so the pair predicates
  fall through to interval refinement of signs that are zero or expensive.

## Rejected changes

1. `zero-distance.patch`: return the retained source from
   `parallel_left_retained` when the composed distance and translation are
   exactly zero. It breaks three existing tests that require the +1 then -1
   round trip to keep a procedural endpoint without coordinates
   (`logs/suite-with-both-changes-failures.log`; with both changes the full
   suite has 3,074 passed, 3 failed, 34 ignored). It also slows the plain E
   chamfer closing from 61-63 s to 76-78 s (`logs/zero-plain-pairs.log`: new
   10 s selected-circle/chord pairs).
2. `sharing-A.patch`: in `share_exact_offset_band_endpoints`, recognize
   selected-circle join fragments and share algebraic (not only represented)
   endpoints after the existing tangent-junction proof. Alone it leaves the
   chamfer closing unfinished at a 900 s limit (`logs/variantA-nozero.log`
   stops after the dilation) and is neutral on the plain case (60.5 s). A wider form sharing at every certified smooth junction
   (`logs/variantB-chamfer.log`, 292 s with change 1) gave no further gain.

Neither change is committed: change 1 contradicts existing tested contracts and
change 2 has no failing witness of its own.

## Open

The chain needs retained junction identity in regularized boundaries, or band
connectors that carry their normal-line relation to the span tangent, so that
coincident connectors and zero-distance offsets are recognized without
refinement. Even with both changes, individual pairs over these fields take
5-50 s (`logs/pair-timing.log`), which is M2 cost work.
