# Circle certificates through exact SVG graph replay

Source: CSGRS `ee50162ab9` ("Keep circle certificates through exact SVG graph
replay") and `d308c8d2f2` ("Gate the circle certificate check on the svg
feature"); `source.patch` holds both. The first was written and qualified as
`b4bbaa5a26` on `af0aca8290` and cherry-picked unchanged onto the receipts
commit `361c4f7e6d`. The lint phase of the pre-push campaign then found the new
check unused without the `svg` feature (`clippy -D warnings`), which the
all-features Clippy runs below do not exercise; the second commit gates it as
the other svg-only helpers are. Release builds, Rust 1.99.1, except
`capability-matrix/`, which uses the default toolchain (1.98.1, recorded in
its report). It ran before the first commit, so its `dirty.patch` holds the
same change.

## Contract

Closure-plan obligations "native save/reload, and further operation" and
"exact native replay must retain and validate defining relations" (P12, P15,
P17-P20). Owners: Hypercurve's native SVG graph codec, and the retained
rational-quadratic circle certificate in `rational_bezier.rs`.

## Reproduced defect

A 20x20 frame with a dumbbell hole (two 4x4 lobes, width-2 channel), dilated
by 3/2, replays through version 5 metadata with an empty symmetric difference.
Dilating the replayed region by another 1/2, where each lobe collapses exactly,
was `Blocked(Offset, Line, RealSign)`. The same dilation of the unreplayed
region succeeds with one loop (`witness-on-previous-source.log`).

## Diagnosis (`probes/`)

`probes/svg_probe.rs` is a temporary in-crate test, applied with
`run_src_probe.sh`, `classify_patch.py` (comparison tracing) and
`intern_patch.py` (decode-time point interning). `diagnosis-output.log`
records the following:

- The original round joins are rational quadratics that retain their circle
  (center, radius squared, two tangent contacts) and implicit conic. The
  decoded joins retain neither; the graph wrote only native controls and
  weights.
- Rebuilding the region in-process from its own boundary paths works.
  Decoding, with or without arrangement replay, blocks.
- The original shares each joint point between adjacent curves. Scalars
  decoded twice from the same bytes compare equal at once. Interning decoded
  points by their exact encoding restores the sharing, but the dilation still
  blocks.
- `trace-orig.txt` and `trace-dec.txt` list the comparisons at the
  chord-coordinate and same-value sites. The decoded run diverges at entry 767
  with undecided comparisons whose serialized operands are 1.08 to 128 MB; the
  original makes no such comparison there.
- Recognizing the circle again from the decoded controls gives centers for the
  lobe joins whose Debug renderings are 460,000 to 590,000 characters, and the
  dilation stays blocked.
- Attaching the original center and radius squared, with or without tangent
  contacts and with or without point interning, completes the dilation with one
  loop.

## Change

Graph definition tag 31 writes a native rational quadratic, then its retained
circle's center and radius squared. Import requires `r^2 > 0` and the
homogeneous identity `|X - cW|^2 = r^2 W^2`. With
`G_ij = w_i w_j ((P_i - c) . (P_j - c) - r^2)`, the identity holds exactly when
`G_00 = G_01 = G_02 + 2 G_11 = G_12 = G_22 = 0`. These are five exact zero
tests under the strict policy. A refuted certificate is malformed input, and
an undecided one is a typed blocker. Tangent contacts are not serialized.
Version 3 single-path metadata is unchanged. Older readers reject tag 31 as an
unknown definition.

## Witnesses

- `replayed_circular_joins_support_further_offsets_through_collapse`
  (`tests/svg_region_replay.rs`): the replayed 3/2 dilation equals the
  original; a further 1/2 dilation has one loop and equals the direct
  dilation by 2. It fails on the previous source.
- `svg/exact/graph/circle_certificate_tests.rs`: quarter and negative-weight
  major arcs keep their certificate; an uncertified curve gains none; a wrong
  center, a wrong radius, and zero or negative radius squared are rejected as
  malformed.

## Qualification (`qualification.log`)

Format check; strict Clippy with all targets and features on 1.99.1 and MSRV
1.95.0; the full Hypercurve release suite with all features (3,072 passed, 34
existing ignored); the root crate's `svg-io` SVG tests (15); the HyperCircuit
(105) and HyperDRC (1,670) release suites; the capability row
`replayed_circular_join_further_offset`.

Not established: replay of tangent contacts or other retained construction
evidence; HyperBRep persistence of circular conics; total work or memory
bounds for replay.
