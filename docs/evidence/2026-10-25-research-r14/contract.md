# R14 fixed rational-polynomial preparation

Owner: Hypercurve selected-parameter sign replay, bezier_parameter.rs.
Properties: P1/P2/P4/P5/P8/P9/P10/P11/P19/P20/P27/P35/P36.
Domain: exact rational fixed coefficient arrays and rational isolating brackets;
nonrational arrays/brackets keep the existing generic Real fallback. No persistent
cache, new public carrier, content GCD, change of work budget or precision policy.
Positive coefficient and bracket denominator scales preserve signs. Zero,
constant, vanishing leading terms, negative/cross-zero/singleton intervals and an
exact midpoint root must retain the baseline decisions. No refinement result or
Unknown is saved to the authoritative selected root.

Missing gates: repeated-preparation counts on current source; exact point-Horner
and reused bracket results against independent rational arithmetic; unchanged
1,152-polynomial Bernstein/Horner oracle; actual captured leaves; whole ignored
refilleting workflow and small cold controls. Historical measurements are leads.

Prototype boundary: one coprime_filter_sign_by_bisection proof invocation.
First measure coefficient preparation and midpoint-sign counts. Prepare fixed
coefficients once and only use a rational homogeneous point sign where rational
inputs prove applicability. Share per-bracket conversion between Horner and
Bernstein. Incremental Bernstein powers are a separate hypothesis and will not be
bundled. Record preparation cost separately from whole proof/workflow completion.

Stopping rule: pilot and oracle work first, at most two coherent preparation
variants before reassessment. Stop on any wrong sign, lost certainty/authority,
new failed completion, unsupported resource change or lack of measured benefit.
Long children have external 900-second containment, separate from API budgets.
Before final measurements freeze paired process count, protected total latency
family, effect estimator and simultaneous one-sided confidence bounds. Literal
nonregression from hypercurve_rd_program.md section 6.3 applies; reductions in
allocation or instructions cannot substitute for native latency admission.

No main worktree code is modified during the active frozen R04 validation.
Private baseline is HEAD plus current tracked changes and new task tests, with
R12 offset_joins.rs production change removed (a rejected candidate). Every
checkout uses a separate target and writable ccache. Code, dependency, binary and
input digests must be retained before claims. The historical leaf result labels
are not an independent certificate; exact rational reference checks are required.
