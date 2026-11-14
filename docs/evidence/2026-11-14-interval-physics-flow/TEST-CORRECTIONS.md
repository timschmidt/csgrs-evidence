# Diagnostic history

The baseline missing consumer fails with E0599, before production edits.
Initial candidate compilation used Vector3 field syntax instead of existing indexed
access, and initial test compilation exposed an extra delimiter and non-Copy array
repeat expressions. Corrections use indexed clone access and array::from_fn.
No mathematical expected value, policy, source or test threshold was weakened.
An initial mutable graph-budget reference was hardened to an opaque operation view
before the final ten acceptance tests and owner qualification, preventing replacement
of the configured counter while retaining its original source/field operations.

The first allocation build and all observer assertions pass. Inspection with objcopy
without an explicit output file rewrote copied benchmark artifacts. The timing driver's
hash check rejected them before execution. Original Cargo-built executables still
matched every recorded hash; restore-artifacts.py restored the copies, and the section
inspector now specifies a separate output. artifact-restoration.json retains both
hashes. All timings use the original hash-verified executables.

The initial two Criterion invocations lacked --bench and ran successful acceptance
checks only; they are not timing observations. measure-dynamics.py records four actual
Criterion timing invocations with --bench. All original outputs remain archived.
