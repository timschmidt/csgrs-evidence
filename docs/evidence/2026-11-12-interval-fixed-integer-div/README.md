# Fixed exact-integer division and FOC Clarke specialization

Baseline: 434b6e09a1b8edae9df7764254eb07442342dc0c. SOURCE.json identifies the
final source commit. See ADMISSION.md for the pre-change contract and the
ordered candidate decisions. The implementation extends Hyperinterval fixed
arithmetic and changes only the unpublished FOC conformance client as consumer.
No production Alumina migration, phase completion, full pre-push validation or
push is claimed.

## Contract and reasoning

For raw interval [a,b] on scale 2^F and exact integer d>0, the tight retained-grid
quotient has raw endpoints floor(a/d), ceil(b/d). For negative d the exact
numerators are -b,-a and the positive denominator is -d, normalized in i128.
The widened endpoint/divisor values fit i128 even at signed extremes. Existing
quotient_bounds and from_wide establish direction and checked representation.
The scale cancels; the divisor need not have a representable fixed-point lift.
All valid i32/i64 fractional scales and all i64 divisors are admitted. Zero
returns ContainsZero even for empty input, nonzero maps empty to empty, and
unrepresentable outputs return Overflow, including MIN/-1. No allocation,
ambient precision, iteration, tolerance, saturation or new policy is introduced.

For Q30 i32 source bounds, the widened integer Clarke numerator 2*a-b-c has
magnitude below 2^34; affine multiplication by two and subtraction are exact
and cannot overflow i64. Divide that numerator once by integer three before
narrowing. This preserves the previous full outputs and failures. Balance
validation remains first; beta and Park paths retain their original arithmetic.
The source-preservation record verifies all previous fixed code after removing
only this added method and documentation link, plus 171 byte-identical files
from the preceding production/support audit. This is not a whole-repository
semantic-equivalence proof or a universal closure proof.

## Reproduction and validation

- baseline-witness.log records the missing div_integer API; witness/ is the
  minimal Rust project. final-witness.log records its now-successful run with
  CARGO_TARGET_DIR=/tmp/interval-refactor/fixed-div-witness-target, Rust 1.88.
- checks-final.py and checks-final.json give all 38 executed commands, statuses,
  timings and individual logs. Every command passed. This covers both selected
  compilers' debug/release scalar and consumer suites, Clippy, docs, ARM/Wasm
  library builds, formatting and downstream fixed lattice/original FOC tests.
- Scalar fixed+serde suites pass 33 tests/doctests each. Targeted tests without
  serde pass separately (fixed-only-tests.json/log). Independent cross-product
  inequalities cover 1,673,100 small cases across twelve scale instantiations,
  endpoint/divisor extremes and 20,000 full-width seeded cases (seed 20261113).
  Composition includes fresh-process serialization, widening and further
  division; allocation counting uses an isolated integration executable.
- initial-tests.log retains the failed hand-computed replay expectation. The
  original lower bound was one ulp too high. The corrected first-stage bound
  is [-715827883,715827883], then division by -2 gives [-357913942,357913942].
  The implementation was not changed to fit the expectation. Existing hard
  cases and all assertions remain; a first-stage assertion was added.
- The unchanged FOC corpus checks 399,950 outcomes: 95,848 successful transforms,
  26,366 Range outcomes and 277,736 balance errors, plus scalar and finite-chain
  witnesses. Full native/shared outputs agree; independent integer corners
  check successful bounds. Original rounded-Clarke and intermediate-Park
  overflow hard cases remain. No-allocator tests pass.
- extra-checks.py/json execute targeted scalar and complete FOC ASan tests with
  leak detection, FOC LLVM coverage, Wasm build and independent Wasm replay.
  All six commands pass. Scalar ASan covers six new tests; FOC covers seven.
