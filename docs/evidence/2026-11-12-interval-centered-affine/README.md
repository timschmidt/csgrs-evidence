# Authored center/radius affine sources

Source `728ea5d7d63f9d98e9cf44fbeb55202d8fffa423`; baseline and patch digest in SOURCE.json. All four managed
repositories were clean initially. ADMISSION.md records the domain, owner,
missing witness, acceptance requirements and the qualification-driven change
from zero subtraction to native negation. The committed execution ledger
contains the full outcome and remaining scope. This does not complete Phase 6
or the full 15-phase goal; no push was attempted.

TranslatedBox retains exact c and a native offset box U, denoting c+U. The
bridge starts with U=[-r,r], never computing absolute endpoints or an identity
coefficient. Native scalar negation preserves the radius scale. Affine pullback
uses B(c+u)+t = Bu+(Bc+t); the same context spans both evaluations and all outer
map composition. Primitive projections can widen or fail, without replacing the
source. Restrictions select signed offsets. Replay validates dimensions,
scalar families and singleton centers; absent centers require empty domains.
No scalar arithmetic algorithm or old affine/chain body changed.

## Commands and retained failures

checks.py/checks.json retain all 15 selected command invocations and results.
Logs check-00 through check-14 cover Rust 1.88, 1.95 debug/release, stable,
Clippy, docs, ARM no_std, the downstream interval surface, Wasm, the maintained
cost example and root formatting. All pass. The owning all-feature suites have
83 tests/doctests and the downstream surface has 7. Final resource-query test
expansion passes in resource-final.log; final Clippy passes in clippy-final.log.
Those commands are `cargo +1.95.0 test --locked -p hyperlattice-interval
--all-features --test centered_affine` and `cargo +1.95.0 clippy --locked -p
hyperlattice-interval --all-features --all-targets -- -D warnings`.

ASan (asan-final.log) passes five new tests and the allocation test:
`RUSTFLAGS=-Zsanitizer=address CARGO_TARGET_DIR=/tmp/interval-refactor/authored-center-radius-asan
cargo +nightly test --locked -p hyperlattice-interval --all-features
--test centered_affine --test centered_no_alloc --target x86_64-unknown-linux-gnu`.
The previous sanitizer log is retained too. No new full coverage, fuzz, HIL or
full pre-push matrix claim. The unrelated elliptic suite was not repeated;
the preceding checkpoint retains its passing result.

The original minimum-exponent dyadic test failed with SizeExhausted in
initial-tests.log. The zero-minus-radius construction tried to align zero over
an enormous exponent gap. rejected-zero-subtraction.patch reproduces that bridge
against the final source; the later negation adapter can remain unused during
reproduction. No test or budget was weakened. The direct-negation fix passes
negation-tests.log and the final suites. General scalar zero-alignment behavior
is not claimed fixed. Baseline-missing.log reproduces the missing method on the
exact baseline; external-witness.rs subsequently passes against this source.

The corpus covers 918 six-backend center/radius fixtures followed by offset
restriction, correlated duplication/difference and runtime chains. Hard cases
include F31/F63 sources whose absolute bounds overflow while a half-scale image
succeeds without representable one; IEEE MAX source cancellation; fresh-process
fixed replay followed by further cancellation; malformed selectors; empty/unit
sources and rectangular maps. Every insufficient work budget below a completed
bridge and a completed affine query returns WorkExhausted, preserves its source,
and succeeds at the measured cost on retry. Primitive allocation assertions
remain zero. No partial result is published.

## Resources

native-measure.py runs the maintained centered_cost example. The original four
actions remain; action 4 converts to TranslatedBox and action 5 projects a
retained translated source. 1,440 samples cover six backends, dimensions 4/64,
six actions and 20 samples/action, with 32 warmups and 128 completions/sample.
The run was pinned to CPU 0 after the selected checks and initial ASan run completed, without governor or
frequency control. It is a short sequential local probe, not a speedup or global
no-regression claim. Primitive actions allocate zero. The translated source has
the same inline size as the authored pair for measured host types. Warmed N=64
rational bridge/projection use 0/60 allocations (0/2,400 bytes), dyadic 462/210
(3,696/1,680 bytes). These are fixture observations, not arbitrary-rational
resource bounds. Temporary stack and monomorphized growth are unmeasured. The
expanded probe is 1,619,448 bytes; raw sizes/digests and samples are retained.

wasm-check.py uses /tmp/interval-refactor/tools/bin/python with Wasmtime 50.0.1.
The maintained module has no imports. Independent Python integers verify full
endpoints for 8,027 cases: 4,401 successes, 2,462 invalid radii, 1,164 overflows;
19,046 returned calls plus two selector traps. The additional 35 F31 half-scale
cases preserve exact expectations and include overflowing original absolute
bounds. Prior vector/matrix cases, empty/unit and unqualified IEEE probes remain.
The module is 48,514 bytes; digest and maximum returned fuel 4,684 under a
1,000,000 per-call cap are in wasm-summary.json. Fuel is not time or MCU cycles.
Binaries are reproducible from committed sources and not copied into this record.

Public docs/changelogs describe the bridge and offset semantics. Remaining work
includes heterogeneous authored arithmetic, broader operations and coverage,
Jacobian carriers, facts/specializations and consumer adoption, plus all prior
solver/Interface/firmware blockers and later phases. No production migration is
claimed here. No Interface or firmware files changed.
