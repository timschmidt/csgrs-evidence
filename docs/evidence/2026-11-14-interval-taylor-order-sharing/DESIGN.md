# Prepared order restriction

The existing normalized Lie recurrence is a1=F and
`a(k+1)=(partial_t a(k)+D_x a(k)*F)/(k+1)`. Its kth stage depends only on the
original field and earlier stages, not the requested final order. Thus the first
r+1 stages of a program prepared through m+1, r<=m, are exactly the stages that
independent order-r preparation constructs. Tests compare every stage's source
DAG, derivative requests/association, output indices, and complete executed proof.
Pointer checks separately establish storage reuse; they do not define equality.

Restriction copies only the first r+1 immutable stage handles. Each handle shares
its ExpressionProgram definitions and execution slots and its CoefficientProgram
source, requests and derivative program through existing Arc fields. The fixed N
output positions and degree are copied. A same-order result shares the complete
stage vector. There is no new differentiation, scalar evaluation, graph builder,
source simplification or proof authority. Existing executable bodies are byte
identical; the only change in the old source file is a new module declaration.

The ordinary verifier is unchanged. It establishes existence/uniqueness using
the original Picard proof, analyticity over the entire original field domain,
then evaluates stages1..r at the initial set and stage r+1 on the full time/tube
product. The latter supplies the complete remainder, including effects beyond
the retained polynomial order. Restriction is not removal of higher Taylor
contributions without a residual. Preparation alone certifies no trajectory.
Both successful and failed original source guards therefore retain their meaning.

Restriction requests above the available order return UnpreparedOrder before
allocating or generating missing coefficients. Cancellation is checked first;
it is not treated as an invalid order or cached permanently. Equal order costs
one graph work unit and no stage allocation. For lower orders, check aggregate
stage/output entry count `(r+1)+(r+1)*N`; charge one unit, N+8 per stage handle,
and r+1 units for array transfer, then check cancellation before publishing.
These are conservative structural units, not instruction counts. Scalar/native
work remains unchanged. Intermediate handles drop on failure, and shared source
state is immutable. Tests cover exact and one-short work limits, entry failure,
cancellation, retry and use after the source owner is dropped.

Additional retained handles use O((r+1)*(N+1)) storage; exact source graphs remain
shared. The same-order route allocates no new stage array. Shared input graph
storage, payloads, allocator overhead and total heap-byte limits are outside the
structural counter contract. The diagnostic measures requested live bytes for
this operation's owned allocations, excluding common original input storage; it
is not whole-process RSS or a universal memory bound.

This explicit API supports caller-selected finite order portfolios. The existing
adaptive controller still generates each requested order independently. Changing
that controller requires separate qualification of lazy preparation, retained
history, budget exhaustion points and costs; this increment does not silently
change those behaviors or claim that automatic sharing is complete.
