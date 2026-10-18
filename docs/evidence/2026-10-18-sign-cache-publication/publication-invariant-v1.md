# Scope of the exact-sign publication argument

AtomicFacts belongs to one immutable Computable expression. Certified signs of
that expression must agree. The cache word contains the sign itself; publishing
a sign does not publish a separate mutable witness requiring an acquire load.
Other packed fields are preserved by the existing masked compare-and-exchange.
The source audit records the reviewed production publishers and owner searches.
This argument is conditional on those sign proofs and node immutability.

For each loop iteration, either the observed word contains Valid(sign), in which
case the method returns without replacing any bits, or it does not. In the
second case, a successful CAS replaces only the sign field in exactly that
observed word. A failed CAS supplies the newer word and the guard is checked
again. Thus an unresolved publisher cannot replace a Valid sign, including when
a proof arrives between its original load and attempted CAS. A same-sign proof
is reusable; contradictory certified signs violate the precondition and are
diagnosed by the debug assertion. No release-mode contradiction is legitimized.

The deterministic barrier test covers a delayed unresolved publisher after a
completed proof. Packed-metadata tests cover all three signs and varied other
fields. The sqrt(2)-1 regression has an independent positivity argument and
checks subsequent immediate, structural and zero-refinement public queries
without any numeric approximation cache. The Invalid-to-Unknown-to-Valid
control confirms unresolved facts can still be strengthened.

This is a source-level invariant argument and executable regression evidence,
not a machine-checked atomic model or a proof of the entire cache system.
Overlapping in-flight queries may have read an older state; the claim concerns
retention and same-thread or otherwise synchronized queries following completed
publication. It does not promise instantaneous visibility to unsynchronized
readers. Other decline caches,
whole-expression mutation proofs, eviction policies and global P4 coverage
remain outside this narrow correction. Numerical sign retention does not
establish topology, source fidelity or an internal total-work bound.
