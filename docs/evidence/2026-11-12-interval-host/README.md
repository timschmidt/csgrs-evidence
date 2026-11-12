# Interval host carrier qualification

Source commit: caa8adb9fe6819a8f5b136956c9a57bc5b8c3350. Local evidence, not uploaded.

Final runs are in matrix-final, coverage-final, fuzz-final and fixed-client-final.
Each matrix row records its exact command and exit status. Fuzz commands and
statuses are in fuzz-final/results.json. Coverage includes instrumentation data,
compiler artifacts and the production-source report. Environment files retain
compiler/CPU details and symbol sizes. metadata.json and the normal dependency
trees describe the feature graph; the fixed-only tree has no dependency edge.

Initial failures and exploratory timing runs are retained alongside successful
reruns. Oracle adapter failures were mixed-number Display import mistakes, not
changed geometry fixtures. Early dispatch tests shared cached scalar storage;
the final test compares identical cold/warm sequences in separate processes.
The two candidate-reconstruction patches below apply to the source checkpoint.
They recreate only production differences affecting the corresponding probes;
they do not recreate earlier test adapter mistakes.

host-samples.csv is the initial un-inlined product boundary; other qualification
work overlapped that run. host-samples-inline.csv is the subsequent run with
inlined product/endpoint boundaries. No whole-solver speedup or migration gate
is inferred from these finite warm probes. fixed-client initially included
host-only error variants in firmware builds; final variants are feature-gated.
The final fixed executable matches the prior text/data/BSS sizes. Build trees
are intentionally omitted; their commands, manifests, locks and outputs remain.

The full goal remains active. Solver kernel migration, full coverage, hosted OS
runs, hardware timing and all later interval/lattice/dynamics phases remain open.
