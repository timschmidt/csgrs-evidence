# Reproduce native surface interval range evidence

This record concerns the optional native rational Bézier tensor range consumer.
It does not close the fifteen-phase interval refactor or general surface algebra.
All work is local; these source/evidence commits have not been published.

## Source identities

- Base: `b0fde90b4d9eb51c51723fb6e24a9b6ab6938962`.
- Expanded acceptance: `e5c4e01f9ff7b8a32cdf991aff419a2970da632b`.
- Measured production/workload: `2d2fc538b7cc8b3b76555878cf34064e4f4ee072`.
- Fixed owner qualification: `014a082252da83d8d5d566253bcb598c7a456df3`.
- Documentation metadata: `d625de5b8e93dcb34e481a99253b1bb3cdd77592`.

`qualification-source.json` binds every tracked input at the fixed owner
revision. `COST-COMPLETION.json` proves only documentation changed after timing.
`DELIVERY-SOURCE.json` proves the subsequent metadata commit changes no Rust
source, test, workload, runtime dependency or default feature. Its only manifest
addition is `package.metadata.docs.rs.all-features=true`.

Use a clean checkout of the named revision. Never execute this record's writer
scripts inside a frozen evidence directory: copy them to a new mutable directory
and change their explicit source/build/output roots. Keep original observations.
Do not regenerate lockfiles from scratch; retain and audit registry versions and
checksums when changing a standalone consumer root.

## Correctness and owner/downstream checks

`acceptance-validation.json` and its logs record 52 focused passes. The complete
fixed-source command list is in `qualify-owner.py`; actual completed commands and
their exit codes, elapsed times and log digests are in
`qualification-commands.json`. A missing row is not a pass. The driver stops on
failure and verifies the same clean source before every command and after the
last command. It uses Rust 1.95.0, two release test threads and explicit Cargo
build jobs. Stable compilation is a separate check, not stable runtime coverage.

The private lifecycle corpus checks native homogeneous-cache identity separately
from shared scalar-fact warming. `TRACE-REVIEW.md` retains the original mistaken
new-fixture premise and four complete actual lifecycle snapshots. Existing trace
assertions and native evaluator bodies are unchanged. Algebraic expanded scalar
comparison can remain undecided; the maintained exact per-node quadratic oracle
and original failed diagnostic are retained rather than claiming universal
scalar-decision closure.

## Completed costs

The checked-in `benches/support/surface_ranges.rs` defines three complete
sixteen-cell portfolios. Both modes include preparation, all coordinate/partial
evidence, native exclusion and destruction. Independent analytic extrema validate
the whole output. `measure-final-cost.py` produces the final warm observations;
`measure-cold-cost.py` produces fresh-process cold observations. Use the recorded
toolchain, features, dependency versions, CPU affinity, timing boundaries and
explicit budgets. Stop other builds/tests/profiles during timing.

Final authoritative warm records have the `final-` prefix. Earlier records are
retained as history. Cold timing excludes native source construction and the
independent oracle between query and destruction spans; it is not OS-cache
coldness. Allocation probes use the existing ownership-aware header instrument,
count requested payload rather than RSS, and separate live output from storage
remaining after source/output destruction. `retention-summary.json` records the
32-query plateau diagnostic, not a uniform heap bound or allocation attribution.

## Actual package consumers and documentation

`package-final` verifies nine archives at the fixed owner source and runs the
unchanged shipped example with dependencies resolved only from those archives.
`wasm-package` builds the same example into a test-only export and runs three
sixteen-cell portfolios in Node 22.23.5, with zero imports and the default linker
stack. The WASM artifact is a debug build; this is not public JS binding or
release-size qualification.

`package-delivery` repeats native archive build/run/strict Clippy at the metadata
revision. `package-docs-followup.py` declares every packaged HyperBrep feature in
a dedicated root and verifies the resolved set before strict rustdoc. This avoids
Cargo's rejected `--all-features` invocation on an external dependency. Rendered
module and five item pages are checked. Actual hosted docs.rs execution is not
claimed. `archive-source-equivalence.json` compares both archive sets: Rust
sources/fixtures are byte-identical; changed dependency checksums are individually
matched to the new archive digests. The initial failed byte-only premise remains.

## Integration and limits

`integration-rehearsal-metadata.json` proves clean application and exact reversal
in an alternate index, with logical preservation of all 41 pending extraction
paths. It does not establish that integration has occurred. Consult the final
integration and qualification records for completed actions.

Full pre-push workflows, hosted platforms, public language bindings, total
scalar/heap resource bounds, universal coverage/proofs and general surface
operation closure remain separate obligations. Unsupported carriers and
denominator overestimation remain explicit outcomes. No existing fixture,
certainty policy or acceptance gate was weakened to obtain a passing result.
