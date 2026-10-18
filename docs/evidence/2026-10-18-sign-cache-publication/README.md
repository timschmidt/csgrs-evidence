# Exact-sign publication correction

The shared scalar publisher now preserves a certified sign when delayed work
publishes Unknown. The guard is checked after every failed compare-and-exchange.
Three regressions failed on the old method; all four pass with the correction,
including an independently positive sqrt(2)-1 expression and a subsequent
zero-refinement public query. Other packed facts remain intact.

After integration, actual-main checks passed 934 default and 1,041 all-feature
scalar parent tests, 817 debug library tests, and 5,549 tests across six downstream
packages. Configuration totals overlap. Forty existing downstream ignores remain
open. Doctests, affected strict Clippy, documentation and formatting pass.
Rust 1.95 compilation checks pass for the scalar and immediate consumers.

All twelve complete native report replays match in raw bytes and parsed values.
Original native CPU/wall gates pass. Five alternating allocation-process pairs
produce identical rows across twenty representation lifecycles. No speedup or
whole-cache concurrency proof is claimed. The invariant note states the reader
synchronization and immutable-node preconditions.

The original 5 GiB storage stop, later 8 GiB copy-batch overshoot, and earlier
scalar harness failures remain retained. Storage migrations permit 12 GiB in
/tmp and 96 MiB of cumulative logs without resetting baselines or changing
workloads, time, memory, root-volume or approved Disk B limits. New copies are
preflighted. Historical missing artifacts are not claimed recovered; /tmp
artifacts are volatile. Source, protocols, raw logs and individual artifact hashes
are retained here, with large build artifacts preserved at their recorded paths.

This admits only the scalar publication correction. Exact-ingress completion,
release validation, broader P4 coverage and the full plan remain open.
Hypervoxel remains out of scope.
