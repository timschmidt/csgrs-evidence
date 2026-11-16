# Rejected: adaptive coefficient-association sharing

Target CSGRS d17bd974757330dd739a23556d409539e8e9d7cb, Rust 1.95.0,
x86_64 Linux, locked/offline dependencies, 16 build jobs. Initial-state records
were captured before advancing the clean isolated checkout from 217bdda844;
all baseline and candidate compilation used d17bd974. Main 41 staged paths,
Interface 8 pending paths and firmware were untouched.

This revisits the rejected adaptive-order-sharing typed prototype only with a
new ownership hypothesis: share each complete immutable coefficient association
in one Arc, preserving the stage's executable and output positions. The source-only
zero-order extension delegates to fresh preparation because its authored source
is already shared. No predicate call or existing logical work charge is reordered.
The prior macro/extraction-only timing failures remain disqualifying evidence for
those earlier candidates. The prior hypothesis was rediscovered during review;
INITIAL-OWNERSHIP-HYPOTHESIS and initial-read-only-review are superseded by ADMISSION.

## Exactness and sharing

The missing pointer-sharing witness fails on the accepted revision, then passes
on this candidate. Pointer identity is only a storage witness, not equality of
represented mathematics. The existing independent coefficient/oracle and adaptive
history/resource tests remain unchanged. Twenty tests pass across four binaries:
9 adaptive-sharing, 1 original preparation fixture, 9 order/restriction, and
1 current baseline observer. Both observers match all 373,388 baseline artifact
bytes (SHA-256 9427a38397bda4fa56b68b0911a4d750cc3ff9bc85e38b2a6635199822ad2fd1),
including full graphs/reports, dispatch and graph/native work for constant,
exponential and Riccati fields. This is finite strict enclosure evidence, not
full two-policy geometry qualification or a universal correctness proof.
Rust 1.95 Clippy, all owner targets with adaptive-taylor and dispatch-trace,
passes with -D warnings. No tests, assertions or budgets were weakened.

Stage layout bytes for dimensions 0/1/2/64 change from 96/104/112/608 to
40/48/56/552. Generated associations acquire an extra allocation; the smaller
inline stage does not establish reduced total allocations or retained memory.
No runtime/heap advantage is claimed.

## Decisive early size gate

Same checkout/compiler/features/target build directory and release command:

| Existing executable | Raw byte delta | .text delta | Named owner text delta |
| --- | ---: | ---: | ---: |
| hyperdynamics | 0 | 0 | 0 |
| adaptive_taylor | +4264 | +1664 | -1165 |
| taylor_orders | +544 | +144 | -111 |
| coordinate_transition | 0 | 0 | 0 |
| taylor_flow | +1528 | +272 | -318 |
| taylor_evolution | +240 | +112 | -209 |
| qr_coordinates | 0 | 0 | 0 |
| qr_evolution | -8048 | -2032 | -664 |

Named owner text is a deduplicated address/size union of symbols containing
hyperdynamics, not all inlined owner instructions. Other named text and complete
section tables are retained. Four raw binaries grow; lower sizes elsewhere do
not waive these per-workload gates. This combined candidate is rejected. No
instruction-level attribution or timing benefit is inferred. The new shared
benchmark has no accepted-baseline equivalent and cannot justify old-path growth.
No runtime, allocation, full downstream, successive_operations, coverage, fuzz,
WASM or pre-push campaign follows this early rejection. No variant is retained.

## Restoration

All 5 tracked edits and 7 experiment-only files were saved and removed only after
byte verification. The isolated checkout is clean at d17bd974. Restored existing
adaptive tests (9), order tests (8), and workspace formatting pass. All eight
rebuilt existing benchmark executables match baseline SHA-256 and size exactly.
Protected primary/Interface patches match the initial digests; firmware is clean.
All 73 prior frozen stages verify unchanged. No push or publication. The full
15-phase objective and automatic cross-order reuse remain open.

The initial artifact extraction script incorrectly expected spaces after observation
labels, then incorrectly expected only one observer. Inspection showed 18 baseline
rows and two identical 18-row candidate observer blocks; the final comparison
checks both full blocks. Neither failed diagnostic changed code or test results.
Candidate formatting completed across the restoration boundary, so only the
separately completed restored format check is credited here.
