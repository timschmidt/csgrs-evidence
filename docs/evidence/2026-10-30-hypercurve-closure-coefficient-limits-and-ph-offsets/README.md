# Coefficient growth limits, PH region offsets and a replay identity gap

Source: CSGRS `874df73de8` (replay gap ledger), `3c2c051957` (PH region
offsets) and `090a5b23ca` (coefficient growth limits) on `884790f27b`;
`source.patch` holds all three. Release builds, Rust 1.99.1.

## Coefficient growth limits (M4)

`with_coefficient_bit_limit` and `observe_coefficient_bits` add a deterministic
bit bound reported by integer polynomial Bareiss entries, pseudo-quotient
matrix entries and exact rational dense tensor products.
`measurements/coefficient-limits.log` (test source in
`measurement-test-source.rs`): the stalled filleted hyperbola bevel stroke
fails on a 7,950-bit coefficient under 1,024- and 4,096-bit limits and on a
23,826-bit one under 16,384 bits, each after 24,238 refinements and 30
promotions. Other coefficient arithmetic is not measured.

## PH region offsets

`tests/repeated_offset_identities.rs` checks convex disk identities on the
region of the PH cubic `(t - t^3/3, t^2)` and its chord, and the 1/8 dilation
against a boundary built from the materialized rational PH offset. Eroding the
1/16 erosion by another 1/16 did not finish: `measurements/ph-erosion-probe.*`
stops it after 120 s, with a stack sample at 100 s in Hyperreal's quadratic
tower sign under `curve_resultant` trailing-zero trimming (an earlier sample of
the same probe was in the dense two-radical sign).

## Replay identity gap

`measurements/replay-gap-probe.*`: the dumbbell-hole dilation by 3/2 replays
through exact SVG with an empty symmetric difference, but a further dilation by
1/2 is `Blocked(Offset, Line, RealSign)` after replay and succeeds (one loop)
without it.

## Qualification (`qualification.log`)

Formatting; capability guard tests; strict Clippy with all targets and features
on 1.99.1 (Hypersolve, Hypercurve, HyperBRep) and MSRV 1.95.0 (Hypersolve,
Hypercurve); a workspace check of all targets and features; Hypersolve (1,332
passed), Hypercurve release (3,067 passed, 34 existing ignored), HyperCircuit
(105) and HyperDRC (1,670); the four new capability rows (`capability-matrix/`).

## Rejected: region-level round-offset composition

`rejected/round-offset-composition.patch` recorded each round offset's source
and distance and recomputed a further same-sign round offset from the source by
the summed distance. A partial release-suite run with a print in that shortcut
(`rejected/round-offset-composition-shortcut-hits.txt`) found at least eleven
existing tests that deliberately offset generated geometry again and would have
bypassed that reuse. The patch was not committed.
