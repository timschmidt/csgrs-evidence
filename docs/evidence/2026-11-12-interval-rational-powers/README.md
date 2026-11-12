# Rational signed interval powers

Source commit: 0a5a732635019abbf4fee1dfcec6e19edba87aa8. Baseline: d45d4358c.
The source progress record supplies the contract, monotonicity/critical-point
argument, measured results and open work. Commits remain local.

- missing-witness.log: initial missing-method/source-variant compile failure.
- unused-endpoint-failure.log, pre-critical-selection.patch and snapshots:
  reproduced unnecessary exhaustion for [-1/3,1]^large_even. To reproduce on
  the accepted source, replace rational.rs and rational_powers.rs with those
  snapshots and run the even_zero_crossing test. All other dependencies and
  shared test helpers are unchanged by that correction.
- checks.py/checks.json: final 26-command matrix, all successful. Initial
  matrix is retained separately. guard-regression-* logs run the strengthened
  maximum-required guard fixtures after the last test edit. final-format.log
  and staged-budget.log are the subsequent formatting/tree checks.
- gmp-oracles and regression logs: exact GMP endpoint expectations, actual
  native guard boundary completion/refusal, i64 extremes, native replay,
  generated-output composition and outward dyadic bridges. The 60-second
  external guard-boundary check is explicitly recorded in checks.json.
- fuzz.log/corpus: first 100000-run campaign. fuzz-final.log/corpus-final:
  final ASan campaign, seed 20261115, 100000 runs, 10-byte maximum, 30-second
  cap (14 seconds used). Final corpus includes original seeds and little-endian
  i16 seeds (-1,1,0,2,MIN), (-1,1,2,0,MIN), (0,0,0,0,MIN), (-2,1,0,2,MIN).
  The optional rational feature is enabled explicitly. Huge-exponent buckets
  use zero/unit and native guard facts; GMP powers are otherwise capped at 32.
- coverage-1.95: final clean instrumented run, report/export/diagnostic all
  complete. Dependencies/tests/probes are excluded; the only mismatch is the
  documented excluded Rug OptRational::parts function. Earlier coverage runs
  are retained separately, without mixing their profiles into final metrics.
- samples.csv/cost-*.json/layout.txt: final completed power(3)->power(-2)
  workloads, with independent exact expectations, 4096 warmups and 30 samples
  of 8192 chains per case. Owned exact endpoints are consumed and dropped.
  Initial timings remain under initial-*; no optimization or firmware claim.
  Compiler/hardware/flags, full executable size and SHA256 are retained.

Reproduce the new cost probe:

```
cargo +stable build --locked --release -p hyperinterval --example rational_power_cost --no-default-features --features rational
target/release/examples/rational_power_cost
```

No binaries/build trees/third-party package archives are copied here. Rebuild
coverage objects from the named source/compiler if external target paths are
unavailable. No full-plan, full-coverage, hosted-platform or release/distribution
completion is claimed. Hyperreal's fixed growth policy remains distinct from
caller-selected cumulative work, heap-byte and cancellation contracts.
