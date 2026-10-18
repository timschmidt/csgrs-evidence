# Exact-track ingress after shared scalar equality facts

The unchanged exact-track importer remains **unadmitted** on revision
`540074a8c05ccc676d7c70b8f0093f98804b81d9`. Its 75 focused semantic tests pass,
but both original KiCad resource gates fail. No production source changes.

Current baseline reproduction fails all ten archived stroke tests and three
of twelve archived aggregation tests; the other nine aggregation and all 39
existing source-error tests pass. The failures include missing round-cap area,
source decimals collapsed by the finite adapter, and unsupported extreme
coordinates. These are reproduced on the current admitted libraries.

The candidate changes only the track importer in production code. It reuses
native strict round-capped stroke construction, retaining structured failure
and certainty receipts. The reviewed source-test migration preserves all six
extreme fixtures and their area, bounds, membership, receipt and downstream
handoff assertions. It does not include the unadmitted cache proposal.

The full-board test consumes **369.825772873 worker CPU seconds** against its
120-second limit. The separate copper-neck test measures **129.559299287 body
wall seconds** against 60 seconds; its overall process takes 366.03 seconds,
including work outside that assertion. Gerber passes. These clocks are distinct.
The focused tests do not certify every full-board outcome, and a smoke/timing
gate is not an independent geometric oracle. Full output/API migration and
broader downstream qualification remain required before importer admission.

A separate default-feature release build with frame pointers and debug level 1
profiles both complete original boards. A counting-only permission preflight
passes, but the first sampling attempt is denied before running the fixture.
An explicit userspace-callchain probe passes; the continuation reuses the same
binary with `--user-callchains`, without changing host security settings. The
failed attempt, successful probe and all original outputs remain preserved.

The 3 Hz userspace-cycle profile recovers **1,227 samples**, zero reported lost
samples, and no empty stacks. Unknown leaves account for 0.01081% of sampled
cycle weight; 99.809% includes the board-test ancestry. Polynomial normal-form
work appears in 41.780%, exact sign in 44.140%, curve subdivision in 23.762%,
and Point2 equality in 9.604%. Inclusive categories overlap. Normal-form work
and subdivision overlap in 15.846% of the total weight. The largest recovered
non-scalar normal-form caller is curve comparison at 17.608%. The declared
allocator-leaf subset contributes 22.247%; this is not an allocation count.

These observations point to scalar proof work during curve processing for
further reproduction. They do not select a patch, establish a speedup, or
justify an importer-specific shortcut. The instrumented full-board assertion
also fails at 374.311107312 worker CPU seconds; its changed code generation
makes that a diagnostic observation, not a matched release comparison.

The [review](review-v1.json) records the acceptance decision and next experiment.
[Profile observations](profile-observations-v1.json) retain the denominator,
recovered symbols and limitations. The [raw archive](raw-evidence-v1.tar.gz)
contains contracts, helpers, overlays, complete logs, raw perf data and the
additional consumer attribution. The [archive index](archive-members-v1.json.gz)
records each physical file independently. Build artifacts and executable copies
remain separately hash-pinned. Prepared but unexecuted helpers receive no
execution credit; mutable dependency caches are outside the closed roots.

The approved 72 GiB Disk B ceiling and original free-space baseline remain;
all other execution, storage, memory and log limits are unchanged. No run
hit containment. The earlier 921,794-path missing observation is inherited,
not re-audited or declared recovered. Hypervoxel remains out of scope.
The complete pre-push matrix, shipped user path and full plan remain open.
No push is made.
