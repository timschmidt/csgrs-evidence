# Release consumer audit and quickstart correction

The README advertised the in-development 0.23.0 API through crates.io. A clean
external consumer, with a fresh Cargo home and no workspace patches or local
dependencies, failed resolution after updating the official index: no version
matched ^0.23.0; the newest candidate reported was 0.20.1. The independent
official sparse-index response also contained no 0.23.0 entry. The README now
labels the API unreleased and runs the existing example from the source checkout.
Its Rust example is unchanged. The existing version test derives its expected
version from Cargo instead of repeating a hard-coded dependency declaration.

The [registry inventory](registry-inventory.json) covers the exact versions in
20 publishable manifests. Twelve successful index responses omitted the target
version; eight requests returned HTTP 404 and remain separately classified as
lookup failures. Presence alone would not establish source/API compatibility.

Cargo's root package listing reached its declared 180-second wall limit and
was terminated with no file list. Root package contents, including the suspected
evidence inclusion, therefore remain unestablished. No exclusion was changed.
Hypercurve's listing completed: 422 paths and 26,245,600 bytes of existing source
files. Those bytes exclude Cargo-generated files and are not compressed archive
size. No package archive was assembled or verified.

Both existing README tests passed after the final edit, compiled directly with
rustc because they have no geometry dependencies. Strict direct Clippy and
repository-wide cargo fmt passed. This does not rerun the geometry library or
the external modeling pipeline. Fresh build storage, dependency availability,
feature/MSRV checks, package builds and real binding consumers remain release
gates. The deferred cache proposal remains unadmitted.

See the [contract](contract-v1.md), [patch](readme-installation.patch),
[observations](observations-v1.json), [validation](readme-validation.json),
[raw evidence archive](raw-evidence-v1.tar.gz) and its independently verified
[member inventory](archive-members-v1.json). All interrupted and unsuccessful
commands remain in that archive. Original output roots are closed and retained.

Only current_work changes in the execution ledger. The checkpoint preserves
27,093 inherited missing artifact paths; this is not a whole-history preservation
claim. The full properties plan and its open release boundary continue.
