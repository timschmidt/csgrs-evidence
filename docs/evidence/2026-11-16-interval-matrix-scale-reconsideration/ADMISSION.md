# Matrix scaling reconsideration

Previous goal turn: progress (FOC audit and bounded-size exception). This stage
reproduces the size-only matrix scaling candidate from frozen stage 77 against
c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb. No subagents or push. The user also
authorizes committing/discarding user changes: the four policy files are now
committed coherently; the 41 staged extraction and eight Interface paths remain
untouched pending their own implementation review. All 81 earlier stages frozen.

Owner: hyperlattice-interval matrix algebra, plan section 5/phase 6; P1/P3/P5/P6,
P8-P10/P18-P20/P27/P36/P37. Missing witness: public row-major matrix scale does
not compile at the target revision. Scalar multiplication and fallible arrays
already exist in the owner. The useful extension is shared-context matrix
scaling, preserving explicit empty/unit products, outward endpoints, typed
resource failure and downstream matrix/vector/replay composition. It is a
Cartesian enclosure and deliberately does not claim shared-scalar correlation.

Restore only the matrix candidate and its original hard cases. Reproduce the
missing API before source edits. Add any necessary conformance/dispatch/cost
witnesses without weakening existing assertions. Use current baseline binaries,
not stage77 hashes, and identify each by source path (example/bench names collide).
Old supported workloads compare identical completed contracts; a separate paired
manual-loop/API consumer measures the new operation. Preserve predicate order.

The normative admission protocol's bounded exception applies. Budget data are
predeclared in size-budget.json. Each artifact and metric must pass both absolute
and percentage limits, independently. No cross-target netting. This is the first
exception in the named matrix-algebra program; cumulative baseline is fixed to
this source revision, and subsequent exceptions must carry its consumption forward.
Final executable/WASM artifacts are measured; symbol sums are only additional
code attribution. Current native matrix/dynamics probes and the standalone WASM
boundary consumers form the measured envelope. Confirm firmware and Interface
normal dependencies before declaring flash headroom inapplicable; no object-size
proxy can qualify a changed firmware image. No numeric size allowance relaxes
latency, allocation, memory/stack, dispatch, exact output or validation gates.
