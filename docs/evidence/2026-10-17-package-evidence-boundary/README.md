# Root package evidence boundary

Kept the root manifest exclusion `/docs/evidence`. This intentionally changes
the source distribution: historical acceptance archives remain in the repository
and are omitted from the crate package. Runtime geometry and its evidence APIs
are unchanged. No historical archive is deleted by this change.

The earlier 180-second package-list stop remains preserved in the previous
audit. A fresh inventory with a declared 900-second allowance completed in
204.150 seconds: 448,428 paths, including 440,659 historical evidence paths
with 9,448,625,594 bytes of existing source files. The candidate inventory
completed in 112.929 seconds with 7,769 paths. Exactly the named evidence paths
disappeared; no other path disappeared or appeared. These are diagnostic command
times with different package-content contracts, not a performance comparison.
Source-byte counts are not compressed crate archive size.

During candidate verification, all 7,766 retained physical files other than the
manifest matched their original hashes. All five literal compile-time asset
references remained present. Closure then adds the decision to the admission
ledger: every other retained physical file is rehashed, and only the ledger's
raw current_work value may change. See the [closure contract](closure-contract-v1.md)
and [final preservation check](final-source-preservation.json).

Cargo metadata for all 19 workspace members matches the prior declarations
except the two explicitly isolated output-directory fields. Offline metadata,
repository-wide formatting and authored whitespace checks passed. No Rust
implementation changed or runtime test was rerun. No crate archive was assembled
or built. Registry dependency availability, actual package builds, the complete
external modeling pipeline, feature/MSRV checks and real binding consumers
remain release gates. The cache proposal remains unadmitted.

See the [contract](contract-v1.md), [patch](package-exclusion.patch),
[baseline](baseline-result.json), [decision](proposal-result.json),
[metadata comparison](metadata-comparison.json), [raw archive](raw-evidence-v1.tar.gz)
and [verified archive inventory](archive-members-v1.json). The raw Git and Cargo
lists, process observations and command outputs are retained. The new physical
output roots are closed after this checkpoint.

Only current_work changes in the execution ledger. The checkpoint preserves
27,093 inherited missing physical paths; it makes no whole-history preservation
claim. The full properties plan remains active.
