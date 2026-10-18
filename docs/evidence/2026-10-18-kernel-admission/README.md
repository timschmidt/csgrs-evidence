# Native kernel admission (E85)

This patch rejects invalid stored trigonometric ranges and proves defined
inverse-cosine endpoints before downstream arithmetic consumes them.
It preserves valid private graph bytes and public trigonometric constructors.
The new rational-only proof reuses the native bounded quotient evaluator.

Broad cached-zero reuse is rejected: despite a passing scalar suite, a new
diagnostic demonstrated that it could erase an undefined child. All failed
candidates, compiler errors and raw command results remain retained.

Final-source scalar, predicate, selected curve/circuit, modeling, compiler-floor,
lint, documentation and format checks are detailed in `review-v1.json`.
The modeling checks include empty composition, caches, full-resolution strict
drills and exact linear modeling. Matched import and arithmetic cost controls
retain every sample and make no speedup claim.
The initial cost summary failed because two arithmetic controls retained
608 and 416 bytes on first use in both revisions. All memory counters match;
a separate three-batch probe found zero retention in subsequent batches.
The original samples and failed summary remain. The largest median timing
increase was about 4.9% in these instrumented controls.

General non-leaf domain admission and quantile seed proofs remain open.
The bad p=1/2 quantile seed still produces 100 through import and the public
native constructor. Full release, bindings and stack qualification are open.
Hypervoxel is excluded. No push or full-plan completion is claimed.

`external-evidence-v1.json` identifies the verified raw archive and independent
physical-file expectations. Compiled outputs remain at their recorded paths.
The prior target layers were mounted read-only and independently reverified.
The agent-selected temporary allowance is 46 GiB at its original baseline;
the user-approved Disk B and log limits remain 72 GiB and 100 MiB.
