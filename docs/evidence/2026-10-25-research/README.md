# Research follow-on evidence, 25 October 2026

Baseline CSGRS: `3cca6a894858c8b98497a3cfe81cff5e17e1a7f2`.
This record establishes the R01 **mesh milestone**, reproduces the R02 blocker,
and recovers part of R25's historical evidence. It does not close the entire
30-project program or R01's BRep support/parameter-identity work.

## R01

`r01/baseline.log` reproduces the loss of a negative meridian when a disjoint
positive component is added. The other 19 original profile tests pass in
`baseline-controls.log`. `implementation.patch` contains the final production
and regression delta; build manifests identify the actual probe binaries,
toolchain, lockfile, features and source patches. Binary files themselves are
not retained: their hashes, sources and build commands are.

The final entries of `checks.jsonl` and their logs record formatting, Clippy
(all root targets/features, warnings denied), 18 native curve unit tests,
56 affected integration tests (24 exact-profile tests), one existing revolution
continuation test, 13 FFI Rust tests, actual C/C++/Python consumers, warning-free
Rust docs, and the complete generated JS/TS WASM binding script. All pass.
An earlier continuation invocation accidentally compiled out its tests; the
zero-test log is retained and the final run enables curve,stl-io,obj-io.

The original C/Python/C++ failure fixture expected 13/-13 rotation to stay
undecided. The baseline Python run reproduces that stale expectation. Its
mathematical success remains asserted for all four set operations; an
independent three-rotation fixture exercises the still-undecided error path.
No failing operation is accepted as an empty success.

`paired_probe.py` runs 18 cases, three alternating pairs of fresh processes,
five samples per process (first cold, subsequent warm), with one CPU affinity.
The 540 completed operations are certified. Each operation is followed by
strict manifold validation, exact JSON row materialization and drop, measured
separately. Allocation counts cover calls, requested bytes, peak live growth,
result-live and retained-after-drop bytes. Timings include allocation-counter
overhead on a shared host and are focused measurements, not general speedups.
The 12 one-sided/even-lattice controls preserve exact bytes/checksums and
allocation totals. Odd mixed-sign rows intentionally migrate to phase-correct
regularized material. The old analytic fold performs a different contract.
All unfavorable cost rows remain in `paired-summary.json`; overlap N=5 rises
from about 1.09 ms/1.07 MB requested to 268 ms/258 MB requested, with 1.07 MB
peak live growth. This milestone is retained for exactness, not speed.

`initial-candidate/` retains the earlier paired experiment that revealed 144
avoidable requested bytes per operation; the final variant only normalizes
angles exceeding one turn. The exact control rows remain unchanged.
`*-size.txt` attributes the standalone probe's linked sections. These are not
WASM deployment-size measurements.

`openscad-2021.01/` contains executed reference calls and OFF outputs. The
installed 2021.01 binary uses phase 180 for full turns and saturates 450 to a
full turn; mixed-sign input is rejected. CSGRS keeps start zero by default,
provides explicit `revolve_from`, and continues rejecting oversized noninteger
sweeps. Partial-turn `$fn` in OpenSCAD is not CSGRS's segment-count argument.
No current-upstream compatibility claim is inferred from this older binary.

## R02

`r02/arc-corner-baseline.log` actually executes the ignored end-to-end gate:
fillet, stroke, rebuild, reverse and refillet complete; erosion fails with a
RealSign blocker in 11.52 s. The line-corner control passes. Hypercurve code
is unchanged. No implementation is accepted for R02 yet.

## R25 recovery

`r25-recovered/historical/` preserves extant H13-H15 files byte for byte;
`provenance.json` records their origin and hashes. They are recovered original
records, not newly invented historical samples. The degree-214 input matches
the digest published in Hypercurve PERFORMANCE.md.

New independent verification uses SymPy 1.14.0: exact multiplication/division
and square-freeness reproduce factors 2,8,40,164; only degree 164 changes sign
in [63/64,127/128]. One Bernstein sign variation plus opposite endpoint signs
proves that interval contains exactly one root. The modular-input polynomial
is bound to the selected factor, and good primes 19,29,31 reduce possible
rational factor degrees to {0,164}, proving irreducibility. The earlier
full-polynomial Sturm count timed out at 300 s and is retained as an adverse
verification route. Both the successful scripts and all input coefficients are
included for replay. Existing harness build attribution/crash durability and
the remaining independent-completeness work in R25 are still open.
