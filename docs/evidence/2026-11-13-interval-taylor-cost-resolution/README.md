# Taylor retention and legacy cost resolution

Final retained source: `5222328cf32f96ae77fb9d8226b441ceb2dae3a5`.
Main advanced from `7f718e82f00f06218764004fcb8603ceabde9c86` while preserving
all forty pending extraction paths. Thirty-seven nonoverlapping pending blobs
are identical; the three overlapping Hyperdynamics files incorporate the
qualified Taylor additions. Interface's eight pending edits are unchanged.
No repository was pushed. The full fifteen-phase goal remains active.

## Final evidence

The final source and results are under **`arity-qualification/`**:

- `SOURCE_FINAL.json`, `source-files/`, `source.patch`, `source-commit.json`:
  final twenty source paths and the last three-file correction.
- `final-qualification.json`, `downstream-qualification.json`, `VALIDATION.json`:
  fifteen owner and eleven downstream groups passed after the final source edit.
- `legacy-artifact-comparison.json`, `compare-artifacts.py`:
  both old consumer ELF files preserve every byte except twenty build-ID bytes
  and ninety-one nonallocated symbol-string bytes. Sizes, section metadata,
  machine code, runtime data, source diagnostics, relocations, unwind tables
  and function layout are identical. No binary is rewritten by inspection.
- `final-consumer-builds.json`, `arity-semantic.log`: same 177,398-byte old
  source/output/certainty transcript and original binary sizes.
- `arity-pair-*`: all twelve fixed alternating paired runs, all 22 cases,
  original 31 eight-operation samples, fixed CPU/path/ASLR and warmup.
  Resource/allocation rows match. One pointwise interval is adverse:
  unit/integrate 1.0049825577, 95% interval [1.0000935935,1.0101950084].
  Retention uses the stronger deterministic execution-artifact equivalence;
  no interval, threshold or case was changed. No universal timing or speedup
  claim is made, and this observation remains part of the record.
- `model-cost-*`, `model-invariance.json`: two completed-model trials and sixteen
  resource controls. Resource, image and allocation records match the earlier
  candidate. Construction medians are about 54, 136, 197--198 and 828 us for
  logistic, mixed, reciprocal and sine cases. Reuse and replay remain separate.
  These are absolute costs, not comparisons against a different completed task
  or claims of whole-resource bounds.
- `retention.json`, `pending-after.patch`, `repository-state.json`: retained
  source, preservation of pending work, unchanged sibling states.
- `immutable-parent-verified.json`: prior 314-file Taylor stage remains identical
  to its separately archived record.

All final source-body changes to the old Jacobian are visibility-only. Its
original complete-column traversal remains unchanged. Optional Taylor exports
are appended after existing source. The demanded traversal reuses the existing
Builder and Expr derivative rules through an arity-based composition loop.
There is no second local calculus authority or copied derivative-rule helper.

## Earlier investigations retained

Top-level `SOURCE_FINAL.json`, `source-files/`, `combined-*`, `final-*` and
`downstream-*` refer to the superseded two-accessor revision, not final arity
source. That version restored identical machine code but retained nineteen
changed diagnostic source-location records. Its twelve short-batch pairs retained
one adverse halving-limit interval. Its identical-baseline instrumentation control
had no adverse intervals. A predeclared 64-operation repeat retained adverse
identity-replay and halving-limit intervals. All inputs, outputs, scripts and
observations remain here, including the exploratory exact-ELF-size assertion
failure and the corrected nonregression-size inspection. `CONTRACT.md` records
the hypotheses and decisions in order.

The prior `docs/evidence/2026-11-13-interval-taylor-candidate` record at external
commit `102425928655792d063a3cfa8121dfcdec37a555` remains authoritative for initial
candidate qualification, rejected alternatives and the pristine timing correction.
Its digest is da15cf76824197c12746e9b0d6b87bc354d9e1059c44324533d4093a8a52500c.
This record extends that evidence and does not rewrite it.

## Remaining work

Taylor model arithmetic/composition, wrapping control, wider consumers and
competitive completed-workload benchmarks remain open. The explicit scalar,
coefficient-payload, heap-byte and within-scalar cancellation exclusions still
apply. Phase 11 extraction retention, broader phases and release/HIL qualification
remain open. These local checks are not the full pre-push workflow matrix.
