# Required opaque scalar payload

Parent: 7ce3ff7f000b59d8b497f42b3f9bd9c135fc71fe.
Owner: Hyperreal Real deserialization, shared by Serde and its JSON/CBOR
wrappers. Properties P3, P6, P18, P26 and P35-P39.

The input domain is the existing serialized Real schema. The Irrational
class has no symbolic certificate from which to reconstruct its value;
its Computable payload is mandatory, even when the outer rational is zero.
An absent field and explicit null must fail before a Real is published.
Serde returns its typed error; the existing convenience wrappers and CBOR
Value conversions preserve their Problem::ParseError contract. Valid exact
symbolic certificates may still omit the lazily materialized payload.

First reproduce the missing acceptance tests against unchanged production.
Then implement only this structural invariant in the common Deserialize
implementation. Preserve field order/name, valid representation bytes,
cache skipping and all existing tests. Test all affected public ingress
routes and enclosing collections. Independently known rational/pi/e/root
bounds and downstream translation check consumability; serialization-byte
identity is a separate assertion.

This step does not validate every mathematical domain in a present graph,
or certify consistency of arbitrary symbolic tags and supplied graphs.
The separately reproduced sqrt(-1) blocker remains open. The affine
subtraction candidate is not applied or admitted by this patch.

Run the full scalar default/all-feature Cargo suites, debug units, relevant
doctests, strict Clippy, docs and formatting, plus affected serialization
consumers. Run declared compiler-floor checks where available. Broader native
workloads and release/distribution work must be named separately if unrun.
Use actual source without overlays after the final production edit.

Use a new empty target and private Cargo bookkeeping. Mount retained
registry input trees read-only. Copy GMP cache files independently.
Freeze every executed Cargo binary before later builds can replace outputs;
preserve previous closed experiments and every adverse result.

All original storage baselines and current ceilings remain: root 16 GiB,
Disk B 72 GiB, /tmp 24 GiB, cumulative logs 96 MiB. Child address space
8 GiB, at most two jobs, focused 60 seconds, compile/full suite 1800 seconds.
No benchmark or speedup claim. Temporary artifacts are volatile.
Hypervoxel remains excluded. No push or publication.
