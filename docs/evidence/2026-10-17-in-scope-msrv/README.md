# In-scope Rust 1.95 compatibility

The retained Hypercurve cache candidate passed the root workspace's default
all-target check on Rust 1.95.0. CSGRS, CSGRS FFI, HyperDRC and Hypergraphics also
passed all-target checks with all features and with default features disabled.
These four crates explicitly declare the compiler floor. The exact corrected
Hyperreal package extraction separately passed default and all-feature
all-target checks at the same compiler. All fourteen commands exited zero;
eleven were compiler checks and three recorded tool identity. No compiler
warnings or resource stops were observed.

The original candidate checkout remains unchanged. Its lockfile is identified
separately from the newly admitted Hyperreal package correction; the latter's
actual extraction was checked separately and mounted read-only. The new TOML
development dependency and normalized-manifest guard therefore also compile
at 1.95. No source, fixture, feature, policy or dependency version changed.
These checks are not runtime test executions or the full feature powerset.
Clippy was neither installed nor run for 1.95; the repository's MSRV workflow
requires Cargo checks, and prior stable Clippy results retain their own scope.

Hypervoxel is deferred by explicit user instruction. No command targets its
workspace, and it was not compiled in this matrix. Its dependent distribution
blockers remain: HyperSDF, CSGRS, CSGRS FFI, HyperDRC and Hypercircuit. No optional
feature or dependency was removed to make a package succeed. The retained root
metadata, including optional dependencies, identifies fourteen other packages
for a separate native Cargo package-verification run. That selection is not a
claim that the complete workspace packages successfully.

Controls, commands, raw output, scope correction and source/tool identities are
archived and verified. Every newly closed target file is hashed at its physical
path and retained on Disk B outside Git. The previously closed Hyperreal
extraction is unchanged. Historical missing paths remain 27,093, unqualified.
The separate cache candidate is still unadmitted; release and full-plan
completion remain open. Only current_work changes in the ledger. The original
repository remains unchanged and no push or publication occurred.