- Scalar coverage command: CARGO_TARGET_DIR=/tmp/interval-refactor/fixed-div-target-coverage
  RUSTFLAGS='-C instrument-coverage'
  LLVM_PROFILE_FILE='/tmp/interval-refactor/fixed-integer-div/scalar-coverage/%p-%m.profraw'
  cargo +1.95.0 test --locked -p hyperinterval --no-default-features --features
  fixed,serde --test integer_division --test integer_division_no_alloc
  --message-format=json -- --nocapture. scalar-coverage-report.py merges and
  reports with LLVM's single-thread option. All 15 emitted new-method
  instances execute; 27/28 distinct source regions execute. The uncovered
  region is the scale-validation error return, unreachable with safely
  constructed valid intervals. The scoped scalar report is not full-crate
  coverage: 128/176 lines, 218/280 regions, 22/29 functions.
- Client coverage is 168/170 lines, 364/385 regions and 16/16 functions; scope
  excludes dependencies, tests, binaries and allocation support. Raw profiles,
  merged profiles, exports and scripts are retained; no LLVM warnings occurred.
- wasm-replay.py uses independent Python exact staged integer bounds. The
  rebuilt module has zero imports and passes 1,660 transform calls plus 405
  full-range Park checks (335 success, 70 overflow), with a one-million-fuel
  per-call ceiling. Maximum observed fuel: 19,081. wasm-replay.json records
  Wasmtime version, size (40,006 bytes) and artifact SHA-256
  28f5514ceb76f127a8dfedc8998a7b9d3798d368262d023a9bcdfbb12f0fc3e5.
- final-format.log and repository-budget.log record final format/budget checks.
  Production firmware/interface remain at their initial heads and clean.

## Costs and candidate decisions

Baseline binaries were rebuilt before edits on the target revision. Candidate
patches/logs preserve four sequential experiments: integer division, existing
affine/subtract numerator, normal inline hint on the new method, then normal
inline hint on the private narrowing adapter. Candidate 3 is retained.
Candidate 4 is rejected: its shared-probe and cost .text sections are byte-
identical to candidate 3 on both compilers. Final rebuilt binaries match
candidate 3 exactly; final-binaries.json records code-section comparison and
executable digests. Executables are not redistributed in this evidence record.

paired-cost.py alternates baseline/final order over six rounds per compiler:
4,800 samples total, 120 per action/provider/revision/compiler, 512 completed
calls/sample after warmup. Full-output equality is checked before timing;
timing includes output materialization and digest work. All checksums agree
and allocation calls/bytes are zero. Five runtime seeds also match all native/
shared footprint probes across revisions/compilers (paired-probes.json).
Raw CSVs, commands and medians are retained. metadata.json records compilers,
CPU and unpinned/shared-host conditions. Short host probes do not establish
universal speed, firmware cycles/stack or full-workload acceptance.

| Compiler | Action | Baseline shared/native | Final shared/native | Final shared/baseline shared |
| --- | --- | ---: | ---: | ---: |
| 1.88 | Clarke | 3.048 | 1.588 | 0.441 |
| 1.88 | chain | 1.642 | 0.859 | 0.519 |
| stable | Clarke | 4.307 | 2.144 | 0.504 |
| stable | chain | 3.280 | 1.734 | 0.532 |

Other unchanged transform paths also vary with code layout and host conditions;
see every action in paired-cost-summary.json. No isolated algorithmic speedup
is attributed to those changes. Final native/shared probes are 444,776/446,168
bytes (1.88) and 460,656/465,072 bytes (stable). Shared shrinks by 4,432/5,576
bytes relative to baseline shared, but still exceeds matched final native by
1,392/4,416 bytes. Section reports are retained. These measurements do not
substitute for monomorphized-code or full firmware build-size gates.

The exact scalar extension and lower-cost conformance consumer are retained.
Production adoption remains rejected: Clarke and the stable chain remain
slower than native, and shared probes remain larger. No existing general
solver migration decision is changed. Full benchmark/dispatch-policy gates,
Jacobian and independent-center/radius carriers, firmware clock, HIL, hosted
platforms and later phases remain open. No new fuzz campaign was run.
