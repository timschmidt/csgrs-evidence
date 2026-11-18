# Isolated affine axis projection functional qualification

The source candidate is not admitted to the primary production branch. The
existing bounded memory/size policy and all historical charges remain unchanged.
No runtime, complete-lifetime memory, final-binary, firmware-fit or release claim
is supported by this functional stage.

- CSGRS baseline: `52b6d1bab627ab212eda80fbc0d4c08a4cd23176`.
- CSGRS isolated candidate: `8f351042e1880a8d77b50606df8b387066522c45`.
- Interface baseline: `5b532c803af86dd9e3d7a66f3651163fd2f7c68b`.
- Interface isolated candidate: `e5af3b4383d33c440d087e0d2b933fccde766b9c`.
- Unchanged firmware: `7e0d5a43d01706fe619234d8b174beb1ebe45dc6`.

Both candidate repositories retain
`refs/interval-unaccepted/axis-projection-owner-20261117`. The extraction moves
only exact affine axis projection, with a narrow error and legacy mapping.
Feed, lookahead and jerk extraction remain outstanding.

Final all-feature owner suites pass 602 tests; the minimal feature test passes;
Interface core passes 201 tests. Four external comparisons preserve complete
reports and all dispatch counts in both policies, tracing off/on. Sixteen full
baseline snapshots become count assertions. Thirteen legacy error mappings and
both public legacy paths are covered. The direct consumer has no geometry crate.
The original 41,795-byte canonical planner fixture is unchanged and passes.
Strict Clippy, docs, formatting, typo and repository-budget checks pass within
the recorded configurations.

The command ledger records 53 child invocations and
720.397 wall seconds, within its 120/3600
validation envelope. The expected original missing-API compile failure is
retained. A preliminary movement script assertion failed before writes; its
original source and correction are retained. The initial consumer lock was
regenerated during candidate resolution; a reconstructed baseline lock on the
unchanged source has identical package versions/sources/checksums to the
candidate, and locked rebuilds reproduce both original complete outputs.
This does not establish artifact or timing equality.

`payload.tar.xz` contains scripts, manifests/locks, full outputs, logs, audits and
source revision references. `origins.json.gz` binds every payload member to its
original path and SHA-256. The archive driver verifies every original, decoded
and committed byte and preserves earlier archive paths. No compiled image is
included because no cost claim is made. The held release queue and fixed DRC
image remain unchanged.
