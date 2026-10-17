# Include the license texts already declared by crate packages

Owner: crate distribution metadata and packaged documentation, P36/P37 and T12.
Domain: the twelve publishable crate manifests currently declaring Apache-2.0
without an Apache license text in their package root: hyperbrep, hypercircuit,
hypercurve, hyperevolution, hyperlimit, hyperpack, hyperparts, hyperpath,
hyperphysics, hypersdf, hypersolve and hypertri. Existing manifest expressions
remain authoritative inputs for this limited package-content check. Existing
MIT grants, copyright notices and third-party attribution files are preserved.
This patch supplies declared terms; it does not choose a new license, determine
ownership, certify dependency/fixture provenance or resolve all license history.

Before editing, reproduce the absence in Cargo package file lists at the target
revision, record all existing package file hashes, declarations and README
license links, and fetch the canonical license from
https://www.apache.org/licenses/LICENSE-2.0.txt. Compare that response byte for
byte with the existing crates/hyperreal/LICENSE.txt copy. Fail before edits if
they differ. Add that exact text as LICENSE-APACHE to each of the twelve crates.
Correct the Apache links in hypercurve, hyperphysics and hypersolve and link
both existing choices in the hyperlimit and hypertri READMEs. No grants or
notices are removed; no Rust code, manifests, lockfiles or fixtures are edited.

After the final edit, rerun every affected Cargo package --list command and
require exactly one added member, LICENSE-APACHE, in each package. All other
retained file bytes must match the baseline except the five declared README
edits. Verify all twelve license texts against the independently fetched bytes,
the README links, all original notices, manifests and lockfiles, and run cargo
fmt --all -- --check plus authored whitespace checks. Preserve raw output,
failures and command/tool identities. No runtime test, full Cargo build, crate
archive build, minimum-compiler, dependency-provenance or shipped external
consumer qualification is claimed from file lists or documentation checks.

Reuse the frozen E49 runner read-only with fresh output roots and its original
900-second command limit, 8 GiB child address-space bound, 2 GiB host available
memory, 512 MiB repository reserve and 256 MiB runtime-filesystem reserve.
Add a monitored 4 MiB total fresh-output cap. Fetch uses its own 60-second and
64 KiB response limits. Controls, authored changes, committed evidence and Git
writes have a 3 MiB planning allowance above the repository reserve. Monitoring
is external containment and may overshoot between observations; it proves no
internal algorithmic work or retained-memory limit. No closed build target or
artifact root is written or deleted. Close all new physical paths separately,
without inode deduplication, and update only current_work in the ledger.
The existing 27,093 missing historical paths remain explicitly unqualified.
