# Retained region extrusion investigation

Baseline: `b89c43cd16081ca7049654e2c763e4cb3e8790b9` on `brep`, with upstream
`7ed43501755fd64a01f54c3078d12229cbc0129d`. A fresh upstream fetch after the
preceding cost increment found no new commits. This is a diagnostic contract
before implementation, not an admission of a new supported domain.

The missing acceptance workflow is strict planar Boolean/offset output to
native extrusion, exact classification, cold persistence and further modeling.
Properties P1/P6/P8/P9/P11/P12/P15–P20/P24/P26/P35–P39 apply. Hypercurve owns
the filled region, retained curve/parameter/selected-root identities, winding,
measurements and their certainty. HyperBRep owns faithful spatial lifting,
edge/pcurve correspondence, complete shell admission, persistence and solid
composition. Supporting changes are allowed in their owners when required for
that workflow; unrelated upstream repairs remain with the concurrent thread.

The initial diagnostic preserves the complete authored geometry from
`hypercurve_curve_intersection.rs::path_difference_and_xor_reverse_algebraic_parabola_contacts_exactly`:
the quadratic with controls `(-2,4), (0,-4), (2,4)` and its closing chord,
the rectangle `[-3,3] × [2,5]`, difference and XOR, and their full affine
images `x' = -2x + 7`, `y' = 3y - 1`. Retain the original exact inside,
outside and boundary assertions; add the uncut profile as a control.
The set below height two and above `y=x²` has area `8 sqrt(2)/3`.
The original full profile has area `32/3`; XOR has area
`(22 + 16 sqrt(2))/3`. The affine image multiplies area by six.
Extrusion is between zero and three, so exact volumes are three times these
areas. These formulas are independent of the kernel's integration code.

Also retain the complete zero-offset analytic square and nonzero quadratic
parallel cap recipes from `hypercurve_analytic_parallel_region.rs`. These
exercise a line image and a non-rational analytic carrier; the latter is not
silently replaced by a sampled curve or fitted rational one. Every probe
records carrier families, native/source views, selected endpoint presence,
area availability, certainty, construction diagnostics and any reachable
native replay/query stages. A diagnostic returning a typed error is not a
completed extrusion workflow.

No runtime source, public API, representation or policy is changed during
reproduction. Preserve original inputs and failed build/run attempts. Source,
input, lockfile, toolchain and process records accompany the observations.
External time containment is distinct from a production work/memory budget.
Choose an implementation only after the current failure stage is reproduced;
any extension must preserve the preceding complete 192-case/211-artifact
domain and add independent topology, fidelity, persistence and continued-use
evidence. Do not infer exact support from endpoint samples or positive area.
