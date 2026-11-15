# Dyadic product exponent normalization

Owner Hyperinterval DyadicInterval::mul; Phases 3/6, P1/P6/P18-P20/P36/P37.
Target revision and pending work are recorded in BASELINE.json. Work is isolated.
This is an explicit capability extension, not a behavior-preserving refactor.

Missing witness: 2^MAX times 2 fits as mantissa 2 at MAX, yet checked exponent
addition rejects it. At the lower boundary, [-1,2]*2^-1073741824 times
[-1,2]*2^-1073741825 has exact hull [-1,2]*2^MIN after common-factor removal.
Reproduce both on baseline before production edits. Preserve the original upper
boundary hard case with its new exact expectation and document the intentional
failure-to-success migration. Genuine unrepresentable lower endpoints still fail.

Reuse from_wide_exponent, already owning square/power normalization. Preserve
empty/zero handling, sign predicate order, four corner products, ordinary output
and ordinary budget accounting. No sign-partition optimization. Input/output are
closed finite real intervals with BigInt mantissas and i32 common exponents.
No scalar policy or approximation terminal applies. DyadicBudget bounds declared
coefficient reservations and deterministic work units, not wall time/actual heap;
normalization growth must be reserved before shifts. New exponent-range inputs
can fail size/work admission before representability is established. No cache or
cancellation interface is introduced. Fresh-budget retry must remain possible.

Use independent bounded-integer endpoint oracles around both exponent limits,
resource boundary tests, output composition, and canonical serde replay. Compare
ordinary successful outputs and work to the prior algorithm; qualify ordinary
native costs/allocations and portable builds. Run full owner tests and strict
Clippy, affected Hypersolve/Hyperlattice checks, formatting and retention budget.
Record raw commands, failures, limitations and source hashes. No push/publication.
