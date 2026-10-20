# Retained section differentials: implementation contract

Baseline b5988e6c03865713e70a1162d6a75878383f524b; main remains frozen.
Remote read-only check: main dbe99e3cc145e8ca58a53ade6e79fd46311972fb,
brep eaa0cae54442e0e5c311c3ad917a489e0319892e; no update to merge.

Owners: Hypersolve owns polynomial arithmetic; Hypercurve owns differentiation
of an implicit graph branch and its rational images, joint vector queries and
oriented smooth-event tangent directions. HyperBRep owns the spatial lift,
parameter chart, affine transport and downstream geometric queries.
Properties: P1, P4-P6, P8-P9, P15, P17-P20, P25-P27, P35-P39.
Missing acceptance: the complete interior circle section is constructed but
its regular derivative cannot be queried through either pcurve or spatial APIs.
Reproduce that failure before production edits.

Domain: regular selected points of admitted polynomial branches, including
rational-image compositions and restrictions in the original source chart.
Hypercurve traversal reversal retains that chart; BRep spatial reversal
reflects its public chart and differentiates by the exact chain rule. The original source and every denominator guard remain authoritative.
Smooth vertical events have oriented tangent directions but no finite derivative
in the source x chart. Singular gradient-zero events require branch-limit work;
no zero vector or fake cancelled value may stand in for an unresolved limit.
The spatial derivative API must accept the retained public Parameter and expose
represented coordinates only as an explicit narrower view. No compatibility shim.

Acceptance: independent derivative identities on nontrivial selected fibers,
higher orders, both pcurve/spatial queries, restrictions, reversal, nonuniform
spatial affine transport and cold archive replay. Preserve prior full fixtures,
artifact output and all prior admitted represented derivatives. Invalid input,
unsupported limit, uncertainty and exhausted controls remain distinct typed
failures. Include exact singular/pole controls and budget refusal/recovery.

No new cache. Polynomial degree/coefficient growth, total work, retained memory
and cancellation require honest limits; contain costly probes externally.
Measure complete preserved workflows and new workloads; retain adverse costs.
Run affected local/downstream/native/WASM checks after final edits. The complete
pre-push workflow matrix remains separate, and no push is requested here.
