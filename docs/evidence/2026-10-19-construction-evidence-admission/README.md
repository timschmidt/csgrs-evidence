# E99: retained native construction qualifications

Native meshes now preserve a compact construction summary separately from local
predicate certainty, topology proofs and geometric fidelity. Supported transforms,
Boolean composition, empty results, hulls and other mesh operations carry it
forward. Buffer edits expose missing history without erasing known qualifications;
modeling caches distinguish otherwise identical geometry with different evidence.
An immutable in-process binary STL artifact preserves source qualifications and
records coordinate projection. Plain-byte import exposes missing source history.

The [public guide](../../construction-evidence.md) explains the explicit source
boundary, BooleanMeshBatch Arc migration and supported Rust/binding surfaces.
The [review](review-v1.json) records the executed domain and limitations; the
[contract](contract-v1.md) predates implementation. The twelve original E98
pipelines retain their geometry, local receipts, policies and exact STL bytes.
New tests separately assert retained construction evidence, mutation, caches,
empty composition and concurrency. The full native/root/downstream matrix,
matching strict lints, docs, compiler-floor checks and real affected binding
consumers pass within the recorded configurations.

The [cost record](cost-review-v1.json) retains forty matched original-workload samples,
twenty samples of the new bound-artifact path, allocator/RSS data, sizes and the
mutation probe. Weak batch identity witnesses
can retain old backing allocations until their carriers are dropped. On this
host the mesh carrier grows from 40 to 48 bytes and the batch from 48 to 72 bytes;
the 10,000-point mutation probe retains 1,440,048 bytes after replacement until
the batch is dropped. The four matched instrumented cases have approximately
1.3-12.0% higher median elapsed time across five trials each. These limited
samples do not establish general latency bounds. All unfavorable results remain
recorded. The change delivers a stronger evidence contract and makes no speedup
or constant-heap claim. The [checkpoint](checkpoint-v1.json) binds
source, commands and individually hashed physical artifacts.

This summary is not complete provenance, per-boundary source mapping, replayable
proof or persistent proof-preserving interchange. Curve lineage, full pre-push CI,
clean shipped distribution and the broader properties plan remain open. Earlier
failed checks remain in the raw evidence. Historical missing artifacts were not
reaudited or recovered. Hypervoxel remains excluded.
