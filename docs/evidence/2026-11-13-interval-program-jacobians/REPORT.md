# Source-bound symbolic Jacobians with graph budgets

Source commit `f69be5f322b697861a7a46179858562c693190ee`, based on
`83e9ddceba06b9c4577bffc9842e076012f11f61`. This is progress on plan section 10.5,
not completion of the full plan or a validated vector-field/trajectory interface.
CONTRACT.md records the missing witness and owning properties before edits.
SOURCE_STATE.json and source.patch identify the complete nine-file increment.

## Reproduced prerequisite and correction

On the target revision, the existing power derivative at exponent one produced
x^0 and failed with Hyperreal(NotANumber) at x=0. identity-power-before.log records
the failing acceptance witness. The correction uses `0 * base + derivative(base)`
for this exponent, through existing domain-aware simplification. This removes
the invented nonzero requirement without dropping guarded base evaluation.
The regression checks x^1 at zero and nonzero points, ln(x)^1 at x=1 (zero base)
and x=2, excluded logarithm inputs, and a genuinely singular sqrt derivative.
The earlier minimum-exponent, repeated-power and dense-solver regressions remain
unchanged. This is a correctness extension, not a behavior-preserving refactor.

## Owned construction and mathematical authority

`ExpressionProgram::jacobian` builds a private `JacobianProgram` containing the
immutable original program, ordered distinct differentiation variables, and a
combined executable program. Source outputs precede column-major partials.
`partial_output(row,column)` maps their positions and rejects invalid indices.
Identity/replay is the original complete definition plus the ordered variables;
replay validates that source and regenerates derivatives. No serialized
association flag or caller-supplied derivative graph is trusted.

Each demanded source node is visited once per requested variable. A tiny local
Expr template delegates its derivative to the existing Expr::derivative rules;
import then substitutes source-node references into a flat graph. The adapter
maps grammar constructors but does not duplicate derivative formulas in another
kernel. An arbitrary source Expr tree is never reconstructed. Original source
sharing is preserved inside the generated program, and one prefix copy serves
all columns. Local templates may repeat individual supporting operations; this
is not a claim of globally minimal expressions. The source and generated prefix
are distinct owned graph storage, while ordinary program clones share their Arc
definitions. No allocation identity is used as mathematical equality.

Structurally known zero partials skip derivative work, including independent
source expressions at otherwise singular primitive derivative endpoints. They
never skip the complete original output evaluation. Thus a zero partial of
sqrt(0) is valid, while a zero partial of sqrt(-1), log on excluded inputs, or a
zero power at zero does not publish successful source evidence. The derivative
formula may still have a smaller domain than a differentiable composite at a
removable chain-rule singularity. Its failure does not prove nondifferentiability;
no complete simplification or global smoothness theorem is claimed.

Graph entry/work checks cover source copying, variable/binding validation,
use-count traversal, each fixed-size local-rule expansion, template compilation,
import and final validation. Scalar payload cloning/arithmetic, coefficient
storage, heap bytes and numerical refinement remain outside total-work
accounting. The local template has constant structural size for a single grammar
node, including both i64 exponent boundaries; it does not contain user source
subtrees. Cancellation is cooperative between charged stages. Exhaustion checks
precede completed publication, failed attempts retain no derived cache, and
fresh-budget retry succeeds. This is bounded graph construction, not the final
whole-field resource contract.

## Acceptance witnesses and consumers

Seven new program-Jacobian tests cover all 17 constructors and extreme integer
powers against independent exact expectations; 81 polynomial input pairs with
independently derived partial values; repeated differentiation; original source
guards; zero partials; shared/repeated outputs; binding and column errors; empty
outputs and columns; exact consumed-work and entry boundaries; cancellation and
retry; and fresh-process replay followed by source mutation/regeneration.
A 128-level shared squaring DAG stays within five times the source node count
and evaluates its slope 2^128 exactly at one. A 20,000-deep negation source is
constructed, differentiated, evaluated and dropped on a 128-KiB thread stack.
These are bounded witnesses, not a universal closure proof.

