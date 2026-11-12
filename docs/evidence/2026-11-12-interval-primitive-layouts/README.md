# Primitive layout experiment — 2026-11-12

Source commit `94e23534708352d6de05ec7262fa722cb301646d`. Baseline and patch digest are in SOURCE.json;
initial-state.json records all four clean repositories. The source commit's
INTERVAL_REFACTOR_PROGRESS.md contains the full scope, interpretation, and
adoption decision. No production implementation changed. The standalone
package and both dependency locks are committed under
crates/hyperlattice-interval/conformance/primitive-layouts.

## Admission and outcome

ADMISSION.md was written before source changes. The prototype separates lower
and upper arrays, validates reconstruction through the existing scalar APIs,
and preserves operation order and canonical empty behavior. Its six tests
pass under 1.88 debug/release, stable debug, and nightly ASan; the existing
owner's 45 tests/doctests pass. The prototype is retained as an experiment.
Transparent production replacement is rejected: several operation/IEEE timings
regress, the executable grows, reconstruction adds validation, and the existing
borrowed lanes API cannot be implemented from separate arrays without another
storage/API decision. Storage savings alone do not satisfy admission.

## Commands and evidence

- run-checks.py and checks.json: exact 15 selected commands, exit codes and
  elapsed times; check-*.log are the final logs. Tests were unchanged by the
  final Cargo.toml EOF whitespace cleanup. final-diff.log and
  repository-budget.log cover the final staged result.
- asan.log: `RUSTFLAGS=-Zsanitizer=address
  CARGO_TARGET_DIR=/tmp/interval-refactor/primitive-layouts-asan cargo +nightly
  test --locked --manifest-path
  crates/hyperlattice-interval/conformance/primitive-layouts/Cargo.toml --lib
  --test layouts --target x86_64-unknown-linux-gnu` (exit 0). All six tests pass.
- environment.json: hardware, toolchains, dependencies and affinity. Extra
  tool versions are in tool-versions.txt. Source/release profiles are committed.
- native-measure.py: exact full-output fresh-process comparisons for 17 seeds
  (136 outputs/provider). native-probe-outputs.json retains values, not just
  checksums. Single-provider probes use const generic selection. Their named
  symbols confirm the other provider's chain is not linked.
- native-samples.csv: 6,912 final pinned CPU 0 timing samples, 16 warmups,
  alternating order, four families, nine dimensions and eight operations.
  Allocation count and bytes are zero in every sample. Native summary medians
  and sizes are in native-summary.json. The entire focused run took about
  1.66 seconds; no confidence interval, frequency control, or universal speed
  claim. Timer-scale rows are not speedup evidence. Each scalar arithmetic
  result is the same qualified enclosure; no Hyperlimit policy/traces exist
  on these primitive paths. Extra reconstruction checks preclude calling this
  a predicate-preserving production refactor.
- Native executables: 545,288→591,712 bytes, GNU size text 424,966→469,166.
  Unique-address out-of-line named kernel symbol bytes 72,971→113,342;
  aliases are deduplicated. This is not total monomorphized-code coverage;
  inline bodies are included in whole text but absent from named sums.
- wasm-replay.py: run with /tmp/interval-refactor/tools/bin/python (Wasmtime
  50.0.1). Its independent integer oracle passes 612 full endpoint pairs / 1,224
  calls, with four invalid selector traps and two unqualified IEEE probes.
  wasm-rows.json retains every exact endpoint and fuel count. The zero-import
  module is 297,168 bytes; digest and max fuel in wasm-summary.json. Fuel is an
  engine instruction metric, not Wasm time or hardware cycles. Binaries are
  reproducible from source and not duplicated into this archive.

## Adverse and superseded results

first-checks retains the initial Clippy type-complexity failure; a type alias
fixed it. initial-diagnostic.txt records the earlier generic inference error
and final staged whitespace correction. pre-probe-checks passed before the
size harness correction. initial-measurements retains the first runtime-bool
probe's measurements: it linked both providers and its timing overlapped the
root formatter. Those measurements are excluded from final claims. The final
size harness selects at compile time; final timings ran after the checks ended.
No test, failure, qualification, or input domain was weakened.

## Limits

No production adoption, phase completion, whole-stack workflow, HIL, browser,
new fuzz campaign or universal closure claim. Peak temporary stack and total
monomorphized expansion remain unmeasured. The new storage experiment does not
resolve the existing solver/firmware performance blockers, independent
center/radius carrier, Jacobian/fact work, or the Interface positive-helper
proof-transport gap. The full 15-phase goal remains active. No push.
