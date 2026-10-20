# Spherical transverse chart and UTM selection evidence

Started 2026-10-18; final validation continued on 2026-10-19. Base commit:
`4b7b0ed4c`, branch `hyperspatial`. The final source hashes, compiler
versions, host and environment are in `source-metadata.json`. This is the
spherical component of E2 and angular UTM selection; ellipsoidal rectification,
geodesic measurements, E3–E4 and A1–A5 remain open. The production dependency
boundary remains native Hyper crates and all numeric values remain Real backed.

The admission contracts are
[the transverse chart](../../docs/admission/e2-transverse.md) and
[the native exponential repair](../../../hyperreal/docs/admission-negative-exp-tail.md).

## Reproduced failures and retained cases

- `missing-api.log` and `missing-utm-api.log`: missing public APIs before implementation.
- `negative-exp-*-probe.log`: standalone exp(-10^320) requests succeed. They do
  not establish that composed evaluation succeeds.
- `atan-negative-exp-baseline.log`: the independent public Hyperreal consumer
  aborts on the default Rust thread stack. The temporary diagnostic in
  `negative-exp-fallback-diagnostic.log` identifies 1065 nested squares. The
  diagnostic was removed; `atan-negative-exp-fixed.log` retains the successful
  uninstrumented reproduction after the kernel repair.
- `huge-easting-failure.log` and `huge-easting-fixed.log`: original transverse
  fixture, including all ±10^320 and symbolic-offset eastings, three northings,
  public clones, changed origins and ECEF consumption. No fixture was reduced.
- `native-tail-representations-baseline.log`: exp(-10^320 ln(3))
  stops at the eager Rational budget. Reusing Real's power contract preserves
  its existing symbolic fallback and ordinary exact rational results.
- `transverse-representations-baseline.log`: a symbolic-scale physical strip
  endpoint becomes Unknown after normalization. Direct endpoint comparison
  retains the proof; approximate equality cannot canonicalize the value.
- `internal-switch-baseline.log`: an unresolved comparison at |eta|=1 needlessly
  stops a valid inverse. Overlapping formula domains permit a separate proof.
- `stable-checks-initial.log`, `msrv-checks-initial.log` and
  `cache-matrix-initial.log`: Clippy rejects the enlarged pole-convention enum.
  Sharing immutable longitude relations fixes its size without a lint allowance
  or a public API change. Later logs with these names minus `-initial` supersede them.

## Independent comparisons and cost

`oracles-representations.log` retains the PROJ4RS 0.2.1 comparison on 49 spherical
transverse coordinates. At latitude 0°, longitudes ±80°, its northing differs
from exact zero by 0.3005480788438524 m; these two results fail the unchanged
3e-7 m criterion. `proj4rs-transverse-baseline.log` retains the initial failing
assertion. The final fixture checks native northing against the independent
equatorial identity, records those comparator rejections, and tests the foreign
inverse independently using validated native projected coordinates. Native
fresh-input round trips and foreign inverse comparisons retain the 3e-14 rad
criterion. The failure is consistent with the comparator's spherical
acos-based northing formula (`proj4rs`'s `estmerc.rs`), not a chart ambiguity.

`benches-stable.log` and `benches-msrv.log` retain all optimized Hyperspatial
benchmarks, including five warm trials at latitude 49°, longitude 2°, height
100 m. The new spherical transverse benchmark accepts 100/100 native and
50,000/50,000 comparator round trips at its stated angular criterion. Model
evaluation and evidence contracts differ: these timings are not an exact-kernel
speed ratio. The older ellipsoidal-Mercator comparator still rejects all its
benchmark samples at that criterion; its residual is not hidden or relaxed.

`scalar-consumer-cost.json` retains the exact independent consumer source and
five fresh-process release trials, including fork/exec startup and peak RSS.
Every trial completes; it is completion/containment evidence, not a comparison
against the aborting baseline. The host was also running other validation work.
Logs ending `-before-shared-relation` and earlier coverage runs are superseded;
only the final coverage report and final benchmark logs support final claims.

## Final validation

All final commands completed successfully. `summary.json` gives machine-readable
counts; the command-bearing logs and reports retain the raw evidence.
`raw-logs.tar.gz` preserves every log byte-for-byte. Displayed `.log` files only
remove trailing whitespace and surplus EOF blank lines for Git whitespace
checks; `log-formatting.json` records both hashes. Inputs, thresholds, outputs,
failures and timing samples are unchanged.

| Gate | Final result |
| --- | --- |
| Stable 1.99.0 `scripts/checks.sh` | 154 test executions; formatting, all targets/features, docs, Clippy `-D warnings`, both independent README consumers and fuzz build/lint pass. |
| Rust 1.95.0 `scripts/checks.sh` | Same 154 executions and checks pass. |
| Four primitive-cache configurations | 300 test executions and all-target Clippy pass. Final focused boundary checks add 60 passing executions, including ±10^-500° around the equator/UTM coverage limits. |
| Independent formulas and representations | 484 ordered scalar pairs plus 176 cold/warm regime cases, all 22 certificate families; poles, both singular edges, huge eastings, changed parameters and strict/approximate provenance paths pass. |
| WASM | Library check and Clippy with warnings denied pass. No runtime binding is claimed. |
| Workflow audit | `zizmor --pedantic --strict-collection .` reports no findings. |
| Hyperspatial production coverage | 1875/1902 lines (98.5804%), 2576/2754 regions (93.5367%), 201/201 functions. The 95% line gate is unchanged; the 100% line target remains open. |
| Native inverse coverage | 136/140 physical executable lines (97.1429%), preserving its separate 95% gate. |
| Repaired native exponential functions | Computable kernel 46/48 physical executable lines; `Real::exp` 36/36. These are whole-function subsets, not whole-Hyperreal coverage. |
| Final directed search | 176 fresh-process executions in 22 independent buckets, four candidates over two generations; 38 selected cases, no failures. Full dispatch observations retained. |
| Final ASan mutation campaign | 28,142 executions / 901 s, 12,249 counters and 42,474 features, 883 MiB reported RSS; 213 initial seeds, no new artifacts. |
| Final-selection ASan replay/mutation | 1272 executions / 61 s, 214 initial seeds, no new artifacts. |
| ASan regression binary | All 15 transverse/UTM tests pass, including the overlapping-domain and approximate-equality regressions. |

The final 900-second mutation campaign uses the first directed search's selected
cases plus the full 176-case regime seed set. The second campaign uses the final
search's 38 selections. Both run the final production implementation. The
initial pre-sharing campaign (26,613 executions) is retained separately and is
not counted as final-source evidence. Sanitizer counter/feature totals measure
the instrumented binary, not production line or branch coverage.

The focused cache/MSRV/ASan reruns include the final extra sub-float UTM boundary
fixtures. They add no production code; the measured coverage report's production
source hashes were checked against the final files. Native scalar validation is
described in its linked admission record. Source metadata identifies the base
revision plus final content hashes; these commands ran before the containing
commit existed.

No push or complete workspace pre-push validation is claimed. Branch coverage
on stable Rust, universal completion, physical model accuracy and native scalar
wall-time/heap bounds remain unproved. Finite coverage and campaigns do not
discharge those goals. None of the remaining development-plan stages is closed
by this spherical-chart increment.
