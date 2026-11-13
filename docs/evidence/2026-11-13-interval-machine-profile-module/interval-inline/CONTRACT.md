# Propagate typed interval ingress facts at the consumer boundary

The interval-only implementation preserves full profile transcripts and raw
allocations, and successive_operations size is unchanged. The profile ELF still
grows by 440 bytes. The application validates a nonnegative i64 wire numerator
and a nonzero denominator; the shared u64 interval entry otherwise retains a
full-width fallback and a scalar Result invariant check.

Test ordinary #[inline] only on this new typed interval entry so the existing
consumer's input facts can inform specialization. No existing function attribute,
body, predicate order, error mapping, domain or test is changed. All existing
scalar implementation files remain byte-identical. This is a new boundary hint,
not the rejected scalar-private-reducer wrapper. Recheck profile and successive
sizes first, then all affected exact/trace/native/WASM/runtime gates if it passes.
