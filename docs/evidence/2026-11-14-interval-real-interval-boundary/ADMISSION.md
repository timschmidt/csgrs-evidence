# RealInterval ownership and migration boundary

Phases 0/7, P1/P4/P6/P8/P10/P17-P20/P27/P36/P37. Owner: Hypersolve's strict
symbolic endpoint proof adapter, with scalar set arithmetic in Hyperinterval.
Target is the clean committed CSGRS revision recorded in BASELINE.json; existing
pending extraction and Interface changes are excluded from the isolated audit.

The source review identifies a missing migration witness: symbolic RealInterval
multiply intentionally sums opposite-sign corners when both inputs straddle zero,
whereas RationalInterval selects a tight hull. This is a public bound difference
on ordinary rational inputs, propagated to subsequent operations. A drop-in
migration must preserve observable bounds and predicate order, not merely contain
the same exact point products. Reproduce this boundary before making inventory
claims. No production function is to change in this admission.

Audit the complete real_interval.rs body, its actual exports/feature/serialization
surface, the sole rational Bernstein external call, and explicitly named selected
RealInterval consumers. Record exact source digests and separate complete body
review from partial caller review. Classify every declaration including helpers
missed by lexical keyword scanning. Do not credit search hits as reviewed bodies,
remove historical rejected dispositions, or assert the whole inventory is audited.

Retain a focused acceptance suite with independent small integer corner bounds,
explicit strict-straddling composition expectations, nonrational endpoints,
quotient domains and polynomial-sign controls. Reuse existing downstream strict-
only uncertainty regressions. Full owner tests/Clippy and affected downstream
regressions must pass; no runtime, allocation or size improvement is claimed from
adding tests and audit records. All migration cost gates and the full goal remain
open. No push or publication.
