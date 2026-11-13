# Source-bound Jacobian matrix projection

Status: retained as an opt-in completeness extension at 8b63fa68d0b952fdab026b4b11c609ff4a0fa319.
Baseline: CSGRS 40d33795396cbe05996a0550f9438d92c4a0f9db. The initial E0599
witness reproduces the absent API. The governing contract and domain were
recorded in CONTRACT.md before production edits. The corrected ten-path source,
patch and hashes are in layout-preserving/final-source/ and final-source.json.

## Contract and ownership

Hypersolve's opt-in interval-lattice feature projects an existing immutable
RegularJacobianEnclosure into Hyperlattice's native fixed-size IntervalMatrix.
The new JacobianMatrix borrows the original source, selected variables, arguments
and precision evidence; it does not create another derivative or matrix kernel.
Rows follow source output order; columns follow selected differentiation order,
which may differ from binding order and omit nonselected parameter variables.
Original partial bounds and grid are copied exactly with shared dyadic budgets.
Numerical products/norms consume intervals(); they do not acquire a new regularity
claim. into_intervals() explicitly moves only the numerical matrix. There is no
unchecked public constructor or serialized proof flag.

Shape validation precedes empty handling. Empty domains remain empty at zero
dimensions, distinct from nonempty zero-dimensional products. Graph cancellation,
entry and work limits and native coefficient size/work limits remain distinct.
Failures return no partial matrix or mutated proof; a larger-budget retry succeeds.
Stack/heap totals and cancellation within an individual scalar copy are not bounded
by these counters. Source/derivative construction keeps its existing restrictions.
P1, P5-P6, P8-P10, P17-P20 and P35-P37 apply. This is a new opt-in completeness
extension; no existing consumer algorithm is migrated or made faster by it.

## Correctness and checks

Seven maintained tests cover independent polynomial derivatives at 81 points,
rectangular boxes and reversed selected columns, subsequent products/norms,
shape failures, empty/unit dimensions, exact resource charges, cancellation/retry,
source-definition replay and zero new dispatch/reducer calls. Nonselected parameter
fixtures t^2*x and sqrt(t)*x retain the t domain including zero while differentiating
only in x; they do not assert C1 regularity in t. Replay rebuilds the original
source and regular evidence; this particular test is in-process, not a separate
serialization format or fresh-process proof check.

Corrected source passes 1,461 owner tests plus 455 benchmark smokes, strict
all-target/all-feature Clippy, warnings-denied docs, WASM compilation, default
feature isolation, 60 downstream tests and workspace formatting. The final added
parameter test passes a seven-test release run and six-test ASan run (dispatch
instrumentation excluded). The full coverage run's last configuration compiles
that final test corpus; its production source was unchanged throughout.

The unchanged coverage script passes 85% at 53,497/62,018 executable lines
(86.26%). Its regex also includes Hyperinterval and hyperlattice-interval files;
the Hypersolve source-prefix subtotal is 51,700/57,777 (89.48%). Both use the
script's trailing-inline-test exclusion, which can retain separate test helpers.
The new projection is 61/61 under that convention. LLVM aggregated instantiated
lines for that module instead report 56/64 (87.50%) and regions 97/104 (93.27%).
No branch coverage or universal closure claim follows from these measurements.

The new independently expected polynomial fuzz target covers column order,
empty domains, bounded-copy failures, cancellation and retry. Two 10,000-run
ASan smoke campaigns pass (initial and corrected variants), seed 20261113,
max input 16 bytes; each execution campaign completed in six seconds within
a 30-second cap. Full fuzz-bin checks, focused fuzz Clippy and formatting pass.
This is bounded sanitizer smoke, not a completed lexicase campaign.

## Costs and rejected design

The initial unretained pair-of-dimensions diagnostic grows ExpressionError
24 to 40 bytes. It is rejected and preserved under layout-preserving/before/.
Corrected separate row/column errors keep size 24 and alignment 8 with and
without the new feature, retaining each expected/actual diagnostic without boxing.
The corrected projection and its Result have the same layout as a tuple control
carrying the same evidence reference and native matrix at five dimension pairs.

The standalone cost control includes projection, evidence retention, native norm,
full output materialization/drop and all graph/native charges. It excludes source
construction. Its handwritten arithmetic is a cost control, not an independent
correctness oracle. Twelve cases cover 1x1, 3x2 and 8x8 matrices with 1, 80 and
1,200 decimal-zero magnitudes, plus empty and zero-dimensional products. Exact
matrix transcripts, work and allocation counts match. Sixteen completed calls
allocate 96, 864 and 8,608 times respectively; peak live bytes range 48-1,536,
176-5,632 and 1,104-35,328 by coefficient size. Live bytes return to zero, all
allocations are freed, no reallocations occur. Empty/unit cases allocate nothing.

The enabled shared probe is 1,936,160 versus 1,935,872 bytes (+288); text is
+176 bytes and the union of sized defined functions is +181. These unfavorable
new-path costs are retained explicitly. The existing feature-disabled expression
benchmark has identical text (3,206,471 bytes), equal stripped size (5,409,376),
and passes all twelve smoke workloads on both revisions. Unstripped size grows
6,836,464 to 6,836,472: string table +5 bytes and alignment account for the +8;
18 changed u32 diagnostic locations are each +13, matching inserted source lines.
This is not byte-identical ELF output or a waiver of behavior-preserving refactor
gates for other migrations.

Two six-block ABBA native timing campaigns retain all samples and equal value,
work and allocation rows, using a fixed executable path, pinned CPU and disabled
ASLR. The first campaign's small first case varies strongly at process startup.
A second adds one second of CPU warmup before each process. Warmed nonempty
median ratios generally differ by about -0.7% to +2.9%; the zero-row unit case
is 59 versus 55 ns (+4 ns), and a large-coefficient 1x1 case retains an adverse
outlier (mean block ratio 1.0499, pointwise 95% bootstrap interval 1.0017-1.1416).
No samples are removed. Both campaigns lack host/frequency control and use short
31x64-call samples; they support this limited cost comparison, not a speedup,
competitive superiority or unchanged-runtime claim.

## Integration and limits

The corrected candidate is combined with the exact pending 41-path extraction
patch in a separate worktree; 25 owner tests, 71 dynamics tests, 448 path tests and strict all-target/all-feature
Clippy pass; results are in layout-preserving/integration-commands.json. After
copying the identical source into main, eight focused tests and formatting pass. An initial
command named a nonexistent test target and failed before compilation; the
corrected command names expression_interval and program_jacobian. That tooling
failure is retained separately and did not cause a test or policy change.

Pending extraction and Interface edits are preserved; firmware is unchanged.
No phase is declared complete. No new solver, general inverse, variable-dimension
matrix, field migration, native proof serialization or whole-resource guarantee
is supplied. WASM is a compile check, not a browser benchmark. Full coordinated
release, packaging, HIL, competitive workloads and the complete pre-push matrix
remain open. No push occurred; full pre-push verification remains required.
