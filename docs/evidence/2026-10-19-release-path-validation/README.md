# E100: release packages and the source consumer path

On revision 7d4f1a8f8, all fourteen packages independent of deferred Hypervoxel
pass native Cargo package verification with all features on Rust 1.98.1 and
1.95.0. Every nongenerated package member matches the checkout; normalized
manifests contain no workspace paths or patches. The two compiler runs have
different compressed archives. Their source members and normalized manifests
agree; lock graphs agree after accounting for candidate archive checksums.
The [comparison](package-comparison-v1.json) retains those differences.

The unchanged documented source example also runs successfully. An independent
exact-set oracle checks its raw-STL import, union-with-empty result and bound
artifact reimport over 375 rational cells, with separate certified closed-PWN
and manifold checks. Source-history and projection qualifications survive.
Reserialized STL bytes differ; semantic equality and deterministic serialization
are recorded separately under the [source-example contract](source-example-contract-v1.md).

The clean registry consumer cannot resolve csgrs =0.23.0. Twelve successful
index responses omit their requested versions; eight HTTP 404s remain lookup
failures. The root README already labels its API as unreleased. Fourteen sibling
installation sections need qualification, as recorded in the
[findings](readme-installation-findings-v1.json). Those instructions are not fixed
by this evidence checkpoint. Five distributions whose dependency closure
includes Hypervoxel retain their packaging blocker; that crate was neither
built nor packaged.

The initial package run failed with Cargo's no-hash diagnostic. Its staged
archive checksums matched, and the same workload passed with private writable
Cargo state. The exact cause was not isolated. All failures, archives, commands,
HTTP observations and physical copies remain retained. See the
[review](review-v1.json), [command summary](command-summary-v1.json),
[contract](contract-v1.md) and [checkpoint](checkpoint-v1.json).

Native package staging and a source checkout do not establish public installation.
Full release, provenance, runtime corpus, pre-push CI and the broader properties
plan remain open. This checkpoint changes no implementation, test or policy.
Historical missing artifacts were not reaudited or recovered.
