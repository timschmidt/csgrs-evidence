# Hypersolve Algebraic Fiber Benchmarks

Generated automatically by `cargo bench --bench algebraic_fiber`. These are deterministic wall-clock throughput probes with exact result checks, not Criterion statistical estimates. Override the default iteration count with `HYPERSOLVE_FIBER_BENCH_ITERATIONS`.

| Benchmark | Iterations | Total | Mean per iteration | Validation checksum |
| --- | ---: | ---: | ---: | --- |
| `algebraic_fiber_even_multiplicity` | 1000 | 0.351 s | 350.76 us | root=1000; refinement=4000 |
| `algebraic_fiber_eight_independent_intervals` | 1000 | 2.521 s | 2.52 ms | root=4000 |
| `algebraic_fiber_eight_batched_intervals` | 1000 | 1.126 s | 1.13 ms | root=4000 |
| `algebraic_common_fiber_degree_drop` | 1000 | 0.641 s | 640.51 us | root=1000; refinement=4000 |
| `algebraic_image_policy_zero_content` | 1000 | 0.173 s | 172.72 us | coefficient=2000 |
| `rational_quadratic_common_fiber_two_components` | 1000 | 1.687 s | 1.69 ms | component=4000 |
| `implicit_quadratic_common_fiber` | 1000 | 0.945 s | 945.04 us | component=5000 |
| `implicit_quadratic_high_cofactor` | 1000 | 2.735 s | 2.73 ms | component=7000 |
| `rational_repeated_cubic_common_fiber_three_components` | 1000 | 3.632 s | 3.63 ms | component=6000 |
