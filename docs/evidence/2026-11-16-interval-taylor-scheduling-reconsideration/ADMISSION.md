# Taylor derivative scheduling: bounded-size reconsideration

Previous goal turn: progress. Matrix scaling was freshly reviewed and removed
for an independent completed-workload latency gap. User policy edits and two
array-lifecycle tests are committed. All 82 earlier evidence stages are frozen.
The user authorizes managing all repository changes; 41 staged extraction paths
and 8 Interface paths remain pending their own review, unchanged in this stage.

Target revision: 924bef14429b31229c82fc20de43deadd35a13ce. Owner: Hypersolve
expression_program::taylor::derive. Properties P1/P4/P5/P6/P8-P10/P18-P20/P36;
plan scalar/solver migration, repeated coefficient construction and dynamics
composition. Source read confirms an ExpressionNode clone before the scheduling
visit's budget checks. That visit only needs the by-value two-slot input index
array. The later ready visit still needs its clone while mutating Builder.

Reproduce the existing named-coordinate/large-rational witness and every work/
size boundary before editing. The proposed exact patch removes only the first
clone, retaining budget checks/charges, stack push order, memo access, arithmetic,
root identities, retained graph and ready-visit cloning. Preserve the known
allocation witness, all both-policy exact output/serialization/receipts/dispatch
controls and the original source graph. No inline/layout adjustment is proposed.

The bounded exception is governed by docs/admission.md. Reuse the published
interval-refactor-2026-11 account and its fixed c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb
baseline. Do not reset existing test-harness consumption. Existing caps remain:
per native artifact file/text growth <=4096 bytes AND 1% incremental, <=16384
bytes AND 2% cumulative; named-text <=1024 bytes AND 0.5% incremental, <=4096 bytes
AND 1% cumulative. WASM file/code <=1024 bytes AND 5% incremental, <=4096 bytes
AND 10% cumulative. The separately qualified lattice test-harness cap remains
unchanged. New complete coefficient/wrapping/WASM consumers use the corresponding
existing native/WASM caps; establish their fixed-baseline artifacts before editing.

The small allowance is justified only by demonstrated removal of unnecessary
owned construction/heap work with identical completed contracts. Other gates
remain intact: owner/consumer time, allocation/peak/live memory, observable local
stack, scalar/predicate order and counts, ordinary/error/retry behavior. Measure
final binaries and code, not just objects/symbols. Verify firmware/Interface
feature closure before declaring flash inapplicable; no firmware allowance or
fit claim is granted by this declaration. Full goal remains active.

The retained count assertion, if admitted, is added to the existing
program_coefficients integration harness. It records independently checked
polynomial values, full baseline serialization, receipts and all dispatch
counts. Its separate test-only allowance is file <=32768 bytes AND4%, text and
named text <=16384 bytes AND4%, both incremental and cumulative against c9f1f9ac.
This allows the additional diagnostic/fixture data and the test entry point;
production artifact caps remain unchanged. Measure this final test executable
explicitly; this is not an allowance for arbitrary production growth.
