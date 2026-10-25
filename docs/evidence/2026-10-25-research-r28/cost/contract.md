# R28 native fit-cost veto and subsequent admission gates

This performance-only experiment protects the complete public exact line-fit
query, including its certainty receipt, result validation and destruction.
Twelve fixtures cover native and general rational quarter circles, selected
circle output, constant points, line images, noncircular conics and mixed-sign
typed failures. Both policies must preserve the independently specified outcome.
The first timed query follows input construction, which may already prepare
facts; it is not a claim of globally cold caches. Seven subsequent timed batches
of 8,192 queries provide a within-process warm median. Each query checks the
receipt and result, validates exact line endpoints when Fit is returned, updates
the deterministic result checksum and destroys the result. Input construction,
JSON export and process startup are outside this focused query timer. Full
output-workflow timing is a separate required gate before adoption.

Use the frozen R28 baseline (the restored trace checkout, without any trace
instrumentation) and private candidate. Normalize source/probe build paths and
retain locks, flags, hashes, native sections and all samples. Build native System
allocator and counting-allocator executables separately. Allocation traffic,
calls and live/peak changes explain cost; instrumented latency is excluded.

After a separate functional/variance pilot, freeze a final design of thirty
balanced randomized A/B and B/A process pairs, seed 20261025, pinned to one
available CPU. No builds or other task-owned heavy work run during final timing.
Warm batch repetitions are not independent samples: each process contributes
one first-query observation and one median batch per-query observation. All
48 fixture/policy/phase metrics are protected. Paired log-ratio Student intervals
report marginal and Bonferroni simultaneous 95% confidence. The literal
nonregression gate requires every simultaneous upper bound <=1; no margin is
introduced. The predeclared circle target (fixtures 0-3, both policies, warm)
requires upper bounds <0.8. Preserve every adverse and inconclusive row.

A protected direct-API regression is an early veto. If this stage fails, retain
the negative result and do not claim a whole-workflow speedup or deploy the
candidate. An inconclusive nonregression result remains inconclusive. Passing
this stage alone cannot admit the optimization: it must then preserve full
geometry/provenance/receipt artifacts in matched complete circle and board
workflows, with independent set oracles, construction, continuation, export and
destruction; complete affected owner/downstream/feature checks; and disclose
allocation, retention and native size costs. Existing instrumented circle/Nano
traces supply dispatch and completion evidence only. Nano reports six release
blockers and does not establish release readiness; its original single-board
filter skips the all-board snapshot comparison.

No R28 primary production change is admitted by these preparations.
