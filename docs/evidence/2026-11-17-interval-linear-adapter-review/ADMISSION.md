# Required phase-7 ownership review

Revision: 15cf097839b40dd2525f5018943e5d4d981e7b59, clean primary.
Scope: all445lines of crates/hypersolve/src/linalg.rs, its manifest,
public reexports, SolveReport storage, and solver.rs call/consumption sites.
Owner: Hypersolve numerical proposal boundary. P6/P9/P19; plan7.1/7.2.
Domain: dense f64 matrices and vectors, dimensional and numerical failures,
empty systems, damping, trust radii and BFGS step limits. No interval carrier.
Output: lossy proposal vector plus diagnostics, or Singular/DimensionMismatch.
No exact solution, rank or enclosure is promised. No policy parameter,
total-work budget or cancellation API is present.

Missing inventory witness: required file has zero inventory entries at target.
Missing failure witnesses: reject non-finite outputs, including overflow from
finite input, before reporting successful proposal work. These will be tested
against a byte-identical copy of the entire source with standalone rustc.
No production edit or mathematical migration is proposed in this review.
Existing proposal receipts and independent small-system expectations provide
controls. Reproducing failures does not admit a fix or prove consumer closure.
No performance, allocation, stack, size or cross-target claim is planned.
