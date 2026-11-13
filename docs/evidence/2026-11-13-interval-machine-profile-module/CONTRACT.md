# Isolated typed-fraction construction module

Previous goal turn: progress. Three rejected machine-profile ingress variants
are archived at f1d491d7627331dcb4b3a46ef1568e92049fd60c. Main's new f5ba9ce9b
changes only ledger/index files from the 3e4382664 source used here. Current
isolated cost worktree is clean at 3e4382664; main 41-path extraction remains
untouched, as do Interface's eight pending changes.

Hyperreal owns the u64/NonZeroU64 exact fraction and its canonical reducer.
Hyperinterval owns the closed nominal-plus/minus set; Interface retains units,
nominal and configuration identity. Properties P1, P3-P6, P8-P10, P17-P20,
P27, P31-P33, P36-P37. Domain and downstream contract match the rejected typed
variant: arbitrary finite Rational nominal, full u64 radius numerator and
nonzero u64 denominator; no extra rational sign query. All preexisting scalar
constructors and interval domains remain. Rational work remains unbudgeted.

The preceding in-place constructor shifted original construction source lines
and changed unrelated exception metadata. Hypothesis: a child module containing
only the new inline typed wrapper can preserve existing construction bytes and
locations while sharing the same reducer. This is not a proof of size stability.
Do not alter existing dispatch, predicates, bodies, attributes or tests. Public
method and exact reduction must be identical to the prior typed prototype.

Reproduce the absent API test and baseline scalar benchmark. First compare the
owning borrowed_ops binary and sections. A failure of that gate rejects this
variant before expensive consumer qualification. Passing it still requires
owner/trace tests, same completed native/WASM profile outcomes, exact allocation
counts, emitted code/binary sizes, performance and successive-operation gates.
No source is retained on the strength of a small constructor test alone.
