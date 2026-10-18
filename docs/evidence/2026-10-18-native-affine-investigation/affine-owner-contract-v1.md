# Rational affine-difference construction

Owner: Hyperreal Computable::add and its bounded rational-offset recognizer.
Properties P1-P5, P19-P20 and P35-P37. For the same structurally identified
defined base u and coefficient s, (s*u+a)-(s*u+b)=a-b. A bare base is the
coefficient-one, offset-zero case. Construction should retain the exact
rational leaf instead of asking later callers to rediscover this identity.

The public probe establishes that the shared-base orders already complete;
this proposed change targets repeated proof construction and resource cost.
Its unrelated unequal-radical zero-refinement assertion remains failed and
is not an admission gate for shared-base cancellation. The new unequal-base
owner control requires no rational collapse and retains the ordinary -512
refinement check; it does not replace or erase that earlier observation.

Before changing runtime code, compile the actual scalar crate with four added
owner tests. Three require rational-leaf retention across shared bases, unequal
offsets, scaling, reversed sums, bare bases and existing operand caches. The
fourth rejects cancellation of distinct bases. Existing tests are unchanged.
The ordinary additive identity supplies the independent expected rationals.

Keep the recognizer's existing depth/work and scale bounds, decline paths,
source identity and approximation caches. No persistent cache or geometry
adapter shortcut is proposed. A candidate must be compared against the exact
baseline tests and actual native comparison shapes before broader admission.
The original native full-board/copper-neck and downstream gates remain required.

A direct full scalar test-crate compile uses the original 1800-second build
cap; focused test execution uses 60 seconds. Both retain 8 GiB child address
space and all existing storage baselines. Verified read-only dependencies are
reused. New compiler temporaries and executables stay in a fresh /tmp directory.
This is isolated qualification, not a production-source edit or runtime admission.
