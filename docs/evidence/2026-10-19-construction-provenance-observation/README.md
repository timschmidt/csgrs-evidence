# E98: construction evidence can disappear between supported operations

Twelve current-revision pipelines reproduce the missing provenance boundary.
An approximate hull reports `Approximate512Consumed`; its extracted mesh then
passes strict transform, Boolean composition, binary STL export/import,
closed-PWN validation and further composition. Those later operations expose
local `Certified` receipts, with no surviving receipt for the original hull
claim. Exact and approximate histories produce identical STL bytes.

The tiny outside-point fixture demonstrates a real distinction in represented
sets: the intended hull includes an additional pyramid of volume
`2^-1200 / 3`, which the approximate output omits. A separate sign proof run
after the complete pipeline certifies the original point is outside. The
later topology certificates correctly describe the resulting geometry; they
do not certify that earlier construction intent. The fractional translation
also changes coordinates at the documented binary32 boundary.

The [observations](observations-v1.json) retain exact expectations, source
review, receipt sequences and qualifications. All eight original cases are
preserved in the expanded twelve-case run. The [probe](observation-v3.rs),
[contract](contract-v1.md), [outside-point addendum](outside-point-addendum-v1.md)
and [checkpoint](checkpoint-v1.json) bind the evidence to the target revision.
The [follow-up acceptance gate](next-change-contract-v1.md) requires separate
construction evidence through native, modeling, format and binding paths.

No production code is changed or admitted here. This investigation is not a
repair, release qualification, full provenance audit, or completion of the
properties plan. Historical missing artifacts remain unreaudited.
