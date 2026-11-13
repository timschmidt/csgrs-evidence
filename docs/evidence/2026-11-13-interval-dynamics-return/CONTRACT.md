# Preserve specialized path extraction across the return boundary

Previous goal turn: progress, retained Jacobian source 8b63fa68d with ledger
cc056c7c3 and immutable evidence aff2dd277d79231c31895ddea643ce2810fc8c30609d6b11755713e56206e969.
Current objective remains every requirement of docs/INTERVAL_REFACTOR_PLAN.md.
This turn addresses the blocking phase-11 extraction retention gate, not a new
capability in place of completing that migration.

Owner: Hyperdynamics schedules, Hyperpath exact geometry and one-release legacy
compatibility. P1, P4, P6, P8-P10, P19, P21, P27, P31-P37. Required input domain,
reports, failures, source identities and STRICT/APPROXIMATE_512 behavior are the
existing specialized metric/join/feed/lookahead/jerk/axis corpus. No predicate,
solver replay, arithmetic, allocation policy or clock/compiler setting changes.
Missing acceptance: unchanged completed legacy semantics, dispatch and resource
rows without the reproduced owner timing or size regressions.

Prior work found extra large report copies at the legacy error conversion boundary.
A shared error alias lowers motion instructions but grows the owner ELF; blanket
ordinary inlining and boundary-only ordinary inlining are separately rejected.
Do not repeat favorable timings or relabel those failures as acceptance.

First new candidate idea: deprecated direct function reexports where signatures
permit. A Rust 1.95 compiler probe immediately rejects the design: #[deprecated]
on a pub use does not warn at the legacy call, even with -D deprecated. The program
compiles successfully. It would weaken the required migration notice, so do not
replace compatibility functions by such reexports.

Follow-up hypothesis: with the shared native error alias, force inline only the
thin compatibility function bodies; retain real deprecated functions, signatures,
argument order and predicates. This differs from prior broad ordinary inline hints
on both traits/error methods and wrappers. Do not touch any algorithm or source-
owned metric/join method. First reproduce pristine/extraction/error-alias costs
on current source in one isolated worktree, then compare the new variant. A failed
size/code gate rejects it before an expensive timing campaign; no success claim
comes from compilation or documentation. If promising, preserve all 194 exact
result/allocation observations, two-policy dispatch fixtures, owner/downstream,
successive-operation, sanitizer and full artifact/timing gates before retention.

Main's 41 staged paths and Interface's eight edits remain unchanged. All prior
frozen evidence stages are read-only. New logs/patches belong only in this stage;
compiled artifacts and targets stay outside it. No push.

The fresh baseline and original extraction reproduce the earlier owner ELF hashes
exactly. Shared-error-only still grows ELF by 4,248 bytes. Forced compatibility
inlining grows ELF by 6,592 bytes and the complete sized-function union by 14,968
bytes, despite removing 17 function ranges relative to shared-error-only. Reject
that variant. Next causal test: keep those thin forwarders inlined but explicitly
outline the twelve native scheduling entry points they call, excluding equation
constructors and all metric/join/predicate methods. This fixes the intended call
boundary rather than allowing large native bodies to expand into callers. It must
still pass the same unchanged source/error/dispatch/cost gates; fewer symbols is
not sufficient. No other source edits or compiler configuration changes.
