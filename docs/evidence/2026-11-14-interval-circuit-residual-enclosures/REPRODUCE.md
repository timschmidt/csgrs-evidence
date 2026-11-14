# Reproduction

Copy this frozen record to a new mutable directory before executing any driver.
Update absolute stage/worktree/target paths and inspect assertions first. Integration
and commit scripts describe one-time transitions and must not be rerun against an
already integrated checkout. No historical evidence stage is a working directory.

Baseline: e6ecb73b3a904298058f9f280e6d0e1809e8c000. Candidate:
83b608d92c7d5fdaec1dd1e146709948f33e1348. Create separate worktrees at these
revisions. The main checkout additionally contains the preexisting Phase 11
extraction, which is not part of the candidate commit. SOURCE.json and the patches
identify the changes exactly; INTEGRATION.json documents reversible application.

Use Rust 1.95.0 with locked dependencies. The new capability is opt-in:

```sh
cargo +1.95.0 test --locked -p hypercircuit --features interval-residuals,dispatch-trace
cargo +1.95.0 clippy --locked -p hypercircuit --all-features --all-targets -- -D warnings
RUSTDOCFLAGS='-D warnings' cargo +1.95.0 doc --locked -p hypercircuit --features interval-residuals --no-deps
cargo +1.95.0 check --locked -p hypercircuit --no-default-features
cargo +1.95.0 check --locked -p hypercircuit --features interval-residuals --target wasm32-unknown-unknown
cargo +1.95.0 fmt --all -- --check
bash scripts/check-repository-budget.sh
```

qualify.py records the initial full core run and local gates. The final focused
run adds the algebraic-source witness; validate-main.py repeats full core tests
and all-feature Clippy with the pending extraction. TEST-CORRECTIONS.md describes
initial harness mistakes and the existing conservative quotient derivative bound.

build-cost.py builds separate baseline/default/enabled MNA artifacts and the new
maintained interval_residuals benchmark. The baseline/default artifacts must have
the recorded identical SHA-256; do not infer universal binary invariance from this
one workload. measure.py pins CPU 0, disables ASLR, and executes six MNA controls
plus three new trials. Stop builds, tests and profiles before measuring. Each new
trial completes 10,000 iterations per strategy after warmup and verifies complete
residual/derivative bounds, metadata/source identity and root exclusion. Reuse
retains a prepared program and its caches. Preparation is reported separately;
this is neither a cold-call speedup nor a minimal-hull benchmark. Existing controls
have visible drift and are a limited screen, not a formal equivalence test.

prepare-observer.py copies the complete maintained benchmark body and a previously
used external allocation counter, replacing timing instrumentation. The external
Cargo.lock starts from the workspace lock; observer-dependencies.json verifies all
external dependency versions match. Final allocation build removes an initially
unused copied helper. Each counting epoch starts after warmup and excludes source
objects/caches retained beforehand. Construction/drop epochs must return to zero
incremental live heap. Resource rows measure retained query/preparation bytes and
native/graph work. None of these measurements establish a global live-heap bound.

The new optional Cargo.lock dependency shifts the existing extraction diff's blob
IDs and hunk offsets. integrate.py verifies all remaining patch content is identical,
and exact reversal in an alternate index recovers the original pending tree before
mutating main. All 41 pending paths remain. There is no push or full release claim.
