# Interface measurement delegation admission

CSGRS efb7b2b9909e038987ec93c2b89211439b957a40; Interface
ee6cdb169ba1feb8d5f3e8bcda11256733c70755. All managed repos initially clean.
Phase 8 production arithmetic migration; owner Hyperinterval rational set
arithmetic, semantic wrapper BoundedMeasurement<U>. P1, P4–P10, P19, P31–P33.
Domain: arbitrary finite exact Rational nominal and signed uncertainty; every
unit U. Nonnegative uncertainty returns exact closed nominal +/- uncertainty;
negative uncertainty retains BoundaryError::NegativeUncertainty. Lower/upper
const accessors, unit type/symbol, equality, cloning and Debug remain unchanged.
Use the existing RationalInterval::from_nominal_uncertainty and into_bounds;
no endpoint formula, order proof, normalization or scalar kernel is added.
Retain any unexpected kernel error as typed source rather than mapping it to
a known domain failure. Test exact outputs, errors, replay/canonical consumption,
trace counts, allocation, time and executable footprint against the baseline.
Reproduce all current core tests before changing production. A failing
cost/size/trace gate rejects adoption, not the requirement for eventual migration.

Missing witness: no old/shared full-domain conformance and measured production
adoption test. Existing nominal +/- uncertainty tests cover only small integer
samples. Add independent exact fraction expectations and full representation
cases. Both STRICT and APPROXIMATE_512 policies must retain downstream values
and certainty. Neither policy participates in rational construction itself.

Machine-profile from_scalar currently performs no uncertainty-sign test after
configuration validation; the shared constructor adds one. Do not change that
path in this candidate: its ownership/predicate-order transport needs a separate
solution. Positive products/quotients and full machine-profile migration remain
part of Phase 8. No push until the full workflow gates are satisfied.

Candidate 1 matches exact outputs and fresh-process cold/warm trace counts,
but the matched native probe grows 912 bytes and Wasm grows 6 bytes. The first
in-process trace witness was invalid: interned rational facts survived input
reconstruction. Running the exact original formula on both sides reproduces
the same failure; retain that diagnostic and compare fresh processes instead.

Candidate 2 keeps the typed Interval error and Error::source chain, but gives
this new outer error a short domain message. The original negative-radius
message is unchanged. Formatting every hypothetical kernel error in the outer
Display duplicates diagnostics already retained by source(); removing that
formatting may avoid linking unused kernel formatting paths. No validation or
typed diagnostic is removed. Measure before deciding whether to keep it.

Candidate 2 makes the native footprint probe 48 bytes smaller than baseline,
but the Wasm module still grows six bytes. Candidate 3 adds an ordinary inline
hint to RationalInterval::from_nominal_uncertainty, whose validated arithmetic
body and order remain unchanged. Measure all output/trace and completed-work
gates again; the hint must not be assumed beneficial from source inspection.

Candidate 3's inline hint changes neither footprint; reject it and restore the
scalar source exactly. Candidate 4 shortens only the newly introduced invariant
expect message to 'nonempty nominal-radius interval'. The check and mathematical
precondition are unchanged: RationalInterval's constructor cannot return empty
on success. No domain error, validation or typed source is removed. This tests
whether the verbose panic text accounts for the small remaining module growth.

Candidate 4 also leaves footprint unchanged; keep the concise invariant text
but do not claim a size benefit. Wasm section comparison shows code shrinks
42 bytes while data grows 48. Added strings identify the probe's unexpected-
error panic, not production diagnostics. Revise the new unpublished probe to
return a separate unexpected-error status; the Python oracle now explicitly
rejects it as well as comparing every expected output. The production typed
error/source chain is unchanged. Rebuild both baseline and candidate with this
identical probe revision before any footprint decision. Keep all earlier raw
measurements and failures. This does not admit any previously failing case.

A later selective release allocation-test command reproduced Cargo's duplicate
libcsgrs.so/rlib filename collision between aborting non-test binaries and
unwinding integration tests, followed by E0463. Preserve the failed log. Gate
the native probe binaries behind an explicit probes feature; ordinary trace
tests no longer request those aborting binaries. Use a dedicated target
directory for measurement artifacts and rebuild both revisions with the same
feature. This changes only harness build selection, not assertions or production
profiles. Revalidate the affected test/build commands after the final edit.
