# Public curve trait compatibility, 2026-11-05

Owner: Hypercurve immutable shared parallel-fidelity construction. P18, P19,
P20 and P37 require generated native carriers to remain consumable by ordinary
thread and unwind-aware clients at the supported default compiler limit.

Source revisions: parent 628ede94d28404cd9e81b85442c81102de6c35d4;
R24 baseline 41fb7657dcad1e6a6f079ee279ef65537fb8101e;
fixed 952b987fe8b23ace512619fb4b1e63ca9d7c17a5 (including the packaged
consumer correction through 28cc997db655d4b745acb0b9ca5e7096f1af0886).
The parent external consumer passes; R24 fails E0275 on Curve2 without added
nesting or recursion attributes. The fixed default-limit consumer passes on
Rust 1.95.0 and 1.99.1. Two maintained integration tests compile all three
native carriers with Send, Sync, UnwindSafe and RefUnwindSafe; generated geometry
then crosses a thread, reversal and a caught unwind with independent endpoints,
bounds and its original fidelity receipt intact.

A private trait-object boundary retains the original shared construction
allocation and compiler-checked bounds. It adds no manual unsafe trait assertion,
extra construction allocation, scalar materialization or geometry authority.
All original fields, exact borrows, sharing, replay checks and payloads remain.
The client-specific documentation recursion workaround is removed.

The two maintained tests pass on stable and MSRV; the MSRV minimal feature
configuration also passes. Nine existing fidelity tests and four native graph
validation/budget/cancellation tests pass. Strict all-target/all-feature Clippy
passes for the four directly affected consumer packages. Both full unchanged
package workflows pass, verifying all 18 packages, their docs.rs configurations,
clean external Rust/README user paths and C/C++, Python, Go and TypeScript
consumers. Network-denied attempts and their exact retry records remain.

The native-feature WASM check passes on stable. The optional comparative
all-feature WASM probe fails at getrandom in both the unchanged baseline and
candidate; MSRV WASM was unavailable because its target was not installed.
Neither is credited as passing. Full final integrated CI remains a separate gate.

Matched allocation/output probes use identical source and dependency locks,
20 samples per variant in five completed workloads, alternating blocks of five.
Every geometry document and native document matches byte for byte across all
runs. Independent geometry/receipt assertions and existing regression tests
support semantics separately from deterministic bytes. Curve2 remains 8 bytes.
Allocation counts are unchanged; candidate allocated bytes increase by 16 for
construction/edit, 40 for SVG replay, 24 for BRep replay, and zero for plain
geometry. Peak increases are respectively 16, 24, 16 and zero bytes. The probe
executable grows by 17,336 bytes. The larger private shared handle costs eight
bytes per stored source handle; graph enum layout can add replay overhead.
Timings are short, contended observations and establish no speedup or general
completion envelope. Retained allocation deltas include existing caches and
are not a leak-freedom claim. Reproducer manifests retain original local paths;
replace only the checkout prefix when checking out the cited source commits.
No compiler binaries, package archives or build caches are redistributed.

This record qualifies the scoped compatibility repair and its packaged user
paths. It does not establish universal algebraic closure, full BRep integration,
final pre-push completion, registry publication or deployment.
