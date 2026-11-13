# Owned expression field enclosures

Source commit `afe74ec511744b48aa6229d0fdd9b3f69bcc4ad6`, based on
`767de272ea1b8ddf420d3917e469bd19e1cfffbd`. This advances plan section 10.5;
it does not complete the fifteen-phase plan, the pending dynamics extraction,
or a validated ODE solver. CONTRACT.md records ownership, properties, domain,
and the missing acceptance witness before source changes. SOURCE_STATE.json,
source.patch and core-source/ identify the isolated eleven-file increment.

## Ownership and semantics

Hyperdynamics now owns a sealed EnclosedVectorField<N> and ExpressionField<N>.
Hypersolve remains the expression validation, derivative and image authority;
Hyperlattice supplies BoxN, IntervalVector and IntervalMatrix; Hyperinterval
supplies scalar enclosures. The adapter does not reproduce scalar or derivative
formulas. It validates exactly N outputs, N distinct state variables and one
distinct time variable, with arbitrary original binding order. All source nodes,
including unused references, pass native validation. The original source,
time identity and ordered state mapping determine immutable structural identity.
Clones share Arc storage; equality is not allocation identity or function equality.

Identity serialization emits FieldDefinition only. A consumer deserializes that
source and calls the constructor, which revalidates it and regenerates its
Jacobian. No field executable, independently authored derivative graph or validity
flag is deserialized. The image uses the original source without evaluating its
derivatives. Jacobian evaluation consumes original outputs before partials, then
moves column-major partial outputs into the native row-major matrix. Source-domain
guards survive zero derivatives. The sqrt field at zero has a valid value image
and an uncertified Jacobian; failure does not establish an invalid source field,
nondifferentiability of every composite, or absence of a solution.

Empty time or state inputs produce canonical empty vectors/matrices after graph
policy checks. N=0 retains the distinction between the unit Cartesian product and
the empty set. Returned Jacobians are consumed by native matrix-vector products,
including the shipped time-dependent oscillator example. There is no field cache
whose evidence could survive a changed source or exhausted attempt.

## Resource scope

One EnclosureBudget carries immutable EnclosurePolicy configuration and mutable
Hypersolve graph and Hyperinterval scalar counters. Reusing it aggregates work
across construction, image and Jacobian calls. ExpressionBudget exposes its
existing charge method and a check_entries adapter to its existing entry check;
existing callers, validation order and implementations are unchanged. The field
charges binding/shape bookkeeping, materialization and native interval copies.
Precision is a grid exponent, not a resulting-width promise. Cancellation is
checked between stages and before publication, including empty output paths.
A new budget explicitly starts a retry; failures do not poison later attempts.

This is not total-resource-bounded evaluation: source ingestion/serde, underlying
scalar payload cloning/destruction, Hyperreal constant refinement and heap bytes
retain their existing exclusions. Cancellation cannot interrupt an individual
native scalar/refinement stage. A successful source-bound formula enclosure is
not yet a general continuity, existence or uniqueness certificate. No ODE
trajectory, exact-horizon integration or flow-tube completion is claimed.

## Acceptance and qualification

Seven field tests cover 125 independently expected affine cases, arbitrary
binding order, explicit time dependence, nonlinear cubic images and partials,
source-domain guards, derivative singularities, independent constant derivatives,
N=0 unit/empty behavior, invalid source and shape, structural identity and changed
coordinate interpretation, fresh-process exact replay with a sqrt(2) coefficient,
entry/work limits, cancellation, precision transitions and larger-budget retry.
They test the exact constructor and Jacobian work boundaries and one-unit-short
failures. A cumulative image-then-Jacobian test consumes the exact sum of both
counters to zero; one less graph unit fails the second operation. No earlier
assertion or fixture was loosened. The new tests include serde-gated fresh-child
replay; minimal features exercise the six non-serde cases.

All seventeen commands in checks-final.json passed after the final source edit:
core all-feature/minimal/default configurations, Rust 1.95, release, strict
all-target Clippy, example, strict docs, stable Wasm, 874 Hypersolve owner tests,
AddressSanitizer, 466 integrated dynamics/path tests, integration Clippy, both
format checks and both diff checks. Supplementary staged checks and repository
retention budgets pass. The point evaluator benchmark smoke passes all 12 cases.
This is affected local/downstream validation, not the complete pre-push matrix,
hosted operating systems, hardware qualification or release packaging. No push
was attempted. The external consumer uses explicit path dependencies and is not
a published-package consumer proof.

## Completed workload costs

The external release consumer runs degree 0/1/8/32/128 Horner fields and N=2/N=4
affine fields. Independent integer expectations check images and Jacobians.
Each case completes constructor, JSON replay, image, Jacobian and combined
constructor/image/Jacobian workloads: 35 timed completed workloads. Twenty-one
separate small-budget cases check exhaustion and cleanup, not field completion.
Every allocation epoch ends with zero live bytes. Construction and pipeline
include cloning the definition; replay includes JSON parsing, validation and
Jacobian regeneration. Output validation and destruction are included. Preparing
sources, input boxes and preexisting fields is excluded where not part of the
named operation. Raw samples and the probe source/lockfile are retained.

There are eight warmups, 32 allocation iterations and 31 timing samples of eight
operations, pinned to CPU 0. Default policy uses precision -64, 1,000,000 graph
entries, 100,000,000 graph work, 16,384 scalar bits per stage and 10^12 native
scalar work units. The cost project resolves its own dependency lockfile; this
is an absolute probe, not a matched performance or speedup claim. Medians span
2.052 to 907.151 microseconds, with maximum observed peak 173,660 bytes. Degree
0/1/8/32/128 constructor graph costs are 51/116/599/2,255/8,879 units; N=2/N=4
costs are 422/1,918. Per-operation graph/scalar consumption is in cost.json.
These finite cases do not establish a universal memory, degree or runtime bound.

The existing point benchmark is 7,047,776 bytes, eight bytes larger than the
accepted-parent control. Its .text and .rodata are byte-identical; the sized
function interval union remains 3,150,521 bytes. .data.rel.ro differs, so whole
artifact identity is not claimed. The field consumer is 3,934,024 bytes with a
1,992,385-byte sized-function union; these are absolute artifact measurements.
Symbols, ELF sections, hashes, compiler, hardware and dependency metadata are
retained. This additive capability does not waive preserving-refactor gates.

## Separation from the pending extraction

The source was qualified and committed in an isolated worktree containing only
the minimal field package and the budget admission API. The main branch was
advanced with a mixed reset; all working-file bytes were checked before/after.
The original pending index and patch were preserved before that operation. The
legacy extraction was restaged over the new core package, leaving 40 pending
paths instead of 42 because the two licenses are now part of the committed core.
Its algorithm, adapter and test files and the original lib.rs legacy tail remain
byte-identical to the original pending index. Metadata/docs now compose with the
field package, so the rebased extraction patch hash intentionally differs.
COMMIT.json records both hashes. The Interface patch is unchanged; Firmware is
clean and unchanged. The extraction's cost-retention gate remains open.

Next work remains whole-field accounting and derivative/continuity evidence,
then validated Euler/Picard evolution, uniqueness, bounded halving, exact horizon
and endpoint enclosures and flow tubes. All earlier plan obligations remain open.
