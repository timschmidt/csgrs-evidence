# Real rational-power admission

SOURCE.json binds the implementation to its baseline and source commit. This
record covers Hyperinterval pow_rational on rational, dyadic and extended dyadic
sources, with arbitrary-size integer exponent components and at most two closed
output components. P1/P3/P5/P6/P19; broader plan completion is not claimed.

## Contract and proof

Reject a zero denominator before empty shortcuts. Reduce sign and common
factors before selecting real branches; odd denominators admit negative bases,
even denominators exclude them. Negative powers exclude zero. Exponent zero
uses the constant-one convention, then rounds outward to the requested grid.
Empty succeeds; no defined member returns EmptyDomain; excluded points produce
Partial. Bounds at infinity are limits, not members. Closure can include an
unattained zero and normalization can merge touching rounded components.

Integer root bisection preserves lo^q <= floor(z) < hi^q. Exact quotient and
power relations determine whether the upper grid bound increments. Perfect
rational roots are retained before powering/grid expansion. Negative powers
invert the original powered fraction, not a rounded intermediate. Branch
monotonicity and numerator parity determine extrema and reflection. All nested
numerical stages use deterministic DyadicBudget size/work reservations.
Existing strict APIs, Hyperreal dispatch and primitive power helpers are unchanged.
root-helper-review.log records available helpers and ownership constraints.

## Validation and adverse evidence

checks.py/checks.json record all 29 final commands passing. They cover compiler
and feature isolation, 140 unique unit/integration tests, 12 doctests, release,
strict Clippy, docs, formatting, fuzz builds, repository budget, whole-repository
Zizmor, four unchanged Hypersolve value/dispatch witnesses, primitive dependency
closure and ARM/WASM no_std builds. test-list.log/test-count.json establish the
unique count; two child-process replay executions are not additional unique tests.
No push or complete coordinated-release validation was performed.

The GMP oracle covers 9108 source/exponent/grid combinations. Additional directed
MPFR point checks and rational cases cover partial domains, extreme scales,
perfect roots and 1024-bit near-one coefficients. Exact GMP relations establish
singleton results when MPFR's rounded intermediate root straddles the answer.
Fresh-process replay consumes split output in further powers. Work refusal,
size refusal and retry are exercised, with subsequent exponentiation and
operation-local/inherited coverage distinguished.

missing-witness.log reproduces the missing baseline API. pre-zero-grid.rs and
zero-grid-failure.log preserve the initial coarse-grid defect; the regression
remains in the final test suite. oracles.log and early-clippy.log preserve early
test utility compile/lint failures. matrix-initial preserves the module-order
formatting failure; the full matrix was rerun after formatting and the final
large-coefficient/extreme-request fixtures. Initial coverage/cost runs remain
separate and are not represented as final-source measurements.

fuzz.log completes 10,000 ASan cases in one second; fuzz-final.log completes
10,000 in two seconds, seed 20261123. Run from crates/hyperinterval:

    cargo +nightly fuzz run fractional_power CORPUS -- -runs=10000 -max_len=12 -max_total_time=30 -seed=20261123

The corpus and logs are retained. PATH included /tmp/interval-refactor/tools/bin;
CARGO_TARGET_DIR was /tmp/interval-refactor/fuzz-target. Tests use the GMP oracle,
MPFR point cases, canonical replay and further reflection.

Final coverage uses Rust 1.95, all features, -C instrument-coverage and fresh
profiles in coverage-1.95. Scripts retain exact exclusion patterns. Production
coverage is 3878/3959 lines (97.95%) and 7709/8259 regions (93.34%); no branch
denominator is available. Tests, probes, Hyperreal, dependencies and test-only
IEEE code are excluded. Eight profile mismatches are independently diagnosed
as excluded Rug OptRational::parts. All 12 new-module functions execute.

## Completed cost envelope and open scope

measure.py, samples.csv, cost-summary.json and cost-environment.json retain 540
completed samples: nine dyadic source cases, three precision bands, 20 samples
of 128 calls with 32 warmups per group. Fresh 32768-bit/10^13-work-unit budgets,
exponent normalization, root and arithmetic work, normalized output and receipt,
materialization and destruction are timed. Source construction and oracle work
are outside timing. Exact work units are retained for every row. Host/compiler,
executable hash and whole-probe size are recorded; GMP/MPFR are linked, so size
is not production-kernel size. These are new-capability costs, not speedups.

Size/work reservations are not CPU-instruction or actual heap-byte guarantees.
Cancellation, allocation profiling, rational-backend timing, consumer migrations,
tangent/other pole functions and full coordinated release remain open. This
record does not close the earlier incomplete plan phases.
