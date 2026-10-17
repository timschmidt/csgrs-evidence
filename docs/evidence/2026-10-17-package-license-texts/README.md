# Package the declared Apache license texts

Twelve crates lacked the Apache text declared by their manifests: hyperbrep,
hypercircuit, hypercurve, hyperevolution, hyperlimit, hyperpack, hyperparts,
hyperpath, hyperphysics, hypersdf, hypersolve and hypertri. Each now includes
LICENSE-APACHE. The new files match the [official Apache text](https://www.apache.org/licenses/LICENSE-2.0.txt)
byte for byte and also match the existing Hyperreal copy. The SHA-256 is
cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30.

Hypercurve, Hyperphysics and Hypersolve now link their Apache label to Apache
terms. Hyperlimit and Hypertri link both already-declared choices. Manifest
license expressions and every existing license/copyright file are unchanged.
This is an asset and link repair; it does not settle ownership, license history,
the scope of inherited grants, or dependency and fixture provenance.

On the recorded revision, all twelve baseline Cargo package file lists lacked
LICENSE-APACHE. All twelve final lists add exactly that member and remove none.
The 1,082 existing physical package files were compared: only the five declared
README edits changed bytes. No Rust code, fixture, manifest, lockfile or existing
license was changed. Cargo formatting and authored whitespace checks passed.
The package file lists are not built crate archives or external-consumer builds.

The first inventory helper stopped on Cargo's generated Cargo.lock member before
making edits. Its executed bytes, original Cargo output and failure description
are retained. The revised helper recognizes the generated member described by
the [Cargo package documentation](https://doc.rust-lang.org/cargo/commands/cargo-package.html).
No package source, input fixture or acceptance requirement was weakened.

The reused frozen runner retained its 900-second wall limit, 8 GiB child address
space, 2 GiB host available memory, 512 MiB repository reserve and 256 MiB runtime
reserve. Fresh outputs were additionally monitored against 4 MiB. Controls,
authored changes, evidence and Git writes had a 3 MiB planning allowance. These
checks provide external containment, not internal execution bounds or performance
evidence. No closed artifact root or target was written or removed.

See the [contract](contract-v1.md), [protocol](protocol-v2.json),
[qualification](qualification-v1.json), [result](result.json),
[original diagnostic failure](prepare-v1-failure.json),
[raw archive](raw-evidence-v1.tar.gz) and [archive members](archive-members-v1.json).
All new physical paths are hashed individually. Only current_work changes in the
ledger; the 27,093 missing historical paths remain unqualified. No whole-history
preservation, complete release, production-cache admission or full-plan
completion is claimed. Large fresh-build storage remains unavailable.
