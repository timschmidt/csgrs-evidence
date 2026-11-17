# Combined runtime qualification — not executed or admitted

Compare ee4932b4c with f65589b44 using the sealed, source-verified artifacts.
The added correctness witnesses do not use earlier wrong answers as speed
baselines. Retain all 30 older queued commands, including standalone component
comparisons. Eight additional guarded commands qualify composition.

Owner/public timing uses eight ABBA/BAAB invocations, 30 Criterion samples,
0.5-second warmup and one-second requested measurement. Existing source and
all completed workload definitions remain unchanged; the added complete-chain
harness uses the already qualified byte-identical fixture. Counts are 15 owner,
28 alpha, 46 linear, 30 Jacobian, 76 domain and 16 chain cases. Materialized
reports and their drops are included in the public loop. Rebuilt-input loops
include input destruction; process caches can already be warm. No cold-cache
latency claim follows. Each invocation has 300-second containment. Each queued
campaign retains its separately declared finite total budget.

The source-attributed successive benchmark runs all 21 original chains at their
original long lengths, with eight ABBA/BAAB invocations separately for validated
and untouched histories. Each complete invocation has 900-second containment,
plus the driver's five-second termination grace. A history has 7600 seconds
of external cumulative queue budget. All 200 expected steps must complete with
certified outcomes, and validated steps must have certified manifold topology.
All non-cost row fields must agree across calls. The unchanged integration
suite supplies additional exact oracles/geometry assertions. No shortened chain,
partial journal, typed failure or zero driver exit substitutes for these gates.

Step, validation and predecessor-drop times remain separate. The original
benchmark does not separately time final-result destruction; process completion
includes it together with startup, journal sync and teardown. Interpret total
process time accordingly. Requested allocation traffic/peaks are not RSS or a
complete allocator-overhead/whole-lifetime measurement. Do not infer unmeasured
memory bounds or a memory exception from these columns alone.

Both runners pin CPU0, disable ASLR, verify exact executable hashes, and retain
before/after host/process records. The host guard's body was extracted unchanged
from timing.py into runtime_support.py for reuse, with its original text retained
in timing-guard-before-extraction.txt. Competing routing/enclosure/KiCad/compiler
work aborts qualification. Observations at boundaries are not proof of exclusive
host access throughout a run. No automatic retry hides an adverse observation.

analyze-timing.py preserves every process estimate and reports four paired
process comparisons, with limited-power empirical intervals and adverse screens.
It grants no acceptance automatically and introduces no runtime allowance.
Inspect every case, confidence interval, original gate and host record before
retention. Size/memory proposals cannot waive a runtime regression.

Prelaunch report-output control: all five solver timing drivers explicitly set
HYPERSOLVE_SKIP_BENCHMARK_REPORTS=1. The existing finish_benchmark_report hook
otherwise writes tracked benchmarks.md under its embedded CARGO_MANIFEST_DIR.
This disables only that post-benchmark documentation exporter; sample settings,
measured bodies, assertions and raw Criterion output stay unchanged. Original
drivers and before/after hashes are retained in timing-report-output-controls.json
and their stages. The 38 queued command records remain unchanged.

Successive analysis is prepared in analyze-successive.py. It rechecks all eight
source-attributed completions, original 21-chain/200-step corpus, artifact/driver
and journal hashes, unchanged geometry/certainty rows and all 17 host-boundary
records. It retains per-step, per-chain and driver-wall comparisons separately.
Zero baselines have no invented ratio; absent untouched validation remains
absent. Peaks and live-at-start values are maxima, never sums across steps.
Allocation columns cover step calls only, excluding initialization, validation
and predecessor/final destruction; they cannot establish a memory exception.
The tool introduces no allowance and cannot admit a candidate.

The 26 controls in successive-analysis-controls.json use synthetic inputs only;
no runtime measurement or geometry result follows. They exercise incomplete
journals, changed schema/corpus, noncertified output, geometry mismatch, source/
artifact/driver/hash changes, external host load, zero baselines and an exact
2x adverse example. Their short overlap with the first queued DRC replay is
recorded in successive-analysis-quiet-overlap.json. Preserve that limitation
and every replay result; the second predeclared DRC replay is independent.
