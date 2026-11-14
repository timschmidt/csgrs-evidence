# Direct chart transport argument

Let two admitted charts of one source be x=c0+A0*y and x=c1+A1*z.
The charts retain strict exact proofs B0*A0=I and B1*A1=I. For finite square
matrices, the second relation establishes that A1 is invertible and B1 is its
inverse. Consequently every point represented in the original chart has unique
target coordinates

    z = B1*(c0-c1) + (B1*A0)*y.

The implementation prepares these coefficients with Real::sum_products and exact
subtraction, retains both original chart certificates, and constructs the affine
executable with the existing coordinate-row builder. No floating-point fit,
heuristic inverse, approximate matrix identity or geometric tolerance is used.
Independent source reconstructions are allowed only when their complete
structural definitions agree. Ordered chart variables must agree as well.
The field adapter additionally requires the same original time/state meaning.

For a native input box Y, outward evaluation encloses the image M*Y+d. The
certificate retains Y and the exact map, so that the image definition survives
projection. Its Cartesian enclosure Z is an explicitly enlarged target initial
set, not a claim of exact reachable-set equality. A subsequent existence proof
for every z in Z covers the retained exact affine image in particular. Time is
unchanged. No ODE existence assertion follows from transport alone.

Composing exact coefficients before enclosure can preserve cancellations that
are lost by independently enclosing x and then applying B1. With A0=A1 equal
to the shear [[1,128],[0,1]], c0=c1 and Y={0}*[-1,1], direct transport is Y.
A Cartesian source projection followed by inversion yields [-256,256]*[-1,1].
This independent expectation tests the lost correlation, not just agreement of
two wrappers. With target shear 64 and origins (10,-3) to (12,-2), the exact
map is [[1,64],[0,1]]*y+(62,-1): the first coordinate spans [-2,126]. Two
Cartesian projections span [-130,254]. Identity charts have no width advantage.
No universal tightening, optimal frame choice or automatic QR guarantee follows.

The empty input is carried as empty after chart validity has already been
established. In dimension zero the empty matrix map preserves the nonempty unit
product. Final graph/cancellation checks precede publication. Failure does not
publish a partial transport proof. Preparation charges finite source scans,
coefficient-product setup, graph construction and publication; native evaluation
charges existing interval arithmetic. Real scalar payload and refinement work,
predicate internals and within-scalar cancellation retain the documented budget
exclusions. Per-stage entry limits do not bound total live memory.
