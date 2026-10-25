# R14 preparation experiment: no production change retained

The two-variant stopping budget is complete. The proposed midpoint kernel is
already present at its scalar owner: `Real::eval_poly` calls homogeneous integer
Horner for these rational arrays, with leading/zero-term shortcuts and no final
normalization needed for sign. Variant 1 duplicates that route and establishes
no benefit. Variant 2 only shares fixed coefficient preparation and bracket
conversion. Its latency benefit remains inconclusive, so neither variant is
adopted under the literal nonregression rule in the Hypercurve handoff §6.3.

The contract, source patches, commands, dependency/toolchain and binary digests,
raw phase rows, unfavorable pilots and corrections accompany this record.
Every checkout has its own Cargo target and writable compiler cache. The final
tracked sources, instrumentation module and binaries match their build records
(`phase-and-workflow/final-attribution-check.json`). No primary production file
was changed for R14.

Both captured degree-27 filter leaves reproduce the repeated work: 15 and 20
coefficient preparations, reduced to one each by variant 2. Five alternating
diagnostic pairs measure baseline preparation at median 0.259 ms (0.417% of the
first proof) and 1.143 ms (0.0102% of the harder proof). Midpoint evaluation takes
about 89–90% of both proofs. These instrumented, loaded-host measurements locate
work; they are not native latency admission or an allocation claim.

Independent exact rational evaluation verifies every tested enclosure stage.
The first bounded helper proves Positive after 1,024 bisections; the harder
helper returns None after its existing 4,096-step limit. The historical full
sign label describes a caller fallback, not this helper. The initial diagnostic
which confused those scopes is retained with its correction. No production
fixture or limit was weakened.

Baseline and both variants pass the unchanged 1,152-polynomial differential
oracle, exact midpoint/fallback checks (14 cases × three policies × two replays),
captured-leaf expectations and all-feature/all-target Clippy with `-D warnings`.
Variant 1 also passes 6,336 independent rational point comparisons; those tests
and its source remain recorded when the duplicate point kernel is removed.

The unchanged ignored public refilleting gate passes for both variant 2 and
baseline, under external 900-second and 8-GiB address-space limits. The single
candidate run is 161.61 s / 72,852 KiB maximum RSS; baseline is 173.70 s /
72,768 KiB. These are correctness completions, not a paired performance result;
the diagnostic run explicitly reserves that scope. Root selection, receipts
and refinement authority remain unchanged.

A new performance experiment would need a changed premise at the actual
midpoint-evaluation owner, with its existing shortcuts preserved, before another
variant is justified. Persistent caches, incremental Bernstein powers, solver
changes and wider resource claims were not tested here. Native paired latency,
allocation, binary size and full downstream admission are unnecessary for this
rejected/inconclusive private change and have not been claimed.
