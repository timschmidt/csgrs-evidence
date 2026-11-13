# Hyperdynamics

Exact motion-limit algorithms with independent Hypersolve replay. Hyperdynamics
owns dynamics; Hyperpath supplies retained path geometry. Dependencies point down
to Hyperreal, Hyperlimit and Hypersolve, with no dependency on Hyperpath.

The current API selects and certifies route-wide limits from exact affine
machine-axis derivatives. It retains limiting rows, deterministic ties and full
replay reports. Exact metric spans also support constant-jerk replay and two-phase
monotonic transitions. Hyperpath implements `MetricSpan` for retained line, arc,
and PH spans. Non-affine projections require their own derivative contract.

Build and test with `cargo test -p hyperdynamics --all-features` on Rust 1.95.
Feed profiles, corner limits, forward/reverse lookahead and bounded jerk
refinement consume `MetricPath`, `MetricSpan` and `JoinSpan`. Join reports retain
the geometry owner’s complete receipt. Run `cargo run -p hyperdynamics --example
feed_schedule` for a standalone exact provider. Validated ODE/reachability and
extraction retention qualification remain in progress.
