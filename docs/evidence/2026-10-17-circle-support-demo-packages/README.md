# Demo qualification and package assembly findings

The unchanged Hypercurve demo workflow passed: 42 tests, strict Clippy and the
release wasm32 build. Its separate lockfile's registry archives were verified.
This qualifies the declared workflow commands, not interactive browser behavior.

A full root-workspace archive-assembly attempt selected all 19 publishable members
and failed after updating the registry: HyperSDF requires Hypervoxel, which is
excluded from this workspace and was not found in the registry. No dependency,
feature or policy was weakened. Package builds were deliberately a later gate;
the failed assembly cannot be credited as a successful distribution.

Cargo retained eight pairs of staged archives and one incomplete HyperSDF file.
The initial summary inspected only the final directory and omitted that staging.
A recursive follow-up preserved all 17 physical archive paths and verified every
nongenerated member of the eight staged packages byte-for-byte against source.
Normalized active manifests contain no workspace paths or patches. Hypercurve's
new cache regression module is present. No final package archives were published
by the command. The separate v1 helper's stale membership-count assertion also
remains preserved; it failed before launching Cargo.

The staged Hyperreal archive is 108,043,832 bytes (103.0 MiB). Its 126 historical
checkpoint members contribute 110,147,092 uncompressed bytes. Large archived
verification bundles dominate this package. A package-content migration must
preserve source, tests, required fixtures, summaries and the repository's replay
bundles. No such metadata change is applied by this checkpoint.

The [Cargo package documentation](https://doc.rust-lang.org/cargo/commands/cargo-package.html)
describes multi-package assembly and the separate verification step. The
[Cargo publishing guide](https://doc.rust-lang.org/cargo/reference/publishing.html)
documents a 10 MB archive limit; a crate-specific exception was not investigated.

Raw controls, logs and inventories are archived and verified. The completed demo
target and package-staging target are closed, independently hashed at every
physical path, and retained outside the Git archive. Source and general Cargo,
compiler and native-build caches remain open. The cache candidate is unadmitted;
release, external-consumer, MSRV and full-plan completion remain open. Historical
missing paths remain 27,093. Only current_work changes in the isolated ledger;
the original repository remains unchanged.
