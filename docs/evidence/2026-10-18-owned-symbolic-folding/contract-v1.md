# Owned folding preserves the symbolic value

Owner: Hyperreal Real::fold in real/convert.rs. Properties P1, P2, P3,
P6, P18, P26 and P35-P39. The parent is recorded in preparation-v1.json.
The committed library produces e instead of exp(pi), and asinh(1) instead
of asinh(pi), when it directly consumes a valid lazy serialized Pi.

Domain: valid named Class certificates constructed by public APIs, with
null or omitted Computable payloads and zero, unit and negative nonunit
outer scales. Irrational still requires a payload. Existing Some graphs
must remain authoritative and movable, with their cancellation signal.

Use Class::computable_certificate, already used by borrowed folding, for
the two missing-payload branches of owned folding. Share that implementation
without duplicating formulas, changing layout/cache ownership or eagerly
rewriting serialized fields. This does not admit arbitrary forged tags or
undefined graphs, or claim that every other lazy query is repaired.

Missing regression: consume the decoded value directly; cloning can
materialize it and hide the bug. Cover all 21 public named-certificate
recipes through JSON and CBOR, null and omission, scales 0/1/-3. For
exp followed by ln require independent strict rational bounds of the
original value, with an exact zero check. Include materialized controls
and independent forward exp/asinh bounds for Pi at unit and nonunit
scales. Those forward checks guard against paired inverse mistakes.
Serialization checks and tag coverage are separate from semantic checks.
Run the tests on unchanged production before editing it.

After the final edit run full scalar default/all-feature tests and docs,
debug units, strict Clippy, formatting, the complete predicate suite,
curve SVG consumers and circuit interchange targets. Check affected crates
at their declared compiler floor. Preserve all old hard cases, policy and
fixture sizes. A narrow successful repair does not close the rejected
lazy-cache experiment or the invalid-domain/certificate findings.

No performance gain is claimed. Existing stored graphs move unchanged;
the missing graph uses the established certificate constructor. Its work
has no new internal total-work bound. External containment remains root
16 GiB, Disk B 72 GiB, tmp 32 GiB, cumulative logs 96 MiB, 8 GiB child
address space, two jobs, focused 60 seconds and build/full suite 1800
seconds. Original baselines remain unchanged. The inherited tmp contract
names the preceding target; its capacity applies cumulatively to all tmp
artifacts, including this new target. Registry mounts are read-only;
Cargo bookkeeping and builds are private. Preserve every closed artifact.
Hypervoxel is excluded. No push or complete release claim.
