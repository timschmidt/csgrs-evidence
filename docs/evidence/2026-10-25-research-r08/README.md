# R08 policy replay, affine continuation and explicit board-query receipts

Base source revision: `3cca6a894858c8b98497a3cfe81cff5e17e1a7f2`, with the
already retained R01/R04/R11/R05 milestones. No root commit or push was made.
`accepted-source/source.patch` and `accepted-source/new/` reconstruct the
cumulative unpublished implementation and acceptance files on that revision.
Locks, compiler identity, commands, source patches and executable hashes are
retained beside each experiment. Registry versions/checksums of both external
probes were checked against the workspace lock. Build targets and executables
are excluded from the archive with reasons and executable hashes; no historical
sample is reconstructed from a summary.

## Contract and baseline

The owning layers and properties precede implementation in `contract.txt`,
`affine-prototype/contract.txt`, and `hypercircuit-contract.txt`.
The independently zero expression is the sine addition identity
`sin(e+1)-sin(e)cos(1)-cos(e)sin(1)`. A square whose final point is `(z,0)`
requires the terminal to close on this target. `baseline-gate.log` and
`baseline-acceptance.log` reproduce the generic policy-mismatch Invalid and
same-policy translation/extrusion failure. A nonzero 1/100 gap is rejected
under both policies. Native exact squares remain certified under both.

## Retained changes

- A private policy-admissibility helper replaces duplicate checks in retained
  chord/selected-fiber validators; region chord provenance delegates to its
  existing validator. The new low-level `IncompatiblePredicatePolicy` cause
  becomes principal `Blocked(Predicate)`, retaining operation/family context.
  CSGRS maps the low-level cause to `Undecided` as well. This helper does not
  observe consumption merely because a policy was selected.
- Affine transforms which consumed terminal evidence skip the optional
  strictly closed native contour accelerator. Geometry, endpoints and retained
  boundary qualification remain authoritative; no native connection check is
  bypassed in the retained implementation. The exact source still takes its
  native path. `affine-prototype/baseline-tests.log` fails on the old
  `AmbiguousCurveStringConnection`; the same continuation test passes with the
  guard. Final acceptance adds the exact/native-view control. Two reversed/
  forward chains each run four translation/reflection/scale steps with Boolean
  reuse and strict retries, replacing the old source at each step.
- Hypercircuit has outcome methods for the complete point, inset, disc,
  segment and box queries. They expose `Provisional<Result<Classification<T>,
  BoardBoundaryGeometryError>>`; old methods retain their signatures and are
  documented compatibility paths. Operation certainty and prior construction
  fidelity remain distinct. Selecting approximation alone leaves exact queries
  certified. A certified outcome can still contain uncertainty or an error.

`hypercircuit-probe/baseline-run.log` uses an external observer around the old
methods. `candidate-run.log` directly consumes each new outcome method for
the terminal fixture; exact compatibility controls remain in both probes.
The logs are byte-identical across 30 query results: five symbolic cases and
five exact controls under strict/approximate/strict. Six checked-in acceptance
tests cover these decisions, nesting, source drop, mapping, errors, mixed
arc/line boundaries, cutouts and exact near-boundary offsets.

## Rejected or deferred experiments and failed attempts

`connection-prototype/` is an isolated broader experiment. It replays the
region's connectivity before constructing a native contour without another
strict connection check, and makes translation and extrusion complete with
qualified receipts. Native Contour2/CurveString2 have no retained closure-policy
field; subsequent native views cannot explicitly carry that dependency. A
strict rebuild of the native view remains blocked. This prototype is not
adopted. Its certified operation-local point classification is not by itself
a wrong answer, and no wrong certified answer was established. The pending
contract is to retain source-bound closure qualification through consumers.
`native-view-review.txt` records this distinction.

The typed helper initially encountered a const-drop compiler restriction;
the private error wrappers are now ordinary functions. Initial formatting,
Clippy and two test-harness API mistakes are retained. The initial broad suite
completed with 2,601 passing tests and four assertions still requiring the old
generic topology cause. Those assertions now require the more specific policy
cause; no fixture, predicate policy or acceptance requirement was weakened.

## Final checks and limits

`full-final/` is the complete seeded Hypercurve command:

    PROPTEST_RNG_SEED=20261025 cargo test --locked --release -p hypercurve --all-features --no-fail-fast -- --test-threads=2

It passes 2,607 tests in 70 test targets, with 35 existing ignored tests and no
failures. The command, including builds/waits, took 1,573.193 seconds within
an external 2,700-second limit. Its child RSS statistic includes compiler/test
processes; it is not a geometry-only peak-memory result.

`final-checks-1792922416729885577/` passes all 31 commands, with 350 Rust test
executions in 30 targets and 25 existing ignored tests. These overlap the full
suite and must not be summed as unique coverage. It covers:

- All-target/all-feature warning-denying Clippy for csgrs, hypercurve,
  hypercircuit and hyperbrep; final formatting and diff checks.
- Policy replay, qualified affine, source/native controls, PCB board queries,
  curved routing/materialization, modeling, BRep, curve continuation and budgets.
- Warning-denying docs and wasm32 Hypercurve/Hypercircuit layout compilation.
- FFI Rust tests/build and actual C, C++ and Python curve-error, transform-error
  and construction-evidence consumers.
- JavaScript/WASM and TypeScript consumers, plus the repository retention budget.

`candidate-gate.log` records the remaining native extrusion failure explicitly:
both policies still reach the principal Invalid wrapper around
AmbiguousCurveStringConnection. Classification/Boolean/affine strict replay is
Blocked(Predicate), and same-policy affine continuation now succeeds. Cold
archive/rebuild and other representation-specific replay guards remain open.

The native gate probe increases text by 20,312 bytes and file size by 12,424.
The linked board-query probe increases text by 5,116 bytes and file size by
8,624. These linked-probe costs include their compiled dependency changes;
they are not an attribution to one wrapper, a production/WASM release-size
measurement, or a speed claim. One-shot runtime observations are diagnostic.
There is no new internal total-work or memory bound. External timeouts contain
the runs; existing explicit work-budget regression tests remain successful.

The full repository pre-push/release matrix was not run. No CI configuration
changed, no deployment/publication ran, and no push was requested or performed.
R12 work remains in a separate private checkout and raw record; no R12 code is
included in this accepted R08 source.
