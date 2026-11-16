Both first baseline consumer builds succeeded but setup for case4 panicked:
zero skew error is invalid when maximum_channel_skew_cycles>0, even if slew0.
No production code was edited. Preserve that input as expected typed invalid
calibration; route it through actual validated() in operate instead of trying
to prepare a proof in setup. The unrelated default proof stored for invalid
prepare_each inputs is never consumed. Both original sources, failed output
and binaries remain preserved with initial- prefix. No measured timing ran.
Also print both complete32-byte digests: protocol Digest Debug is abbreviated.
Independent equality checks already compare full digest bytes. No authority,
validation, fixture or production behavior is weakened.
