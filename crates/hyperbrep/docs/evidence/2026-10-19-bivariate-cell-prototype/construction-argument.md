# Rational bivariate cell prototype

This is an implementation argument and research record, not formal verification or a completed BRep intersection claim.

The source equation F(x,y) and rational closed rectangle are retained. The projection polynomial includes res_y(F,F_y), the leading y coefficient, F(x,y_min), F(x,y_max), and the two vertical bounds. Its complete exact roots partition the rectangle. A zero discriminant, a nullified fiber, or an identically zero boundary equation requires component processing and currently returns a typed blocker. No such condition is treated as disjointness.

On each open projection interval the y degree is fixed, the roots are simple, and there are no roots on either horizontal boundary. Real roots inside the rectangle therefore form an ordered finite collection of continuous graphs with constant cardinality. Each graph is identified by its rank at one exact rational slice, rather than by nearest-neighbor matching. Compactness of the closed y interval forces a finite limit on either event fiber. Complete fiber isolation includes isolated points even when there are no adjacent graphs.

For an event fiber, rational separators strictly separate every distinct root. At a root on a horizontal domain boundary, an exterior separator is admitted only after exact root counting proves no additional event root between it and the boundary. A rational side slice is moved toward the event until interval evaluation proves that F does not vanish on any separator throughout the entire connection strip. The non-crossing separators and complete side-fiber root counts then establish all incidences. There can be multiple critical points at the same x and multiple arcs at a singular event; no generic-position shortcut or guessed branch pairing is used. This graph records the zero set, not intersection multiplicities or material transitions.

Primary references consulted (no code copied, no production dependency):

- [CGAL algebraic kernel](https://doc.cgal.org/latest/Algebraic_kernel_d/classCGAL_1_1Algebraic__kernel__d__2.html): critical projection/fiber architecture and retained root ranks.
- [Berberich et al., GeoTop section 3.3](https://arxiv.org/html/1201.1548): separating critical-fiber roots with rational horizontal levels and excluding intersections over a shrinking connection strip. Our bounded rectangle specialization additionally owns boundary contacts and typed component blockers.

The original BRep biquadratic patch has z=(u-1/2)^2+(v-1/2)^2-1/16 with positive unit weights and x=u, y=v. Its plane pullback contains a radius-1/4 circle strictly inside the parameter square. The baseline executable verifies four exact points on this circle, then reproduces UnsupportedIntersection at 495eb89ca. The initial probe compile mistake and corrected runtime failure are both retained.

Remaining implementation requirements include retained implicit branch carriers and exact point/parameter queries in Hypercurve, rational tensor spatial images and dual pcurves in BRep, source graph persistence, trimming and general face arrangements, parameterization regularity/embedding guards, multiplicity/material semantics, component extraction, broad execution and cost qualification. The solver prototype alone does not fix the original public BRep intersection call.
