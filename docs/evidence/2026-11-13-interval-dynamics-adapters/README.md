# Path-dynamics adapter experiments: neither retained

The full fifteen-phase interval goal remains active. This investigation starts
at retained CSGRS `65a832b8cf108894fe0913a77f4253407f48c332`, with the exact
41-path pending extraction captured in `pending-main.patch`. `CONTRACT.md`
records the owning layer, unchanged domain and acceptance gates before edits.
Main and Interface sources were not changed. The isolated checkout is restored
to the original extraction candidate; neither experiment is accepted.

## Controlled source changes and artifacts

The first experiment adds 20 ordinary inline attributes to the five trait/error
adapter methods and fifteen legacy compatibility wrappers. The second keeps
only the five methods in `routing/dynamics.rs`. Their bodies, scalar/predicate
order, public error identities and all report fields are unchanged. The benchmark
body differs from the retained baseline only by the pending extraction's two
deprecation allowances. `source-invariants.json` verifies these boundaries.

All four owner executables were built with Rust 1.95.0, locked dependencies,
unchanged release policy and the same checkout path. Read-only ELF analysis
counts the union of every defined sized function range, merging aliases and
overlaps; six unsized function symbols remain in each artifact.

| Variant | ELF bytes | Defined function union | .text bytes |
| --- | ---: | ---: | ---: |
| Retained baseline | 13,312,600 | 8,044,187 | 8,118,103 |
| Original extraction | 13,304,584 | 8,036,358 | 8,110,279 |
| All adapters/wrappers inline | 13,319,296 | 8,059,498 | 8,133,527 |
| Five boundary methods inline | 13,304,608 | 8,036,427 | 8,110,359 |

The broad experiment fails size admission: +6,696 ELF and +15,311 function-union
bytes against the retained baseline. A per-name diagnostic shows substantial
expansion in Criterion callback bodies; aliases in that diagnostic are not a
second total-size measure. No timing qualification or complete functional
qualification is claimed for this rejected broad variant. The narrower variant
passes this size comparison but fails the separate timing gate below.

The complete 194-case observer preserves all full Debug result observations and
allocation rows for the original extraction and both experiments. Epochs include
completed results and their destruction after warm-up, with zero live-byte delta.
These are differential observations, not independent geometry oracles or canonical
wire serialization. Existing package versions remain pinned; the observer adds
only its own package record. Its body comes from the actual owner benchmark,
with the Criterion harness replaced by the retained observation harness.

## Full timing sweeps

Six sweeps run in order baseline, original extraction, narrow experiment, narrow
experiment, original extraction, baseline. Each completes all 194 cases. Every
run uses the same executable path and argv, CPU 0, scoped warm-up, disabled ASLR
for the subprocess, 0.1-second per-case warm-up, 0.2-second measurement and ten
samples. No host governor, sysctl, compiler policy, benchmark case, fixture or
acceptance threshold changes. Raw samples and estimates from all 1,164 measured
case executions are retained; no favorable-only reruns or selection are used.

`wide-comparison.json` compares pointwise mean-estimate confidence ranges. An
adverse separated case has the lower confidence bound from both candidate runs
above the upper confidence bound from both baseline runs. There are 65 such
cases for the original extraction and 109 for the narrow experiment. These
counts are observed gate failures, not a family-wise statistical guarantee.

Examples for the original extraction include parser-256 ratio 1.06169, mixed
route parsing 1.06410 and arc-wire exact lifting 1.07953. The narrow experiment
improves parser-256 to 0.94960, but worsens other cases: differential-pair skew
1.04129, rectangular-pad edge clearance 1.05064 and rational-quadratic evaluation
1.06147. The latter cases have separated adverse ranges. Ratios are averages of
the two point estimates divided by the average baseline point estimate, not
bootstrap ratio intervals. Aggregate improvement or one favorable parser result
does not clear the per-case retention failure. Clock/governor and other host
activity remain outside this harness's control.

## Execution profiles and remaining uncertainty

After all timing sweeps, 21 successful Callgrind runs measure seven selected
cases for the baseline, original extraction and narrow experiment. Each counts
exactly 32 warmed complete-result/drop callbacks at a common executable path.
They are instruction-reference observations, not hardware cycles or a universal
resource bound. The new profile records are compared only within this build and
tool run, not numerically mixed with older archives' profiles.

Parser, importer, skew and rectangular-pad instruction counts are identical
across the three variants. The narrow experiment reduces original extraction
counts for corner lookahead and mixed jerk, but still exceeds baseline:
lookahead 2,507,304 versus 2,503,560; mixed jerk 2,296,200 versus 2,293,160.
Symmetric jerk remains 2,053,160 versus 2,050,344. The separate 256-byte
MetricSpan length adapter disappears with inlining, but eliminating that call
does not remove all motion overhead or qualify the complete workload.

These results reject blanket wrapper inlining and the five-method boundary hint
as retention fixes. They do not establish the hardware cause of unchanged-
instruction wall-time differences. Future extraction work still needs a coherent
solution to ABI/return or code-generation costs with the complete contract; it
must not alter unrelated parser mathematics or waive the failed gate.

## Restoration and validation scope

`restored.json` verifies that all experimental source edits were reverted and
the isolated candidate's staged patch exactly matches the original 41 paths.
`restored-qualification.json` records focused routing/migration tests, the axis
migration suite, formatting and whitespace checks after restoration. Those
checks apply to the restored candidate, not the rejected variants. No new full
Interface, WASM, sanitizer, all-feature downstream or pre-push qualification is
claimed by this investigation. The preceding retained coordinate-stage archive
contains the prior combined-worktree qualification; this turn does not replace
or strengthen its scope. No push occurred. The extraction remains pending,
and all other open plan phases remain in scope.

The focused routing run passes three tests, including fresh-process feed/join
and jerk report/dispatch differentials; the axis migration suite passes its one
fresh-process differential. A separate capture preserves all six legacy/direct/
compatibility transcripts under STRICT and APPROXIMATE_512: each has 92 report
and trace lines, identical within policy. No count assertion was changed.

Raw build targets and executable binaries live outside this archive. The prior
immutable archives and Interface's eight edits remain preserved. Final state
checks and the evidence registration are recorded separately from these mutable
investigation scripts.
