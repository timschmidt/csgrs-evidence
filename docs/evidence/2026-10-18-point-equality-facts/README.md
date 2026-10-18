# Shared exact equality facts and Point2 consumption

This change retains the existing cheap Rational equality branches in one
inlined scalar fact implementation. Real exposes Some(true), Some(false), or
inconclusive None; Point2 consumes a sufficient fact and keeps its original
difference/zero-proof fallback. Complete Rational equality retains its full
cross-product path. Unreduced representations remain supported. No policy,
input domain, importer, cache, or serialization contract is weakened.

Independent fraction/cross-product and affine-coordinate expectations cover
exact results separately from wrapper agreement. The committed point tests
permit stronger proofs after warming and reject contradictions. The
[review](review-v1.json) records the final decision, scope and source hashes;
the [cost review](cost-review-v1.json) retains every observation.

The inline candidate passes 1,068 scalar, 2,481 curve, 1,667 native plus three
native doctests, 365 predicate, 250 mesh, 440 default modeling, and 348
all-feature circuit test executions. The 33 curve and seven mesh ignores are
unchanged. Kernel/native all-target all-feature Clippy and documentation pass
with warnings denied. Rust 1.95 all-target all-feature and no-default-feature
checks pass. The original native timing assertions pass, and all 12 complete
native reports remain byte-identical. Passing counts do not substitute for
the independent semantic expectations or establish the full properties plan.

After the final edit, main-checkout formatting and 107 required test executions
pass: seven scalar equality, three public point, 14 point-group, one API
inventory, 29 scalar doctests, and 53 native ingress/aggregation tests. A first
harness mistakenly filtered point::tests instead of the original point::
group; its nine selected tests passed, then its expected-count assertion
failed. The corrected continuation restores the full 14-test filter and
reuses the identical-source successful checks. Both helpers and all original
outputs remain preserved. The implementation and tests were not changed to
hide a failure. The broader suites were run on hash-verified identical
implementation bytes; they are not claimed as rerun on main.

The unchanged nine-family Point2 probe has lower observed repeated medians
in every rational family, including the full large-coefficient case, with
fewer requested allocation calls. Symbolic allocation counts are unchanged.
The matched direct Rational control uses four samples per implementation
with matching native-build dependency features. Decimal repeated equality
has an observed +3.27% median regression: every candidate sample exceeds every
baseline sample. Shared-storage median change is +0.54%. These adverse costs
are accepted explicitly for the broader Point2 improvements, not dismissed.
The point/direct probe executables grow 1,160/56 bytes. Large-coefficient first
live payload grows 560 bytes and subrange repeated live payload grows 736 bytes.
These allocator-instrumented diagnostics are not a universal or statistically
significant speedup, an application speedup, RSS, or an internal resource bound.

The original full-rational Point2 comparison is rejected: its full
large-coefficient case is about 6.7 times slower. The unhinted fact extraction
is rejected as-is for roughly 17–25% ordinary direct-scalar regressions. The
standalone inline scalar pilot remains exploratory because transitive features
differed; its initial compile failure is preserved. The unhinted proposal
combined with exact-track ingress still fails both original timing gates.
No inline/importer combination was executed and no importer is admitted.

The [raw archive](raw-evidence-v1.tar.gz) and
[member index](archive-members-v1.json.gz) preserve contracts, helpers, proposed
sources, failures, controls, command outputs and reports. Frozen sources,
build artifacts and ELF binaries remain separately hash-pinned; every physical
path is hashed independently. Previously indexed E67/E68 paths are verified
without changing them. Prepared helpers are not credited as executed checks.
Mutable dependency caches are outside the closed experiment roots.

The approved 72 GiB Disk B ceiling uses the original free-space baseline;
the 16 GiB root, command/probe, memory, reserve and log limits are unchanged.
The old 921,794-path missing observation is not re-audited or declared recovered.
Hypervoxel remains excluded. Public distribution, the complete pre-push matrix
and the full plan remain open; no push is made.
