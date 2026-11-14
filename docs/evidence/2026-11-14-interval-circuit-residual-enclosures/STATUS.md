# Circuit residual and Jacobian enclosures

Retained source 83b608d92c7d5fdaec1dd1e146709948f33e1348 adds the opt-in
Hypercircuit feature `interval-residuals`. It implements the circuit consumer
portion of Phase 13: ordered circuit unknowns and component tolerance bindings,
exact residual sources, full-domain residual/Jacobian enclosures and root exclusion.
The full fifteen-phase goal remains active. No phase is marked complete.

## Authority and supported contract

`CircuitResidualProgram` associates an immutable Hypersolve source with exact
symbol order, net-voltage/branch-current identities, component parameters (nominal
value, name, units and provenance), and equation labels. Duplicate physical input
identities and mismatched symbols/counts are rejected before derivative generation.
Each independently varying input has a derivative column, including parameter
sensitivities. Repeated occurrences share their source symbol. Correlated physical
parameters require shared latent-input expressions rather than independent lanes.
Metadata is an authored association, not validation of external circuit equations
or dimensional analysis.

`LinearMnaSystem::residual_program` validates square shape and snapshots its exact
matrix/RHS and unknown order into that same carrier using a flat graph. It does not
restamp the circuit, invent component provenance no longer present in the matrix,
or change existing point replay/solving. Algebraic coefficients remain exact source
objects. Later mutation of the public MNA fields cannot alter the snapshot/evidence.

Hypersolve owns derivative generation and sufficient full-domain continuity/C1
checks; Hyperinterval owns native bounds and domain outcomes; Hyperlattice owns
matrix projection/products/norms. The adapter adds no scalar or derivative kernel.
Reports retain circuit metadata and the complete source-bound regularity certificate,
arguments, precision and derivative values for subsequent consumers. An `Excluded`
row has a range excluding zero and proves no simultaneous root in the box.
`NotExcluded` proves neither a root nor uniqueness. `Empty` denotes an empty input
product, distinct from a nonempty zero-dimensional unit product and all failures.
Shape checks precede empty success. Native dyadic products are the supplied domains;
no implicit rational-to-dyadic tolerance conversion is performed.

Graph work/entry limits and native arithmetic budgets are caller supplied and shared.
Constructors check size before cloning MNA payloads; failed/cancelled attempts publish
no partial certificate and do not mutate or poison the source. Metadata strings,
exact scalar payload/refinement, total heap bytes and cancellation within scalar or
native operations remain explicit exclusions. Replay definitions, input metadata and
domains through constructors; serialized flags and derivative caches are not proofs.

## Acceptance and executed validation

The missing MNA consumer is reproduced as an E0599 compiler failure on the baseline.
Eleven final acceptance cases cover uncertain resistor residuals with independent
analytical/point derivative expectations; all existing linear stamp families;
immutable MNA snapshots; algebraic coefficients and positive-square isolators;
shared-parameter correlation; generated derivative-source consumption; downstream
matrix/norm projection; shape and duplicate identity failures; empty/unit/zero-row
products; nonlinear inverse-Shockley logarithm guards; typed causes; construction
and query budgets including one-unit-short final work; cancellation/retry; fresh
process definition replay and invalid source references; and zero-dispatch getters.

The initial all-core circuit run passes 116 top-level tests in 48 groups, including
an earlier ten-case version of the new corpus. Final focused tests pass all eleven.
The combined main checkout repeats the entire core run: 117 tests pass. Strict
all-feature/all-target Clippy passes both isolated and combined checkouts. Docs with
warnings denied, disabled-feature build, WASM feature build, formatting and repository
budget pass. Existing MNA and dispatch tests remain unchanged. There is no claim of
all-feature geometry integration test execution, a full pre-push/workflow matrix,
coverage/fuzz/sanitizer campaign, platform/HIL qualification or release readiness.

TEST-CORRECTIONS.md preserves initial fixture mistakes and their correction. In
particular, the existing quotient derivative R/R^2 overestimates the exact 1/R
image. The original test mistakenly assumed a minimal hull. The final fixture keeps
the same source/domain, checks the actual conservative bound, independently checks
inclusion of the analytical derivative range and verifies exact corner derivatives.
No lower-layer rule or predicate order changed. Exponential nodes are not part of
the current source grammar; the nonlinear test uses ln(1+I)-V=0 on I>-1 instead.
The full original compiler/test output remains available.

## Completed-workload costs

The maintained `interval_residuals` bench measures source/derivative preparation,
prepared query reuse and fresh preparation plus query for the same uncertain
resistor residual V/R-1. V lies in [3,4], R in [1,2], grid precision is -16.
Every complete query materializes exact source/metadata association, arguments,
residual [1/2,3], conservative Jacobian ([1/4,2],[-4,-3/4]) and the same root
exclusion. Graph limits are 100,000 entries / 10,000,000 work and native limits
4,096 magnitude bits / 100,000,000 work. Three CPU0/ASLR-disabled trials each use
10,000 complete operations per mode following 16 warmups, with no builds, tests
or profiles running concurrently. Mean time per operation, minimum–maximum:

| Work | Microseconds |
| --- | ---: |
| Source/derivative preparation | 7.245–7.262 |
| Reuse query | 14.808–14.845 |
| Prepare and query | 27.287–27.305 |

Reuse includes prepared source/cache benefits; this is not a universal or one-off
cold-call speedup. It does not claim minimal derivative bounds or automatic circuit
solving. The independent observer copies the whole benchmark body; external dependency
versions match the workspace. Thirty-two post-warmup construct/drop iterations per
mode return to zero incremental live heap. Preparation allocates 8,985 bytes/op and
peaks at 2,876; query reuse allocates 3,740 and peaks at 1,984; preparation plus query
allocates 12,725 and peaks at 3,612. A retained query owns 656 incremental bytes and
uses 101 graph / 21,676 native work units. Prepared source/derivative ownership adds
1,628 retained bytes over the already-held original source/metadata. Existing source
objects/caches and allocator/platform overhead are excluded. These are measured
fixture costs, not a universal total-memory guarantee.

Five existing MNA benchmark cases complete in six baseline/default/enabled runs.
The baseline and default candidate executables are byte-identical (3,223,768 bytes,
SHA-256 84c6acdc7de86472da7b53d31367a7d446a68c1e9a04c9afc9f4f452b0037304).
Enabling the feature adds 21,408 executable bytes and 80 .text bytes; .rodata size
is unchanged. No adverse separation is observed by the simple min/max screen, but
visible timing drift makes these controls a limited screen, not statistical proof
or a speedup claim. The opt-in memory/code costs are admitted for the new capability.

## Integration, evidence and remaining work

Alternate-index application and exact reversal recover the original pending tree.
The optional dependency insertion in Cargo.lock changes pending-diff blob IDs and
hunk offsets, so the pending SHA changes from
676e5d602a1fbdcc3fc7ff0d15bfb62692ef03f69a5a62f957aa7c7b6697b359 to
e52d18c6c53a33a3037b977bb3f718eca60ff766f474b024748897b7ffef4273.
The preflight verifies all other patch content is identical before main mutation;
all original 41 staged paths remain. Interface's eight edits and Firmware's clean
state are unchanged. All 33 earlier frozen stages verify unchanged. No push occurred.

Automatic device-parameter lowering, exponential expression support, nonlinear
root/existence/uniqueness proofs, circuit transient reachable envelopes, additional
consumer adoption, automatic wrapping/order/frame evolution, the Phase 11 timing
blocker, embedded qualification and coordinated release remain open. This source
extension does not establish the full requested final state.
