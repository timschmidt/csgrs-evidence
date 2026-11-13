# Dyadic zero grid admission and qualification

SOURCE.json identifies the clean source commit and baseline. ADMISSION.md
records owner, domain and pre-edit missing witness. source.patch reconstructs
the final code, tests, docs and ledger from that baseline. The fix preserves
exact represented sets and extends compact completion through scalar zero.
It is not a pure performance refactor: mixed-zero deterministic work charges
intentionally shrink. The mathematical fact is that zero is representable on
every dyadic grid with zero magnitude bits. The private canonical representation
ensures only the singleton zero can have both mantissas' bit counts equal zero.
All five common-grid callers handle empty input before selecting a grid.

baseline-failure.log records the initial two-test run against the baseline:
adding exact zero at the minimum signed exponent fails SizeExhausted. The true
nonzero exponent-gap exhaustion test passes. fixed-regression.log runs the same
witness/budget after the source repair. expanded-regression.log retains a test
compilation failure from an omitted BigInt type annotation; the corrected
expanded-regression-fixed.log passes. downstream-regression.log passes both
dyadic affine tests. baseline-nonzero.log passes the independent exact-integer
nonzero accounting test on the detached original revision, with only the new
test file copied into that checkout. Its command was:

    cargo +1.88.0 test --locked --manifest-path /tmp/interval-refactor/dyadic-zero-grid-baseline/crates/hyperinterval/Cargo.toml --features dyadic,serde --test dyadic_zero_grid nonzero_addition_preserves_exact_output_and_accounting

checks.py and checks.json retain all twelve selected commands and exit statuses,
with check-00 through check-11 logs. All pass. Scope/counts and mathematical
expectations are recorded in ledger.txt, which is the source ledger entry before
archive registration. Root fmt and diff checks pass. The final repository size
check passes: 4,065 tracked files, 141,847,232 bytes.

ASan commands (both pass) were:

    RUSTFLAGS=-Zsanitizer=address CARGO_TARGET_DIR=/tmp/interval-refactor/authored-center-radius-asan cargo +nightly test --locked -p hyperinterval --features dyadic,serde --test dyadic_zero_grid --target x86_64-unknown-linux-gnu
    RUSTFLAGS=-Zsanitizer=address CARGO_TARGET_DIR=/tmp/interval-refactor/authored-center-radius-asan cargo +nightly test --locked -p hyperlattice-interval --features dyadic --test centered_affine --target x86_64-unknown-linux-gnu

These exercise five scalar and two dyadic affine tests, including all insufficient
work thresholds, retry and fresh-process scalar replay. There is no new full
coverage denominator, fuzz campaign, formal verification, hardware execution,
Wasm execution or full pre-push matrix claim. No CI files changed or push ran.
Neither this work nor its finite corpus establishes whole-plan completion.

## Matched cost probe

prepare-probes.py builds the retained probe.rs separately against the original
and repaired source, using the existing shared allocation counter. It seeds
the temporary lockfiles from the repository lock. dependency-check.json confirms
all registry versions/checksums match and both probe locks are identical.
Binaries are not archived; the build script, locks, compiler/config metadata,
source revisions, raw output and SHA-256/byte sizes make them reconstructible.
The first build used fresh registry resolution; those separate raw observations
remain under alternate-dependencies-* and are not the primary cost evidence.
In particular their newer BigInt has different allocation behavior.

measure.py pins the runs to allowed CPU 0, after other builds and tests finish.
No frequency/governor control is asserted. Each case uses 64 warmups followed
by 30 samples of 4,096 operations. Inputs are built outside measurement; outputs
are materialized and dropped inside timing. Allocations are separately scoped
to one operation, using the committed counter. Serialization is compared outside
timing and supports deterministic-output preservation, while the independent
integer tests supply semantic expectations.

The primary 60 matched cases have identical serialized output; nonzero work
charges are identical. Sixteen candidate-only cases at signed exponent extremes
complete; their old failure is not treated as a faster/slower completed baseline.
The 20 ordinary nonzero timing ratios span 0.855–1.009 in this short sequential
probe. This supports no global speedup/no-regression claim. For [-3,7]*2^e + 0,
e=-17/+17, work changes 48/84 -> 16; allocations remain two/16 bytes. Hull
allocates four/32 bytes; intersection two/16 bytes. Extreme completion uses
similarly compact mantissas. The executable grows 524,952 -> 526,112 bytes,
+1,160. That lower-priority cost is retained for exact completion. The primary
candidate binary SHA-256 is
fec082fed51b4e429d365a58701b3e545f01c2a4e0c0ab823af6e9cb3a89ccb1.
Peak temporary memory, stack and monomorphized size are not measured.

The retained implementation changes no interval layout, public signature,
serialization format, predicate order or division precondition. Existing size
and work units remain deterministic estimates rather than CPU/heap/instruction
bounds, and there is no new cancellation interface. Actual nonzero growth still
exhausts honestly. Broader scalar/lattice qualification, heterogeneous forms,
Jacobian interfaces and all prior consumer-adoption/later-phase gaps stay open.
