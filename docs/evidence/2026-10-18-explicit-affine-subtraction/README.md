# Explicit affine subtraction qualification

The isolated candidate reuses Hyperreal's affine recognizer at explicit Real
subtraction. Matching symbolic terms leave an exact rational offset difference.
Ordinary addition retains its existing shared-operand and cache behavior.
The previous constructor-wide candidates remain rejected.

On unchanged production code, four of six new public acceptance tests fail;
all 849 original scalar units pass. The isolated candidate passes all six
new tests and the original units. The tests include signed rational scales,
operand reversal, bare shared bases, cold/warm operands, unequal symbolic
terms, oversized-scale decline and 512 successive differences.

Wider direct-compiler unit and scalar integration results are recorded in
review-v1.json. All 23 original top-level scalar integration files run, including
CLI consumers and independent numerical oracles. The unchanged native stroke,
stroke-composition and point-equality controls pass on both matched builds.
All 81 comparison result rows agree. Eight parallel-coordinate cases avoid
the repeated quadratic recognition observed on the baseline.

Five alternating allocation pairs preserve all 100 original lifecycle rows.
This is requested Rust allocation payload and named proof-work evidence, not
a wall-clock speedup or a global memory bound. Concurrent later unit/integration
qualification is not used for timing claims.

The first integration setup miscounted 23 files as 24 and stopped before any
compiler or test ran. Its failed helper and empty directories are preserved.
The corrected inventory matches the prior qualified Cargo targets.

Production source remains unchanged. This candidate is retained for further
qualification, not admitted. Exact rational output is an intentional
representation improvement that still requires report/serialization review,
Cargo and downstream gates, and validation after actual-main integration.
The exact importer and full native completion remain open.

All original resource baselines and limits remain in force. Compiled artifacts
are physically retained with independent hashes; source, commands and raw logs
are archived. Temporary storage remains volatile. Historical missing artifacts
were not reaudited or recovered. Hypervoxel remains outside scope, and neither
release readiness nor the full properties plan is complete.
