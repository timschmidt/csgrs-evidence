# Reproduction

Copy the frozen record to a new writable stage before running its drivers.
Use BASELINE.json and source-commits.json for baseline/final source identities.
Baseline firmware release builds include only the new test module as an
uncommitted test-only addition; it does not enter release code. Exact retained
patches are in the two *-source-commit.patch files. Candidate workspace paths
were redirected to the isolated candidate core; production uses stable sibling
paths. Adapt absolute paths in probe manifests and scripts to your checkouts.

Run Hyperinterval test/all-features and clippy/all-features/all-targets on 1.95,
with -D warnings for Clippy/rustdoc. Run no-default-features fixed,integer,serde
on 1.88, including fixed_midpoint and integer_midpoint. Run firmware tests and
all-target Clippy for alumina-foc, alumina-clock, alumina-sim on 1.88, then the
clock/FOC thumbv7em-none-eabihf check. Interface uses the unmodified client at
2708686 with consistent candidate dependency paths, --locked native tests and
wasm32-unknown-unknown check. Its two known Clippy errors are recorded separately.

Build baseline/candidate native probes with the same release profile and both
compilers. verify-consumers.py checks complete observer output, zero allocation
reports and artifact size/hash. measure.py and measure-195.py replay the servo
cost probes; measure-consumers.py replays clock/FOC. Do not compile or run other
benchmarks concurrently with timing. Intermediate candidate snapshots are
rejected experiments, not replacements for the final source commits.

build-consumers.sh builds maintained downstream consumers. wasm-replay.py
accepts the FOC wasm artifact path and uses Python exact integer expectations.
servo-wasm-replay.py compares fixed midpoint/width to independent Python integer
expectations across extreme and seeded full-range endpoints. Both use the
recorded Wasmtime 50.0.1 environment and explicit fuel caps.

Run preservation checks outside frozen stages. verify-prior-stages.py writes
inside this record and therefore must not be run here after archival.
