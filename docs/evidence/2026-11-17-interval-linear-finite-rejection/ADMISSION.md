# Dense linear proposal finite-arithmetic repair

Baseline: a32805da2dd4d8e038c1275969526b58e9160215, clean isolated checkout.
Owner: Hypersolve linalg proposal adapter; P6/P9/P19, required plan7 inventory.
Previous turn was progress:25required declarations classified; finite-overflow
and NaN-input failures reproduced on an unchanged complete source module.
Reproduce those witnesses again before editing this revision.

Input domain: rectangular f64 matrices/vectors of matching dimensions and finite
scalar options. Preserve current finite nonpositive-radius clamping and
EPSILON singularity semantics. Neither is promoted to an exact proof.
Expected extension: NonFiniteInput for invalid numeric input, and
NonFiniteArithmetic for non-finite intermediate/output arithmetic from finite
inputs. DimensionMismatch retains priority. No NaN/infinity proposal or pivot
metadata is published as successful work. Finite operations keep their order
and previously completed ordinary outputs/receipts. Reject norm-overflow zero
steps as arithmetic failure. No new interval or second arithmetic authority.

The nonlinear solver must preserve the new diagnostic distinction in unit
ConvergenceReason variants; ordinary Singular/DimensionMismatch behavior stays
unchanged. New enum variants require a migration note for exhaustive matches.
No codec exists on these carriers. No new budget/cancellation guarantee is made.

Search before implementation found no reusable dense f64 finite-validation
helper in Hypersolve. Algebraic tensor conversion is a different exact-to-float
boundary and is not an input-validation substitute.

Acceptance: independent small-system controls; all three public methods with
NaN/infinite matrix/vector/options, empty/dimension priority; finite overflow in
accumulation, Gaussian elimination, norms and dogleg arithmetic; finite retries;
new errors through nonlinear solver; existing owner proposal/certification tests.
Compare original completed numerical outputs/report fields, allocation/drop and
whole-call stack before spending on timing. Dispatch counts remain zero in the
pure-f64 module; nonlinear controls still require trace checking.

No acceptance implied by implementation. Runtime, resource and final linked
size/cumulative budget evidence remain required before primary retention.
Size allowance is not assigned here; declare affected artifact caps before
judging retention. All previous57accounts remain unchanged during experiments.
