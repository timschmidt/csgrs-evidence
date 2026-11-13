# Phase 8 machine-profile rational uncertainty ingress

Previous turn: progress; two phase-11 adapter experiments rejected with retained
cost evidence. The full fifteen-phase goal remains active. Main's 41-path and
Interface's eight-path pending extraction patches are preserved separately.

Owners: Hyperinterval constructs an ordered rational set; Hyperreal owns scalar
fraction conversion and arithmetic; Interface retains configuration identity,
units, nominal value, profile bounds, conservative selection and machine lowering.
Properties P1, P4-P10, P17-P20 and P31-P34.

Domain: arbitrary finite Rational nominal with i64 numerator/u64 denominator
for exact encoded uncertainty. Convert through the existing Rational::fraction,
then reject negative numerator using its integer sign, without a second Rational
sign predicate or normalization. Zero denominator preserves the original scalar
cause and precedence. Nonnegative data defines the exact closed nominal +/-
uncertainty interval. Existing arbitrary-Rational uncertainty API is unchanged.
Configuration validates nonnegative uncertainty before deriving a machine profile;
the new shared constructor remains independently checked for public use.

Missing witness: no shared exact fraction-uncertainty constructor preserves the
current machine-profile scalar trace/order while delegating endpoint arithmetic.
Reuse the existing ordered endpoint construction in one private helper; do not
copy a second mathematical kernel, add a trusted flag, narrow existing domains,
or weaken downstream assertions. Interface keeps private nominal/lower/upper
storage, const accessors, Debug and equality shapes. Unexpected interval errors
retain a typed source; original fraction failures remain Arithmetic(Problem).

Validate independent fraction expectations, invalid data, consumed output,
fresh-process cold/warm scalar traces, complete profile fields and canonical
lowering fixtures. Measure old/new native and WASM consumers, allocations and
costs before retention. This increment alone does not finish positive product/
quotient migration, named error composition, browser/HIL or the full plan.
