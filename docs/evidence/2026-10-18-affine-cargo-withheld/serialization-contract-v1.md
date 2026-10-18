# Exact affine result representation migration probe

Explicit subtraction may now return the existing rational Real carrier instead
of an equivalent Computable expression. This strengthens structural facts and
can intentionally change raw Real JSON/CBOR bytes for newly constructed values.
It is not a serialization-schema change or a performance-only assertion.

Use eighteen exact recipes: sqrt(2), sin(7), and pi, each with six signed
rational scales. The independent oracle is
((base + 5/8) - (base - 3/7)) * (n/d) = 59*n/(56*d).
Compare the current qualified baseline and final formatted candidate. Record
JSON, CBOR, display strings and availability of immediate rational facts.
Require byte-identical serialization before/after cache warming within each
implementation. Require every emitted JSON and CBOR value to be read by both
versions and proved equal to its independently derived rational oracle.
Retain every changed byte sequence; do not normalize reports to hide changes.

Use verified, frozen baseline library inputs and the candidate Cargo all-feature
library. These reader/value checks do not establish report compatibility,
analytic-source fidelity, topology, release readiness or a general provenance
upgrade. Full native reports retain their separate unchanged acceptance gates.
No performance claim follows. Each compile/process retains the original
60-second focused limit, address-space cap and migrated storage-only contract.
