# Alumina FOC conformance and completed-work cost

Source `3422eb3f10e0bd9fb9c0b152a71627ad4024df87`. CSGRS baseline
`a4560f1c9209396bc4409d0dc5d5f2fe92db2225`; unchanged firmware
`bdee397d0b80841f16bf17e7bcd029b4feb2c212`. SOURCE.json/patch identify the
implementation. initial-state.json covers all four managed repositories before
edits. ADMISSION.md was written first. No push or production migration.

## Ownership, domain and reproduced witnesses

This is the maintained Phase 6 Clarke/Park client required by the interval plan.
The standalone unpublished package lives at
`crates/hyperlattice-interval/conformance/alumina-foc`, with a no_std library,
native tests/probes and a separate no-allocator Wasm consumer. The production
package/dependency graph is unchanged. Four local dependencies are sufficient:
Hyperinterval, Hyperlattice interval algebra, Alumina FOC and protocol. Both
lockfiles are committed in the source revision. No executable is archived here.

Alumina retains Q30/phase/frame wrappers, validated Rotation, balance policy and
FocError. Shared fixed arithmetic owns every product/division/conversion;
Hyperlattice owns the interval linear products. The input domain includes every
valid nonempty Q2.30 interval, valid public rotation and signed balance bound.
Rotation validation uses the original Alumina constructor; the client repeats
the existing balance policy with shared wide arithmetic. There is no implicit
midpoint, float demotion, new solver status or numerical policy. The scalar source and matrix dimensions bound the
loops; there is no heap allocation or new iterative resource contract.

The pre-edit baseline-witness.log reproduces two invalid shortcuts:

* alpha=MIN, beta=0, sine=-1/cosine=0: native Park rejects intermediate MIN*-1,
  whereas a signed dense matrix returns a representable result.
* phases=(1,0,-1): pre-rounded 2/3 and -1/3 matrix coefficients produce alpha
  [ONE-1,ONE+1]; native Clarke returns exact ONE.

The client preserves staged rounded products/subtractions and computes Clarke
integer linear numerators with widened i64 storage before division/scaling.
Numerator magnitudes are below 2^34 for i32 sources; all needed scaled products
fit i128. Additional exact addition of zero in a matrix dot cannot change a
successful fixed result or create overflow. No tests or native bodies were
weakened; both original mismatches are preserved as deterministic witnesses.

## Commands and exact outcomes

`checks.py`/checks.json are the initial complete 24-command matrix;
`checks-final.py`/checks-final.json repeat it after adding allocation-error cases.
All commands pass with no warnings. The records include full argv, elapsed time,
exit code and log path: Rust 1.88/stable debug/release tests, Clippy -D warnings,
docs -D warnings, ARM/Wasm builds and Clippy, standalone/Wasm/workspace formatting,
fixed-only owner tests (23 tests/doctests), the unchanged 83 FOC tests, and
normal dependency inspection. The original firmware baseline also passes 83.
The shared probe include receives an additional explicit rustfmt check.

The endpoint and seeded transform corpus compares full outputs and typed errors
for 399,950 cases: 95,848 successful transforms, 26,366 Range failures and
277,736 UnbalancedPhases failures. Successes enclose independently evaluated
exact integer corners of the original expressions. The scalar corpus compares
12,025 pairs for product and division against independently ordered rational
corner extrema, using native, shared i32 and shared widened/narrowed paths.
Seed 20261112, full endpoints, zero-crossing intervals, valid continuous rotation
families and rounding residues are retained. There are 64 successful five-step
chains with every intermediate compared and source endpoint containment checked
for those fixtures. This is not a universal round-trip identity for all phase
boxes. Independent integer inequalities validate both authored radical brackets.

The global allocation counter is reused from the existing owner support module.
It covers native/shared complete sample generation and transforms, plus shared
and native range/balance error paths: zero calls and zero bytes. Exceptions are
not converted into completed geometry or dropped errors.

    CARGO_TARGET_DIR=/tmp/interval-refactor/foc-target-asan RUSTFLAGS='-Z sanitizer=address' ASAN_OPTIONS=detect_leaks=1 cargo +nightly test --locked --manifest-path crates/hyperlattice-interval/conformance/alumina-foc/Cargo.toml --tests --target x86_64-unknown-linux-gnu -- --nocapture

