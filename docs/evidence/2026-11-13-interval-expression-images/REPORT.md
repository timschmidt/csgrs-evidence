# Owned expression interval images: admitted increment

Source: `edb68461ece8dc8a170799df06cd11269b25e487`, based on
`6151b0892f6d14d8e62567ac925e98badc0ac60b`. This advances plan section 10.5.
It does not complete an owned field/Jacobian or validated evolution. The full
fifteen-phase goal remains active. Admission and the missing witness are in
CONTRACT.md; the complete 13-file patch and file hashes are in source.patch and
SOURCE_STATE.json. Existing staged dynamics and Interface changes remain
byte-identical; neither extraction nor its historical cost gate is accepted here.

## Implementation and exact contract

Hyperinterval owns principal dyadic asin, acos, acosh and atanh images. Exact
monotonicity, native domain restriction and already certified sqrt/atan/log and
arithmetic supply outward images. Asin/acos use [-1,1], acosh [1,infinity), and
atanh (-1,1); coverage remains Complete/Partial, an entirely excluded nonempty
source returns EmptyDomain, and empty maps to empty/Complete. Atanh retains
explicit rays or the entire extended line for interior approaches to excluded
endpoints. Exact zero special values avoid irrelevant precision expansion.
All native arithmetic stages use the caller's DyadicBudget. Enclosures are not
promised tight. The budget's established exclusions remain in force.

Hypersolve's opt-in interval-program feature interprets every one of the 17
Expr constructors over the Cartesian product of dyadic inputs. Its exact owned
source remains authoritative. Binding and graph checks precede canonical empty
product outputs; a zero-dimensional input is the nonempty unit product. Only
Complete operand-domain images are accepted. Dependency overestimation can
prevent this proof for valid source points; DomainNotCertified is not an invalid
function theorem. Native interval failures retain node and source diagnostics.
The adapter preserves the source's guards under zero factors and powers,
including Expr's exclusion of zero-to-zero, despite the native set-power
convention. Shared nodes, final-use moves, left-first operands and output order
are preserved. No partial result is published after exhaustion.

Graph work and entry counts remain separate from dyadic arithmetic work and
per-stage bit reservations. Copies of interval mantissas use budgeted native
operations. Hyperreal constant enclosure refinement remains outside both total
work accounts. Graph cancellation is checked between stages and before output
publication; it cannot interrupt one native operation or constant refinement.
There is no total heap-byte budget or complete field resource contract. Requested
precision is a rounding grid, not an enclosure-width guarantee. The oscillator
example consumes symbolic derivative expressions, but neither binds their
correctness to a retained field certificate nor proves existence/uniqueness.

## Rejected refactor and preserved point implementation

Five generic traversal candidates passed scalar benchmark smoke tests but grew
the accepted point benchmark binary by 624, 920, 304, 360 and 384 bytes. All five
were rejected under the repository's refactor retention gate. The successive
variants were generic fallible arithmetic, ordinary inlining, distinct
infallible-copy/native-operation error types, inlining those types, and static
operation dispatch. Artifact hashes, sizes, symbol coverage, logs and available
candidate sources are retained. There is no accepted optimization or timing
claim for these candidates.

The final point evaluator and its operand consumption helper are unchanged.
The interval path specializes traversal effects while reusing graph validation,
operand use counting and native interval authority. This retains more traversal
source instead of imposing an unqualified existing-consumer cost. The final
point-only Criterion artifact is 7,046,936 bytes, with 3,151,803 bytes in the union
of sized function symbols (5,154 distinct ranges), exactly matching the accepted
control. GNU text/data/bss sizes also match, and .text and .rodata are
byte-identical. Artifact hashes and .data.rel.ro differ. These observations do
not claim whole-file identity, a new speedup, or universal performance equality.
The independent existing dispatch assertions remain unchanged and pass.

## Qualification

All 16 commands in checks-admitted.json passed on the final implementation:
27 distinct selected native tests, 866 Hypersolve owner tests, strict owner
all-feature/all-target Clippy, warning-free docs, example, stable Wasm builds,
format/diff/budget checks, Rust 1.88 native dyadic tests, Rust 1.95 program tests,
release tests, AddressSanitizer and 454 selected Hyperdynamics/Hyperpath downstream
tests. The native power suite also reruns one witness in a child process, which
must not be counted as another distinct test. The point benchmark smoke suite
completes all 12 cases. This is affected qualification, not a complete pre-push,
hosted-OS or hardware qualification. No push was attempted.

The four new native tests cover exact special values and extreme requested
grids; empty, excluded and partial domains; unbounded endpoint limits; composition;
size/work exhaustion and retry; and 2,068 independent directed 512-bit MPFR
endpoint comparisons. The eight new program tests cover the full grammar,
extreme integer powers, 588 independently expected affine boxes and subsequent
consumption, source guards, partial domains and dependency overestimation, empty
and unit products, both budgets and cancellation/retry, symbolic constants,
existing derivatives, shared DAGs/repeated outputs, demanded error order and
unused invalid expressions. A measured exact graph/scalar work threshold passes;
one fewer unit fails typed, followed by a successful fresh-budget retry.

The existing 14-test program corpus remains intact. Fresh-process replay now also
compares dyadic images and independently bounds sqrt(2). A newly written test
initially (incorrectly) required a one-grid-cell constant enclosure; Hyperreal
correctly returned two cells. The final test checks independent containment and
exact live/fresh-process agreement, without adding a tightness promise. The
original exact replay assertions are unchanged. Other retained intermediate
failures were compile-time API mismatches (extended versus finite bounds,
Ordering versus Option<Ordering, and a nonexistent SymbolRef constructor) and
an unused shared-oracle helper warning. Each is fixed; the complete admitted
command set was rerun after the final source/test edit. Earlier failed runs are
preserved rather than presented as final qualification.

## Completed workload and allocation observations

The external cost-project reuses the earlier counting allocator unchanged and
measures all 17 constructors plus degree 1/8/32/128 polynomials on [1/4,1/2], at
grids -16 and -64. Preparation and compilation are outside the measured region;
evaluation, full output checking and output destruction are inside. Constants
are exact rationals. Eight warmups precede 32 allocation iterations. Each warm
timing has 31 samples of eight iterations, pinned to CPU 0, with no concurrent
compiler or qualification run. Raw output and samples are in cost-qualified.log;
parsed rows and resource counts are in cost.json. This is an absolute probe,
not a matched speedup or validated-field measurement.

All 42 completed cases and 84 zero/one-work exhaustion cases finish with zero
live bytes in the allocation epoch. Absolute median times range from 402.125 ns
to 269,270.5 ns. The greatest observed temporary peak is 57,808 bytes (degree 128).
The greatest consumed graph/arithmetic work counts are 3,081 and 16,053,477,
within the declared 100,000-entry/1,000,000-graph-work and 16,384-bit-per-stage/
1,000,000,000,000-arithmetic-work configurations. These counts do not measure
all scalar work or constitute a general degree/operation-depth bound. Fresh
larger-budget retries reproduce the complete outputs after each exhaustion
probe. Artifact/source/dependency/toolchain/hardware records accompany the data.

## Remaining work

Bounded derivative construction, checked source/derivative associations, owned
field and Jacobian semantics, complete constant-refinement accounting, and
validated Euler/Picard evolution remain open. No phase completion, general
algebraic closure, geometry-kernel migration, or pending dynamics cost-gate
acceptance follows from this increment. Hardware, hosted targets and all other
previously open plan requirements remain open.
