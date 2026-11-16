# Borrowed rational-quadratic promotion

Phase14 native workload cost; P4/P10/P15/P19/P27/P36. Current63-stack profile
shows temporary RationalBezier2 promotion inside native-arc preparation. Review
on accepted54e6337 confirms rational_quadratic_circular_arc first clones its
RationalQuadraticBezier2, while From<owned> then clones every point and weight
again into the promoted owner. The caller retains the original source. Test a
borrowed From conversion sharing the existing body, with owned conversion
forwarding to it. Keep every zero test, homogeneous multiplication, certificate
attachment and subsequent predicate call in the same order. No cache, field-kind,
geometry, domain, policy, fixture or threshold changes.

Domain: every valid RationalQuadraticBezier2, including signed, large, symbolic
weights and retained implicit/circle/contact provenance. Missing witness before
edit: borrowed promotion preserves controls, homogeneous coordinates, endpoints,
provenance and both-policy numeric dispatch relative to the original conversion.
Use independent endpoint/homogeneous expectations as well as differential outputs.
Measure same-source-path release binary/monomorphized size and full KiCad test;
reject before broader qualification if cost evidence fails. If retained, owning
checks, successive_operations and applicable downstream checks must pass. Preserve
all70 frozen stages and main41/Interface8 pending paths. No push/publication.
