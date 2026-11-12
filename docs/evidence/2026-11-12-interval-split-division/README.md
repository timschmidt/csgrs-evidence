# Split interval and extended division admission

Owner: Hyperinterval; P1/P3/P5/P6/P19. Source and baseline are in SOURCE.json.
This adds a normalized inline carrier of up to two closed extended dyadic
intervals and extended reciprocal/division, including poles and domain receipts.
It does not implement rational powers or general finite-union arithmetic.

## Validation

checks.py and checks.json record the final 29-command matrix, all successful.
131 unique unit/integration tests plus 12 doctests pass; the fresh-process child
replay is an additional execution of one test, not a 132nd unique test.
The large-coefficient supplement and final instrumented suite also pass.
Four existing Hypersolve value/dispatch witnesses pass unchanged. ARM/WASM,
MSRV 1.88, Rust 1.95 and stable configurations, feature isolation, strict Clippy,
docs, repository budget and whole-repository Zizmor are recorded.
final-checks.json records final fmt and diff whitespace checks.
No push or complete coordinated release validation was attempted.

fuzz.log and fuzz-final.log retain 100,000 ASan cases each, in 19 and 20 seconds.
Run from crates/hyperinterval with cargo +nightly fuzz run split_division and
-runs=100000 -max_len=16 -max_total_time=30 -seed=20261122. The retained corpus
and independent GMP four-corner oracle cover bounds, poles, replay and continued
operations. Environment/tool paths are recorded in checks.py and logs.

Final Rust 1.95 coverage: 3570/3643 lines, 7070/7571 regions; no branch denominator.
Coverage scripts, build JSON, profiles and reports are retained. Eight profile
mismatches belong to excluded Rug OptRational::parts, with diagnostics. Earlier
profiles remain separate and are not merged into final coverage.

## Adverse evidence

missing-witness.log records the baseline API gap. matrix-initial retains two
Clippy failures; pre-lint-extended-dyadic.rs preserves their source. The syntax
repair did not reorder conditions. pre-exact-quotient.rs and
grid-expansion-failure.log preserve avoidable SizeExhausted on exact quotients
at the minimum requested grid. The final reduction repair retains compact exact
dyadic values. exact-quotient-repaired.log and large-coefficients.log record
repair/retry checks. gcd-accounting-note.json distinguishes work accounting from
actual CPU/heap guarantees and identifies the backend algorithm/version.

## Cost and limits

measure.py, samples.csv and cost-summary.json retain 540 completed samples:
9 cases, 3 precisions, 20 samples of 1024 calls, after 128 warmups per group.
Each call includes a fresh 4096-bit/10^11-unit budget, image and domain receipt,
materialization and destruction. Inputs and the independent oracle are outside
timing. cost-environment.json and cost-size.txt record compiler, host, executable
hash and whole-probe size; the probe links GMP and is not production kernel size.
Inline layouts are 72/80/160 bytes for finite/extended/split dyadic carriers,
excluding backend-owned allocations. No speedup or full heap/cancellation bound
is claimed. Primitive two-piece construction, other split operations/backends,
consumer migrations and full release qualification remain open.
