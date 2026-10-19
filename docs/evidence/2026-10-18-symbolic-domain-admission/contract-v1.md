# E88: symbolic domain contradiction admission

Target: d9d946bc88fd657323741053df720fe207173122. Owning layer:
Hyperreal expression admission and the shared bounded quotient recognizer.
Properties P1, P3-P6, P18-P19, P26 and P35-P39 apply.

Reproduce the current imported Inverse(x-x), including a valid symbolic x,
zero products and outer Real scales, before changing production code.
An exact conditional algebraic identity can refute domain validity: if any
dependency is undefined the composite is undefined; otherwise a denominator
x-x equals zero and its reciprocal is undefined. The proof may reject the
graph but cannot certify its value or the validity of a cancelled dependency.

Reuse the existing bounded quotient evaluator without publishing conditional
facts. Preserve the existing defined-rational proof and exact leaf fast paths.
Extend only the existing native domain/range checks. An inconclusive attempt
still accepts the original graph without claiming a proof of validity.
Do not relax a native policy, replace a graph, add approximation, or use the
conditional result to certify an endpoint. Native unchecked construction and
complete arbitrary-graph domain validation remain open.

Invalid symbolic arithmetic previously accepted must now fail native serde
with a domain/range diagnostic and Real JSON/CBOR/Value wrappers with
Problem::ParseError. This diagnostic migration applies to invalid inputs.
Valid bytes, supported exact facts and downstream composition must remain.
Named-certificate uncertainty remains a distinct outcome.

The shared proof retains 512 nodes, depth 64, 32 atoms, 64 terms, degree 8,
4096 coefficient bits and 8192 operations per attempt, with its existing abort
checks. The fallback is a separate bounded attempt after existing proofs
decline. These are not whole-input parser, structural matcher, heap-byte or
elapsed-time bounds. Use external containment for adversarial tests.

Acceptance: independent ring identities and invalid domains, every arithmetic
form and affected partial/range variant, valid noncancelling controls, preserved
wire graphs, zero-factor/zero-scale wrappers, JSON/CBOR/owned and borrowed
values/collections, no conditional fact publication, repeated valid and invalid
imports, cold/warm/low-high-low facts, cancellation and bounded-proof recovery.
Retain the original opaque regression and a distinct still-unproved obligation.
Run scalar default/all-feature release tests, debug library, doctests, strict
Clippy/docs/fmt, affected predicate/curve/modeling consumers and compiler floor.
Retain matched ordinary import cost and adverse rows; no speedup is proposed.
Local qualification does not establish full release, bindings or plan acceptance.

All new bulky artifacts remain in this Disk B/csgrs directory. Closed earlier
artifacts are read-only. Preserve all attempts and source versions; hash each
physical path independently. Resource baselines stay unchanged: root free
75,664,232,448 bytes with 16 GiB net limit; Disk B free 373,218,291,712 bytes
with 145 GiB net allowance; /tmp free 67,482,746,880 bytes with 58 GiB limit.
Cumulative logs 200 MiB; child address space 8 GiB; Cargo jobs 2; focused
execution 60 seconds; compile/full suite 1800 seconds. Do not delete evidence
or reset baselines to fit. Prepare the full matrix before any necessary storage
allowance request. No push or Hypervoxel work.
