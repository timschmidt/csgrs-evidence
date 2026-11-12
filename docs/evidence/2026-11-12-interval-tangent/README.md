# Tangent and cotangent admission

SOURCE.json binds the baseline and source commit. This record covers rational,
dyadic and extended dyadic tan/cot images under Hyperinterval's existing
size/work/precision contract. It does not establish completion of the full plan.

## Contract and proof

Empty inputs return empty/Complete. A zero-only cotangent input returns
EmptyDomain before numerical work. Any excluded pole reports Partial. Infinity
is a bound direction, never a member. A full branch or unbounded connected source
proves the entire real image. Finite branches use certified monotonicity, with
one-sided infinite limits at poles and normalized closed outward components.
Coarse rounding may merge gaps; numerical uncertainty never proves a pole.

The existing half-pi phase reducer and extremum scan locate poles. Sine extrema
mark tangent poles and cosine extrema mark cotangent poles. Rational endpoints
cannot be nonzero rational multiples of pi. Cotangent's exact zero endpoint is
handled separately from interior incidence. Tangent increases and cotangent
decreases on each admitted branch. Each endpoint computes its denominator first
from certified Taylor enclosures; zero-containing denominators cause refinement
or typed exhaustion. Original exact sources survive every attempt. Shared work
accounting covers nested numerical stages, with no partial success on exhaustion.

shared-trig-body-check.json compares the entire old trigonometry source after
removing only crate visibility, whitespace and one rustfmt signature comma.
All old numerical bodies/call order remain unchanged. Existing Hyperreal dispatch
and primitive kernels were not edited. Test pi/index helpers are shared rather
than duplicated between trigonometric oracle suites.

## Validation and retained failures

checks.py/checks.json record the final 29-command matrix, all passing: supported
compiler/feature combinations, release tests, strict Clippy, docs, formatting,
fuzz builds, repository budget, whole-repository Zizmor, four unchanged Hypersolve
value/dispatch witnesses, primitive dependency closure and ARM/WASM no_std builds.
The adapter test added afterward passes focused tests/Clippy and the final full
instrumented suite. test-list.log/test-count.json establish 148 unique tests,
plus 12 doctests. Three child-process replay executions are not extra unique
tests. No push or full coordinated-release validation was performed.

missing-witness.log reproduces the absent baseline API. oracles.log retains
initial oracle type-inference errors, repaired without changing expectations.
matrix-initial and pre-lint-tangent.rs retain two failures of the same parity
lint. Its spelling repair preserves condition order. All matrix commands were
rerun on final production code.

The independent GMP branch-index formula differs from production's residue
scan. Directed 4096-bit MPFR point bounds are checked to stay within the selected
branch before tangent/cotangent evaluation. The ordinary dyadic corpus has
504 function/source/grid combinations; further cases include endpoint/interior
poles, intervals within 2^-128 of periodic boundaries, phases through 2^512,
2^-1074 inputs with 2^-64 and 2^-1074 grids, coarse-gap merging, rational/extended
adapter validation, budget refusal/retry, and subsequent operations.

fuzz.log completes 10,000 ASan cases in 55 seconds; fuzz-final.log completes
10,000 in 61 seconds. From crates/hyperinterval:

    cargo +nightly fuzz run tangent --features rational CORPUS -- -runs=10000 -max_len=8 -max_total_time=120 -seed=20261124

PATH included /tmp/interval-refactor/tools/bin and CARGO_TARGET_DIR was
/tmp/interval-refactor/fuzz-target. The retained corpus exercises both source
backends, pole classification, exact replay and later arctangent operations.
Fresh-process tests replay a split image and apply another pole operation.

## Coverage diagnostic

Final coverage uses Rust 1.95, all features, -C instrument-coverage, and fresh
profiles in coverage-1.95. Coverage is 4121/4208 production lines (97.93%) and
8190/8772 regions (93.37%); all 16 new-module functions execute. There is no
branch denominator. Scripts retain exclusions for tests, probes, Hyperreal,
dependencies and test-only IEEE code.

The initial ordinary report/export succeeded, but extra llvm-cov --dump
diagnostics aborted with an allocator error. The log/backtrace and earlier
profiles remain in coverage-before-adapter. Re-running diagnostics with
-num-threads=1 succeeded; its report table exactly matched the ordinary report
(after the dump-only InstantiationGroup preamble). All nine mismatches are
excluded Rug OptRational::parts. Final reports/export/diagnostics use one merge
thread, with unchanged exclusions and fresh final profiles. Verification JSON
records the comparison and mismatch audit. The LLVM failure is not hidden or
presented as a successful check.

## Cost envelope and open scope

All 1560 samples in samples.csv complete. The probe covers rational/dyadic
point, narrow, pole-sensitive, wide, huge and tiny sources for both functions,
plus extended entire-line inputs, at three precision bands. Each group has
16 warmups and 20 samples of 16 calls. Each call includes a fresh
32768-bit/10^13-work-unit budget, phase/pole proofs, refinement, full image and
receipt materialization, and destruction. Input construction and independent
oracle work are excluded. Raw rows retain deterministic work units; metadata
retains compiler/host, executable hash and whole-probe size. GMP/MPFR are linked,
so size is not production-kernel size. Tiny cotangent is an explicitly measured
stress case, not hidden in ordinary-point averages. No speedup is claimed.

Actual heap-byte limits, allocation profiling, cancellation, embedded cycles,
consumer migrations, earlier incomplete phases and coordinated release remain
open. Controlled exhaustion tests validate resource handling; they are not
counted as completed geometric cost samples.
