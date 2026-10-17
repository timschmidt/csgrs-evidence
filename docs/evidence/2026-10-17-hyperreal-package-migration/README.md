# Hyperreal package-content migration

The actual Hyperreal archive now contains 283 members and is 4,012,052 bytes,
compared with 346 members and 108,043,832 bytes before this change. Exactly 63
historical replay tarballs are omitted. Every bundle remains byte-identical in
the repository. Source, examples, tests, regression fixtures, checkpoint JSON
and compressed sample summaries remain in the package. All other members are
byte-identical except the declared manifest, lock, VCS, README and test edits.
This is an explicit distribution-content migration, not a runtime speedup.

Before editing, the original extracted package reproduced a README metadata
test failure: its textual dependency-table search rejects Cargo's normalized
manifest. The corrected test uses the already locked TOML parser as a dev
dependency and preserves both assertions about rug. The root lock adds only
that development edge; all existing package versions and checksums are retained.
Two invalid extracted manifests fail at the intended assertions: rug moved to
normal dependencies and rug removed from development dependencies.

The extracted package has no monorepo ancestry, workspace patches or path
dependencies. Its default build, default/all-feature all-target checks and
Clippy with warnings denied pass. The source and extracted package each pass
both README test binaries under both feature settings (16 test passes across
configurations), run the unchanged quickstart program, and pass the existing
verification-acceptance guard tests. Root cargo fmt --all -- --check passes.
The all-feature normal dependency tree contains neither rug, GMP nor the TOML
test parser. These checks do not constitute the complete scalar test suite or
a rerun of formal proofs.

A successful response from the [official Hyperreal index](https://index.crates.io/hy/pe/hyperreal)
contains no version 0.13.1. The README now labels this source as unreleased and
provides the tested source example command. Neither archive assembly nor this
local extracted-package validation establishes publication or MSRV support.

Raw failures, controls, source pins, commands and output are preserved. The
first sparse preflight omitted a direct crates/ formatting file and stopped
before Cargo; its corrected replacement is separate. An edit-helper generator
syntax error wrote no files and is also recorded. Neither failure is erased.
Both build targets, all four extractions, and every newly closed physical path
are independently hashed and retained on Disk B; the large artifacts are not
copied into Git. Historical missing paths remain 27,093 and unqualified.

The isolated branch admits this package correction only. The original 35-file
native bundle remains rejected and the separate Hypercurve cache proposal
remains unadmitted. The whole-stack release still needs its excluded Hypervoxel
dependency, complete packaged consumer pipeline and MSRV checks. No push or
publication occurred. Only current_work changes in the ledger, and integration
into the original worktree remains pending its storage reserve.
