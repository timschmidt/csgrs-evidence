# Named scalar certificate admission

Named Real imports now check their parameter claims and any supplied payload
before publishing a value. Invalid claims return ParseError; missing proofs
return UnknownCertificate. SVG preserves the undecided scalar cause, and
CSGRS classifies it as Undecided. Valid pi^0 products reconstruct as one.
The public migration and remaining import limitations are documented in the
Hyperreal README. Accepted payload graphs, wire bytes and Real layout remain.

The two retained failing acceptance tests now pass. Coverage includes 35
invalid forms, three outer scales, JSON and CBOR, typed Value conversions and
containers, all 176 shared public variants, lazy certificates, and undefined
children hidden behind zero factors. The native proof also resolves the eight
previously undecided equalities among the nine differing valid payload recipes.
Independent signs, exact domains and value bounds supplement wrapper agreement.
The initial cold/warm assertion fails on both revisions for an opaque value;
the corrected test preserves named facts and certifies every variant's sign
through high/low precision queries. Existing tests remain unchanged.

Runtime-source validation passes 935 default and 1,073 all-feature scalar tests,
818 debug units, 24/29 scalar doctests, 366 predicate tests, 24 SVG tests,
60 selected circuit tests and the geometry/all-feature circuit cases.
Modeling checks compile the public Cargo libraries and the actual integration
test sources directly, without unrelated competitive dev dependencies. The exact
commands and counts are in review-v1.json and command-summary-v1.json.
Affected strict Clippy, docs, formatting and Rust 1.95 checks pass. This does
not claim the complete pre-push matrix or a published distribution. An unchanged
minimal-feature rustdoc link failed. Its two leading comment lines now state
the feature requirement; affected docs, Clippy and formatting pass after that
edit. An SVG-enabled build caught a missed exhaustive error match. The adapter
now preserves the scalar cause through IoError::Construction; the public import
regression passes among four scalar-failure tests with SVG/fields enabled.
Both modeling feature configurations pass after the final edit. Native crate
sources remain unchanged from their passing scalar and consumer runs.

Each cost row completes 100,000 valid imports, checks sign, consumes and drops
the result. Five alternating instrumented pairs retain all raw measurements.
Construction and byte validation are outside timing. Ratios are candidate /
baseline medians. This correctness repair makes no general speedup claim.
Named-root validation adds six allocations per import; trigonometric validation
adds seven and raises peak temporary allocation by 328 bytes. The additional
cost is retained explicitly for the higher-priority certificate checks.

| Import | Time ratio | Allocations baseline / candidate | Peak bytes baseline / candidate |
| --- | ---: | ---: | ---: |
| named-root-cbor | 1.1175 | 1600000 / 2200000 | 656 / 656 |
| named-root-json | 1.1992 | 1600000 / 2200000 | 776 / 776 |
| opaque-root-cbor | 1.0076 | 900000 / 900000 | 528 / 528 |
| opaque-root-json | 1.0135 | 900000 / 900000 | 576 / 576 |
| rational-cbor | 1.0066 | 400000 / 400000 | 128 / 128 |
| rational-json | 0.9783 | 400000 / 400000 | 176 / 176 |
| small-atanh-cbor | 1.0152 | 1100000 / 1100000 | 576 / 576 |
| small-atanh-json | 1.0233 | 1100000 / 1100000 | 672 / 672 |
| trig-cbor | 1.1967 | 1900000 / 2600000 | 704 / 1032 |
| trig-json | 1.4384 | 1900000 / 2600000 | 848 / 1176 |

The probe executables contain 6,675,736 baseline
and 6,684,344 candidate bytes. Real remains
48 bytes; every cost row releases its additional live allocation bytes.

Raw evidence is archived on Disk B with independently verified member hashes.
Compiled outputs remain at their recorded physical paths. Original root,
Disk B and /tmp allowances remain 16/72/40 GiB; cumulative logs remain bounded
by the user-approved 100 MiB amendment to the original 96 MiB contract. No
baseline reset, artifact deletion or historical recovery is
claimed. Earlier missing artifacts remain qualified in the expectation chain.

Opaque graph domains, private kernel and quantile prerequisites, complete
import resource contracts, ordinary strict workflows and the shipped user
path remain open. Hypervoxel is excluded. No push or full-plan completion is
claimed. See review-v1.json for the exact admitted scope and next work.
