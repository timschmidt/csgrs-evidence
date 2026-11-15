# Source-retaining affine voxel enclosures

Kept additive phase-13/Tier-3 transformed-bounds capability. Source commit
3366c48c36eb48c30613f9facffdf6e05b6f5b3d; base
3df1ac8c4cd1a6fcf04b33bf233926db5706bc71. contract.md predates implementation.
The reproduced baseline witness has a finite certified scalar enclosure while
ExactAffineTransform::map_bounds returns UnknownScalarOrdering. The mathematical
coefficient is zero by the sine addition identity, outside the admitted exact
normal form. No earlier capability assessment was assumed current.

## Retained implementation and meaning

The optional interval-enclosure feature exposes ExactAffineTransform::enclose_bounds
and immutable AffineBoundsEnclosure. Source endpoint pairs denote coordinatewise
closed hulls, including reversed and singleton coordinates, consistent with the
existing exact transform. Hyperinterval::DyadicInterval::from_real and hull enclose
all exact inputs; Hyperlattice Cartesian matrix-vector multiplication and addition
compute the containing box. The original exact transform and source endpoints are
retained without rounding or replacing the source. Singular matrices are valid.
A Cartesian enclosure is not the correlated image, occupancy, or topology.

The new Hyperlattice/interval-hyperreal and companion/hyperreal feature forwarders
expose native scalar conversion through the existing re-export. They avoid a new
Hypervoxel dependency edge and leave the root lockfile and primitive no_std/default
features unchanged. Hypervoxel's separate lockfile records the activated packages.
The discarded direct-dependency draft and feature-plumbing rationale are retained.
No old map_bounds arithmetic, exact comparison order or predicate body was changed.
The feature adds a typed HypervoxelError::IntervalEnclosure variant retaining the
lattice/scalar source chain; clients opting into the new feature see that variant.

All conversions and arithmetic share one dyadic budget, with fixed three-dimensional
loops and no variable-sized report container. Precision denotes scalar enclosure
spacing, not promised final width or tightest rounding. Native work/size failures
abort the result and independent retries remain possible. Hyperreal refinement,
exact-value clone/drop and heap-byte accounting retain native exclusions. No total
resource, asynchronous cancellation or universal symbolic decision claim is made.

## Regression and downstream qualification

Six self-contained tests cover the original ordering blocker and new successful
containing box, 17 integer matrix cases with independent eight-corner extrema,
reversed coordinates, rational/algebraic coefficients, singular maps and point
sources, immutable source isolation, subsequent native interval consumption, exact
budget success/one-unit-short failure, precision size failure and retry, and fresh
process reconstruction. Reconstruction is not serialized proof replay. The first
seven-test layout reused a sibling private fixture; its assertions were retained
in a merged portable test so packaged tests do not require that helper.

The final owner all-feature suite passes 84 tests. Stable/MSRV all-target Clippy,
strict rustdoc, default tests, native Rust 1.95 tests, WASM compilation, native lattice
bridge tests, and 13 affected Hypersdf voxel intake tests pass. An independent
Rust 1.95 path client passes exact affine source -> certified box -> source-bound
SDF whole-cell inside proof, retaining both source associations. This is an external
path client, not package/registry release qualification. The fixed firmware backend
passes on Rust 1.88 thumbv7em-none-eabihf. A Rust 1.95 ARM check first failed because
that target is not installed; no Rust 1.95 ARM success is claimed. WASM was compiled,
not executed. Formatting and primary regression/budget/diff checks have separate
command records. validation-summary.json indexes completed checks.

Setup diagnostics are preserved: missing array length inference, an initially
incorrect tightest-grid assumption for Hyperreal's sqrt enclosure, and a probe
literal type-inference error. The algebraic test now uses independently squared
rational bounds to test the advertised enclosure rather than requiring a rounding
width the API does not promise. Rational exact assertions and the original hard
case remain. No production failure was relabeled as success.

## Completed-workload costs and disposition

Rust 1.95 release probes use CPU0, disabled ASLR, warm scalar caches and no competing
builds. Timings include full returned output and destruction. Authored transform,
source construction and warmup are outside the epoch. Allocation measurements are
requested allocation bytes, not retained size or peak RSS. Every native report
retains its definition; the exact baseline returns only exact extrema, so these
are different completed contracts and not a speedup comparison.

| Native report | Median ns | Allocations | Requested bytes | Scalar work |
| --- | ---: | ---: | ---: | ---: |
| Integer | 8761.95 | 90 | 720 | 47932 |
| Rational | 9131.47 | 96 | 912 | 54964 |
| Algebraic | 12217.50 | 129 | 1896 | 108446 |
| Undecided coefficient | 12457.05 | 138 | 1968 | 55790 |

The unchanged exact mapping path was measured in eight same-path processes,
B/C/C/B/B/C/C/B, five batches of 4096 completed operations per representation.
Candidate/baseline median ratios: integer 0.99935, rational 1.00023, algebraic
1.00624. Allocation counts/requested bytes match at 1/176, 0/0 and 6/272.
These short samples do not establish a speedup or global no-regression guarantee.
The all-feature legacy probe grows 2,864,680 -> 2,880,512 bytes (+15,832). The native
probe is 2,839,600 bytes and has a different reachable workload. Raw binaries,
commands, sources, allocations and every timing sample are retained. Temporary
probe examples were removed from the checkout after builds. Both comparison
builds were freshly compiled at the same checkout and executable path.

Keep the new feature for demonstrated completion where exact endpoint ordering
was undecided, with these explicit costs. This is not a behavior-preserving
refactor or an optimized replacement for exact map_bounds. Exact enclosure
consumption is qualified only for the stated domain and corpus. Whole-resource,
remaining migration performance, broader consumers, hardware/HIL and coordinated
release obligations remain open; this does not complete a phase or the goal.
All 41 staged extraction paths and eight Interface edits remain unchanged;
firmware is unchanged, and all 62 prior frozen stages verify. No push/publication.
