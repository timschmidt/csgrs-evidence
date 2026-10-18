# Correction to E70 profile attribution

E70's prose incorrectly called the entire `::subcurve` symbol group
"subdivision." That group also includes contact queries, support bounds,
containment, line-image recognition and point-hull filters. Its raw counts
and profile remain preserved; this correction supersedes that interpretation.

Exact recovered function names attribute **1.8162%** of sampled cycle weight
to subdivision, with **0% recovered overlap** with polynomial normal-form
work. The earlier 23.762% broad group and 15.846% broad normal-form overlap
must not be cited as subdivision measurements. Support-bound computation
accounts for **6.7649%** and contact relations for **9.3360%**.

The [correction](correction-v1.json) lists every exact symbol and period.
The [verification](verification-v1.json) independently reparses all 1,227
samples, recomputes every group/overlap period, and verifies that the union
covers every original broad-group sample. Inclusive categories can overlap;
missing and inlined frames limit attribution. These are diagnostic cycle
weights, not calls, allocations or predicted speedups.

The copied [executed preparation helper](reproduce_v1.py) preserves the original
attribution calculation and its separate, clearly identified test-preparation
section. Its paths refer to the original validation control location. The
profile inputs and earlier evidence are unchanged. No runtime tests are
credited to this documentation correction and no implementation is admitted.
The circle-envelope experiment remains open and separately unadmitted.
