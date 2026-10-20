# Discovered native transform gap

`graph-matrix-3.log` and `graph-test-v3.rs.txt` retain the original attempted
unit workflow: construct radius 5, height 7; uniformly scale by 1/1000 or
127/5000; export in that same length unit; strict reimport. It fails in the
native transform before export with `GeometryError::InvalidSurfaceFrame`.
The curve and surface transform implementations transport unit frame vectors
without changing radius or parameter charts. This is unchanged existing code,
not a new writer failure. Rigid transforms/reflections pass.

Uniform analytic similarity transforms (including chart, pcurve, retained
certificate, radius and height transport) remain an unfulfilled workflow; the
current error also misclassifies a valid unsupported operation as an invalid
frame. This increment does not claim to solve that workflow. No old test,
fixture or policy was removed or changed. The initial new test incorrectly
assumed scaling was already supported as setup for output-unit acceptance.
The unit encoding acceptance now constructs the intended exact physical
dimensions directly; a separate native frontier test retains both original
scale values and their present failure. This is not evidence of scale closure.
The larger scaling extension belongs to native BREP, not the STEP writer.
