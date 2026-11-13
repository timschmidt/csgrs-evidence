# Source-bound regularity and Picard step verification

Base 188bafa1c5bee0131f7a5acbfef7368b8943e19b. Previous turn was progress:
native rational coefficient admission before materialization. The full goal stays
active. Owners: Hypersolve expression-domain/derivative association; Hyperlattice
scalar-vector enclosure multiplication; Hyperdynamics IVP semantics and proof
assembly; Hyperinterval scalar arithmetic. P1-P6, P19-P20, P25, P36-P37.
Missing acceptance witnesses: the owned Jacobian explicitly lacks regularity
certification, and no Picard self-map/uniqueness/end-step verifier exists.

Add a source-bound regular Jacobian enclosure. Original full-domain evaluation
proves continuity on the input product. For source nodes structurally dependent
on requested differentiation variables, require strict sqrt/asin/acos/acosh
primitive domains; division/log/integer-power guards already exclude their
singularities. Inactive-variable-only expressions need continuity, not bounded
time derivatives. Generated derivative formulas must also enclose successfully.
Retain source, variable order, input box, precision and computed outputs; no
serialized proof flags or independently supplied derivatives are trusted.

Add native vector scale using the existing scalar multiplication authority.
A dyadic forward step uses exact singleton endpoints t0<t1, initial X0 and a
caller-supplied candidate Y. Verify X0 subset Y; full regular source/Jacobian
images on T x Y; P=X0+[0,h]*F(T,Y) subset Y; h*upper(norm_inf(J))<1. Return the
whole integral enclosure P and end enclosure X0+h*F(T,Y), preserving all evidence
and failures. Empty initial sets are successful empty after time validation;
zero-dimensional unit products remain nonempty. Check the final end contribution
before certification. End boxes must feed another step. All output is private
immutable evidence; replay revalidates source and reexecutes admission.

Banach self-map argument: for each x0 in X0, continuous Y-valued curves form a
nonempty complete closed subset of the uniform-norm function space. The integral
operator maps it into Y by P inclusion and contracts by hL<1. This establishes a
solution and uniqueness in Y. Strict active primitive domains additionally give
state-local regularity around its path. No finite-stage Euler point trajectory
is silently promoted; no Taylor remainder is omitted. Arithmetic rounding is
already included in the retained images, not reported as zero point error.
Primary theorem reference: https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/ODE/PicardLindelof.html

Use one mutable graph/scalar budget for nested work, typed failure before
certification, cancellation and independent retry. Existing symbolic-refinement,
payload-lifecycle/ingress and total-heap exclusions remain explicit; this increment
is not a wholly bounded solver. Arbitrary rational endpoint support, automatic
bounded halving, proposal generation, flow tubes and a complete baseline remain
required work, not excused by this dyadic step verifier.

Acceptance: constant/affine/time-dependent/nonlinear analytic controls, temporal
sqrt boundary vs state singularity, uncertain initial boxes, N=0, empty/invalid,
self-map and contraction failures, exact endpoint inclusion, output-to-input
composition, exact budget boundaries/cancellation/retry, fresh-process replay and
source/proposal mutation. Measure completed workloads, cleanup, artifacts and
existing field costs. Preserve pending dynamics and Interface patch bytes.
