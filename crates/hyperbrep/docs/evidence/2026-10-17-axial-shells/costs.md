# Complete-work cost observations

All original full harnesses retained; intentional native-carrier receipt migrations are recorded separately. Three alternating pairs; no task builds/tests overlap. Shared-host observations, including all adverse rows. Allocation requests and peak process RSS do not bound retained heap. Executables are harnesses, not distribution sizes. Absolute new-workflow costs have no comparison to a former failure.

184 preceding cases and 8 new cases; 129 fresh processes. 6 intentional receipt migrations require semantic review; every case remains deterministic within each revision. Median case ratio 1.000016; range 0.782783–1.753610.

## Rows above the 10% review marker

| Corpus / case | Baseline ms | Candidate ms | Ratio |
| --- | ---: | ---: | ---: |
| region_exchange / region_exchange/Butt/reverse_false | 11.525307333 | 13.058876667 | 1.133061 |
| region_exchange / region_exchange/Butt/reverse_true | 10.713428000 | 12.356108667 | 1.153329 |
| kernel / spline_kernel/nurbs_path_extrusion_build_exact_volume | 0.690851158 | 1.211483204 | 1.753610 |

## Increased allocation requests

| Corpus / case | Calls delta | Requested bytes delta |
| --- | ---: | ---: |
| faceted / step/box | 1.000 | 3144.000 |
| faceted / step/two_bodies | 2.000 | 6288.000 |
| faceted / step/through_hole | 1.000 | 3144.000 |
| faceted / step/oblique_tetrahedron | 1.000 | 3144.000 |
| region_exchange / region_exchange/Butt/reverse_false | 4677.333 | 299198.667 |
| region_exchange / region_exchange/Butt/reverse_true | 4676.667 | 299081.333 |
| region_exchange / region_exchange/Round/reverse_false | 1505.000 | -48980.000 |
| region_exchange / region_exchange/Round/reverse_true | 1505.333 | -48921.333 |
| oblique / oblique/identity | 316.000 | 788976.000 |
| oblique / oblique/millimetre_reflection | 404.000 | 793664.000 |
| oblique / oblique/radical_reflection | 2783.000 | 929288.000 |
| closed_edges / closed_edges/build | 1.000 | 3144.000 |
| closed_edges / closed_edges/replay | 1.000 | 3144.000 |
| closed_edges / closed_edges/split_circle | 2.000 | 3792.000 |
| closed_edges / closed_edges/split_seam | 2.000 | 3792.000 |
| closed_edges / closed_edges/reversed_shifted_replay | 1.000 | 3144.000 |
| coplanar / coplanar/torus_axial/recut | 64.000 | 238272.000 |
| coplanar / coplanar/torus_axial/clear_and_recover | 42.000 | 167664.000 |
| coplanar / coplanar/torus_axial/reconstruct | 48.000 | 210240.000 |
| coplanar / coplanar/torus_longitudinal/recut | 64.000 | 240576.000 |
| coplanar / coplanar/torus_longitudinal/clear_and_recover | 42.000 | 168816.000 |
| coplanar / coplanar/torus_longitudinal/reconstruct | 48.000 | 214848.000 |
| coplanar / coplanar/cone_longitudinal/recut | 736.000 | 545472.000 |
| coplanar / coplanar/cone_longitudinal/clear_and_recover | 544.000 | 403008.000 |
| coplanar / coplanar/cone_longitudinal/reconstruct | 378.000 | 358272.000 |
| coplanar / coplanar/similarity_matrix | 136280.000 | 22831840.000 |
| coplanar / coplanar/circular_boundary_provenance | 4.000 | 12576.000 |
| prisms / prisms/same_height | 18246.000 | 662194.000 |
| prisms / prisms/covering_bores | 20288.000 | -3547356.000 |
| prisms / prisms/annular_cut | 766.000 | -171688.000 |
| sectors / sectors/torus_axial_quarter | 188.000 | 479568.000 |
| sectors / sectors/torus_longitudinal_quarter | 80.000 | 323808.000 |
| sectors / sectors/cone_longitudinal_quarter | 631.000 | 809928.000 |
| sectors / sectors/torus_longitudinal_band | 404.000 | 667088.000 |
| sectors / sectors/cone_longitudinal_band | 296.000 | 527664.000 |
| sectors / sectors/similarity_matrix | 98566.000 | 21989208.000 |
| sectors / sectors/annular_partition | 0.000 | 264.000 |
| sectors / sectors/rotated_torus_reconstruction_false | 179.000 | 778440.000 |
| sectors / sectors/rotated_torus_reconstruction_true | 179.000 | 778440.000 |
| sectors / sectors/rotated_cone_reconstruction_false | 1229.000 | 1190040.000 |
| sectors / sectors/rotated_cone_reconstruction_true | 1229.000 | 1190040.000 |
| sectors / sectors/rotated_cone_band | 31450.000 | 2502164.000 |
| advanced / advanced/box_3d | 1.000 | 3144.000 |
| advanced / advanced/box_pcurves | 1.000 | 3144.000 |
| advanced / advanced/hole | 1.000 | 3144.000 |
| advanced / advanced/two_bodies | 2.000 | 6288.000 |
| advanced / advanced/reparameterized | 1.000 | 3144.000 |
| analytic_similarity / similarity/rational_replay | 1.970 | 5658.720 |
| analytic_similarity / similarity/reflected_replay | 1.990 | 5662.240 |
| analytic_similarity / similarity/radical_replay | 2.000 | 5664.000 |
| analytic_similarity / similarity/primitive_matrix | -1148.000 | 386688.000 |
| analytic_similarity / similarity/clipped_void_matrix | 7995.000 | 2351264.000 |
| analytic_similarity / similarity/selected_three_cycles | 23.000 | 58032.000 |
| analytic_similarity / similarity/periodic_near | 21.000 | 54792.000 |
| analytic_similarity / similarity/profile_families | 424.000 | 77696.000 |
| analytic_similarity / similarity/rejection_recovery | 61.040 | 34520.040 |
| seam_cuts / seams/torus_axial | 61.000 | 219192.000 |
| seam_cuts / seams/torus_longitudinal | 61.000 | 219192.000 |
| seam_cuts / seams/cone_longitudinal | 475.000 | 437640.000 |
| seam_cuts / seams/similarity_matrix | 39743.000 | 7398688.000 |
| seam_cuts / seams/boundary_provenance | 18.000 | 56592.000 |
| seam_cuts / seams/closed_boundary | 4.000 | 12576.000 |
| circles / circles/closed_fresh_document | 1.000 | 3144.000 |
| circles / circles/closed_reused_document | 1.000 | 3144.000 |
| circles / circles/partial_fresh_document | 1.000 | 3144.000 |
| circles / circles/partial_reused_document | 1.000 | 3144.000 |
| circles / circles/edits_replay_composition | 12.000 | 32808.000 |
| pcurves / pcurves/full_fresh | 1.000 | 3144.000 |
| pcurves / pcurves/full_reused | 1.000 | 3144.000 |
| pcurves / pcurves/partial_fresh | 1.000 | 3144.000 |
| pcurves / pcurves/partial_reused | 1.000 | 3144.000 |
| pcurves / pcurves/edit_replay_composition | 7.000 | 19536.000 |
| cone_exchange / cone_exchange/repeated_modeling_source_maps_replay | 1523.000 | 1244064.000 |
| analytic_export / analytic_export/edit_roundtrip | 39.000 | 103896.000 |
| torus_exchange / torus_exchange/whole_frames_units | 40.000 | 109200.000 |
| torus_exchange / torus_exchange/halves_reconstruction | 126.000 | 575136.000 |
| torus_exchange / torus_exchange/rational_band | 75.000 | 234480.000 |
| prism_exchange / prism_exchange/half_cylinder | 2880.000 | 249264.000 |
| prism_exchange / prism_exchange/annular_prism | 1801.000 | 213604.000 |
| prism_exchange / prism_exchange/preserved_planar | 7407.000 | 878272.000 |
| prism_exchange / prism_exchange/covering_circular | -471.000 | 243304.000 |
| axial_exchange / axial_exchange/disjoint_false/reflected_false | 1315.667 | 177481.333 |
| axial_exchange / axial_exchange/disjoint_false/reflected_true | 1317.000 | 177580.000 |
| axial_exchange / axial_exchange/disjoint_true/reflected_false | 476.333 | 60986.667 |
| axial_exchange / axial_exchange/disjoint_true/reflected_true | 473.667 | 60789.333 |

