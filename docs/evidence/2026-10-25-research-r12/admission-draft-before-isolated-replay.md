### R12 shared tangent relation milestone

Owner: Hypercurve private offset reversal/opposition, P4/P8/P9/P17/P19/P20
and P35–P39. The current public retained-parallel/line stroke repeats one joint
cross/dot query three times at a reversal. The isolated one-query acceptance
gate fails on the baseline and passes after removing the redundant outer cross
and consuming the pair's already joint result once. Other family dispatch,
cheap cross-only paths, source carriers, errors and certainty remain intact.
No cache or public API was added; production source is three lines smaller.

The domain is tested with 8,064 independently derived sign cases, terminal
strict→approximate→strict controls, and 1,152 ordered comparisons across all six
private tangent families. Existing Unsupported/Boundary outcomes are explicit
and unchanged. The initial expanded cusp oracle supplied an invalid range-scale
certificate; baseline and candidate failed identically. Correcting the fixture
to the certified one-sided range direction changes no production behavior.

Thirty alternating pairs × 16 cases × 20 samples yield 19,200 certified results.
Every first exact audit file is byte-identical and all sample sizes/checksums
match. Retained-parallel warm stroke ratios are 0.9824–0.9913; all eight paired
95% intervals lie below 1. Strict medians are 10.058→9.950 ms and 9.591→9.481 ms
for zero-distance parallels, and 8.381→8.244 ms and 7.828→7.716 ms for nonzero
parallels, forward/reverse respectively. Requested allocation falls 18,368–31,024
bytes per stroke. Line/native-quadratic allocation controls are identical, as
are peak live bytes, result retention, continuation allocations and post-drop
retention for all 9,600 paired samples. Cold intervals all include 1; adverse
point estimates remain in the record, including +2.45% for reverse approximate
lines. No cold-speedup or general stroke-speedup claim is made.

The native probe is 184 bytes smaller (`.text` −96); the separate executable
WASM probe is 3,681 bytes smaller. Both WASM builds pass 32 stroke/source-drop/
rebuild invocations with identical results. These are matched probes with the
workspace dependency versions, not production package size measurements.

The audit retains exact public definitions where available and full structural
Debug records for unsupported retained rational/recursive views. It is not a
portable interchange format; unavailable native exports remain blocked. Geometry
checks and the independent sign oracle accompany artifact equality. R02's fillet
authority, R03's NURBS gate and unsupported tangent families remain open.

FINAL_CHECK_RESULTS

Evidence: `docs/evidence/2026-10-25-research-r12` in the local evidence archive;
the digest is in `docs/evidence-archive.tsv`. Raw sources, failed probes,
counter traces, allocations, exact artifacts, native/WASM builds, seeds and
commands are retained. The archive branch and worktree changes are not pushed.
