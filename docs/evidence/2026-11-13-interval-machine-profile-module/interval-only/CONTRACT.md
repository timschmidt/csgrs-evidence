# Interval ingress through existing scalar APIs

The typed scalar API is not needed to establish the interval contract: existing
Rational::fraction, From<u64> and exact division already cover finite unsigned
ratios. The three module/public-wrapper experiments preserve exact scalar
values but fail owning artifact gates (+120, +128 and +40 ELF bytes). Their
sources, missing witness and outcomes remain in the parent record. No scalar
API or implementation change is retained.

Owner: Hyperinterval accepts u64 uncertainty numerator and NonZeroU64 denominator,
using Rational::fraction unchanged for values representable as i64. This covers
the whole admitted machine-profile wire domain and keeps its existing scalar
path. Larger u64 numerators use Rational::from(n)/Rational::from(d), with nonzero
d guaranteed by its type; all arithmetic remains in Hyperreal. There is no
new scalar reducer, dependency, approximation or alternate interval kernel.
Arbitrary nominal Rational values and the full u64 radius domain are retained.
Existing arbitrary-Rational radius validation remains in its original order.
The private shared centered helper performs subtraction before addition.

Properties P1, P3-P6, P8-P10, P17-P20, P27, P31-P33, P36-P37. Resource contract
remains the unbudgeted Rational backend. Interface retains semantic storage,
units, nominal, identity, const accessors and existing error variants. Invalid
nominal precedes uncertainty denominator validation, then negative wire radius.

Missing witness: a shared unsigned uncertainty constructor consuming existing
scalar APIs is absent on the restored revision. Reproduce the exact endpoint
acceptance compile failure, then preserve every prior endpoint/full-width/large
nominal test and fresh-process policy/trace assertion. Gate on profile native
and WASM outcomes, exact allocations, size, emitted code, owner/scalar and
successive-operation regression checks before retaining any source. Main's
pending extraction remains excluded and preserved.
