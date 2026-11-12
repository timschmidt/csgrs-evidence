# Interval foundation evidence

Source and locks: revisions.json. CSGRS before-state is
1671894b4a896b091416503910e3720ecf233c82; Interface before-state is
ef94d9e60e0004f3ec894d174fa49c00d547c63f; firmware is unchanged.
The source implementation and inventory are committed in CSGRS; no source
snapshot is substituted for those commits. All records are local; no upload
has occurred.

baseline/ retains original failed attempts and completed normalized baselines.
The original Interface does not compile against current CSGRS without the
recorded compatibility fixes. Phase 0 remains incomplete. The still-running
Hypersolve production coverage log is excluded from this immutable record.

phase1/commands.json and portability.json record the exact feature/target
commands and exit status. Other logs are named by their command purpose.
The compiler, hardware and dependency metadata are retained in baseline/.
The fuzz smoke command uses cargo +nightly fuzz run constructors with ASan,
seed 20261112, 10000 runs, max_len 1024, max_total_time 30. The full resulting
corpus is retained. No crashes were reported. This is a bounded smoke, not
an exhaustive fuzzing or 100% coverage claim.

The initial LLVM report includes only production Hyperinterval source, with
tests and dependencies excluded; branch instrumentation was not enabled.
Coverage-build.jsonl identifies objects; executable build artifacts are not
archived. Reproduce using RUSTFLAGS=-C instrument-coverage and llvm-profdata /
llvm-cov from the recorded compiler. Later compile-fail docs change no code.

Criterion samples are focused baseline probes (10 samples, 1 s warmup, 2 s
measurement), not matched improvement claims. The four-iteration allocation
profile is also a baseline, not evidence of an optimization. Firmware cycles,
HIL, whole-stack coverage, binary size and coordinated release remain open.
