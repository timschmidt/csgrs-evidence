# Hypersolve Algebraic Fiber Benchmarks

Generated automatically by `cargo bench --bench algebraic_fiber`. These are deterministic wall-clock throughput probes with exact result checks, not Criterion statistical estimates. Override the default iteration count with `HYPERSOLVE_FIBER_BENCH_ITERATIONS`.

| Benchmark | Iterations | Total | Mean per iteration | Validation checksum |
| --- | ---: | ---: | ---: | --- |
| `algebraic_fiber_even_multiplicity` | 1000 | 0.384 s | 383.54 us | root=1000; refinement=4000 |
| `algebraic_fiber_eight_independent_intervals` | 1000 | 2.556 s | 2.56 ms | root=4000 |
| `algebraic_fiber_eight_batched_intervals` | 1000 | 1.117 s | 1.12 ms | root=4000 |
| `algebraic_common_fiber_degree_drop` | 1000 | 0.644 s | 643.88 us | root=1000; refinement=4000 |
| `algebraic_image_policy_zero_content` | 1000 | 0.171 s | 171.11 us | coefficient=2000 |
| `rational_quadratic_common_fiber_two_components` | 1000 | 1.702 s | 1.70 ms | component=4000 |
| `implicit_quadratic_common_fiber` | 1000 | 0.952 s | 952.26 us | component=5000 |
| `implicit_quadratic_high_cofactor` | 1000 | 2.753 s | 2.75 ms | component=7000 |
| `rational_repeated_cubic_common_fiber_three_components` | 1000 | 3.656 s | 3.66 ms | component=6000 |
