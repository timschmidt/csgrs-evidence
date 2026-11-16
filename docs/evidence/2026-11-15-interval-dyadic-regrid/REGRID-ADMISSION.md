# Canonical identity for equal/finer dyadic regridding

The unchanged external artifact profile completes with 612,282,606 instructions;
its full eight-case transcript is byte-identical and passes the analytic oracle.
Dyadic regrid has 63,028,733 inclusive instructions (10.29% of this whole-process
observer, overlapping callees; not a timed-call fraction or exclusive sum).
General rational-power routing is also present, but its arbitrary exponents,
poles and rounding need a separate contract. This candidate targets the simpler
exact identity exposed by the same profile, not integer-power substitution.

Owner Hyperinterval, P1/P4/P5/P6/P10/P19/P27/P36. Domain: every valid normalized
DyadicInterval, including zero/empty, all signs and exponent storage extremes,
and requested grids no coarser than the stored grid. Current regrid shifts both
mantissas onto the fine grid then normalizes back to exactly the source. It
needlessly allocates temporary expanded integers, even for unchanged outputs.

Missing witness before edits: a fine-grid identity should allocate no more than
copying the same authoritative source. Use the existing shared allocation counter,
not a new allocator implementation. Keep exact outputs AND all deterministic
resource reservations/failure ordering unchanged; large requested shifts may still
exhaust under the declared conservative contract. Preserve coarse-grid rounding.

Extract the existing alignment reservation/shift calculation once within its
owning scalar layer, share it between alignment and identity regrid, and clone
the already-normalized value after that identical reservation. No cache, policy,
public API, parallel kernel, predicate call reordering or manual inlining tuning.
Empty/zero semantics and supported 32-bit shift conversion remain unchanged.

Reproduce the allocation failure and budget boundary witnesses first. Then test
owner matrices, complete downstream artifacts/work/dispatch, scalar size/runtime
and existing consumer sizes. Any failed unchanged-workload gate rejects the
candidate; no size/runtime waiver follows from an allocation improvement.
