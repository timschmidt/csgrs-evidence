# Closing a chamfered ellipse dilation: connector identity

Source: CSGRS `d92fc4be9b` plus `change.patch`, committed on top of it as the
next revision of branch `m4-coefficient-growth`. Release builds, Rust 1.99.1,
`--locked`, `CARGO_TARGET_DIR` shared with earlier probes. This record follows
`2026-10-31-hypercurve-closure-chamfer-closing-gap`. That record reproduced
the gap and rejected two candidate changes.

## Contract

Closure-plan M1/M3 acceptance: an offset result must be a valid operand of the
next offset. The plan's fixture is "noncircular ellipse offset: cut, fillet or
chamfer, then reoffset". Owners: Hypercurve offset band assembly
(`bezier_region/offset_joins.rs`), the algebraic chord pair kernel
(`bezier_offset/algebraic_chord/tangent.rs`) and retained point identity
(`curve_point.rs`, `bezier_offset/algebraic_chord/points.rs`).

## Workload

The workload is unchanged from the earlier record:
- probe source: `probes/ellipse_variants.rs`, run with `probes/run_probe_bg.sh`;
- E is the unit disk scaled by 2 along x;
- E is dilated by 1/2, cut by x <= 1, and chamfered at the corner where the cut
  starts, with setbacks 1/8;
- the result is dilated by 1/16 and then eroded by 1/16.

Every stage is convex, so the closing must equal the chamfered region. The
check is an empty exact symmetric difference.

## Reproduction on `d92fc4be9b`

On this revision, which includes the per-point bounds memoization and the shared
sign scopes, the chamfer variant still did not finish:
- `logs/head-d92fc4be9b-chamfer-3600s.log`: the dilation took 0.68 s; the
  erosion was killed at the 3600 s limit;
- `stacks/head-stall/`: all 16 `eu-stack` samples are in
  `regularized_exact_offset_band_arrangement` -> `chord_intersections` ->
  `pair_sides_by_refinement` -> `recursive_support_tangent_cross_sign`;
- gdb breakpoint counts over 150 s: one tangent-cross call was active, with no
  new `chord_intersections_once` or `pair_sides_by_refinement` entries. It is
  a single sign, not many slow pairs.

## Diagnosis

The pairs were found with temporary instrumentation, which is not part of the
change. It printed each chord pair before the recursive-norm fallback and
around every non-bounded `pair_sides_by_refinement` call. For each chord it
showed its endpoint kinds, the midpoint of each endpoint's 0-step box, its
retained support, and every chord-parallel endpoint's source, distance,
translation and origin.

**Unchanged source** (`logs/diagnostic-head-cross-norm.log`). The stalled call
compares two connectors of the erosion's bands, both along the chamfer
chord's normal line at its junction C with the ellipse offset:
- `derived(C + n/8) -> analytic C`: the radial connector of the round join's
  band. The join collapses to C, so this band is a cusp semicircle of radius
  1/8.
- `parallel(C, d = 0) -> parallel(C, d = -1/8)`: the chamfer edge's band
  connector.

They are the same segment traversed in opposite directions, so their tangent
cross is exactly zero. The recursive norm has to prove that zero over the
merged field. The merged value has no 0-step interval.

**Sharing alone** (`logs/diagnostic-sharing-only.log`). Here
`share_exact_offset_band_endpoints` also shares algebraic tangent-junction
endpoints of cusp-semicircle spans. The stall then moves to
`oriented_side_by_refinement`, between `analytic(src.end) -> X` and
`X -> parallel(src, at_end, d = 0)`. The composed displacement of the dilated
chamfer edge is exactly zero, so `parallel(src, at_end, 0)` is `src.end`.
Storage identity could not see that.

**Identity alone** (`logs/diagnostic-identity-only.log`, stopped deliberately
after about 10 minutes). The zero-displacement identity on its own still
reaches the recursive norm for the arc/chamfer connector pair. Each such call
took about 230 s.

## Change

Both parts are needed:

1. `CurvePoint2::zero_displacement_origin` and
   `shares_storage_through_zero_displacement`. A chord-parallel point whose
   composed distance and translations are structurally zero is its displacement
   origin: `P + 0*u + (0,0) = P` for every unit direction. The pair-side kernel's
   endpoint equality matrix and `CurvePoint2::same_point`'s positive fast path
   use it. The representation is not replaced, so the three fillet tests that
   rejected `zero-distance.patch` are unaffected.
2. `share_exact_offset_band_endpoints` treats cusp-semicircle fragments as
   circular. It shares a certified tangent junction's offset endpoint even when
   that point is algebraic. `offset_ends_meet_at_tangent_junction` proves the two
   ends equal exactly, so representation is not a precondition. This is
   `sharing-A.patch` from the earlier record.

## Results

`logs/final-variants.log` comes from one process running the final code, with
variants in sequence. Every closing equals its input exactly:

| Variant | 2026-10-31 baseline | Now |
| --- | --- | --- |
| chamfer | not finished in 30 min (and 60 min on `d92fc4be9b`) | 274 s |
| chamfer and fillet | not finished in 300 s | 279 s |
| cut only | 21.7 s | 14.9 s |
| fillet only | 30.3 s | 13.1 s |
| plain E cut at x = 1 and chamfered | 61 s | 23.1 s |
| plain E cut at x = 1 | not measured | 2.9 s |
| circle analogue chamfered | 0.63 s | 0.62 s |
| circle analogue cut | not measured | 0.03 s |

Earlier runs of the same code before the documentation-only edits closed the
chamfer variant in 245.5 s (`logs/diagnostic-both-chamfer.log`) and 243 s.
`variant_circle_both` fails in the probe's own `cut_line` helper both before and
after the change, so it is not a geometry result.

`stacks/remaining-cost/` holds 46 samples of the 245 s closing. No kernel
dominates:
- cusp-fragment regularization probes appear in 18 samples;
- cusp-semicircle chord intersections in 12;
- retained parallel contacts in 10;
- pair sides in 10.

This remaining time is the "5-50 s per pair" cost work of the earlier record,
not a stall.

## Regression coverage

- `cancelled_chord_displacement_tests::cancelled_chord_displacements_are_their_source_endpoints`
  (Hypercurve unit test, STRICT and APPROXIMATE_512):
  - a chord with an irrational unit normal is offset by 1/16 and back;
  - both endpoints stay procedural, are their source endpoints, and decide
    `same_point` as true;
  - a residual displacement of 1/32 decides as false;
  - the two coincident normal connectors resolve as all-`On`, through the new
    `zero-displacement-endpoint-identity` dispatch-trace path under
    `dispatch-trace`.
- `chamfered_ellipse_offset_closing_returns_the_input` in
  `tests/hypercurve_composed_workloads.rs`:
  - the complete chain, ignored as slow;
  - it passed in 243 s, and in 248 s after the final edits
    (`logs/final-ignored-regression.log`; that run's 2.8 GB peak includes
    recompiling the crate).

## Validation

- `logs/release-suites.log`: release `--all-features` tests before the
  documentation-only edits. All passed: Hypercurve 3,087 (35 ignored, one of
  them the new chain test), HyperBRep 687, Hypercircuit 354, HyperDRC 1,670.
- After the final edits:
  - `cargo fmt --all -- --check` passes;
  - strict Clippy (`-D warnings`, `--all-targets`) passes for Hypercurve with
    all, default, no default and `dispatch-trace` features;
  - the new unit test and the existing band-sharing test pass.

The complete pre-push matrix is recorded separately.
