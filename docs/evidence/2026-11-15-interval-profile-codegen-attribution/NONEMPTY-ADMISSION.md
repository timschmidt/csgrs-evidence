# Preserve construction nonemptiness across shared arithmetic ingress

The current mapped executables are byte-identical to the qualified original
artifacts. Their text symbol unions differ by 415 bytes; actual .text differs by
416 (one padding byte). Normalized symbol-family deltas sum to that union delta.
The main transmission derive shrinks 87 bytes; new proof/component adapters and
changed wrapper boundaries dominate growth. Disassembly of positive_scalar_with_proof
shows a null/empty test and a call to an unreachable panic after nominal uncertainty
construction; the native constructor mathematically always returns nonempty. Extra
rodata/relocation/unwind contributions are also recorded, not all attributed to one
branch. This evidence supports testing proof transport; it does not prove the new
carrier will pass every gate.

Owner: Hyperinterval nonempty rational sets and positive refinement. Add a checked
NonEmptyRationalInterval backed by the existing Bounds authority. Preserve exact
nominal +/- unsigned radius construction as nonempty, including signed nominal,
zero radius, arbitrary finite rational coefficients and full unsigned-radius width.
General RationalInterval keeps empty semantics. Share the existing positive check,
and retain its ordering comparison and lower-before-upper arithmetic. A nonempty
refinement can return Option to distinguish only failure of positivity, avoiding
the artificial empty/unreachable branch in the consumer. Interface still owns all
nominal values/units/configuration identity and typed physical-fact errors.

Before edits, compile a missing nonempty-carrier witness on the current control.
Preserve all existing owner assertions and add nonempty/general conversion,
independent arbitrary-rational expectations, failed order/positive ingress and
fresh-process original/control/candidate traces. Screen full native/WASM outputs
and sizes first. If rejected, restore; if favorable, broader owning/downstream
runtime, allocation, code-size, dispatch, canonical schedule and platform gates
remain mandatory. This is an experiment, not accepted source. No policy/fixture
weakening, arithmetic reordering or speculative layout/inlining hints.
