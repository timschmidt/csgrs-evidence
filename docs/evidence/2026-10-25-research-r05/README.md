# R05 shared polynomial cut-point evaluation

Disposition: keep the bounded subdivision optimization; the remaining R05 selected-line,
mapped-query, branch-pair and common-component families are open.

Baseline CSGRS commit: `3cca6a894858c8b98497a3cfe81cff5e17e1a7f2`, plus the preceding
R01/R04/R11 kernel changes captured by `baseline-source.patch`. `implementation.patch`
is the final R05 code and acceptance delta. `candidate-source.patch` is the measured
candidate; later edits add acceptance guards only. `final-root.patch` captures the
combined work before adding this archive's own manifest/link. Earlier records retain
new inputs to the earlier milestones. No root source commit or push was made.

`contract.txt`, `target-source-identity.json`, the original failing acceptance test,
`baseline-shared-authority.log`, and `baseline-cut-point-probe.log` establish the
baseline before the prototype. Instrumentation is retained as a patch and was removed
from the private baseline. The production clone/current source relationship is recorded.

`cut_cost_probe.rs` and the top-level paired rows retain the initial five-sample run,
including adverse warming and controls. `cut_lifetime_probe.rs`, `steady/` and
`steady-build-metadata.json` retain the thirty alternating pairs, ten cases and twenty
samples per process (12,000 certified completions). Exact JSON files, sizes and
checksums agree. `steady/analyze_statistics.py` also checks steady post-drop growth,
matched control allocations and cumulative cache retention. Warm statistics use samples
10-19. All sample-zero cold rows remain available. Source construction, exact-definition
serialization and drop are outside the operation timer; definitions are serialized,
not reimported inside this benchmark. Replay and independent residuals are tested
separately. Timings are from a shared unpinned host and are not a general speed claim.

Both standalone manifests initialize their lock from the workspace lock. All retained
32 dependency versions/sources/checksums match that lock, and the variant locks are
identical. Reproduce with a private baseline and candidate checkout, adjust their path
dependencies, copy the named probe source into each manifest's main.rs, and run the
recorded release build command. `cost-build-metadata.json` describes the five-sample
binaries; `steady-build-metadata.json` describes the twenty-sample binaries. Folder
main.rs contains the final replay-policy diagnostic. Harness import/dependency setup
errors are retained; they did not change the repository manifests or lock.

`expanded-unit-tests.log` retains an exploratory replay assertion failure. The
12-case `replay_policy_probe.rs` then reproduces identical baseline/candidate outcomes:
strict transformed selected-point definitions replay, while an approximate-policy
similarity still refuses strict definition export. The final guard explicitly preserves
that existing blocker; no old passing test or production policy was weakened. The
failed test source is preserved as a patch. New tests retain shared cut storage,
selected source/selector and map identity, independent polynomial residuals, reversal,
subdivision continuation, source drop, invalid parameters and budget recovery.

`run_checks.py`, `validation-final/`, `final-summary.json`, and post-documentation
records show all twelve affected checks passing and 214 Rust tests passing. The initial
format-check failure raced a formatter still finishing; its log is retained and the
complete validation set was restarted after formatting. No production change was made
in response. Clippy denies warnings for every root and Hypercurve target/feature;
BRep sections and archives, modeling consumers, docs and the wasm32 Hypercurve target
are included. This is not the entire pre-push matrix, and no push occurred. Direct
FFI/JS polynomial construction/subdivision is not exposed or changed; no release claim.

Compiled executable payloads are omitted with hashes in `excluded-artifacts.json`.
Original baseline source and the full exploratory test snapshot are represented by
the baseline commit and patches instead of duplicate full files. No third-party package
archive is redistributed. The original topology contact is not yet reused by the new
split; no additional polynomial intersection family or resource bound is claimed.
