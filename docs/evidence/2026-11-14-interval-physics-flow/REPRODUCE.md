# Reproduce the physical flow consumer

Use Rust 1.95.0, source/base revisions in SOURCE.json, and their locked dependencies.
The candidate patch is complete, including the optional feature and maintained bench.
Use an isolated checkout; do not run these stage writers inside an archived/frozen
record. Copy drivers into a new mutable directory and update absolute checkout/build
paths first. Baseline main also has an independent staged extraction recorded in
BASELINE.json and pending-before.patch; that extraction is not part of the source commit.

qualify.py records owner tests, strict Clippy, warning-free docs, disabled features,
WASM, formatting and repository budget commands. The missing witness is the preserved
integration test missing-acceptance.rs, run as a hyperphysics test on the base revision.
The final maintained tests are crates/hyperphysics/tests/certified_flow.rs; all ten
pass with all features (including dispatch-trace). Downstream commands are in
main-validation.json and the separate downstream circuit/benchmark Clippy logs.

build-cost.py builds six benchmark artifacts without timing them. Wait for all other
builds/tests/profiles to stop. measure.py runs the existing physics controls and three
10,000-operation flow trials on CPU0 with ASLR disabled. Its initial Criterion runs
are acceptance-only; measure-dynamics.py runs actual four-way Criterion timing.
Retain raw logs, including unfavorable controls. Every new-mode iteration constructs,
verifies materialized outputs against fixed expected endpoints/tubes, and drops its
result. Preparation and retained-source reuse are separate modes; cache reuse is part
of the observed benefit. This does not compare continuous proofs with discrete Euler.

prepare-observer.py copies the complete maintained flow benchmark and adds an external
allocator observer; build its manifest in release mode and run with
PHYSICS_FLOW_ITERATIONS=32. The observer verifies zero incremental live heap after drop
and records retained/peak bytes and consumed graph/native units. Verify external package
versions against the workspace lock. inspect-artifacts.py uses objcopy with explicit
scratch output to preserve executable hashes. compare-symbols.py compares symbol size
multisets; duplicate demangled symbols are retained. Artifact binaries remain outside
the archive; hashes and command lines are included.

No full pre-push, fuzz/coverage/sanitizer, hosted-platform or embedded HIL qualification
is implied by these local commands. No push is authorized by these drivers.
