# Cooperative cancellation of budgeted exact work (closure plan M4)

Source: CSGRS `a605f5748fb0dbc8f0990be2c77adb263589b85e` ("Cancel budgeted exact
work cooperatively"), on the integration candidate
`f5f8f0fb6f1a430d3a68f79cc293d2916033ebdc`. `source.patch` is that commit.

## Contract

Properties P15, P19 and P20; closure-plan M4 ("Cancellation releases temporary
state. A later larger-budget retry is not poisoned"). Owner: Hypersolve
`work_budget`, with Hypercurve's explicit evaluation scope as the public
consumer. Cancellation is cooperative and is observed at instrumented work
units and at three uninstrumented loops (Bareiss determinants over Z[t],
pseudo-quotient multiplication matrices, dense tensor products). It is not an
elapsed-time, total-arithmetic, coefficient-growth or memory bound.

## Reproduction of the gap

`latency/before-checkpoints-cancel-60s.log`: the first implementation (token
checked only at counted units) running the stalled bevel stroke of a filleted
hyperbola pair. Cancelled after 60 s, it had not returned 21 minutes later and
was stopped externally. `before-checkpoints-stack-*.txt` are gdb samples taken
then: `determinant_integer_polynomial_matrix` under
`quotient_ring_fiber_resultant_polynomial` and the dense two-radical sign.

Iterations (`measure_latency.sh <label>`, release, Rust 1.99.1):

| Label | Checkpoints | Result |
| --- | --- | --- |
| `bareiss` | Bareiss | still running 30 s after cancellation; samples in `pseudo_quotient_multiplication_matrix` |
| `pqm` | + pseudo-quotient matrices | still running; samples in `DenseTensorPolynomial::multiply` |
| `multiply` | + dense tensor products | `Cancellation` after 0.237 s (cancelled at 60 s) |
| `w5`, `w20`, `w150` | all three | `Cancellation` after 0.450, 0.158 and 0.186 s |

## Witnesses

- Hypersolve `work_budget` owner tests: pre-cancelled token, cancellation
  mid-operation, nested scopes both ways, cancellation from another thread,
  cancelled native root refinement followed by a retry equal to the baseline.
- `bareiss::tests::cancelled_polynomial_determinant_is_unavailable_not_zero`.
- Hypercurve `work_budget`: a cancelled rational-cubic intersection publishes no
  contact and the same curves then intersect completely with a new token; a
  concurrent cancellation either reports `Cancellation` or the independent
  expected contacts.
- `cancellation_stops_the_stalled_filleted_hyperbola_bevel_stroke`: passes in
  3.3 s (latency 0.28 s). Without the three checkpoint files it fails its 10 s
  bound (`qualification/stalled-stroke-witness-without-checkpoints-10s-bound.log`);
  with the earlier 120 s bound it passed after 21 s, so that bound was replaced.
- `cancelled_stalled_stroke_releases_its_temporary_heap` (counting allocator):
  retained bytes per cancelled attempt converge 1,237,112 / 140,656 / 48,904 /
  13,584 / 2,520 / 368 against peaks near 4.7 MB; warm attempts must retain
  under 1% of their peak.

## Qualification

`qualification/m4-qualify.log`: Clippy with `-D warnings`, all targets and
features, on 1.99.1 (hypersolve, hypercurve, hyperbrep) and 1.95.0 (hypersolve,
hypercurve): pass. Hypersolve all targets and features: 1,329 passed.
Hypercurve release, all features, two test threads: 3,056 passed, 0 failed,
34 existing ignored. Also run: workspace `cargo check --all-targets
--all-features`, the two new capability-matrix rows (`witness_passed`),
`typos`, `scripts/check-repository-budget.sh`, and `cargo fmt --check`.

No performance improvement is claimed. Hot-loop checks read one thread-local
flag when no scope is active.
