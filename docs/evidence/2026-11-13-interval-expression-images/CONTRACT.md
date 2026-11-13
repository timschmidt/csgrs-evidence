# Interval evaluation of owned expressions (in progress)

Base: 6151b0892f6d14d8e62567ac925e98badc0ac60b. Previous turn was progress.
Owning layers: Hyperinterval for scalar images/domain coverage; Hypersolve for
expression interpretation and full-source domain obligations; Hyperdynamics
for the eventual field/trajectory evidence. Relevant P1-P6, P19-P20, P25, P36-P37.

Missing witness: ExpressionProgram has only exact point evaluation. Its full
17-constructor grammar needs certified interval images without trusting a user
closure or treating partial-domain images as complete field proofs. Existing
DyadicInterval power-zero semantics include 0^0, unlike Expr; the adapter must
preserve Expr's obligation. Asin, acos, acosh and atanh currently lack native
dyadic image methods. Implement their scalar arithmetic in Hyperinterval,
not locally in the field adapter. Retain original source alongside derivatives.

Native inverse images use certified native sqrt, atan, log and dyadic arithmetic
with one shared DyadicBudget. Asin/acos clip to [-1,1], acosh to [1,infinity),
atanh to (-1,1), retaining Complete vs Partial vs EmptyDomain and unbounded
atanh limits. Enclosures need not be tight; no uniform width guarantee follows
from requested grid spacing. Every operation/denominator remains guarded.
Independent directed MPFR endpoint oracles, algebraic special values, partial
and excluded domains, budget exhaustion/retry, composition and empty inputs
are required. New interval images are not validated evolution.

The intended program adapter shares traversal authority and must preserve the
accepted Real dispatch witness and completed-workload costs if that evaluator
is refactored. Graph work, dyadic accounting and unbounded Hyperreal constant
refinement remain separate; do not present graph precision/count limits as
whole-operation bounds. Source-correlated interval inputs may overestimate;
a failed domain enclosure is not proof that every source point is invalid.

The generic Real/interval traversal refactor was rejected: all five tested
forms increased the existing point benchmark binary (624, 920, 304, 360 and
384 bytes respectively). The interval interpreter remains specialized; the
accepted point evaluator and its infallible consume helper are unchanged.
Graph validation, operand use accounting and native scalar operations remain
shared. This retains more traversal source rather than paying an unqualified
existing-consumer cost. A new shared-DAG/output-order/error-order witness and
exact consumed-work exhaustion/retry checks qualify that specialized path.
