# Jacobian context review before edits

Owner: Hypersolve jacobian.rs, explicitly named in plan section 7.1; phase7
proposal/proof boundary and preserved active-row semantics. P1/P6/P8/P9/P35–P39.
This is a primitive-float proposal adapter, not certified interval arithmetic.

Input witness: one unfixed variable whose authored value is1, context binding3,
residual x^2 and finite-difference step1. Forward difference must be
((3+1)^2-3^2)/1 =7. Current code instead perturbs authored1 to2 while evaluating
the baseline at3, yielding -5. Reproduce on557a349f9 through public jacobian API.
Control: context1 still gives3. Include context binding changes, fixed columns,
and unused unbound variables before choosing a compatible repair.

Do not move this proposal kernel into Hyperinterval or promote it to proof.
Preserve the solver's default synchronized model/context path and all existing
outputs, predicate order, uncertainty and resource gates. No code change until
the current-revision failure is reproduced. Other possible validation gaps
(zero/non-estimable steps and filtered missing residual estimates) are outside
this specific witness and must stay explicitly open unless separately addressed.

The timing queue has a new closed build exclusion; prior24commands are unchanged.
No timing under competing routing work. Existing alpha384 remains isolated and
its host-test budget revision is not yet adopted. Any overlapping Hypersolve
size accounting must preserve the same fixedc9 baseline and prior charges,
including subsequently accepted alpha costs; no per-change budget reset.

## Single-entry context update variant

The lookup-then-bind repair9e88 has a reproduced32-byte whole-call stack
increase on every one of16default groups, so it cannot be retained. Keep that
record and source. The next coherent alternative moves binding perturbation
into EvaluationContext, the owner of the map and generation counter, and uses
one entry lookup. This removes duplicated hashing rather than tuning layout.
The independent forward-difference witnesses remain unchanged. Validate both
existing and absent bindings, one generation increment, original caller state,
and the same baseline resources. No test or gate may be weakened.
