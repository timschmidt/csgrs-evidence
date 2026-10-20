# Exchange parameter convention

Checked 2026-10-18 against the primary [ISO 10303-42:2021 resource schema](https://www.steptools.com/stds/smrl/data/resource_docs/geometric_and_topological_representation/sys/4_schema.htm).
Section 4.5.67 defines the extrusion parameterization using its VECTOR; the
magnitude participates in the chart. Therefore encoding the native direction
with its actual magnitude and converting all spatial values by the length
unit preserves both native parameters. Normalizing away that magnitude would
change V and require a different source map. The reader performs the inverse
length conversion on the vector, leaving dimensionless U and V unchanged.
The same schema specifies positive rational spline weights and clamped spline
knot constraints. Entity-family support is not a full application-protocol
conformance claim; selected topology is independently admitted by the native
kernel and source hints cannot replace those proofs.

The [STEP Tools parameter B-spline constraint](https://www.steptools.com/stds/stp_aim/html/t_constraints_param_b_spline.html)
checks endpoint multiplicities against degree+1 and interior multiplicities
against degree, independently of the total knot count. The native clamped
constructor therefore needs endpoint-run boundary tests as well as its existing
interior-run checks. This merged-schema reference is not a complete AP214
conformance validation.

OCCT's [STEP translator guide](https://occt3d.com/dev/doc/overview/html/occt_user_guides__step.html)
distinguishes normal product traversal from representation-oriented reading
when product metadata is incomplete. The independent fixtures deliberately
exercise native explicit representation selection (#96), not product traversal.
The first oracle attempt found no product roots, retained in
[spline-occt-attempt-1.json](spline-occt-attempt-1.json). The oracle now selects
the same representation as a transfer root with product mode OFF, while all
generated files keep normal product mode ON. Input bytes, native assertions,
OCCT validity checks and expected numerical volumes are unchanged. OCCT uses
its default translator shape processing and is not an exact fidelity proof.

The [OCCT mass-property API](https://occt3d.com/dev/doc/refman/html/class_b_rep_g_prop.html)
provides default Gauss, adaptive Gauss and adaptive Gauss–Kronrod integration.
With the installed OCP 7.9.3.1, the first two disagree with the exact volume
on the weighted `(1,2,4)` reparameterization, on both independent input and
exported output. At millimetre scale they return `31.999999866921215` and
`31.99999992812764`; the exact value is `32`. The adaptive Gauss estimator
reports approximately `3.3e-14`, so it is not a certified bound for this case.
The observations and failing check are preserved in
[spline-occt-attempt-2.json](spline-occt-attempt-2.json).
Gauss–Kronrod returns `31.999999999999968` on the same transferred shape.
The final recipe uses that integrator with spans and requested precision
`1e-12`, retains all three observations, and keeps the original volume
comparison (`rel_tol=1e-10`, `abs_tol=1e-8`). No geometry, fixture, translator
tolerance, native proof or numerical acceptance threshold was changed.
