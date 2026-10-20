# Native and selected spline trim replay

This increment repairs independent planar spline image validation and extends
proof-only boundary reassembly to exactly connected, consistently monotone
multi-span sources. It is partial WP02/WP13/WP21 progress. All 28 work-package
gates remain open.

## Problem and construction

At baseline `7091576d8`, saving and independently validating a native rational
spline edge split fails with `EdgeUseSupportMismatch`. The validator compares
the pcurve lift with the whole spatial source instead of the edge's mapped
interval. [The original regression](regression-before.rs) and
[its failure](regression-before.log) are retained. After that interval fix,
selected cuts on a multi-span NURBS encounter the previous one-span-only
injectivity guard; [the intermediate failure](multispan-before.log) records
`UnsupportedPcurveContour`.

The final validator reuses exact native subdivision and affine plane lifting.
Bezier trims are compared in their rebased unit chart; NURBS retain transformed
knots, with reversed controls/weights for a negative map. Endpoint maps and
complete image agreement are checked independently. Archive input supplies
neither a trusted image flag nor a sampled geometric proof.

Hypercurve's new `Curve2::has_certified_injective_image` reuses prepared native
spans. Multi-span success requires exact endpoint joins, strict coordinate
monotonicity on every span and one common direction. These conditions separate
nonadjacent coordinate ranges. Individual injectivity alone cannot exclude
backtracking or disconnected pieces. A single span uses its existing proof;
a restriction can inherit a proof of its whole source. `false` means no
certificate. Queries remain strict in provisional scopes and do not cache
negative facts. BREP consumes this certificate only for boundary-image proof
reassembly; every archived topology record remains present.

## Correctness and deliberate faults

[Commands](commands.json) and raw logs record:

- HyperBRep all features: 243 core tests, 57 integration tests and four
  doctests. Default features: 236 core, 56 integration and four doctests.
  These configurations overlap.
- Four new public BREP regressions cover rational Bezier, rational quadratic,
  single-span and multi-span NURBS; native then two selected cuts; byte-stable
  reloads; map inversion; shear/reflection; positive and negative NURBS chart
  scales; endpoint-preserving interior corruption; and five successive
  selected cuboid cuts retaining one root and two pcurve sources.
- Eight focused Hypercurve tests include the three new multi-span certificate
  regressions and five existing parameter-chart tests. Reversal, scalar source
  restriction, backtracking, disconnected joins and provisional near-joins
  are exercised. No full Hypercurve suite is claimed.
- 34 release selected-point/topology/solid/spline tests pass. Strict Clippy,
  warning-denied HyperBRep/Hypercurve rustdoc, WASM library compilation,
  HyperBRep fuzz-bin Clippy, eight release benchmark builds and formatting
  pass. WASM compilation is not execution.
- Final tests and strict Clippy run after every deliberate mutation is
  restored. The initial formatting failure for a later-added assertion is
  retained in [initial-fmt.log](initial-fmt.log); final formatting passes.

[Four faults](controls.json) are applied one at a time and rejected by runtime
assertions, not by compiler errors:

| Fault | Required check that fails |
| --- | --- |
| Trust endpoints without full spline image equality | Changed interior must fail independent validation |
| Ignore common span direction | Backtracking must not certify an injective image |
| Ignore exact endpoint joins | Disconnected spans must not certify a connected image |
| Use ambient approximate join decisions | Provisional near-joins must not author a strict certificate |

Each patch and failure log is under `controls/`; the runner restores the exact
source hash in a `finally` block. These controls test necessary proof guards,
not exhaustive mutation coverage.

## Cost evidence

Three alternating process pairs pinned to CPU 0 preserve all 66 native kernel
receipts against `7091576d8`. [Per-case comparisons](comparison.json) show a
median of case median timing ratios of 0.989699 and maximum 1.073174 for
homothetic loft construction/measurement/classification (1,116,308 to
1,197,993 ns), within the 10% cohort budget. The executable grows 10,704 bytes
to 24,771,240. Median process peak RSS is 21,764 KiB for baseline and 21,712
KiB for candidate. [Executable hashes](executables.json), raw receipts,
resource records and [benchmark commands](benchmark-commands.json) are retained.

[Feature medians](feature-cost.json) come from three processes with 100
iterations per cohort. Replay includes JSON parsing, independent validation,
topology/selected-coordinate assertions and byte-identical encoding. Initial
source construction and root isolation are outside timing.

| Cohort | Median per iteration | Archive bytes |
| --- | ---: | ---: |
| Full rational Bezier sheet | 379.494 µs | 9,206 |
| Native rational Bezier trim | 884.277 µs | 10,892 |
| Selected rational Bezier trims | 1.160422 ms | 14,141 |
| Selected rational quadratic trims | 1.133407 ms | 14,175 |
| Selected single-span NURBS trims | 1.426204 ms | 15,428 |
| Selected multi-span NURBS trims | 1.616475 ms | 17,047 |
| Eight multi-span replay/encode cycles | 12.824790 ms | 17,047 input |
| Prepared two-span injectivity query | 72 ns | — |

Every selected sheet has seven vertices, two retained-coordinate vertices,
one root and one pcurve source. Bezier variants contain three chart images;
NURBS variants contain two. Archive metadata is printed in each feature log.
The prepared-query row is a short warm-cache sample, not a cold/warm comparison.
These measurements establish no statistical speedup, allocation count,
general chain-growth bound or external-kernel performance comparison.

## Reproduction and remaining work

Use the matching source snapshot and Cargo/rustc 1.99. `qualification.py` and
`recheck.py` contain the exact commands. Run `controls.py` without simultaneous
builds or tests: it temporarily edits source and always restores it. Build the
kernel bench from `7091576d8` in a separate checkout and preserve it as
`/tmp/hyperbrep-selected-solids-kernel`; its expected hash is recorded above.
Compile `measure.c` using
`cc -O2 -Wall -Wextra -Werror measure.c -o /tmp/hyperbrep-selected-archive-measure`.
Run `benchmark.py` without concurrent CPU-heavy work. It selects Cargo
artifacts by target kind, freezes candidate executables and writes receipts
under `/tmp/hyperbrep-spline-replay-evidence`. `collect.py` collects those
artifacts and hashes the source snapshot. `verify.py` checks source/artifact
hashes, local links, command results, all native/feature receipts and restored
faults, while requiring all 28 work-package gates to remain open.

General selected solid/corner/void proofs, surface/contact/fiber carriers,
selected Boolean transfer, bounded/WASM-safe decoding and full operation
budgets remain open. The new multi-span certificate is sufficient, not a
complete self-intersection test; valid sources without its proof still decline.
No full Hypercurve suite, runtime fuzz/ASan/lexicase campaign, independent
kernel oracle, WASM execution or full-workspace/pre-push qualification is
claimed. The external subdivision references in
[algorithm research](../../ALGORITHM_RESEARCH.md) support the mathematical
construction; they are not executed oracles.
