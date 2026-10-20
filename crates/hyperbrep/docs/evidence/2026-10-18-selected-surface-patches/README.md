# Selected planar faces and extrusion patches

This finite extension lets the public planar-face and extrusion-patch builders
consume selected profile endpoints without materializing unavailable scalar
coordinates. Production changes live in HyperBRep construction and persistence;
curve definitions, selected parameters and planar proof authority stay with
Hypercurve. Baseline is eaa0cae54442e0e5c311c3ad917a489e0319892e. Upstream
dbe99e3cc145e8ca58a53ade6e79fd46311972fb was fetched again and is already
integrated.

The [contract](contract.md), [boundary construction](construction-proof.md),
[independent geometry derivations](independent-oracles.md) and
[attempt review](attempt-review.md) distinguish the supported domain, exact
oracles, reproduced failures and orchestration corrections.

## Qualification

Seven shared groups cover selected domains, reversal, reflected/sheared frames,
profile and connector splits, holes, independent exact area/plane/sample checks,
retained contacts, 1/10^12 distinctions, wrong archive images, policy reuse and
zero-budget failure/recovery. BRep/IO release suites pass 698 all-feature and 690
minimal-feature tests after the final production edit. The later test-module
alias correction is covered by final focused fixtures, strict Clippy and actual
consumers; the per-command source patches retain that distinction. Affected
all-target Clippy configurations, warning-denied rustdoc, fuzz-target compilation
and formatting pass. Source-path native consumers execute 107 groups plus eight
original axial exchange workflows. Actual zero-import WASM execution covers
245 groups, including all nine exports of the original 138-group suite. This is
not installed-package or published-binding qualification.

All 354 preceding native files remain byte-identical after cold admission and
re-encoding. The 115 preceding STEP files import 125 bodies and replay natively;
eight text controls are inventoried only. Each export recipe ran twice in fresh processes, producing 282 paired artifacts; 177 pairs are byte-identical. The other 105 pairs
change 2,952 scalar coefficient encodings, with strict exact-value equality and
unchanged non-scalar structure. The changed scalar fields span 344 vertex,
496 curve, 1,864 pcurve and 248 surface entries; the audit covers every field,
including changes beyond pcurve records. Native admission and repeated cold replay pass
on both sides. All non-native paired artifacts retain their bytes. Twenty-six
new patch archives are deterministic across fresh processes and repeated replay.

## Native encoding correction

The baseline nonorthogonal face grows from 64,623 to 173,247 bytes during cold
replay without a geometry/topology change. The encoder now preserves unchanged
pcurve definitions; it still projects endpoints when analytic-arc vertex
canonicalization replaced their coordinate recipe. The new face's 75,329-byte
encoding is stable. A direct field audit compares its exact coefficients to the
original failing archive and verifies identical other records.

Schema version 10 and public signatures remain unchanged. First-export expression
encodings intentionally change, so this is a representation/correctness repair,
not a byte-preserving optimization. The complete selected-profile export set
increases from 7,200,347 to 15,409,257 bytes; its largest file increases from
344,949 to 980,884 bytes. These adverse size observations are retained with the
[exact migration record](artifact-review-summary.json) and full raw comparisons.

## Costs and reproducibility

[Costs](costs.md) and [raw cost data](consumer-costs.json) report every observed
case, allocation request, process RSS and executable size. Three alternating
CPU-pinned pairs use the original complete workflows, one warmup and three
measured repetitions per case. Timing includes the consumers' allocation
counters. The seven new groups have absolute costs rather
than error-to-success ratios. Source and executable hashes stay fixed, with no
task builds/tests overlapping measurements. Same semantic workflow does not
mean identical encoded bytes. Shared-host samples, cumulative requested bytes
and peak RSS establish neither statistical significance nor an internal work or
retained-memory bound. No general speedup is claimed.

The [lossless raw-data bundle](raw-data.tar.gz) includes failed and successful logs, source patches,
source identities, dependency locks, copied consumer projects, helper recipes,
original inputs and generated outputs. Its [inventory](raw-data-index.json) gives each relative path,
size and SHA-256. Recreate separate baseline/candidate checkouts before replaying;
remap the recorded source-root prefixes in Cargo manifests and Rust module/include
paths, and use a fresh output directory for the recorded drivers. The original
multi-export WASM recipe retains its explicit export order and counts. These are
source-path consumers; local dependencies must not be credited as shipped
packages. Frozen binaries are identified by hash/size but are not distributed
in the evidence bundle.

## Remaining work

[Next domains](next-domains.md) retain selected revolution/axial parameters,
general contact/arrangement and shell proofs, broader CAD operations, STEP and
resource/delivery gates. Open-shell boundary validation is not a proof of global
embedding or solid interior. Runtime fuzz/ASan/lexicase campaigns, formal proof
coverage, MSRV and installed distribution remain open. All 28 work packages
remain open/in-progress. The one-time push exception was consumed by eaa0cae54;
this increment does not waive the full pre-push rules or complete the development
goal.

The [manifest](manifest.json), [validation commands](validation.json) and [final-check record](final-checks.json) bind the source, fixtures and executed evidence.

The [qualified source patch](qualified-source.patch.gz) preserves the executed
source snapshot byte-for-byte in gzip form. Decompress it before applying it;
`qualified_source_sha256` in the qualification summary hashes the decompressed
bytes. This packaging avoids treating blank patch-context markers as source
whitespace. The original staged-check failure remains in the final-check record.
