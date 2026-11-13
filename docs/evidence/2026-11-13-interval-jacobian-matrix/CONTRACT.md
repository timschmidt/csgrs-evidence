# Fixed-size projection of source-bound Jacobian evidence

The preceding goal turn made progress: seven rejected ingress experiments were
archived, the latest failing WASM size gate was recorded, and source restored.
Do not repeat them or weaken their gates. This isolated extension addresses the
Phase 6 Jacobian carrier bridge and Phase 12 native derivative consumption.

Hyperlattice already owns IntervalMatrix, and Hypersolve already owns
RegularJacobianEnclosure with immutable source, selected variables, domain and
precision. A second Jacobian representation or proof authority in Hyperlattice
would duplicate these roles. Missing witness: obtain a fixed-size row-major
matrix from regular evidence without dropping its source/domain association or
reimplementing column-major output indexing in each consumer.

Owner: Hypersolve source-bound projection; Hyperlattice owns returned numerical
matrix arithmetic; Hyperinterval owns exact bounded scalar copies. P1, P5, P6,
P8-P10, P17-P20, P35-P37. Add an opt-in interval-lattice feature and a borrowed
JacobianMatrix projection retaining a reference to its regular evidence. Every
matrix entry must equal the generated partial selected by original output row
and ordered differentiation column. Shape mismatch is typed, even for empty
domains. Rectangular, zero-row/column, empty-domain and zero-input unit products
remain distinct. A scalar matrix can be explicitly extracted; ordinary access
retains evidence. No solver status or stronger regularity claim is introduced.

Use the existing single ExpressionError vocabulary, retaining native error
sources. Graph validation/cancellation precedes shape and copying; dimension
multiplication is checked. One caller-owned graph budget covers traversal and
one DyadicBudget covers all coefficient copies. Exhaustion/cancellation returns
no partial projection and leaves the source reusable for larger-budget retry.
Inline output/temporary storage grows with dimensions; no total process/stack
bound is claimed. Existing scalar-refinement exclusions remain unchanged.

Admission: reproduce absent API; independently verify nonsymmetric rectangular
polynomial derivatives, binding/column permutations, downstream matrix/vector
products and norms, shape failures, empty/unit dimensions, small budgets and
cancellation/retry. Retain original field/regularity/trace tests. Verify owning
and downstream checks, feature isolation, emitted code/size and completed cost
before retention. No current consumer, predicate sequence, certificate or
serialization format is changed by this additive bridge. Source evidence has no
trusted deserializer; replay reconstructs it through the existing owner.

The qualification corpus will include a dedicated sanitizer fuzz client for the
new bridge: independently expected polynomial partial boxes, swapped columns,
empty domains, bounded-copy failures, cancellation and retry. It does not change
production projection algorithms or existing derivative fixtures. The current
cost control completes all twelve cases with identical full values, graph/native
work and raw allocation totals. Shared probe ELF is 256 bytes larger (.text +160);
this unfavorable enabled-path result remains part of the retention assessment.
