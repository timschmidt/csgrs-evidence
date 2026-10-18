# Hyperreal package migration admission checkpoint

Admit only the tested Hyperreal distribution correction: omit the 63 historical
replay tarballs from its Cargo archive while preserving every bundle in Git,
document the unreleased source example, and retain the GMP dependency assertion
using a development-only TOML parser that accepts Cargo-normalized manifests.
The root lock may change only the edge to that already locked parser.

Require actual before/after archive membership and byte comparisons, isolated
package builds, default/all-feature all-target checks and strict Clippy,
source/archive README tests and examples, verification guard tests, and the two
expected negative dependency failures. Preserve the original packaged-test
failure and both setup-helper failures. No production Rust or scalar semantics
change; no runtime performance, full scalar suite, proof rerun, MSRV, cache
admission, published release, or full-plan completion claim.

Extend E58's artifact chain. Independently hash every newly closed physical
path, including duplicate archive copies and each extracted/build file. Archive
small raw controls, logs, manifests and receipts; retain complete build targets
and package/extraction artifacts on Disk B outside Git. Do not overwrite closed
files. General source, registry, GMP and other build caches remain open.
Inherited 27,093 missing paths remain unqualified; no whole-history audit claim.

Only current_work may change in docs/properties-status.json. Preserve all other
raw bytes and decoded keys against 9025de62. Reverify original repository HEAD
and ledger unchanged. Verify staged whitespace and every staged blob's bytes
before a separate commit command. No push or publishing.