Interval consumption checks independent affine Jacobian entries and nonlinear
partial extrema (3*x^2+2*y and 2*x), and retains the original zero-power guard.
The combined program uses the already qualified point/interval interpreters.
Both shipped oscillator examples now build and replay the association through
the new constructor; exact field/Jacobian values remain checked. The examples
still do not certify an ODE trajectory or global smoothness.

## Executed qualification

All 19 commands in checks-final.json pass: 874 owner tests, minimal-feature tests,
Rust 1.95 tests, release tests, strict all-feature/all-target Clippy, both examples,
strict docs, stable Wasm, AddressSanitizer, 459 Hyperdynamics/Hyperpath tests, 201
Interface tests and strict Interface Clippy, successive_operations, owning and
downstream benchmark smoke suites, formatting and diff checks. Supplemental
staged-diff and repository-budget checks also pass. The source is committed;
pending dynamics and Interface patch bytes are unchanged, and Firmware is
unchanged. No push or full pre-push/hosted-OS/hardware qualification is claimed.

All 200 successive_operations rows match the earlier accepted derivative-repair
record in outcome, topology/structure and allocation columns. The historical
control is copied as successive-control.log, with comparison scope and columns
in successive-comparison.json. It comes from evidence record
2026-11-12-interval-field-derivative-repair, source d499614eafd096f488ffd4e7b19c4058dbaa9329.
Timing columns are excluded; this is not a matched latency comparison. The
certification/path/point Criterion smoke suites pass 417/194/12 cases respectively.

## Completed costs and artifact observations

The external cost-project reuses the previous counting allocator unchanged. It
measures degree 1/8/32/128 Horner programs at x=1: complete Jacobian construction,
replay including definition clone/validation/regeneration, exact point evaluation,
and interval evaluation at grid -32. Preparation is outside the measured scope;
returned objects, evaluation output checking and destruction are inside. Eight
warmups precede 32 allocation iterations. Each timing has 31 samples of eight
iterations, pinned to CPU 0 after compilation and qualification finished.
Raw samples are in cost-final.log; parsed data is in cost.json.

All 16 completed cases and 12 zero/small-work exhaustion cases finish with zero
live bytes in the counting epoch, with successful fresh-budget retries. Absolute
median times span 872.5 to 389,775.125 ns. Maximum observed temporary peak is
115,256 bytes. Source/generated node counts are 5/7, 33/49, 129/193 and 513/769;
constructor graph work is 71, 526, 2,086 and 8,326. The probe uses one million graph
entries and 100 million graph work units; interval evaluation separately uses
16,384 bits per stage and 10^12 native work units. These are absolute completed
workload observations, not a speedup, heap bound or validated-flow measurement.

Artifact sizes, hashes, all sized-function range unions and ELF section hashes
are retained in artifacts.json and associated records. The new external consumer
is 3,405,576 bytes, with a 1,708,537-byte sized-function range union. The point-only
benchmark is 7,047,768 bytes: 832 more than the earlier control, while its sized
function range union is 1,282 bytes smaller. Its text/rodata are not byte-identical.
The correctness extension and new capability are retained with these costs
explicit; no unchanged-cost or refactor-equivalence claim is made. Certification,
path and successive binaries are 16,564,112, 13,304,608 and 22,399,608 bytes.
The first two are 176 and 104 bytes larger than the previous historical
correctness-repair artifacts, respectively; this is an artifact observation,
not a matched runtime conclusion. Compiler/target/features/locks and hardware
records accompany the measurements. Earlier pending dynamics extraction cost
qualification is neither refreshed nor accepted by this increment.

## Still open

A Hyperdynamics-owned replayable field adapter with explicit time/state/shape
semantics, matrix/vector carriers, whole-operation resource accounting, and
continuity/derivative evidence is still needed. So are validated Euler/Picard
steps, uniqueness evidence, bounded halving, exact horizon/end enclosures,
retained rejected attempts and flow tubes. Broader phase requirements, including
hardware and release qualification, remain open. The full goal remains active.
