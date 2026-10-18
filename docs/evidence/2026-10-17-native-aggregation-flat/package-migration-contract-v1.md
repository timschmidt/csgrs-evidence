# Manufacturing bundle continuation of the readiness migration

The unchanged all-feature Hypercircuit suite reproduced 347 passes and one
failure at the full ZIP golden comparison in workflow.rs. The six Easyduino
fixtures were successfully recomputed. The manufacturing release golden also
embeds versioned HyperDRC evidence and must participate in the already-declared
21-to-22 migration. No implementation or test assertion is changed.

Decode and retain the actual and expected ZIP bytes from the failed assertion.
Require the same 22 members, archive ordering and metadata. Twenty members
must remain byte-identical. The evidence/hyperdrc.json member may change only
its 160 check_version fields. manufacturing-release.json may change only the
two digests of that evidence and the derived core digest. Independently verify
both old and new digests and reconstruct the exact expected ZIP byte changes,
including only the required CRC fields. A fresh test execution must reproduce
the migrated ZIP, verify and reimport it, and retain the existing size-limit,
malicious-path and signing assertions. Retain the original failure.

Keep the executed source snapshot and old fixture unchanged. Qualify the new
fixture as an explicitly hashed, read-only overlay at its existing runtime
path, with the same source and test executables. Re-run the complete affected
all-feature consumer suite and its Clippy check. Reuse unchanged native and
report checks, whose code, test inputs and policies have not changed. Copy the
verified fixture into main only after qualification; this adds one artifact
migration to the intended source patch. No new geometry, policy, fixture
resolution, checksum relaxation, Hypervoxel change or release claim is allowed.