## New complete native/STEP workflows

| Case | Median ms | Calls / operation | Requested bytes / operation |
| --- | ---: | ---: | ---: |
| axial_shell_exchange/kind_0/reflected_false | 2088.020770 | 8010953.333 | 767111573.667 |
| axial_shell_exchange/kind_0/reflected_true | 2109.660137 | 8008729.667 | 776747893.000 |
| axial_shell_exchange/kind_1/reflected_false | 2064.365683 | 7812971.333 | 754758698.667 |
| axial_shell_exchange/kind_1/reflected_true | 2068.718432 | 7707696.667 | 759032319.333 |
| axial_shell_exchange/kind_2/reflected_false | 3048.627629 | 10856293.333 | 1105182232.667 |
| axial_shell_exchange/kind_2/reflected_true | 3085.911064 | 10895388.333 | 1121154564.667 |
| axial_shell_exchange/kind_3/reflected_false | 2533.382974 | 9500617.000 | 1038384245.000 |
| axial_shell_exchange/kind_3/reflected_true | 2560.413110 | 9410111.000 | 1043772868.000 |

## Retained adverse observations

The NURBS-boundary path extrusion probe rises from 0.690851 ms to 1.211483 ms per operation (1.753610×). All three candidate samples are slower than all three baseline samples: baseline totals 345.425579, 342.169792 and 357.643966 ms; candidate totals 605.741602, 606.932570 and 602.100060 ms, each for the original 500 iterations and checksum 500. This is an observed regression, not dismissed as timer noise. That existing probe checks exact volume and materializes its model, but does not serialize a complete exchange workflow. The two complete butt-region exchange cases also rise by 13.3% and 15.3%, with about 4,677 additional allocation requests per operation.

