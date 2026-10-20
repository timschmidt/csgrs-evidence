# Exact normal queries: feasibility and ownership

Checked 2026-10-19 against primary documentation:
- [CGAL algebraic kernel manual](https://doc.cgal.org/latest/Algebraic_kernel_d/index.html): polynomial sign queries can operate at retained algebraic roots; bivariate point access need not materialize independent coordinate polynomials. This is an ownership precedent, not an implementation or speed proof for this repository.
- [CGAL exact kernel with square roots](https://doc.cgal.org/latest/Kernel_23/classCGAL_1_1Exact__predicates__exact__constructions__kernel__with__sqrt.html): exact square-root constructions require an appropriate scalar extension. HyperBRep must not pretend every selected normalized coordinate is a stored Real.

Proposed algebraic query (our derivation): for rational forms L and Q with certified Q>0, compare L/sqrt(Q) to authored c. Compare signs first. With equal positive signs, the result is the sign of L^2-c^2 Q; with equal negative signs, reverse that result. Zero/opposite-sign cases are immediate. This keeps the positive square-root branch and avoids constructing unrelated coordinate roots. Original denominators must be certified before products or cancellation; common-source field alignment belongs to Hypercurve. No runtime speedup or total-work bound follows from the identity.

Surface Jacobians must differentiate original homogeneous coordinate polynomials before selected-field reduction: d(N/W)=(dN*W-N*dW)/W^2. Differentiating a representative reduced modulo the selected parameter relation is invalid. Native represented evaluators remain the fast owner path; selected queries retain the original UV/knot chart and coefficient maps.
