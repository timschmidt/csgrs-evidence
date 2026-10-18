# Complete-work cost observations

All original full harnesses, sizes, iterations, materialization, exact receipts and fixture facts preserved. Three alternating CPU-pinned pairs. No task builds/tests overlap. Shared-host observations, including every adverse row; no broad or statistically established speedup. Allocation requests and process RSS do not bound retained heap. Executables are harnesses, not distribution sizes.

192 matched cases across 22 complete corpora; 132 fresh processes. All receipts agree. Median case ratio 0.996668; range 0.853556–1.162079.

## Targeted original workloads

| Corpus / case | Baseline ms | Candidate ms | Ratio |
| --- | ---: | ---: | ---: |
| region_exchange / region_exchange/Butt/reverse_false | 11.559045333 | 11.549818667 | 0.999202 |
| region_exchange / region_exchange/Butt/reverse_true | 10.753471000 | 10.702254667 | 0.995237 |
| region_exchange / region_exchange/Round/reverse_false | 27.568318333 | 27.603347667 | 1.001271 |
| region_exchange / region_exchange/Round/reverse_true | 27.772405333 | 27.589829333 | 0.993426 |
| kernel / spline_kernel/nurbs_path_extrusion_build_exact_volume | 0.845673584 | 0.838576286 | 0.991608 |

## Rows above the 10% review marker

| Corpus / case | Baseline ms | Candidate ms | Ratio |
| --- | ---: | ---: | ---: |
| faceted / step/units_2000 | 4.458329700 | 5.180931800 | 1.162079 |

## Increased allocation requests

| Corpus / case | Calls delta | Requested bytes delta |
| --- | ---: | ---: |
| region_exchange / region_exchange/Butt/reverse_false | 0.000 | 448.000 |
| region_exchange / region_exchange/Butt/reverse_true | 0.000 | 448.000 |
| region_exchange / region_exchange/Round/reverse_false | -0.333 | 901.333 |
| region_exchange / region_exchange/Round/reverse_true | 0.000 | 960.000 |
| prisms / prisms/covering_bores | 28.000 | 2072.000 |
| advanced / advanced/box_3d | 0.000 | 448.000 |
| advanced / advanced/box_pcurves | 0.000 | 448.000 |
| advanced / advanced/hole | 0.000 | 960.000 |
| advanced / advanced/two_bodies | 0.000 | 896.000 |
| advanced / advanced/reparameterized | 0.000 | 448.000 |
| advanced / advanced/reject_alternate_sense | 0.000 | 64.000 |
| analytic_similarity / similarity/primitive_matrix | 156.000 | 8720.000 |
| analytic_similarity / similarity/clipped_void_matrix | 1632.000 | 208736.000 |
| analytic_similarity / similarity/profile_families | 1338.000 | 73168.000 |
| pcurves / pcurves/full_fresh | 0.000 | 64.000 |
| pcurves / pcurves/full_reused | 0.000 | 64.000 |
| pcurves / pcurves/partial_fresh | 0.000 | 192.000 |
| pcurves / pcurves/partial_reused | 0.000 | 192.000 |
| pcurves / pcurves/edit_replay_composition | 0.000 | 64.000 |
| circles / circles/closed_fresh_document | 0.000 | 64.000 |
| circles / circles/closed_reused_document | 0.000 | 64.000 |
| circles / circles/partial_fresh_document | 0.000 | 192.000 |
| circles / circles/partial_reused_document | 0.000 | 192.000 |
| circles / circles/edits_replay_composition | 0.000 | 64.000 |
| torus_exchange / torus_exchange/whole_frames_units | 0.000 | 11904.000 |
| torus_exchange / torus_exchange/halves_reconstruction | 0.000 | 11776.000 |
| torus_exchange / torus_exchange/rational_band | 0.000 | 960.000 |
| cone_exchange / cone_exchange/repeated_modeling_source_maps_replay | 0.000 | 6080.000 |
| analytic_export / analytic_export/edit_roundtrip | 0.000 | 1536.000 |
| prism_exchange / prism_exchange/half_cylinder | -10.000 | 264.000 |
| prism_exchange / prism_exchange/annular_prism | 3.000 | 1064.000 |
| prism_exchange / prism_exchange/preserved_planar | 0.000 | 6528.000 |
| prism_exchange / prism_exchange/covering_circular | 4.000 | 4072.000 |
| axial_exchange / axial_exchange/disjoint_false/reflected_false | 1.333 | 546.667 |
| axial_exchange / axial_exchange/disjoint_false/reflected_true | -1.333 | 349.333 |
| axial_exchange / axial_exchange/disjoint_true/reflected_false | 1.333 | 546.667 |
| axial_exchange / axial_exchange/disjoint_true/reflected_true | 1.333 | 546.667 |
| axial_shell_exchange / axial_shell_exchange/kind_0/reflected_false | -2.000 | 728.000 |
| axial_shell_exchange / axial_shell_exchange/kind_0/reflected_true | 0.000 | 1200.000 |
| axial_shell_exchange / axial_shell_exchange/kind_1/reflected_false | -4.333 | 797.333 |
| axial_shell_exchange / axial_shell_exchange/kind_1/reflected_true | 44.000 | 3184.000 |
| axial_shell_exchange / axial_shell_exchange/kind_2/reflected_false | 0.000 | 960.000 |
| axial_shell_exchange / axial_shell_exchange/kind_2/reflected_true | -0.333 | 901.333 |
| axial_shell_exchange / axial_shell_exchange/kind_3/reflected_false | 0.000 | 1984.000 |
| axial_shell_exchange / axial_shell_exchange/kind_3/reflected_true | 0.000 | 1984.000 |

## Separate preliminary observations

The pre-edit [reproduction](baseline.json) reproduces the original complete STEP rejection. The preceding native-boundary-image increment supplies the frozen 22-corpus cost baseline. Former unsupported work is never a speedup baseline; new completed native workflows receive separate absolute cost observations.

The full NURBS case keeps the degree-two weighted boundary, original knot interval, line sides, through-hole, 500 iterations and independently expected exact volume 45. It is a build/measurement harness, not a complete STEP exchange workload. Region and axial exchange rows include their original exact assertions, native/STEP materialization and continuation. Their receipts, original sizes, and current byte-identical artifact inventory are separate from timing evidence.

All raw trials, unfavorable cases, allocator observations, process RSS/CPU/wall measurements and executable sizes remain in [cost-summary.json](cost-summary.json), [resource-summary.json](resource-summary.json) and [costs/commands.json](costs/commands.json). Existing archive, spline, cached-arc, pcurve and provenance cost obligations remain open; a later favorable ratio does not erase historical observations.
