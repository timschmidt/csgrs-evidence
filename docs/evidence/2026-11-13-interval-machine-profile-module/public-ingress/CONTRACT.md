# Delegate typed construction through existing public scalar ingress

Both private-reducer inline wrappers fail the owning size gate. Moving the body
into an included file preserves original source positions but retains the new
GOT/relocation and text growth. The new inline API makes a private reducer a
cross-boundary dependency. Do not change the reducer or existing callers.

The typed wrapper will delegate to existing public scalar constructors. For
u64 values representable as i64, call Rational::fraction unchanged; this is the
entire machine-profile wire domain and preserves its scalar reduction/trace
sequence. For larger u64 numerators, use existing from_bigint_fraction. NonZeroU64
proves either denominator check succeeds; their only construction-domain error
is zero denominator. No conversion rounds or invents a substitute value.
The full u64 API domain and independent boundary tests remain unchanged.

This removes the inline wrapper's direct dependency on a private reducer, rather
than changing that reducer's visibility or inlining existing kernels. Preserve
all inherited owner, full-profile/native/WASM, dispatch, resource and cost gates.
First reproduce the owning benchmark size; passing that alone is not retention.
