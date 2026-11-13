# Provider-owned errors for the pending specialized dynamics extraction

Previous turn: progress; current ledger 8ea26dac524dacdaaab6c255a54c355f8cb9de2f
records rejected direct-reexport, forced-forwarding and native-outlining variants.
The full goal remains every requirement of docs/INTERVAL_REFACTOR_PLAN.md.
All earlier evidence stages remain immutable. Main's 41-path extraction and
Interface's eight integration edits are preserved until a candidate is qualified.

Owner: Hyperdynamics generic scheduling protocols and kernels; Hyperpath geometry,
legacy error and deprecated entry points. P1, P4, P6, P8-P10, P19, P27, P31-P37.
Input domain: the same specialized exact path/feed/join/lookahead/jerk corpus,
including every existing error, policy, source/receipt and resource behavior.
Missing acceptance: remove whole-report legacy error conversions without changing
large result semantics or regressing owning/downstream costs. Earlier alias-only
and inline/outline approaches fail; this is a distinct type-ownership design.

MetricSpan, MetricPath and JoinSpan are introduced only by the unretained
extraction. Add their associated Error rather than changing the identity of the
already public RouteCertificationError. The error must losslessly receive native
DynamicsError. Metric errors must compare exactly with native dynamics errors so
the existing jerk-refinement branch can distinguish JerkProposalUncertified from
all other failures without discarding an arbitrary provider cause. Join and metric
composition requires an explicit conversion preserving the join cause. Native
examples may use DynamicsError itself. Keep the legacy geometry error type intact,
including its variant order, Debug and conversions. Add no inline attributes.

Algorithms return the chosen source error directly, constructing that error at
the failure site before any large successful report exists. Geometry callbacks
return their original error. Small native scalar/sign guards retain their owner;
convert their typed failures through From. Private large-report helpers follow
the same output error, preserving arithmetic and predicate order exactly. Replace
the specific error-pattern match by a guarded comparison by hand; do not apply a
mechanical rewrite to control flow or uncertainty handling. Axis-only concrete
APIs retain their existing error conversion, because they have no source protocol.
Deprecated functions and all signatures using legacy geometry remain available.

This is an experimental API design for an unpublished pending extraction, not
an admitted change to a retained protocol. Validate a non-Clone provider error
with retained cause, exact comparison of native failure kinds, native defaults,
and all pre-existing independent and old/new two-policy report/dispatch fixtures.
Then apply the full unchanged result/allocation/code-size/owner-timing/downstream
and successive-operation gates. A typed provider error cannot be collapsed into
a generic unsupported outcome. No tolerated regression or favorable subset can
replace those gates. Build baseline/extraction on the current revision before
measuring this variant. Record failures and restore if retention fails. No push.
