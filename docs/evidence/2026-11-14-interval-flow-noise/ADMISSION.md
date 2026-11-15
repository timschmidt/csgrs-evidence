# Correlated Taylor flow endpoints and fresh residual transport

Target base: 53a12e355028ea1979c0fc8cf576ab41820178bf. Owner: Hyperdynamics for
trajectory meaning and proof composition; Hypersolve for finite exact DAGs,
Taylor coefficients/remainders, affine output forms and retained-noise selection;
Hyperlattice/Hyperinterval for vector/scalar enclosures. P1, P5-P10, P17-P20,
P36-P37; plan sections 10.6/10.7 and phases 12/13. No existing controller,
predicate order, threshold, default feature or acceptance fixture changes.

Missing witness: existing FlowTaylorReport returns a Cartesian endpoint. A
forward shear x'=y, y'=0 followed by its reverse x'=-y, y'=0 over equal dyadic
durations is exactly the identity. Feeding boxes loses the first step's x/y
correlation and enlarges the returned set. Reproduce this on the target before
production edits. A new result must feed the next checked step retaining the
shared initial uncertainty and separately bounded new remainders.

Domain: the existing analytic ExpressionField/FlowTaylorProgram grammar,
finite dyadic parameter domains, exact singleton times, const-generic state
dimensions including zero, empty products, finite bounded compositions and
explicitly chosen finite Taylor order. A caller-proposed Picard tube must pass
the existing self-map/contraction and whole-tube analytic checks. No restriction
to linear fields; linear/reversible examples provide independent exact oracles.

Represent the current outer set as exact center + exact coefficient columns *
independent bounded parameters + independent residual intervals. Its image is
a certified superset of the actual reachable set, not equality or a replacement
exact trajectory. Retain original initial data and all prior field/proof nodes
through shared immutable evidence. At a step construct the finite exact endpoint
polynomial x + sum a_k(t0,x) h^k from the retained Lie stages, preserving guards.
Compose it with the affine input definition through Hypersolve. A degree-one
parameter Taylor model supplies exact center/linear coefficients and complete
nonlinear residual. Reuse TaylorNoiseModel to choose bounded columns; every
omitted contribution stays in the residual. Add the certified trajectory time
remainder from the existing FlowTaylorReport. Fresh residual coordinates are
independent outer parameters on the next step, with distinct provenance.

Crucially, the next Picard input must enclose the entire represented affine outer
set. An intersection with a narrower independent endpoint box must not silently
restrict parameter combinations. Do not use TaylorNoiseModel's intersected range
as the full relaxed affine set. Retain the original coarse endpoint separately.

One caller-owned EnclosureBudget covers preparation, copies, proof construction,
selection, arithmetic and final publication. Bound parameter/column dimensions,
structural work and stage entries before allocations. Preserve typed exhausted,
cancelled, invalid, domain and rejected proof outcomes; no partial success.
Scalar payload/refinement, total heap and within-scalar cancellation exclusions
remain explicit. No uniform practical complexity bound is claimed. Replay starts
from original definitions, initial box/time and step specifications, never flags.

Acceptance: independent reversible shear and triangular/constant exact controls;
nonlinear Riccati and oscillator analytic enclosures; correlation retained across
multiple generated inputs; zero retained columns, omission accounting, fresh
residual separation, zero-dimensional and empty/invalid cases, unsorted variable
bindings, original guards, resource/cancellation/retry and fresh replay. Old owner
and downstream tests/trace checks remain. Measure same completed endpoint-quality
workloads against existing box propagation with required refinement, including
preparation/materialization/proofs/destruction, memory and code/binary costs.
No retention based only on a favorable isolated fixture. No push/publication.

Final review found one additional missing domain witness: transport of exact
nonrational algebraic field coefficients. Add an independently defined sqrt(2)
shear followed by its reverse. Its exact composed map is still identity; this
must not rely on dyadic rounding of the coefficient or only rational seeds.
Owner and properties are unchanged. This is an acceptance-only addition; do not
alter production dispatch or benchmarks to obtain the expected cancellation.
