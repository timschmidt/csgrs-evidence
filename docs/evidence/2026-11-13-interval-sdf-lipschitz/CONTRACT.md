# Correct affine Lipschitz transport

Previous turn: progress; native adaptive SDF cover implementation retained.
Broader plan review found a potential false certificate in the existing default
SDF Lipschitz path: affine evaluation composes with the inverse, but the bound
returns the child constant without the inverse's expansion factor.
Owner: Hypersdf composition of local field bounds. P1,P6,P8-P11,P17-P20,P35-P39;
plan F-rep Lipschitz contract. Reproduce on current source before editing.
Witness: child f(x)=x, child-to-world scale 1/2 along x, query from 0 to 1.
The transformed values differ by 2 at distance 1; a certified bound of 1 is false.
Correct transport must multiply the child bound on the inverse AABB by a proved
Euclidean operator-norm upper bound of the inverse linear part. Reuse native
matrix multiplication/absolute values and existing strict max/provenance helpers;
no new scalar or matrix kernel. Preserve translations and untransformed paths.
Prove arbitrary finite linear-part composition; check scale/reflection/shear,
algebraic similarities, nested transforms, child uncertainty, exact constants,
independent point-pair inequalities and unchanged domain qualification.
Retain original bad witness, default/full-owner checks, trace/cost evidence and
any conservative-bound costs. All existing pending repository edits are preserved.
