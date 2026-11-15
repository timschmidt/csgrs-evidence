
Enable `flow-noise-evolution` for
`program.integrate_noise(initial, end, options, budget)`. The prepared trajectory
program now searches bounded native step durations and tube candidates while
carrying the complete affine outer endpoint into each next search. Accepted
Picard proofs are reused once; analytic Taylor remainders, selected uncertainty
columns and all discarded contributions remain authoritative. The final step
is capped at the exact requested time.

`FlowNoiseEvolutionOptions` selects the retained-column capacity and existing
native search/segment limits. The report retains every native attempt and
noise refinement. Only `Completed`, validated `Identity`, or `Empty` exposes
`end_state`; `prefix_end_state` explicitly exposes a certified prefix after a
later failure. Empty results retain the requested time and can enter another
horizon. Invalid times/options are checked before empty or identity shortcuts.

All calls share the supplied enclosure budget. Structural history checks and
existing scalar counters do not bound total heap, all retained proof graphs,
scalar payload/refinement or within-scalar cancellation. This controller uses
a caller-selected Taylor order and retained-column capacity; it does not
claim global error control, adaptive frame selection or optimal noise retention.
Replay the original box, field/order history, horizon, options and policy;
serialized result flags are not certificates.

```sh
cargo run -p hyperdynamics --features flow-noise-evolution --example flow_noise_evolution
```
