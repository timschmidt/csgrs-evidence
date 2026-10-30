# Cancellation latency across the ignored composition corpus

Source: CSGRS `08556d2d10` (cooperative cancellation and its receipts) with the
temporary probes in `probe-harness.patch`, which are not committed. Release
build, Rust 1.99.1, three probes in parallel beside a running pre-push campaign.

Each probe runs one ignored workload from `hypercurve_composed_workloads.rs` or
`hypercurve_open_path_compositions.rs` in a worker thread under
`evaluate_with_cancellable_budget(STRICT, WorkBudget::UNLIMITED, ..)`, cancels
after 20 s and reports the time until the worker returns
(`sweep_one.sh`). A worker still running 30 s after the request is sampled
three times with gdb and killed. `sweep_outer.sh` samples outermost frames.

## Results (`logs/summary.txt`)

| Outcome | Workloads |
| --- | --- |
| `Cancellation` within 0.25 s | 8 |
| `Cancellation` in 0.25-8 s | 12 |
| `Cancellation` in 19 s and 32 s | `stroke_fillet_stroke_of_a_cubic_arc_path_completes`, `chamfered_cubic_line_bevel_stroke_round_trips` |
| completed before the request (15 s) | `chamfered_quadratic_bevel_stroke_round_trips` |
| still running 30 s after the request | `miter_stroke_of_a_filleted_heavy_rational_cubic_completes` |

`booleans_then_double_round_erosion_completes` admitted no counted unit at all;
its cancellation was observed at an exhaustion check, not at a charged unit.

The stuck and the 32 s cases were sampled inside Hyperreal's recursive
`Computable` approximation (`multiply_with_known_msd`), reached from
`Real::certified_sign_until` in Hypersolve's Bareiss pivot selection under a
selected-fiber resultant for an offset endpoint tangent. Hyperreal's per-value
abort signal makes stopped approximations return placeholder zeros for callers
to discard, so it is not a sound operation-wide interrupt for shared values.
An interrupt observed only between precision steps would be sound but would
still wait for the last, largest step. Scalar precision refinement therefore
remains an uninterruptible stretch, as the module contract states.
