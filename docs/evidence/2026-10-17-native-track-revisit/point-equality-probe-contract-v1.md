# Point equality cost attribution, before implementation

Owning layer: Hypercurve Point2 equality selects a scalar proof; Hyperreal Rational equality already owns exact rational value comparison. P1, P3-P5, P8-P9, P19, P36-P37 apply. No production equality change is made in this diagnostic.

Reproduce whether the current public Point2 equality allocates for already constructed rational coordinates. Use exact integer labels as the equality oracle, including decimal, negative, tiny, huge and non-dyadic rational coordinates; shared point handles and symbolic translations must also be observed. Construction, formatting and output materialization are outside the measured equality loop. Report all cases and both first all-pairs traversal and repeated traversal after warmup. Count requested Rust heap allocations/bytes/peak/live through System; this does not count allocator overhead, native GMP allocation, or RSS. Timings with instrumentation are attribution, not an optimization benchmark.

A future experiment may dispatch borrowed exact rational coordinates to the existing Rational equality implementation, retaining the complete existing symbolic zero-difference fallback, shared point identity, policy behavior and mathematical oracle. It needs its own source pin, before/after measurements, ordinary/hard-case matrix, lower-layer and downstream checks before retention. This diagnostic cannot admit that change or the exact importer.

Compile against the pinned current integration libraries, read-only. Run only after task-owned compilation and native gates stop. Each case has the existing 60-second/8-GiB external containment and inherited filesystem/log limits. Preserve every exit and raw result. No internal work, allocation, memory or cancellation bound is inferred.
