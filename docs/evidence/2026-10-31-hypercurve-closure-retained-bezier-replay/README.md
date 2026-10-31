# Exact SVG replay of retained Bezier ranges

Source: CSGRS `c0b6945490` ("Replay retained Bezier ranges through exact SVG
graph metadata") on `102764add4`; `source.patch` is that commit. Release builds,
Rust 1.99.1; `capability-matrix/` uses the default toolchain recorded in its
report.

## Contract

Closure-plan M5: "construct, Boolean, offset, corner edit, archive, replay, then
another Boolean or offset". Properties P12, P15, P17-P20. Owner: Hypercurve's
native SVG graph codec.

## Reproduced defect

`probes/replay_variants.rs` (helpers from `tests/disappearance_chains.rs`)
exports four ellipse regions. In `probes/before/`, three fail at export: the
plain ellipse x^2/4 + y^2 <= 1 cut by x <= 1 and chamfered with setbacks 1/8
("exact SVG metadata does not encode this generated curve definition"); the
same chain after an initial 1/2 dilation (`Blocked(Evaluation, RationalBezier,
Unsupported)`); and the filleted dilation ("exact circle replay requires a
retained chord-normal frame"). The cut dilation alone replays and offsets.
`probes/svg_probe.rs` encodes each boundary curve of the plain chamfer region
separately; only the remaining ellipse arc fails, a `RetainedBezier` fragment
(source conic plus an exact range ending at the algebraic chamfer contact).

## Change

Graph tag 32 writes that fragment's native source record, two parameter
references and its traversal flag. Import requires a polynomial or rational
Bezier source and an ordered range inside [0, 1], then rebuilds the piece with
`split_at_parameters_refined`, which created it.

## Witnesses

- `replayed_chamfered_ellipse_keeps_its_retained_arc_range`
  (`tests/svg_region_replay.rs`, 15 s): empty symmetric difference after
  replay, an equal difference with x <= 0, and a further 1/16 dilation that
  contains the replayed region. It fails on the previous source
  (`witness-on-previous-source.log`).
- `src/svg/exact/graph/retained_bezier_tests.rs`: forward and reversed pieces
  ending at the root of 2t^2 - 1 replay in their source chart; descending,
  empty and out-of-chart ranges and a line source are rejected.

## Qualification (`qualification.log`)

Format check; strict Clippy for hypercurve with all, default and no default
features, the wasm32 library without default features, and MSRV 1.95.0 with all
features; the full Hypercurve release suite with all features (3,080 passed,
34 existing ignored); root `svg-io` SVG tests (15); the capability row.

## Still open (`probes/after/`)

The plain chamfer region replays, but exporting its 1/16 dilation and the
filleted chains still fails for generated round joins without a chord-normal
frame. An XOR between dilations of the original and of the replayed region is
`Blocked(Boolean, RationalBezier, Ordering)`, although both dilations complete.
The initially dilated chamfer chain still fails export with the evaluation
blocker.
