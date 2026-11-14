# Reproduction

Copy this frozen record into a fresh writable stage before running any driver.
Pin the repositories to BASELINE.json or source-commits.json as appropriate,
then adapt absolute paths in the probe manifests/drivers. Keep the two native
release profiles identical. Do not run builds concurrently with cost sampling.

The unchanged maintained conformance sources were copied into foc-probe; only
local dependency paths, the release profile and the observer executable were
added. baseline-probe targets the pristine firmware/core revisions. `observe`
prints every complete row; compressed baseline/final rows preserve the full data.
`cost` reports complete native/shared actions, exact checksums and allocations.
final_measure.py reproduces the final two-compiler alternating experiment and
its seeded paired-median bootstrap. fixed_measure.py validates the hash of its
clock-stage baseline artifact and compares the final fixed primitive control.

Regenerate the baseline/candidate WASM consumers from their separate manifests.
wasm-replay.py accepts an artifact path; run it with the recorded Wasmtime 50.0.1
environment. It rejects imports, checks the independent exact integer oracle,
and retains the unchanged per-call fuel cap. No hardware timing follows from it.

The compiler/test/build logs, candidate patches, exact source commit identities,
feature trees, target-check commands, original uncommitted Interface snapshots,
lock patch, full artifact hashes and caller/proof contract are all retained.
STATUS.md distinguishes passing software gates from baseline Clippy findings and
unmeasured device/full-application gates. Fresh builds of the legacy control must
use the pinned baseline firmware, since production now delegates to the kernel.
