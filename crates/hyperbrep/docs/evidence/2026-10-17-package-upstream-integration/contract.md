# Package and documentation integration contract

Merge upstream 7ed435017 into brep after 3cac7d929, preserving both histories.
Ownership is package metadata, license assets and documentation; no production
Rust algorithm or dependency lock changed in the fetched seven commits.
Properties P26/P27/P35/P36/P37/P39 apply. The missing acceptance is the merged
package boundary and README contract, with native source preservation checked
independently. Preserve the latest HyperBRep ledger entry and all unrelated
upstream ledger bytes.

Capture baseline HyperBRep and HyperBRep IO package file lists before the merge.
The upstream Apache text must match its declared hash and the pre-existing
Hyperreal text. The BREP IO manifest also declares Apache-2.0: check its package
and include the same standard license asset if absent, without changing its
license expression or existing notices. File listing alone does not prove a
built package, registry availability, provenance or complete release readiness.

Compare all production Rust source and locks before/after. Execute the unchanged
README tests with Cargo's actual package version, deny warnings, check Cargo
metadata and formatting, and rerun a complete frozen axial native/STEP consumer
only after verifying its source inputs and hash. Production source preservation
permits reuse of the preceding qualified binaries; it is not a new timing claim.
Retain every attempt and artifact. If runtime/dependencies change or a regression
appears, expand the affected qualification before retaining the merge.

Use externally contained commands and retain timeout/failure outcomes. Preserve
upstream's explicit missing historic artifact and unreleased package gates.
No broad repair of the other thread's work, push, release or project completion
is part of this checkpoint. Continue BREP performance work after integration.

## Reproduced package-content gap before BREP packaging edits

The baseline HyperBRep list contains 13,119 members, including 12,936 historical
evidence paths; both BREP package lists omit LICENSE-APACHE. No source, test,
benchmark, example or fuzz target refers to docs/evidence as a compile-time input.
Apply the same /docs/evidence exclusion now used upstream at the root to the
HyperBRep package only. Preserve every non-evidence package member, add the
already-declared license texts, and compare all unchanged physical member bytes.
The historical material stays tracked in the repository; this is a package
payload change, not removal or weakening of acceptance evidence. Compare the
resolved dependency/features graph separately from package-only metadata.
