# Research scope and implementation inference

Ryu and Boyd, *A Primer on Monotone Operator Methods* (2016),
https://stanford.edu/~boyd/papers/pdf/monotone_primer.pdf

Read the introduction, sections 4.1 (inverse of a strongly monotone map) and
4.3 (differentiable functions), PDF pages 6 and 9; not the entire paper.
The symmetric derivative criterion supplies a sufficient injectivity proof.
The implementation specializes its segment argument to a compact convex UV
rectangle, a rational denominator certified nonzero throughout, and a constant
invertible normalization. Positive definiteness of the symmetric derivative
follows from exact polynomial interval tests of its principal minors.
This is our application of the theorem, not a surface-intersection algorithm
claimed by the paper. An inconclusive interval test remains a typed blocker.

Also inspected Stanford EE364b *Monotone Operators* slides, definition and
basic-properties pages 8 and 11, not all slides:
https://web.stanford.edu/class/ee364b/lectures/monotone_slides.pdf
The primer above is the direct mathematical reference used by the code.
No external kernel or new runtime dependency is introduced.