asan-final.log: seven client tests pass across six executables (four have no
unit tests). Initial sanitizer output is also retained; no leak/error occurred.

    CARGO_TARGET_DIR=/tmp/interval-refactor/foc-target-coverage RUSTFLAGS='-C instrument-coverage' LLVM_PROFILE_FILE='/tmp/interval-refactor/foc-client/coverage/%p-%m.profraw' cargo +1.95.0 test --locked --manifest-path crates/hyperlattice-interval/conformance/alumina-foc/Cargo.toml --tests --message-format=json -- --nocapture
    python3 /tmp/interval-refactor/foc-client/coverage_report.py

Raw/merged profiles and reports remain. LLVM uses -num-threads=1. Scope is the
new client library and sample generator, excluding dependencies, test support,
tests and probe binaries. 172/174 lines (98.85%), 382/401 regions (95.26%),
17/17 functions; no branch counters supplied by this tool mode. The unexecuted
lines are invariant-failure arms. No complete-core/100% coverage or fuzz claim.

## Actual Wasm execution

    cargo +1.88.0 build --locked --manifest-path crates/hyperlattice-interval/conformance/alumina-foc/wasm/Cargo.toml --target wasm32-unknown-unknown --release
    /tmp/interval-refactor/tools/bin/python /tmp/interval-refactor/foc-client/wasm-replay.py

The module links without a global allocator and has no imports. Wasmtime 50.0.1
runs 1,660 completed transform calls across a 165-fixture period and 405 full-range
Park calls (335 successes/70 typed overflows). Full native/shared outputs are
compared inside the module. The external Python exact-integer implementation
checks every output tag/endpoint digest and expected error. The 1,000,000 fuel
cap is never reached; maximum observed fuel 28,172. This is Wasm fuel, not CPU
cycles. Module: 43,086 bytes, SHA-256
67c36ef145e556a2b7930f747c7b560bcbea273b58d3cb9c5ef6726f5bf94c5e.
No HIL, physical behavior, hardware cycle or peak-stack qualification is claimed.

## Matched costs and rejected production adoption

For each of Rust 1.88 and stable:

    cargo +TOOLCHAIN build --locked --release --manifest-path crates/hyperlattice-interval/conformance/alumina-foc/Cargo.toml --bins
    crates/hyperlattice-interval/conformance/alumina-foc/target/release/cost

Default release flags, no RUSTFLAGS overrides; environment.json records the host
and complete compiler versions. The shared host is unpinned. Each run has 200
samples: native/shared × five actions × twenty samples, 512 completed calls per
sample after 64 warmups. All inputs are prepared before timing. Timing includes
completed output materialization, checksumming and allocation-counter overhead,
identically for both paths. Equality of every successful output is asserted
before timing. All corresponding checksums match; allocations remain zero.

Shared/native median ratios on Rust 1.88: Clarke 3.31, Park 0.71, inverse Park
0.71, inverse Clarke 0.69, chain 1.65. Stable: 4.26, 1.11, 1.09, 1.09 and 3.14.
These are focused completed-work probes, not universal speed claims. Both raw
CSVs, full summaries and unfavorable samples are retained. They reject blanket
production migration; favorable individual 1.88 timings do not waive the gate.

The two footprint binaries use the identical included workload body and differ
only in the selected provider. Five runtime seeds produce identical endpoint/tag
checksums across implementations and compilers. Native/shared sizes are
444,848/450,600 bytes on 1.88 (+5,752), and 460,720/470,648 on stable (+9,928).
Final digests and section tables are retained. Probe programs were rebuilt after
formatting their common include; output checksums and byte sizes remain equal
to the initial probes, and the timing binary remains byte-identical on each
compiler. These are host probe sizes, not full firmware or monomorphized-code
measurements. A production migration must pass the full required gates later.

Decision: keep the required maintained client and measurements; reject the naive
signed Park and pre-rounded Clarke rewrites; reject wholesale production
adoption of this generic path until fixed specialization resolves the time/size
regressions. The client is evidence infrastructure, not an adopted optimization.

## Preservation and remaining work

source-preservation.json verifies 172 byte-identical production/shared-support
files. Firmware production code remains unchanged. repository-budget.log passes.
No original scalar arithmetic, dispatch predicate sequence, policy, or solver
report is modified. The package graph contains no Hyperreal/Hyperlimit policy
path; fixed conformance does not stand in for their trace/receipt gates.

Independent authored midpoint/radius, Jacobian carriers, remaining measured
specializations, clock/interface/firmware migrations and later plan phases are
still open. No full legacy benchmark, all-workflow pre-push, release, hosted OS,
new fuzz campaign, or complete phase/goal claim follows from this checkpoint.
