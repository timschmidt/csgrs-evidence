# Co-locate validated fact lookup and scalar-set construction

The nonempty intervention reduces native/WASM size by432/343 bytes but remains
448/622 bytes over baseline. Its mapped positive_scalar_with_proof still occupies
483 bytes. Disassembly retains two large-result branches: required_scalar lookup,
then scalar_interval_components conversion. Baseline positive_scalar_interval
calls one scalar_interval that performs lookup plus construction. This is an
observed transport boundary difference, not a change to exact arithmetic.

Test combining required_scalar and scalar_interval_components in one private
Interface helper, called once by each positive/general adapter. Remove only the
now-unused private ExactInterval::from_scalar forwarding layer (one existing call).
Keep lookup before nominal conversion, denominator/numerator validation and radius
construction; preserve all errors, validation precedence, scalar call order and
nominal/bounds fields. No owner kernel changes from the nonempty candidate and no
inlining hint. Full outputs, independent owner expectations and explicit failure
paths must remain identical; early size failure still rejects retention.
