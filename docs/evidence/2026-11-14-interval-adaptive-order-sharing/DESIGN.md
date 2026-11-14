# Candidate lazy adaptive preparation

The mathematical owner remains Hyperdynamics's normalized Lie recurrence:
`a1=F`, `a(k+1)=(partial_t a(k)+D_x a(k)*F)/(k+1)`. Each stage depends on
previous stages and the original time/state binding, not on the eventual maximum
polynomial order. An existing order-r program contains stages1..r+1. Extension
retains those exact shared stages and generates only r+2 through the new remainder.
Restriction still selects a complete mandatory remainder at its requested order.
No Taylor polynomial is treated as an exact trajectory without a remainder proof.

The candidate adaptive controller uses the original finite search, quality
checks, halving/regrowth and proof history. It prepares the first demanded order
normally, then extends only absent higher orders. It does not eagerly prepare the
maximum. Complete successful extensions are cached within one integration report;
a failed extension cannot publish a partial program or poison a larger-budget
retry. Shared graph identity checks establish storage reuse separately from the
full mathematical/source/derivative artifact comparisons.

The caller explicitly selects share_preparation. The returned wrapper records
that strategy while exposing a borrowed original report. Its graph work cutoffs
can differ from independent preparation; native arithmetic work is unchanged for
the completed comparison fixtures. Entry/work/cancellation checks include copied
stage handles and output indices. Existing exclusions for exact scalar payloads,
refinement and total heap bytes remain: this is not a whole-process resource bound.

The default controller has no new runtime mode. The typed candidate selects its
preparation branch through a const generic. Inverse statement comparisons prove
that removing that branch restores the original source order. The recurrence is
extracted into an always-inlined typed helper. That source-level equivalence does
not prove compiler output, cost or binary equality. Those gates are measured
separately, and observed failures prohibit retention.

This is an unretained experiment. The macro candidate failed preparation timing;
the typed candidate has positive raw-size deltas in several existing benchmark
executables. Exact artifact agreement and a beneficial new shared workload cannot
by themselves waive the repository's behavior-preserving refactor gates.
