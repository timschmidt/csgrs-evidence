# Reproduce bounded adaptive Taylor selection

Use Rust 1.95.0 and the source/base revisions and patch in SOURCE.json/candidate.patch.
Locked dependencies, exact commands and outcomes are in qualification.json and cost-
builds.json. Use isolated checkouts. Frozen stage scripts write beside themselves;
copy them into a new mutable stage and update absolute checkout/build paths before
execution. Main's independent staged extraction is not part of the source commit.

The baseline missing-acceptance.rs test is compiled with feature taylor-flow; it fails
with E0599 for the absent adaptive_taylor method. The final maintained integration
test is crates/hyperdynamics/tests/adaptive_taylor.rs. qualify.py runs all owner tests,
strict all-feature/all-target Clippy, warnings-denied docs, disabled features, WASM,
formatting and repository budget. The downstream physics command enables
certified-flow,hyperdynamics/adaptive-taylor and runs --test certified_flow. It exercises
nine tests; the tenth requires the separately qualified dispatch-trace feature.

build-cost.py prepares the baseline existing taylor_evolution benchmark, candidate
with adaptive feature disabled, candidate with it enabled, and the new adaptive_taylor
benchmark. inspect-artifacts.py dumps sections to scratch outputs without modifying
executables; compare-symbols.py retains duplicate demangled symbols and compares
size/address multisets. Original artifact hashes are checked before timing.

After all other builds/tests/profiles stop, measure.py runs sequential CPU0/ASLR-disabled
controls (base/default/enabled and reversed), actual Criterion --bench constant-flow
measurements with 1s warmup,2s measurement,10 samples, and three fresh-flow trials of
1000 complete operations per mode with16 warmups. Existing exponential/constant proof
assertions also execute before Criterion filtering. The new benchmark compares complete
fresh preparation+integration+remainder checks+proof destruction on constant and
exponential sources, identical exact horizon and initial set, endpoint quality and
local truncation bounds. Independent rational expectations are checked. It compares
fixed order3 with bounded automatic selection; rejected orders, preparation/cache and
retained histories are part of the automatic strategy's cost. No cold-call universal
speedup, external competitive ranking or equal proof-record-size claim is implied.

prepare-observer.py copies the full maintained new benchmark and adds an allocation
observer. Build its external manifest in release mode; run ADAPTIVE_TAYLOR_ITERATIONS=32.
Verify dependency versions against the workspace lock. The observer checks zero
incremental live heap after result destruction and records retained/peak allocation and
original graph/scalar counters. Separate resource epochs omit benchmark-only analytic
oracle/check costs. Existing source/prepared cache overhead, allocator/platform costs,
scalar payload/refinement and whole process memory remain excluded from bounds.

No full pre-push/workflow matrix, external solver, fuzz/coverage/sanitizer, hosted OS or
embedded HIL qualification follows from these local commands. No push occurred.

Initial control separations motivated compare-allocated.py and the separately retained
measure-controls-same-path.py campaign. All default allocated sections except build ID
match the baseline, but the follow-up still shows a small Picard timing separation.
Both campaigns and the accepted cost/uncertainty remain explicit; do not delete earlier
samples or reinterpret the screen as universal no-regression.