The native carrier migration and retained shell certificates are the relevant changed BREP paths. Isolating construction, admission and certificate storage cost needs a separate measured experiment; this campaign does not establish their individual contributions. The initial generic extrusion allocation before specialization remains a concrete unmeasured candidate. No optimization claim or all-cohort performance gate is earned here. Retention is for the higher-priority exact capability and supported continuation, with these costs explicitly carried forward.

The new complete workflow rows each include construction, independent assertions, native and STEP materialization/replay, repeated cuts, reconstruction, transverse cuts and empty recovery. Their approximately 2.1–3.1 seconds and 0.75–1.13 GB of cumulative allocation requests are whole-workflow costs, not single-Boolean latency or retained heap. Peak RSS for each fresh eight-row harness process is 23,572–24,036 KiB. All allocation increases, including additional certificate storage on existing shapes, remain visible above.

All raw trials, full case rows, process RSS/CPU/wall observations and executable sizes remain in [cost-summary.json](cost-summary.json), [resource-summary.json](resource-summary.json) and [costs/commands.json](costs/commands.json). Warmup and timing boundaries belong to each unchanged harness. OS/shared caches were not flushed. The new harness executes one warmup and three measured complete workflows per process, including independent exact checks and native/STEP materialization. No significant speedup or all-cohort timing admission is inferred.
