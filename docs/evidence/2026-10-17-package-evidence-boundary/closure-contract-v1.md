# Closure and admission-record scope

The complete candidate comparison verified all 7,766 retained physical files
other than Cargo.toml before updating the admission ledger. Closure necessarily
adds this decision to docs/properties-status.json, itself a retained package
file. This is an intentional documentation change alongside the manifest change.
Preserve the candidate comparison as executed; do not rewrite it as a claim
that the ledger remains byte-identical after closure.

After writing the record, rehash every other retained physical file (7,765),
check the manifest against its accepted candidate bytes, and independently
verify that the ledger changes only its raw current_work value relative to
revision 9025de62. Package path membership and every Rust source, test, example,
benchmark and compile-time asset remain unchanged. The archive-membership
migration removes only docs/evidence from the root crate distribution.

The prior audit's metadata may be reused read-only only after its physical
stdout and result file match the inherited artifact expectations. The current
metadata comparison ignores only the two output-directory fields, each checked
against its recorded CARGO_TARGET_DIR. All other returned declarations match.

The raw lists, earlier timeout, process samples and all completed command
records remain available. No full-history preservation, archive-size, runtime,
performance, external-build or release-readiness claim is added.
