# Reproduction

Use clean source `5722d7eaaeb561e74e5b8163c265a2557b7c2822`. Copy archived scripts
and evidence inputs into a new writable stage before executing; never overwrite a
frozen record. Adjust hardcoded checkout/target/output paths to that checkout.

- `run-validation.py msrv` and `run-validation.py stable` contain the eight
  commands/environments. Stable was 1.99.0. New tests: `field_taylor_orders`;
  example: `hyperdynamics --features taylor-flow --example taylor_orders`.
- Build `cargo +1.95.0 bench --locked -p hyperdynamics --features taylor-flow
  --bench taylor_orders --no-run`. `run-benchmark.py` runs its actual executable,
  pins an allowed CPU, checks for concurrent rustc and saves the raw samples.
  Adjust the executable/target location for a new build.
- `prepare-cost-probe.py` creates the saved external allocation/work diagnostic;
  run its saved manifest/source with Rust1.95 release. Live counts are requested
  owned bytes relative to the operation, not whole-process memory. Its final
  source and Cargo.lock are included.
- `package-consumer.py` creates a fresh release dependency cache using the
  repository helper, verifies seven clean packages, unpacks them and builds,
  runs and lints the packaged example. No dirty or no-verify flags were used.
- `package-replay.py` runs all nine non-example test bodies against only unpacked
  archives, enabling the relevant source features. It preserves all assertions;
  source digests and the exact transformed external test are included. The
  fresh-process test serializes definition/max/order/proposal and rebuilds proof.
- `qualify.py` checks source identity, unchanged existing bodies/metadata, counts,
  command exits, package provenance and completed-workload timing samples. It
  validates recorded evidence; it does not replace executing the commands.

`candidate.patch` is the retained feature. `BASELINE.json`, `INTEGRATION.json`,
`pending-before.patch`, `pending-after.patch`, `integration.patch` and
`FINAL-REPOSITORIES.json` describe integration with unrelated pending extraction
work. Integration scripts are historical state-specific operations; do not run
them against another revision. External archive/ledger records define the frozen
digest after all local writers finish. The complete objective remains active.
