# Release documentation argument admission

Owner: repository release tooling. P36/P37 and Phase 14, documentation build
configuration fidelity. No production Rust/API, mathematical representation,
predicate order, dependency requirement, canonical artifact or pending extraction
is changed. Existing runtime/cost gates are not relaxed by this tooling repair.

Target: CSGRS 613c3e2c2b8671af74eda2c85d3e9c2d98393b2d. The existing release
loop consumes docs.rs feature options but silently omits rustdoc-args. HyperDRC
currently requests --cfg docsrs. A real offline two-crate documentation fixture
must require the named cfg only in the requesting crate, preserve a whitespace-
bearing rustdoc argument, reject warnings, and preserve feature selections.
First execute the actual old loop against a fixture that cannot document without
the named cfg. Record failure before changing the implementation.

Implement explicit per-package argument transport using Cargo encoded rustdoc
flags. Preserve strict -D warnings and the selected toolchain. Never shell-split
manifest argument arrays or leak one package's flags into another. Missing package
selection and unsupported metadata must fail explicitly rather than report a
partial configuration as success. Scope the helper to local workspace docs with
the current metadata keys (features, all-features, no-default-features,
rustdoc-args); hosted docs.rs toolchain/target/environment and archive-only builds
remain separate obligations. Retain exact metadata/input, argv/logs and source.

Validate both MSRV 1.95 and stable with the compiled fixture; then run the changed
release path on clean source and inspect all 21 actual documentation outcomes and
existing release consumers. No runtime performance improvement is claimed.

References: https://docs.rs/about/metadata ;
https://doc.rust-lang.org/cargo/reference/environment-variables.html . Cargo
encoded rustdoc flags use ASCII unit separator to preserve argument boundaries.
