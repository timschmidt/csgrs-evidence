# Current interval sanitizer campaigns and conversion admission

This stage implements the explicit rational/dyadic conversion fuzz requirement in plan §14.3 and qualifies the maintained scalar interval targets on the current revision. Owners are Hyperinterval and its test-side independent GMP oracles, P1/P3–P6/P17–P20/P27/P36/P37, Phases 3/5/14. It does not close the broader refactor goal or accept the pending dynamics extraction.

## Source and missing witness

The initial clean worktree is CSGRS c4735815e291e38881577da55b0e6a3836cda18a. All fifteen existing fuzz targets omit direct rational/dyadic conversion, exact-grid admission and IEEE dyadic ingress; existing deterministic rational_conversion and dyadic_float_ingress tests remain unchanged. Source commit `14f78d34d392880d07ebf1b893d6dae9a2ab3678` adds one conversions target, its required rational feature, a bounded CI invocation and a description of its input envelope. No production arithmetic, predicate ordering, policies, budget accounting, existing assertions, dependencies or lockfiles change.

The target uses full-width signed 64-bit numerators and nonzero unsigned 64-bit denominators. Generated empty, singleton and nontrivial intervals are rounded to grids from -128 through 128. Existing GMP rational-transfer and directed-grid helpers establish independent tight bounds; generated dyadic results pass through checked serialization, exact rational materialization and a further grid. Exact-grid admission checks against the unrounded rational values, reversed endpoints retain their validation error, cumulative work is tested at its exact observed threshold and one unit below, and an independent fresh budget succeeds after refusal. Extreme i32 grids exercise the declared size refusal without attempting huge powers. Arbitrary binary64 encodings compare finite values with exact GMP ingress, including subnormals and signed zero, while NaN/infinity fail before any budget use. Source constructors and GMP oracles are outside the native dyadic budget. This is a bounded coefficient/precision domain, not arbitrary-size coverage or a total-work proof.

## Executed sanitizer campaigns

Cargo-fuzz 0.13.2 and rustc 1.101.0-nightly (8006091eb, 2026-10-17), LLVM 23.1.4 built the existing targets with all fuzz features enabled (including rational). The new target was built with rational. Native ASan binaries were then invoked directly with the maintained workflow's run, maximum length, total-time and deterministic seed settings. The retained commands additionally set a 30-second per-input limit, 2,048 MiB RSS limit, leak detection and an outer deadline 60 seconds beyond the campaign total-time setting. None of those failure limits fired. Rational-enabled linking of every existing target differs from the workflow's separate feature configurations; this is not a claim that the entire hosted workflow ran.

The corpus begins with retained explicit integer/IEEE boundary seeds and deterministic generated seeds. All newly retained corpus files, target/binary hashes, lockfile, raw compiler/sanitizer logs and terminal metadata are archived. Sixteen campaigns returned zero, with no crash artifacts or sanitizer diagnostics. Trigonometry and conversions ended at their total-time bound before their requested run count. Other campaigns completed their requested run counts.

| Target | libFuzzer runs | Reported seconds |
| --- | ---: | ---: |
| constructors | 10,000 | 0 |
| fixed_arithmetic | 100,000 | 1 |
| dyadic_arithmetic | 100,000 | 13 |
| primitive_proposals | 100,000 | 4 |
| strict_float | 100,000 | 18 |
| rational_powers | 100,000 | 11 |
| square_roots | 100,000 | 28 |
| primitive_roots | 100,000 | 12 |
| exponential | 10,000 | 13 |
| logarithm | 10,000 | 14 |
| arctangent | 10,000 | 9 |
| trigonometry | 7,644 | 31 |
| split_division | 100,000 | 20 |
| fractional_power | 10,000 | 1 |
| tangent | 10,000 | 64 |
| conversions | 79,026 | 31 |

Total: 946,670 engine runs. Engine counts include inputs rejected by arbitrary decoding; they are not counts of distinct valid mathematical cases. Sancov edge/feature counts include dependency code and are not source branch-coverage percentages. Finite seeded campaigns cannot prove absence of bugs, full backend coverage, no hidden global state, or universal completion. No arithmetic defect was discovered, so no failure regression or production fix is claimed. GMP/MPFR C libraries are not claimed to have been rebuilt with sanitizer instrumentation.

## Local and integration checks

Rust 1.95 checks all fuzz binaries both with default fuzz features and with rational. Strict all-feature fuzz-target Clippy, all fuzz-source formatting, workspace formatting and diffs pass. The full owner tests/doctests report 229 passes in 42 summaries, zero failed or ignored. Because CI configuration changed, repository-wide `zizmor --pedantic --strict-collection .` runs with no findings. The final main-checks record covers the integrated target, formatting, Zizmor, pending diffs and retention budget.

A temporary index proves the integrated tree equals the source commit before updating the four paths. All 41 staged extraction paths remain byte-identical. Interface retains its eight-path pending patch, firmware remains clean, and the 53 previous frozen stages verify unchanged. The source checkouts are retained; compiler outputs live under the external build directory rather than the evidence archive. No benchmark, allocation improvement, full coverage, MCU/HIL, full pre-push matrix, push or publication is claimed. Remaining migrations and coordinated platform/release obligations remain open.
