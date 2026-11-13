# Hypersolve Algebraic Fiber Benchmarks

Generated automatically by `cargo bench --bench algebraic_fiber`. These are deterministic wall-clock throughput probes with exact result checks, not Criterion statistical estimates. Override the default iteration count with `HYPERSOLVE_FIBER_BENCH_ITERATIONS`.

| Benchmark | Iterations | Total | Mean per iteration | Validation checksum |
| --- | ---: | ---: | ---: | --- |
| `algebraic_fiber_even_multiplicity` | 1000 | 0.361 s | 361.00 us | root=1000; refinement=4000 |
| `algebraic_fiber_eight_independent_intervals` | 1000 | 2.618 s | 2.62 ms | root=4000 |
| `algebraic_fiber_eight_batched_intervals` | 1000 | 1.176 s | 1.18 ms | root=4000 |
| `algebraic_common_fiber_degree_drop` | 1000 | 0.653 s | 653.41 us | root=1000; refinement=4000 |
| `algebraic_image_policy_zero_content` | 1000 | 0.178 s | 178.16 us | coefficient=2000 |
| `rational_quadratic_common_fiber_two_components` | 1000 | 1.724 s | 1.72 ms | component=4000 |
| `implicit_quadratic_common_fiber` | 1000 | 0.963 s | 963.47 us | component=5000 |
| `implicit_quadratic_high_cofactor` | 1000 | 2.786 s | 2.79 ms | component=7000 |
| `rational_repeated_cubic_common_fiber_three_components` | 1000 | 3.713 s | 3.71 ms | component=6000 |
