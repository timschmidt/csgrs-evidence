# Retained profile extrusion frontier

Reproduced on `b89c43cd16081ca7049654e2c763e4cb3e8790b9` after a fresh
upstream fetch confirmed `7ed43501755fd64a01f54c3078d12229cbc0129d`.
Production source and dependency locks are unchanged. The
[contract](contract.md) fixes the original geometry, independent formulas,
ownership and missing acceptance workflow before implementation.

| Original recipe | Exact area available | BREP extrusion | Cold replay |
| --- | --- | --- | --- |
| Uncut parabola and closing line | Yes, `32/3` | `UnsupportedPlanarProfile` | Unreachable |
| Parabola minus rectangle | No | `UnsupportedPlanarProfile` | Unreachable |
| Parabola XOR rectangle | No | `UnsupportedPlanarProfile` | Unreachable |
| Affine image of difference | No | `UnsupportedPlanarProfile` | Unreachable |
| Affine image of XOR | No | `UnsupportedPlanarProfile` | Unreachable |
| Zero-offset analytic square | Yes, `16` | One body; exact volume `48` | 33,834 bytes, identical |
| Nonzero quadratic parallel cap | No | `UnsupportedPlanarProfile` | Unreachable |

The [frontier](frontier.json) and [seven original logs](reproduction.json)
retain every result. Local curve decision receipts are `Certified`, including
the error paths; that does not turn unsupported extrusion into successful
geometry. The four Boolean/affine variants pass the original independent
inside, outside and boundary classifications before the BREP call. The square
control proves an already-supported case, not newly implemented capability.
All seven processes exit successfully because the diagnostic records typed
errors intentionally. Construction succeeds in one case, not seven.

The uncut profile narrows the first implementation target. Its parabola is
native, its area has an independently verified exact value, and its closing
line retains an algebraic-chord carrier with represented endpoints.
`construction::persistent_extrusion_curves` rejects a missing native geometry
view. The whole-region line/arc view cannot handle the mixed parabola boundary.
The analytic square already uses that shared whole-region proof successfully.

The first candidate should reuse a complete native-image proof from Hypercurve
for each eligible retained boundary while preserving the authoritative source
and parameter mapping. Put that proof and any reusable view in the curve owner;
spatial lifting, topology, persistence and continued solid operations belong
to BREP. Do not infer a whole curve from endpoint coordinates or a family tag,
and do not expose raw internal fragments merely to duplicate the proof in BREP.
Public API shape must follow the demonstrated certificate and its downstream
needs. Existing native parameters and selected-source machinery should be
evaluated before adding a generic spatial carrier.

The four clipped variants retain endpoints without independent coordinates and
currently have no representable area result. The nonzero analytic parallel
also lacks the required curve/measurement route. Those are separate subsequent
domains: retain source/root identity and exact whole-image evidence, then
qualify measurement, extrusion, cold replay and further composition together.
Do not resolve them by dropping the integral check, fitting, chord sampling,
coordinate rounding or returning an incomplete solid.

The external source-path probe builds with its retained offline lock, passes
warning-denied all-target Clippy and rustfmt, and completes all seven original
diagnostics under separate 300-second time containment. [Commands](attempts.json),
[setup](setup.json), [source/fixture identity](baseline.json),
[frozen executable](baseline-binary.json), [source reconstruction](source-reconstruction.json),
[manifest](manifest.json) and [audit](audit.json) retain the evidence.
Process wall/CPU/RSS samples are containment observations, not matched
benchmarks or production resource bounds. This probe does not test continued
solid modeling, STEP exchange, source-provenance persistence, actual bindings,
installed packages or general curve support. It changes no runtime code and
closes no work package. The preceding complete feature/cost qualification
remains the baseline for a future implementation. No push.
