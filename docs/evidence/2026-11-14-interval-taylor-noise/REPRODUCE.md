# Reproduction

Use source commit `2de9c0ae569a5e40fe97d8e4d179406834c677d3` in a clean checkout.
Do not execute archived scripts in place: copy this evidence record to a new
writable staging directory and adjust hardcoded checkout/build/output paths.
Do not run integration/finalization scripts against unrelated worktrees; those
scripts assert exact recorded source/index states and are historical operations.

1. `run-validation.py msrv` and `run-validation.py stable` contain the eight
   commands and environment for each toolchain. Stable was 1.99.0; pin that
   version to reproduce the recorded compiler. Use the saved lockfile and
   installed dependencies. New tests are `program_taylor_noise` and
   `field_taylor_noise`; the example is `hyperdynamics --example taylor_noise`.
2. Build the benchmark with `cargo +1.95.0 bench --locked -p hypersolve
   --features taylor-noise --bench taylor_noise --no-run`. `run-benchmark.py`
   locates/runs the recorded binary with CPU pinning and copies raw Criterion
   samples. Adjust its binary path for a fresh target directory.
3. `prepare-cost-probe.py` creates the external manifest/source for the separate
   work/allocation diagnostic. Final `cost-probe.rs`, manifest and lockfile are
   included. Run release using Rust 1.95.0; count allocation traffic only.
4. `package-consumer.py` records the coordinated seven-crate package command,
   dependency cache/overlay setup, archive extraction and external consumer.
   Its helper path points to the prior interval-release stage; read/copy that
   helper from its archived record and update the path. No --allow-dirty or
   --no-verify flags were used. Package artifact digests and VCS data are in
   `package-artifacts.json`.
5. `replay.py` adds the saved external `replay.rs` binary, builds with source
   serialization features, runs three fresh proof reconstructions and four
   invalid controls. Saved JSON inputs/results and manifests make the data
   independently inspectable. Rebuild proof, never adopt serialized flags.
6. `qualify.py` verifies the expected exits, test totals, archived consumer
   sources, replay outcomes, benchmark samples and unchanged existing source
   bodies. It verifies recorded evidence, not a substitute for rerunning code.

`candidate.patch` isolates the retained feature. `pending-before.patch`,
`pending-after.patch` and `integration.patch` document integration with unrelated
unaccepted extraction work. The first integration failure was metadata-only and
is retained. `BASELINE.json`, `INTEGRATION.json`, `FINAL-REPOSITORIES.json` and
`REVIEW.json` define exact repository state and preservation checks.
