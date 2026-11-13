# Typed nonnegative uncertainty ingress experiment

Owners: Hyperreal owns exact unsigned fraction construction using its existing
canonical reducer; Hyperinterval owns closed nominal +/- uncertainty sets;
Interface owns wire validation, units, nominal value and configuration identity.
Properties P1, P3-P6, P8-P10, P17-P20, P27, P31-P33, P36-P37.

Domain: arbitrary Rational nominal, u64 uncertainty numerator and NonZeroU64
denominator. Types prove nonnegativity and nonzero denominator; arithmetic is
exact, infallible on this domain, and uses existing scalar reduction. Existing
signed fraction and arbitrary Rational uncertainty APIs retain all behavior.
Rational arithmetic remains unbudgeted; this experiment establishes no total-work
or cancellation bound. Output is consumed by interval arithmetic and unchanged
profile validation/lowering. No serialization or stored profile shape changes.

Interface first converts nominal, then rejects zero uncertainty denominator,
then negative wire numerator using existing Arithmetic/Configuration errors.
Validated ConfigurationDocumentView already excludes these invalid radii. No
new MachineProfileError variant. Predicate/cache order must match for all
admitted configurations. No unchecked trusted flag or alternate arithmetic.

Missing witness: unsigned_fraction and from_nominal_unsigned_uncertainty are
absent on the target. Reproduce missing constructor before production edits.
Independent cross-multiplied expectations, full u64 boundaries, consumed output,
existing signed errors, original profile differential, fresh-process traces under
both policies and complete profile identity/lowering are required. Retention also
requires matched native/WASM outputs and costs, allocations, code/binary size,
owner/downstream validation. A passing probe alone does not finish phase 8.

The prior signed prototype is rejected (672-byte native profile growth), with
its source/tests/results preserved. Neither prototype is retained in main.
