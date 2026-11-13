# Bounded derivatives of owned programs: admission in progress

Base 83e9ddceba06b9c4577bffc9842e076012f11f61. Previous turn: progress
(guarded native interval expression images accepted and recorded).
Owner Hypersolve; P1-P6, P19-P20, P25, P36-P37. Domain: its complete finite
17-constructor Expr grammar with immutable exact scalar constants, ordered
bindings, shared DAGs and integer exponents across the full i64 range.
Missing witness: a graph-bounded derivative construction tied to the validated
original source, replaying by regeneration and consuming original domain guards
before publishing derivative images. Existing recursive Expr derivative must
remain the differentiation rule authority; do not duplicate a derivative kernel
in Hyperdynamics or copy arbitrary source trees into every generated derivative.
Local finite templates can adapt its rules into a shared source DAG. Structural
limits do not account for arbitrary scalar payload/refinement or heap bytes.

Potential prerequisite finding to reproduce on this exact revision: the general
n*x^(n-1) rule at n=1 introduces a false zero exclusion. An identity power must
have the derivative of its base where that derivative exists, including a zero
base; any guards carried by that base must remain. Test ln(x)^1 at x=1 and at
excluded x<=0 as well as x^1 at x=0. Do not simply remove all evaluation of a
guarded base. This is a correctness extension, not a behavior-preserving refactor.
