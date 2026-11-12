# Unit-bearing measurement delegation qualification

SOURCE.json identifies the committed Interface production change and CSGRS
conformance source, their baselines, patch digests and clean worktrees. The goal
remains the complete interval-refactor plan. This record qualifies one Phase 8
constructor delegation; it does not complete Phase 8 or authorize a push without
the repository's full pre-push requirements.

## Contract and source

ADMISSION.md records the owning layer, original domain, missing witness and
candidate sequence. BoundedMeasurement<U> delegates exact rational nominal +/-
uncertainty arithmetic to the existing RationalInterval constructor. Unit type,
endpoint storage, const getters, successful values and the existing negative-
uncertainty failure/message remain. An added BoundaryError::Interval retains an
unexpected typed kernel source and its scalar cause. This public enum addition
is documented for exhaustive callers in Interface's migration document.

The scalar body and predicate sequence are unchanged: one sign check, subtraction
then addition; owned Rational operators delegate to the same borrowed kernels.
Bounds::ordered adds no comparison. Arc clones removed from the adapter do not
change scalar identities. Successful construction cannot be empty. All CSGRS
production sources remain unchanged; the experimental inline hint was removed.
interface-preservation.json records 116 unchanged existing Interface files.
Firmware remains unchanged. No canonical encoding or machine-profile formula is
modified. This is not full machine-profile/browser migration qualification.

## Validation

- baseline-core.log: 199 original Interface library tests pass before production
  edits. baseline-conformance.log records the initial missing conformance suite.
- checks-final.py/json: all 15 final selected commands pass after the final
  harness changes. They include five conformance tests in debug/release, Clippy
  with warnings denied, documentation with warnings denied, Wasm Clippy, 201
  Interface tests/doctests, 17 rational-owner tests/doctests, three formatting
  checks and dependency inspection. Individual final-check-*.log files are the
  final run; pre-probe-isolation-checks/ preserves the earlier complete matrix.
- Independent fraction-grid tests cover 2,145 cases: 1,485 valid radius cases
  and 660 negative radius cases. Both Millimetres and Seconds, exact replay and
  subsequent addition are checked. Eight representation fixtures include large
  rational numerators of roughly 4,000 bits. No float ingress or implicit
  midpoint occurs.
- Fresh-process cold/once-warmed comparisons preserve complete construction
  TraceSnapshot values and downstream exact-rational comparison counts and
  receipts under STRICT and APPROXIMATE_512. Host comparisons use full values,
  including errors; checksums alone are not acceptance evidence.
- Fresh-process allocation tests compare the original arithmetic formula with
  the wrapper, with input preparation and serialization outside the counter.
  Counts/bytes match for all fixtures; cold success takes 0–7 allocations,
  once-warmed success 0–3, and negative uncertainty zero. These are distinct
  from the 32-warmup repeated-input timing experiment, which allocates zero.
- final-isolated-asan.log: all five tests pass with ASan and leak detection,
  including both sets of child processes. Command: CARGO_TARGET_DIR=/tmp/interval-refactor/measurement-target-asan
  RUSTFLAGS='-Z sanitizer=address' ASAN_OPTIONS=detect_leaks=1 cargo +nightly test
  --locked --manifest-path crates/hyperinterval/conformance/alumina-measurements/Cargo.toml
  --features trace --tests --target x86_64-unknown-linux-gnu -- --nocapture.
- The Wasm oracle uses Python Fraction for exact bounds and the scalar's mixed-
  fraction text convention. 4,369 calls pass: 3,015 successes, 1,330 negative
  radii and 24 invalid denominators. Unexpected kernel-error status is explicitly
  rejected. Seven binding imports are installed only as traps; none is called.
  Maximum final fuel is 43,846 under a one-million-per-call bound. Full-value host
  tests supplement the Wasm endpoint-text hash comparisons.
- final-wasm-replay.json identifies the 960,440-byte final raw module, SHA-256
  b35ab853788002c0243309c3ed8972a8625614d49a3888a0a3bac68bca3a1835.
  baseline-status-wasm-replay.json identifies the final-harness baseline,
  960,500 bytes, SHA-256
  ab81c219f391ad5c0aae272565e413544430bbcf84a55b71c5e85c48498ef70f.
  This headless consumer is not an application browser/interactive-latency or
  full-UI-memory qualification. No new fuzz or whole-application coverage claim.
