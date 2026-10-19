# Follow-up acceptance: construction evidence across supported operations

This is a concrete implementation acceptance gate under properties.md and
docs/admission.md, not a replacement policy or an implementation claim.
The target observation is 3e1bc0282a013940c8d4600066e2ca90841f26d9.
Rebind the accepted source before editing if the revision changes.

The first reproduced failure is a mesh-construction dependency claim. Retain
that claim's qualification on the native geometry carrier so extracting an
outcome value, cloning it, converting a Boolean batch, or passing it through
another modeling entry point cannot silently erase it. Keep operation-local
MeshCertainty/GeometryCertainty and reusable PWN facts independent. Strict
validation may establish a new fact about current geometry; it may not clear
an earlier approximate construction dependency. Preserve all existing
Certified local results and the user-authorized cache strengthening contract.

Before implementation, enumerate every affected native/modeling producer and
carrier conversion, including affine/projective transforms, reversal,
concatenation/distribution, hulls, Boolean batches, canonical empty results,
curve-to-mesh and sampled-field boundaries, adapters and binding extraction.
Use one native invariant-enforcing implementation. Routes that lack a proof
of source intent must expose that lack, not default to Certified provenance.
Changing public buffers invalidates the relation to previous geometry while
preserving any still-relevant qualification; mutation or stale cache reuse
cannot certify a new source claim. Reauthoring raw coordinates is a new claim
and must be distinguishable from proving the preceding construction intent.

Retain all twelve pipeline cases, including the original full tiny outside
point and cold/warm states. Add typed mutation, clone, mixed-parent,
empty/nonempty, and materialization controls. Approximate policy selection
alone must not qualify an exact construction. A later proof of topology must
leave original construction evidence intact. Any upgrade to the original
claim needs a new proof of that claim, linked to its actual dependencies.
Do not change the 512-bit modeling policy or remove the 2^-1200 point to make
these cases pass; the delayed 1400-bit observation is not their construction
proof. Preserve the named strict workflow corpus and original difficult cases.

At format boundaries, distinguish source construction, projection loss and
facts about the imported representation. Plain STL bytes cannot encode the
prior proof history: exact and approximate source histories demonstrably
produce identical bytes. A complete supported pipeline must retain a bound
receipt or explicitly expose missing source provenance. Reimport validation
certifies the parsed geometry only. Do not trust a serialized Certified flag
as proof; any restored proof must be verified against the relevant source,
claim and artifact. Preserve deterministic geometry bytes unless a separately
documented representation migration is intentional. Export/render projections
must not replace authoritative exact source geometry.

Expose the distinction through actual affected binding consumers. Rust and
JavaScript extraction must preserve and expose the same native evidence;
audit C/C++ and Python routes and exercise real consumers where changed.
Do not substitute native unit tests for binding validation. Declare any API
migration explicitly and update examples/docs to show the complete supported
construction -> transform -> Boolean -> export -> import -> validation path.
A summary qualification is not complete boundary provenance or replayable
proof; keep any remaining witness/identity gaps explicit until implemented.

Resource contracts apply to evidence as well as geometry. Prefer bounded
metadata where sufficient; retained dependency graphs, source buffers and
receipts need explicit accounting and typed exhaustion/cancellation before
complete results are published. Measure repeated compositions, allocation,
retained/peak memory, output materialization, binary size and cold/warm costs
for the same completed workloads. Do not hide an adverse result or call an
earlier error a speedup. Preserve the existing external containment and
storage/log baselines, and state any missing internal bound accurately.

After final source edits, run affected native/default/feature-minimal suites,
strict Clippy, docs, formatting, supported compiler checks, the named strict
modeling corpus, format checks, and real affected binding consumers. Pin
sources/toolchain/locks, archive commands and raw results, and commit only
qualified work. Full CI/pre-push and shipped-distribution gates remain required
before their respective claims; Hypervoxel stays outside the current scope.
