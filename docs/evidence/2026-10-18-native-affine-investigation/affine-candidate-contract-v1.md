# Isolated affine-difference candidate

The unchanged owner baseline reports three failures and one positive control.
Change only the existing affine cancellation helper in Computable::add: after
the same bounded offset decomposition and scaled-base structural comparison,
return the rational offset difference instead of requiring equal offsets.
Keep the original eight-visit recognizers and scale guards. No new retained
cache, lower precision, approximate terminal or caller-specific rule is added.

Run exactly the same four owner tests, then the complete scalar unit suite in
the same direct compiler configuration. All other source and existing tests
remain byte-identical. Compile into a new directory and preserve the baseline
binary and raw failures. Reproduce the native coordinate probe against a
coherent candidate dependency build before deciding whether to advance.

The intended representation change is explicit: these exact rational
differences become rational Computable leaves. Mathematical values and prior
certified facts must agree. Any exposed serialization consequence, performance
tradeoff or broader resource regression needs separate review before admission.
This isolated candidate is not integrated into the working source or admitted.
Original full native workloads, report contracts and downstream checks remain.
