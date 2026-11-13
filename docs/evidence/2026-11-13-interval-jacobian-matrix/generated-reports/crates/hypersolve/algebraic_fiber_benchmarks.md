# Hypersolve Algebraic Fiber Benchmarks

Generated automatically by `cargo bench --bench algebraic_fiber`. These are deterministic wall-clock throughput probes with exact result checks, not Criterion statistical estimates. Override the default iteration count with `HYPERSOLVE_FIBER_BENCH_ITERATIONS`.

| Benchmark | Iterations | Total | Mean per iteration | Validation checksum |
| --- | ---: | ---: | ---: | --- |
| `algebraic_fiber_even_multiplicity` | 1000 | 0.349 s | 348.86 us | root=1000; refinement=4000 |
| `algebraic_fiber_eight_independent_intervals` | 1000 | 2.496 s | 2.50 ms | root=4000 |
| `algebraic_fiber_eight_batched_intervals` | 1000 | 1.152 s | 1.15 ms | root=4000 |
| `algebraic_common_fiber_degree_drop` | 1000 | 0.710 s | 710.07 us | root=1000; refinement=4000 |
| `algebraic_image_policy_zero_content` | 1000 | 0.191 s | 191.40 us | coefficient=2000 |
| `rational_quadratic_common_fiber_two_components` | 1000 | 1.938 s | 1.94 ms | component=4000 |
| `implicit_quadratic_common_fiber` | 1000 | 1.056 s | 1.06 ms | component=5000 |
| `implicit_quadratic_high_cofactor` | 1000 | 3.267 s | 3.27 ms | component=7000 |
| `rational_repeated_cubic_common_fiber_three_components` | 1000 | 3.791 s | 3.79 ms | component=6000 |
