# Owned expression program admission candidate

Owner: Hypersolve symbolic representation. Properties P1-P6, P19-P20, P25-P27,
P35-P37. Target: section 10.5; this is a prerequisite, not completed ODE support.

Missing witness on 25a0e578: no owned flat expression program with explicit
ordered bindings, validated replay, nonrecursive graph traversal, cancellation,
and typed graph resource failures. Existing Expr is a recursive tree and its
symbolic derivative remains the authoritative derivative implementation.

Domain: all 17 existing Expr constructors, arbitrary retained Real constants,
ordered distinct SymbolId bindings (unused bindings allowed), ordered outputs,
including zero variables/outputs. Flat replay additionally admits shared DAG
nodes with only backward references. Source guards are never simplified away.
Structural identity includes variable order, symbol metadata, node order,
sharing and output order; it is not mathematical equality or a content hash.

Graph budget: count node/variable/output visits and allocations in entries;
check before structural growth; cooperative cancellation between units. Flat
scratch is O(entries), without a byte or total arithmetic bound. Scalar clone,
evaluation, equality, destruction, and deserialization are explicitly outside
that graph budget and require separate containment. Compilation borrows input,
so rejection never takes ownership of a caller's recursively nested tree.

Witnesses: independent exact polynomial expectations; all operators and domain
guards; output/error order; unused invalid nodes; malformed/cyclic/forward
replay; variable order and source mutation; deep iterative compilation;
small budgets, cancellation, retry; fresh-process serde replay using validated
Real serialization. No derivative, interval image/Jacobian or ODE certificate
is advertised by this increment. No existing consumer is switched.
