# Preserve the scalar constructor result at interval ingress

The static invariant trap retains exact values, error checks and dispatch but
still grows the profile ELF by 136 bytes. The next candidate propagates the
existing scalar Result instead of converting it to an invariant panic. It
returns Result<RationalInterval, hyperreal::Problem>. This introduces no error
type: Hyperreal owns scalar construction failure, and Interface already maps
Problem into MachineProfileError::Arithmetic with source() preserved. The new
interval entry has no independent interval-domain failure: unsigned numerator
and NonZeroU64 denominator establish radius validity. Existing interval APIs
and their IntervalError vocabulary remain unchanged.

This is an unretained API design change, not a weakened completion requirement.
Every valid finite input still must return the same exact interval, with full
u64 radius coverage. Tests unwrap every successful construction and preserve all
endpoint, Debug, composition and trace assertions. Potential scalar failures
are propagated, not formatted, suppressed or replaced. No unsafe, fallback
success or new application error variant. Nominal/denominator/negative-wire
validation order is unchanged. Rational resource limits remain as declared.

The i64 wire-domain path calls Rational::fraction unchanged and uses ?. The
larger unsigned path uses existing exact From<u64>/division, with its nonzero
denominator proof. Hyperinterval owns only interval assembly. Both the infallible
and scalar-result prototypes are preserved separately. Apply all original size,
code, runtime, native/WASM and downstream gates before retaining this candidate.
