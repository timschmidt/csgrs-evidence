# Firmware interval inventory reconciliation

Phase0 / plan section12 requires an audited ownership/migration inventory.
Current ac1cbfbf6 has52 firmware lexical candidates, all still marked unaudited,
although accepted firmware b9ecf8df contains native Hyperinterval delegations.
Previous turn was progress (continuous noise qualification); all79 prior records
are frozen. Main41 staged and Interface8 pending paths remain protected.

Owners: domain semantics belong to firmware crates; generic numeric interval
arithmetic belongs to Hyperinterval. P1/P6/P18-P20/P27/P31-P37. No production
behavior, public API, canonical bytes, policy, gate or resource limit changes are
proposed. Audit the actual52 declaration bodies and relevant immediate callers,
separating numeric sets from byte/storage ranges and test-only lexical matches.
Review entire interval-carrier impl blocks, not merely matching declaration names.
Record source revision/hashes and concrete test/benchmark mapping; do not label
search hits as proof of exhaustive call-graph review, HIL or full release.
Missing acceptance witness: each current firmware inventory row needs a concrete
endpoint/semantics/allocation/platform/serialization/consumer/disposition record,
with explicit remaining migration and qualification work. Verify source locators
and enum classification mechanically, but body review remains human/model work.
Use existing ledger and inventory, not a competing completion definition.

## Reproduced-state candidate: clock counter publication boundary

Body review found ClockEstimator::observe writes rate/offset, newest sample,
health and deadline fields before accepted_samples.checked_add(1). At u32::MAX,
Arithmetic is returned only after authoritative model mutation. Owner alumina-
clock, P6/P19/P31-P33, plan9 failure/canonical preservation. Input domain: valid
causal observations of a valid retained model at the accepted-count boundary.
This is a correctness repair, not an identical-behavior refactor: erroneous
partial publication must change while all valid success and earlier rejection
ordering remain unchanged. Existing generic interval delegation stays intact.

First add a regression at firmware b9ecf8df without changing production. Check
last legal increment, entire estimator equality after failed observation, unchanged
published estimates, repeated failure, and explicit reset/reconstruction. Compute
the prospective count after all prior validation/intersection succeeds but before
any model field is assigned. Preserve the Arithmetic error and rejection-counter
semantics; do not saturate the accepted count or bypass input validation. Capture
baseline tests, release artifacts and host/target costs; verify successful paths
and canonical heartbeat fixtures. Report hardware/HIL limits honestly. Full52-row
audit remains unfinished until every body has been reviewed; do not mark it done.
