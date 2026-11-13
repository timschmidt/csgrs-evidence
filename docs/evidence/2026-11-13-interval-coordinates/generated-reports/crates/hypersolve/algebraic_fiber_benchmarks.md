# Hypersolve Algebraic Fiber Benchmarks

Generated automatically by `cargo bench --bench algebraic_fiber`. These are deterministic wall-clock throughput probes with exact result checks, not Criterion statistical estimates. Override the default iteration count with `HYPERSOLVE_FIBER_BENCH_ITERATIONS`.

| Benchmark | Iterations | Total | Mean per iteration | Validation checksum |
| --- | ---: | ---: | ---: | --- |
| `algebraic_fiber_even_multiplicity` | 1000 | 0.386 s | 385.54 us | root=1000; refinement=4000 |
| `algebraic_fiber_eight_independent_intervals` | 1000 | 2.557 s | 2.56 ms | root=4000 |
| `algebraic_fiber_eight_batched_intervals` | 1000 | 1.117 s | 1.12 ms | root=4000 |
| `algebraic_common_fiber_degree_drop` | 1000 | 0.638 s | 637.95 us | root=1000; refinement=4000 |
| `algebraic_image_policy_zero_content` | 1000 | 0.172 s | 172.14 us | coefficient=2000 |
| `rational_quadratic_common_fiber_two_components` | 1000 | 1.683 s | 1.68 ms | component=4000 |
| `implicit_quadratic_common_fiber` | 1000 | 0.937 s | 937.24 us | component=5000 |
| `implicit_quadratic_high_cofactor` | 1000 | 2.720 s | 2.72 ms | component=7000 |
| `rational_repeated_cubic_common_fiber_three_components` | 1000 | 3.601 s | 3.60 ms | component=6000 |
