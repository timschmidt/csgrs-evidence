# Sensitivity and matrix scaling: prototypes rejected on binary size

Source revision: c64758fbc4480312e398cdc05cce8c59aeb1f046, isolated from
primary's 41 staged extraction paths and Interface's eight pending paths.

The inspected source already supports manual affine flow-noise propagation.
This experiment instead reproduces a missing public whole-horizon initial-state
sensitivity API and missing matrix scale method. These are API witnesses, not
proof that existing lower-level operations cannot express the constructions.

The new sensitivity prototype consumes immutable certified Picard C1/Jacobian
reports, encloses ordered Peano–Baker terms and a norm tail, and composes local
transitions on the left. It passes one exact uncertain-shear, four-segment
witness. It is not a qualified sensitivity implementation: the intended
noncommuting, nonlinear, resource, cancellation, replay and physical-consumer
corpus was not completed before the size rejection. The mathematical references
and proposed domain are in ADMISSION.md; no universal support claim is made.

The combined candidate grows the existing flow_noise executable by 800 raw
bytes / 496 .text bytes, with Debug/drop code-size changes, and qr_coordinates
by 24 raw bytes / zero .text bytes. The dynamics prototype is removed without
an arbitrary layout/inlining retry.

The independent matrix candidate uses the owner's existing scalar multiplication
and fallible-array builder, with one shared context in row-major order. Its 92
owner tests pass, including generic independent endpoint oracles, rectangular
product -> scaling -> vector consumption, fixed rounding/overflow, explicit
empty/unit products, exact dyadic budget exhaustion/retry, zero primitive
allocations and fresh-process replay followed by multiplication. All 1,674
Hypersolve/Hyperdynamics downstream tests also pass.

The matrix-only candidate still grows reachability by 8 raw bytes and
qr_coordinates by 24. Only .strtab sizes grow (+14 and +26); named code-symbol
sizes are unchanged, and the inspected allocated sections differ only in build
ID. This establishes a raw-file size failure, not a runtime performance failure.
No timing or new-API performance claim was measured. The recorded gate is not
replaced with a stripped or allocated-section comparison.

Both candidates and their tests are archived and removed. The isolated checkout
is clean. All 26 restored executable metadata captures match the original hashes
and sizes. The driver used 25 distinct names because taylor_orders is both an
example and a benchmark; its physical artifact was overwritten, but all 26
metadata rows were captured independently and compared by executable path.
See artifact-naming-note.txt and complete-artifact-comparison.json.

Restored owner tests: 89 passed. Restored native evolution/flow-noise controls:
two passed, with all three native trace rows identical and the fixed flow-noise
fixture unchanged. Restored owner/dynamics formatting passed. These are scoped
local checks; no claim of full CI, MSRV, portable, fuzz, coverage, release,
successive_operations or latency qualification is made for either rejected API.

All 76 previous frozen records and protected repository states were verified.
No production/test changes, push or publication are retained. Neither public
extension nor any plan phase is marked complete. The full goal remains active.
