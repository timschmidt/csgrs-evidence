# Construct final domain results inside validated interval ingress

Phase8/P1/P4/P6/P10/P17-P20/P27/P31-P33/P36-P37. Owner interval arithmetic remains
Hyperinterval; Interface retains nominal values, physical validation, units and
identity. Prior mapped code demonstrates that nonempty transport plus combined
fact lookup/conversion reduces overhead but leaves +192/+500 native/WASM bytes,
with extra result adapters and unwind entries. Those variants remain rejected.

Distinct hypothesis: a private generic finalizer invoked only after validated
lookup and exact conversion can build each final domain result inside one Result
boundary, rather than materializing intermediate success/error carriers and mapping
again. Share positivity refinement in one helper. Retain exact lookup/conversion/
validation/predicate/arithmetic order, and call the finalizer once only on successful
preceding stages. Closure capture must not evaluate a predicate or conversion early.
No inlining/layout directives, compiler changes or reduced domain. Public getters,
Debug fields, typed physical errors and canonical output remain unchanged.

Reproduce current accepted baseline and previous rejected control. Preserve all
existing independent owner oracle/trace tests. Add failure-precedence/finalizer
lifecycle witnesses and complete native/WASM transcript/size checks before broad
cost campaigns. Only a size-passing candidate may proceed to all remaining owner,
downstream, allocation, dispatch, canonical schedule and runtime/size gates. A
favorable profile-only result is not retention. Preserve primary41, Interface8
patches and all66 frozen stages; no push/publication.
