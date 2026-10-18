# Affected compiler-floor compatibility

After the native and downstream stable checks, use the previously identified
Rust 1.95.0 compiler in a fresh target. Check every HyperDRC and Hypercircuit
target with all selected-package features and with default features disabled.
This checks the affected source and its new test allocator at the declared
compiler floor. It is not a repeated runtime suite, Clippy-on-1.95 claim,
feature-powerset claim or public distribution qualification. Preserve the
same source, lockfile, resource limits and Hypervoxel exclusion.
