# Qualified prepared trajectory order sharing

Source `5722d7eaaeb561e74e5b8163c265a2557b7c2822`, based on
`204cc9609c1b77c7ca3c313aa6bce0f67f1b6b59`; eight paths in Hyperdynamics.
The original missing API was reproduced as E0599/101. Existing method bodies,
features, dependencies and package metadata remain unchanged. The old trajectory
source file only gains a module declaration. No acceptance assertion was removed
or weakened. `first-tests.log` records nine initial tests; final qualification
also includes the actual example and an algebraic-constant fixture.

`FlowTaylorProgram::restrict_order` supplies any prepared lower polynomial order,
including zero, using existing shared source/derivative DAGs. It copies bounded
stage handles and output indices; equal order shares the entire stage array.
The last retained stage is the selected order's complete Lie remainder. Ordinary
step and whole-horizon consumers remain the authority for existence, uniqueness,
analyticity and trajectory bounds. Higher orders return a typed unprepared-order
error; resource limits and cancellation retain their original typed causes.
DESIGN.md gives the prefix argument and resource/storage scope.

## Validation

Rust 1.95.0 and stable 1.99.0 each passed all eight recorded commands: 139 owner
library/integration tests in 17 suites, doctests, all-feature/all-target strict
Clippy, warnings-denied documentation, strict minimal-feature/all-target Clippy,
actual example execution, ten release tests and the unchanged legacy Taylor
benchmark smoke cases. `*-validation.json` and raw logs retain command/exits.

Tests compare all stages and complete deterministic proof reports with independent
preparation at every prefix; graph/native consumption and step dispatch agree.
Restriction itself has zero scalar/predicate dispatch. Storage-sharing checks are
separate from mathematical equality. Independent polynomial and rational-solution
oracles, algebraic constants, noncanonical bindings, uncertain inputs, zero order,
empty/unit products, invalid proposals, original denominator guards, exact and
one-short work budgets, entry failure, cancellation/retry, nested restriction,
use after the original owner is dropped, two-step and whole-horizon consumers are
covered. Three fresh processes reproduce complete source-derived proof artifacts.

All seven dependency-chain packages were built and verified from the clean source
commit. An archive-only consumer built, ran the actual packaged example and
passed strict Clippy. Nine owner test bodies also passed using only those unpacked
archives, including three fresh-process reconstructions; their original assertions
were preserved. The only test-copy changes enable cfg-gated bodies and omit the
example test already executed. Archived manifests, source hashes and metadata
confirm dependency provenance. Package excluded-file/unused overlay notices remain
visible. This is affected-seven qualification, not full release/publication.

Main-checkout formatting, repository budget, whitespace, all ten new tests and
the actual example are recorded in `main-validation.json`. Integration proves
exact reversal to the prior index tree and equality of pending content except
blob IDs/hunk metadata. The 41-path extraction remains unaccepted. Interface's
eight pending files and firmware are unchanged. Prior 41 frozen stages verify.

## Completed-workload evidence

Each fixture constructs all orders0..3, certifies all four complete flow proofs
on horizon1/8, checks endpoints/tubes against independent preparation, materializes
all reports and destroys them. Modes compare four independent preparations with
one preparation through order3 plus shared restrictions. Common original field
construction is excluded equally; all trajectory preparation is included. These
are explicit finite portfolios, not the unchanged adaptive controller.

Criterion: pinned allowed CPU, no concurrent compiler at timing launch, 30 samples,
1 s warmup and 2 s measurement per row. Host clocks/unrelated activity uncontrolled.
All 24 raw Criterion JSON files remain. Mean 95% intervals in microseconds:

| Field | Independent | Shared |
| --- | ---: | ---: |
| x'=2 | 194.716–201.309 | 172.477–172.710 |
| x'=x | 333.613–334.845 | 307.688–308.207 |
| x'=x² | 483.214–484.114 | 444.638–445.191 |

A separate repeated allocation/work diagnostic uses the same complete operations
and output assertions. Counts reproduce across repeated warmed runs:

| Field/mode | Graph work | Native work | Allocations | Requested bytes | Peak live requested bytes | Output live requested bytes |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| constant independent | 2050 | 1550544 | 1716 | 97490 | 38760 | 35520 |
| constant shared | 1784 | 1550544 | 1617 | 84482 | 33592 | 30352 |
| exponential independent | 2689 | 1834294 | 3064 | 135394 | 48416 | 44528 |
| exponential shared | 2360 | 1834294 | 2894 | 118122 | 42864 | 38976 |
| Riccati independent | 4458 | 1591480 | 4479 | 224999 | 59776 | 54312 |
| Riccati shared | 3906 | 1591480 | 4121 | 192487 | 51856 | 46392 |

Allocation/reallocation requests measure traffic. Live values account for this
operation's owned allocator-requested bytes; common input and independently
prepared expectations are excluded. All tracked live bytes return to zero after
report destruction. These are not RSS, allocator usable size, whole-process
retained memory or universal bounds. No general speedup, binary-size reduction,
existing-path performance change or source-size optimization is claimed.

The automatic adaptive controller still prepares each distinct order separately.
Lazy cross-order reuse there needs separate history/resource/cost qualification.
ODE noise propagation, wider wrapping/adoption, unresolved path/Interface migration
costs, embedded flash/stack/HIL, full pre-push and release work remain open. No phase
is declared complete. No push or publication occurred.