- A preexisting stable deprecation warning for alumina-runtime's fetch_update
  appears in both original and candidate Wasm builds. It was not suppressed or
  introduced by this work; changed code passes the selected strict Clippy checks.

## Comparable native costs and footprint

native-adoption-executed.py is the script actually run. native-adoption.py pins
its originally observed Interface HEAD explicitly for future reproduction.
Checkout the SOURCE.json revisions and matching toolchain versions before replay.
The script saves the candidate, temporarily builds the original Interface source,
restores every saved byte in finally, and builds the candidate. Both use the same
explicit probes feature, Interface release profile, Rust 1.95, dedicated target
and source locations. adoption-restoration.json records restored file hashes.
No user edits existed before this controlled experiment. Native executables and
full LLVM modules remain outside the archive; digests, section sizes, function
counts and all output text are retained here.

Authoritative final native results are native-adoption-artifacts.json,
native-adoption-outputs.json, adopt-baseline-ir.json and adopt-final-ir.json.
The value probe shrinks 603,272 -> 603,224 bytes; cost probe 606,760 -> 606,632.
Post-LTO emitted LLVM shrinks 730 -> 729 definitions and 89,986 -> 89,977 nonblank,
noncomment body lines. These are IR expansion measures, not machine byte counts.
All eight complete endpoint/error outputs match.

Six alternating unpinned rounds comprise 1,920 timing samples, 512 completed
constructions/destructions per sample after 32 warmups. Successful case median
ratios are 0.651–0.737; rejection is 1.018 (retained adverse observation).
pinned-cost.py then runs exactly twenty paired rounds on the first allowed CPU,
CPU 0, after two full warmup runs. Its 6,400 samples give successful paired median
ratios 0.665–0.753 and rejection 1.000, with bootstrap median-ratio percentile
interval [0.99996,1.00000]. The bootstrap seed is 20261112. The raw unpinned,
warmup and pinned rows are all retained. No host frequency/governor control or
universal speed claim. Metadata records compilers, CPU, affinity and conditions.

## Adverse and superseded evidence

- The first in-process trace check compared unequal cache states because small
  rationals can be interned. identical-formula-trace-diagnostic.log reproduces
  the failure with the exact original formula on both sides. The final test uses
  independent fresh processes for cold and explicitly warmed states, preserving
  every count assertion and original fixture. initial-measurements-test.rs and
  initial failures remain available.
- Initial Wasm replay incorrectly assumed no imports; baseline-capture.log
  retains that failure. The final imports are fail-on-call stubs, not substitute
  numerical functions. The oracle also accounts for Rational's exact
  mixed-fraction text rather than assuming Python's improper-fraction spelling.
- Candidate 1's generic outer Display pulled in diagnostic formatting and grew
  the native value probe by 912 bytes. Candidate 2 keeps Error::source but gives
  the new outer error a concise domain message. Existing errors are unchanged.
- Candidate 3's inline hint did not improve footprint and was removed. Candidate
  4's shorter invariant panic text also did not change footprint. Both retain
  the same check and mathematical invariant.
- The remaining six-byte raw Wasm growth consisted of 42 fewer code bytes and
  48 additional data bytes from the new probe's unexpected-error panic. The final
  new probe returns a distinct unexpected-error status and the Python oracle
  explicitly rejects it. Both revisions were rebuilt with that identical probe;
  baseline bytes are unchanged. No production diagnostic or assertion is dropped.
- restoration-lock-race.log records an early release command issued before the
  temporary source restoration completed; --locked rejected the intermediate
  graph. The final isolated native driver sequences restoration and builds and
  verifies saved bytes. The final locked builds pass.
- allocation-release.log records Cargo's abort/unwind cdylib/rlib filename
  collision and E0463. Probe binaries now require the explicit probes feature,
  excluded from release tests; measurement artifacts have their own target.
  Final release tests and both final measurement builds pass. No assertions,
  compiler flags governing production semantics or dependencies were weakened.

## Remaining scope

Retain the measured constructor delegation. Machine-profile ExactInterval,
positive products/quotients, named error composition, complete canonical-profile
differentials and full browser/schedule measurements remain open. Earlier solver
and firmware adoption blockers remain. No full pre-push matrix or push occurred.
