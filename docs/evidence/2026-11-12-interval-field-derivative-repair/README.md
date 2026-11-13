# Exact derivative and dense-Jacobian failure repairs

Previous turn: progress, with smaller emitted dynamics code but an unaccepted
timing envelope. This step reviews the Hypersolve-expression prerequisite of
interval plan section 10.5 and repairs two reproduced correctness defects.
It does not implement the owned field or validated ODE/reachability interface.
ADMISSION.md records ownership, properties, domains and the missing witnesses.

Source repair commit: d499614eafd096f488ffd4e7b19c4058dbaa9329.
Its only four paths are Hypersolve symbolic.rs, jacobian.rs, CHANGELOG.md and
symbolic_power_boundary.rs. QUALIFIED_TREE.json binds the source base, repair
patch and complete preexisting pending dynamics/Interface patches. The pending
extraction patch remains byte-identical to the previous record; it was not
committed or accepted with these correctness repairs. No push ran.

## Reproduced defects and exact repair

Expr::derivative formed exponent - 1 for every nonzero i64 power. At i64::MIN
this panicked with overflow checks and wrapped to i64::MAX in release builds.
Both failures are reproduced on the target revision. The release witness checks
homogeneous exponent using i128 and independently checks exact coefficients;
it does not allocate a huge power to infer correctness. A composed second
derivative also produced a negative value where the exact expected result is
positive. Raw debug/release failures and commands are retained.

Only the minimum-exponent branch now represents the derivative as
n * (x^n / x) * x'. The negative source power already requires x != 0, so the
quotient introduces no additional excluded point in the source domain. It keeps
every stored exponent representable and can itself be differentiated again.
Deleting exactly the new branch recovers the entire previous symbolic.rs byte
for byte; hashes and the checked removal are in unchanged-power-branches.json.
All other branches and their ordering remain unchanged. This is a correctness
repair, not a behavior-preserving refactor or a new resource guarantee.

The dense symbolic-Jacobian adapter also used unwrap_or(0.0) for an unavailable
binary64 estimate. A finite exact slope 2^2048 at x=0 reproduced Ok([[0.0]]) in
place of failure. Both plain and prepared entry points now use the existing
EvalError::DenseSolverEstimateUnavailable after the same exact weighted-entry
calculation. Successful conversions keep their existing order and behavior.
These APIs still return dense proposals, not rigorous interval Jacobians.
Other finite-difference/solver conversion issues are explicitly outside this
repair and recorded in NEXT-WORK.md; no complete proposal-layer claim is made.

## Acceptance witnesses and checks

Four new tests cover ten exponents including both i64 boundaries and their
neighbors through three successive derivatives, using independent wider-degree
and exact unit-value expectations. They cover a composed base at positive and
negative unit values, its excluded zero and unbound input, and differentiation
with respect to an unrelated symbol without hiding the source's invalid domain.
Both public symbolic-Jacobian paths consume the repaired minimum derivative and
reject the independently unrepresentable slope. The unit derivative -2^63 is
exactly representable in binary64; no approximate value is used as an interval
proof. Original hard cases and assertions are unchanged.

All eleven final checks.py commands pass: the selected Hypersolve library,
smoke and new regression suites (842 tests); four release witnesses; strict
all-feature/all-target owner Clippy; 459 dynamics/path tests including original/
native/compatibility full-report and dispatch comparisons; 201 Interface tests/
doctests; strict Interface Clippy; owner docs; stable Wasm compilation;
successive_operations; root formatting and diff validation. The Interface
41,795-byte canonical golden still has SHA-256
df893df83e90e6b53452e18586ffcaa2524a021631a395d4a6523be16263669c.
The final 200 successive-operation rows retain their structural and allocation
columns relative to the original maintained baseline. Hypersolve certification
and Hyperpath benchmark smoke runs execute 417 and 194 cases successfully.
The source budget passes. Initial failing tests and the corrected test-only
Clippy assign-op warning remain recorded alongside final results.

This is affected local/downstream qualification, not every Hypersolve integration
suite or a full pre-push/workflow matrix. No sanitizer, hardware/platform or
controlled performance claim is made. Earlier dynamics cost measurements
precede this lower-layer source repair. rebuilt-artifacts.json records the newly
built artifact identities without attributing historical timings to them. The
pure extraction's retention gate remains open and needs fresh cost qualification
on its next target revision; it is not waived by the correctness priority.

The owned/replayable field, exact interval image/Jacobian, complete resource
accounting and validated evolution requirements remain in NEXT-WORK.md and the
main progress ledger. Neither these repairs nor a dense point Jacobian establish
any of those capabilities. All fifteen phases remain the active goal.
