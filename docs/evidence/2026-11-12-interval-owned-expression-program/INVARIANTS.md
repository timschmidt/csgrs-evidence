# Graph invariants and qualification limits

Validation establishes distinct variable IDs, a slot for every variable node,
strictly backward operand edges, and valid roots. This implies a finite DAG.
It validates unused nodes too, including for an empty output list. Scalar
validity comes from Real construction/deserialization, never a serialized flag.

The borrowed-tree importer uses a postorder task stack. Children are emitted
before their parent and their indices are popped right then left. It neither
simplifies nor merges occurrences. Thus all original operators, exponents,
metadata and domain guards remain present. It never owns a recursively nested
Expr, including on rejection. Caller-owned Expr destruction remains recursive.
The deep test dismantles its input iteratively and does not hide that limit.

Evaluation counts each output use and each edge of each reached parent once.
It evaluates roots in requested order and children left before right. A cached
value is moved only at its last counted use; earlier uses clone it. Therefore
an edge/root cannot consume an absent value, and shared graph nodes execute at
most once. This is per-call reuse, not persistent proof/evaluation caching.
Hyperreal's retained scalar caches still exist and can warm.

The initial evaluator cloned every intermediate; a trace comparison caught
changed rational ownership dispatch. Final-use moves repair that unnecessary
clone. Initial trace tests also mixed cold/warm inputs and then ran beside
other tests sharing small constants. Those are invalid count comparisons.
Their failure logs remain. The retained witness matches warm state in a fresh
process and pins the complete matching trace: 11 dispatch events, zero rational
temporaries, GCDs, and sign queries. This is one fixture, not a universal claim
of dispatch or cost equivalence with recursive Expr evaluation.

The 400 deterministic shared DAG fixtures have independent i128 expectations;
the multiplication generator uses small constant right operands to keep that
oracle exact and bounded. The full operator/domain corpus and 20,000-deep source
are retained separately. No fixture was narrowed to make an implementation
failure pass. The earlier wrong trace configurations were test setup errors;
all of their comparison assertions remain in the isolated retained test.

The graph budget charges before structural growth/traversal and checks
cancellation at every charge and publication. Scratch storage is linear in
entry count; scalar payload bytes and arithmetic are not bounded. Real cloning,
equality, serialization/deserialization, destruction and lower-layer caches
are outside this budget. Cleanup allocations are measured only on the named
small-integer corpus. There is no total-work, wall-clock, or heap-byte claim.

This increment is an owned source representation and exact point evaluator.
It can consume existing symbolic derivative Expr outputs. It does not yet
construct derivatives under the graph budget, bind a Jacobian proof to its
source, provide interval images, validate correlated scalar replay across all
Real representations, or certify evolution. Serde replay is unversioned and
experimental; the fresh-process witness covers rational values, one retained
square-root constant and invalid graph references. All Phase 12 completion
criteria remain open.
