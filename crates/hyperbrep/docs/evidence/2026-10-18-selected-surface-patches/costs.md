# Cost observations

Three alternating pairs per preserved cohort and three absolute new-feature runs. Each case retains one warmup and three measured repetitions, complete fixture bodies and assertions, with allocation counters enabled. Sources and frozen binaries are hash-checked. The host is shared; task builds/tests do not overlap these measurements.

The 92 preserved semantic rows have observed time ratios from 0.852615 to 3.458309. 7 exceed the descriptive 10% review marker; 28 increase allocation calls or cumulative requested bytes. These samples do not establish significance or a general speedup. All adverse rows are retained below.

The candidate changes first-export pcurve expression encodings. Comparisons retain the completed semantic workflows, not identical output bytes. Retention is for correctness and expanded selected-domain support. Larger archives and slower workflows remain visible work; this record does not establish release performance admission.

| Cohort / case | Baseline ms | Candidate ms | Time ratio | Baseline allocations | Candidate allocations | Baseline requested bytes | Candidate requested bytes |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| images / `eight_profiles` | 100.894861 | 102.265864 | 1.013588 | 454626 | 454304 | 3.73955e+07 | 3.73665e+07 |
| images / `cut_restore_replay` | 6.673852 | 7.349899 | 1.101298 | 21364 | 21358.7 | 2.70108e+06 | 2.69946e+06 |
| images / `thin_touching_components` | 8.632265 | 8.847335 | 1.024915 | 36506 | 36343 | 3.65194e+06 | 3.64163e+06 |
| images / `planar_replay` | 0.730525 | 0.734618 | 1.005602 | 1553 | 1556 | 236142 | 236210 |
| images / `unequal_holes` | 3.656665 | 3.574994 | 0.977665 | 11509 | 11511 | 1.43392e+06 | 1.43393e+06 |
| images / `self_intersecting` | 0.043098 | 0.044515 | 1.032894 | 104 | 104 | 23312 | 23312 |
| spline / `retained_spline_profiles_complete_step_replay_and_repeated_cuts` | 261.898325 | 231.879426 | 0.885380 | 827081 | 826412 | 9.17852e+07 | 9.17149e+07 |
| spline / `independent_splines_retain_charts_weights_trims_units_and_modeling` | 102.306611 | 101.326769 | 0.990423 | 277979 | 276421 | 3.99066e+07 | 3.98084e+07 |
| spline / `invalid_spline_records_and_exhausted_limits_never_publish_a_body` | 2.706956 | 2.701979 | 0.998162 | 4133 | 4133 | 2.06223e+06 | 2.06223e+06 |
| spline / `spline_whole_images_ambiguous_trims_and_supplied_pcurves_are_checked` | 9.542839 | 9.481009 | 0.993521 | 18455 | 18299 | 4.04461e+06 | 4.03447e+06 |
| spline / `spline_write_limits_units_and_exact_numeric_failures_are_explicit` | 4.172076 | 4.180152 | 1.001936 | 14111 | 14111 | 1.60879e+06 | 1.60879e+06 |
| spline / `spline_views_retain_weights_knots_and_reversed_subcurve_charts` | 0.105592 | 0.106932 | 1.012687 | 338 | 338 | 74712 | 74712 |
| spline / `planar_pcurves_prove_whole_image_and_retain_parameter_correspondence` | 0.149508 | 0.148277 | 0.991766 | 238 | 238 | 55896 | 55896 |
| spline / `extrusion_location_preserves_oblique_nonunit_direction_and_source_parameters` | 1.200365 | 1.204290 | 1.003270 | 3634 | 3634 | 252192 | 252192 |
| spline / `extrusion_location_keeps_ambiguity_and_rejects_nontransverse_or_nonplanar_charts` | 0.060604 | 0.061068 | 1.007667 | 148 | 148 | 21068 | 21068 |
| measurement / `planar_spline_incidence_does_not_require_low_degree_root_solving` | 1.116995 | 1.146068 | 1.026027 | 3420.67 | 3420.67 | 459453 | 459453 |
| measurement / `rational_prism_validity_does_not_require_a_closed_form_measurement` | 411.239638 | 408.538977 | 0.993433 | 3.69221e+06 | 3.6913e+06 | 1.87627e+08 | 1.87551e+08 |
| measurement / `holes_components_and_affine_images_keep_optional_measurements` | 508.198485 | 497.963312 | 0.979860 | 3.1346e+06 | 3.11175e+06 | 2.31461e+08 | 2.30131e+08 |
| measurement / `measurement_absence_survives_empty_identities_and_repeated_slab_cuts` | 439.394435 | 433.544211 | 0.986686 | 2.27339e+06 | 2.26846e+06 | 2.13061e+08 | 2.12751e+08 |
| measurement / `inward_and_damaged_archives_remain_invalid_without_volume` | 17.176697 | 17.152390 | 0.998585 | 108086 | 108037 | 9.55829e+06 | 9.55429e+06 |
| measurement / `independent_quintic_step_admits_and_replays_without_measurement` | 327.639807 | 327.581970 | 0.999823 | 2.33307e+06 | 2.33141e+06 | 1.40797e+08 | 1.40693e+08 |
| measurement / `malformed_quintic_step_and_budget_failure_cannot_publish_geometry` | 17.629067 | 17.758065 | 1.007317 | 129624 | 129633 | 8.02559e+06 | 8.02609e+06 |
| selected / `selected_boolean_profiles_extrude_and_replay` | 262.461308 | 549.481776 | 2.093572 | 1.83948e+06 | 4.25362e+06 | 1.27696e+08 | 2.96838e+08 |
| selected / `selected_profile_paths_share_native_image_admission` | 221.977720 | 389.241198 | 1.753515 | 1.51565e+06 | 2.92728e+06 | 1.06916e+08 | 1.98774e+08 |
| selected / `selected_profile_edits_and_slab_booleans_preserve_exact_material` | 8232.861360 | 28471.781693 | 3.458309 | 6.62049e+07 | 2.32672e+08 | 4.61104e+09 | 1.71388e+10 |
| selected / `selected_profiles_keep_holes_and_disconnected_components` | 41.842144 | 102.102985 | 2.440195 | 303408 | 818509 | 2.09445e+07 | 5.648e+07 |
| selected / `selected_profiles_transport_exactly_and_reject_damaged_archives` | 163.466706 | 261.218463 | 1.597992 | 1.12292e+06 | 1.93747e+06 | 8.47472e+07 | 1.42037e+08 |
| selected / `partial_height_profile_contacts_keep_boundary_and_overlap_distinct` | 368.178289 | 366.755083 | 0.996134 | 1.27742e+06 | 1.2754e+06 | 1.57422e+08 | 1.57309e+08 |
| selected / `selected_profile_step_vertices_remain_explicitly_unencodable` | 186.111254 | 367.402123 | 1.974099 | 1.172e+06 | 2.6804e+06 | 9.52791e+07 | 2.03148e+08 |
| selected / `selected_quadratic_image_keeps_the_complete_curve_and_original_roots` | 9.806266 | 9.854959 | 1.004965 | 69623 | 69569 | 4.81273e+06 | 4.80985e+06 |
| selected / `nonmonotone_native_image_preserves_its_entire_parameterized_polynomial` | 0.225006 | 0.212109 | 0.942682 | 1028 | 1013 | 63884 | 63044 |
| selected / `unavailable_higher_degree_views_do_not_replace_selected_evidence` | 0.023321 | 0.022262 | 0.954618 | 77 | 77 | 13456 | 13456 |
| selected / `selected_weighted_curve_images_preserve_exact_quotients` | 8.054956 | 8.244349 | 1.023513 | 46761.7 | 46771.3 | 3.22533e+06 | 3.22591e+06 |
| parallel / `nonlinear_parallel_pcurve_replays_exactly` | 6.936150 | 6.875658 | 0.991279 | 38070 | 38070 | 2.55059e+06 | 2.55059e+06 |
| parallel / `polynomial_and_rational_parallel_sources_replay` | 2.690958 | 2.737251 | 1.017203 | 20957.3 | 20957.3 | 1.17851e+06 | 1.17851e+06 |
| parallel / `selected_parallel_ranges_survive_replay_and_subdivision` | 1.016788 | 1.022136 | 1.005260 | 5767.67 | 5767.67 | 415440 | 415440 |
| parallel / `parallel_cusp_endpoints_remain_selected_on_replay` | 1.547405 | 1.571181 | 1.015365 | 15398 | 15398 | 568809 | 568809 |
| parallel / `replayed_parallel_pcurves_reenter_planar_modeling` | 25.521819 | 25.627307 | 1.004133 | 218411 | 218411 | 1.13292e+07 | 1.13292e+07 |
| parallel / `parallel_archives_reject_forged_definitions` | 1.894746 | 1.923339 | 1.015091 | 13147.3 | 13147.3 | 795458 | 795458 |
| parallel / `parallel_archive_limits_and_exhaustion_recover` | 2.730577 | 2.643050 | 0.967946 | 21043 | 21043 | 945662 | 945662 |
| planar / `original_nonlinear_parallel_cap_extrudes_and_replays` | 122.312349 | 119.303014 | 0.975396 | 1.01871e+06 | 1.00903e+06 | 6.3766e+07 | 6.29189e+07 |
| planar / `planar_images_preserve_exact_frame_and_chart` | 2.012428 | 1.854778 | 0.921662 | 7169.67 | 7137.67 | 487613 | 484861 |
| planar / `parallel_cap_classification_and_edge_split` | 93.374321 | 88.143731 | 0.943983 | 725183 | 705085 | 4.13674e+07 | 3.96375e+07 |
| planar / `parallel_cap_affine_transform_and_cold_replay` | 70.116029 | 59.782006 | 0.852615 | 531173 | 466613 | 3.02364e+07 | 2.64502e+07 |
| planar / `parallel_cap_repeated_slab_booleans` | 743.152356 | 710.705209 | 0.956338 | 5.78192e+06 | 5.58714e+06 | 3.3865e+08 | 3.21648e+08 |
| planar / `parallel_extrusion_point_queries` | 0.175907 | 0.179237 | 1.018932 | 805 | 805 | 39428 | 39428 |
| planar / `authored_parallel_paths_share_admission` | 416.898051 | 402.836225 | 0.966270 | 3.30466e+06 | 3.22798e+06 | 1.87686e+08 | 1.81686e+08 |
| planar / `planar_image_archives_reject_forged_interior_and_frames` | 57.602363 | 55.368550 | 0.961220 | 437403 | 426052 | 3.09696e+07 | 2.99967e+07 |
| planar / `planar_image_limits_and_typed_frontiers_recover` | 52.271752 | 50.194335 | 0.960257 | 407871 | 397822 | 2.32727e+07 | 2.24078e+07 |
| planar / `parallel_caps_keep_holes_and_components` | 219.515222 | 210.005139 | 0.956677 | 1.68989e+06 | 1.62895e+06 | 9.85094e+07 | 9.43828e+07 |
| planar / `planar_lifts_share_native_source_evaluation` | 1.334918 | 1.330309 | 0.996548 | 1956 | 1956 | 384152 | 384152 |
| planar / `parallel_step_frontier` | 43.448876 | 41.745946 | 0.960806 | 338381 | 328706 | 1.96481e+07 | 1.88011e+07 |
| selected_planar / `selected_planar_points_keep_frame_and_source_correlation` | 7.983534 | 8.074771 | 1.011428 | 74947.3 | 74947.3 | 4.7695e+06 | 4.7695e+06 |
| selected_planar / `selected_planar_points_replay_sources_and_affine_transforms` | 2.205648 | 2.183883 | 0.990132 | 7479 | 7495 | 756056 | 756072 |
| selected_planar / `selected_parallel_edge_splits_replay_the_whole_cap` | 90.546291 | 85.558197 | 0.944911 | 691739 | 665129 | 4.0261e+07 | 3.82042e+07 |
| selected_planar / `selected_parallel_splits_continue_through_boolean_sets` | 714.149150 | 719.429426 | 1.007394 | 5.53232e+06 | 5.61446e+06 | 3.21801e+08 | 3.28706e+08 |
| selected_planar / `selected_parallel_splits_transform_and_preserve_near_separation` | 142.994107 | 130.149938 | 0.910177 | 1.10909e+06 | 1.02497e+06 | 6.3838e+07 | 5.80575e+07 |
| selected_planar / `selected_planar_archives_reject_forged_sources_and_recover` | 285.880411 | 273.703784 | 0.957407 | 2.19007e+06 | 2.12069e+06 | 1.34639e+08 | 1.28572e+08 |
| selected_planar / `selected_planar_policies_and_work_exhaustion_recover` | 45.869055 | 44.101913 | 0.961474 | 355336 | 345568 | 2.06358e+07 | 1.97835e+07 |
| selected_planar / `selected_planar_poles_remain_typed_failures` | 0.458931 | 0.462509 | 1.007795 | 1747 | 1747 | 158728 | 158728 |
| selected_planar / `authored_and_constant_forms_preserve_exact_values` | 0.019119 | 0.018699 | 0.978049 | 71 | 71 | 9928 | 9928 |
| selected_planar / `selected_forms_preserve_root_correlation_and_cancellation` | 1.867738 | 1.820348 | 0.974627 | 21660.7 | 21659.3 | 1.42161e+06 | 1.42149e+06 |
| selected_planar / `selected_form_bounds_and_policy_reuse_keep_exact_meaning` | 0.126280 | 0.124874 | 0.988869 | 462.667 | 462.667 | 44013.3 | 44013.3 |
| selected_planar / `analytic_form_incidence_preserves_the_positive_normal_sheet` | 12.900281 | 13.000541 | 1.007772 | 113410 | 113411 | 5.77021e+06 | 5.77027e+06 |
| selected_planar / `symbolic_forms_keep_correlated_coefficients` | 0.223228 | 0.223101 | 0.999430 | 1244 | 1244 | 93384 | 93384 |
| selected_planar / `parallel_injectivity_requires_the_consumed_range` | 0.460011 | 0.456779 | 0.992973 | 3890.67 | 3890.67 | 221453 | 221453 |
| contacts / `cubic_contacts_retain_original_source_and_certify_independent_equations` | 4.519445 | 4.460093 | 0.986867 | 25025.3 | 25029.3 | 1.72662e+06 | 1.72663e+06 |
| contacts / `complete_root_sets_keep_repeated_roots_endpoints_and_distinct_visits` | 1.859241 | 1.814780 | 0.976086 | 11931 | 11931 | 760993 | 760993 |
| contacts / `high_degree_empty_and_contained_results_are_complete` | 0.240822 | 0.238533 | 0.990494 | 1373.67 | 1373.67 | 86044.3 | 86044.3 |
| contacts / `nonunit_nurbs_contacts_use_original_curve_parameters` | 0.468989 | 0.466299 | 0.994266 | 1157.67 | 1159.67 | 183186 | 183188 |
| contacts / `nurbs_coincidence_keeps_all_ranges_and_isolated_contacts` | 0.050832 | 0.050906 | 1.001456 | 127 | 127 | 45584 | 45584 |
| contacts / `nurbs_joint_classification_preserves_each_incident_span` | 1.672838 | 1.669871 | 0.998227 | 4045 | 4045 | 543812 | 543812 |
| contacts / `parallel_plane_contacts_preserve_reversal_frame_and_tangency` | 76.619321 | 76.260538 | 0.995317 | 555430 | 555438 | 3.31183e+07 | 3.31183e+07 |
| contacts / `planar_nurbs_overlaps_use_authored_spans_before_spatial_transport` | 0.733068 | 0.725891 | 0.990211 | 2257.67 | 2257.67 | 238397 | 238397 |
| contacts / `plane_contacts_keep_tiny_exact_separations` | 5.041727 | 4.921027 | 0.976060 | 29790.7 | 29794.7 | 6.37094e+06 | 6.37094e+06 |
| contacts / `contact_parameters_split_shared_edges_and_replay_solid_operations` | 294.882421 | 266.798511 | 0.904762 | 2.29833e+06 | 2.10698e+06 | 1.32556e+08 | 1.21989e+08 |
| contacts / `plane_contact_policies_exhaustion_and_recovery_preserve_certainty` | 0.389412 | 0.387480 | 0.995037 | 1856 | 1856 | 150932 | 150932 |
| contacts / `plane_contacts_reject_poles_before_empty_or_contained_shortcuts` | 10.186141 | 10.026618 | 0.984339 | 68650 | 68654 | 4.28257e+06 | 4.28258e+06 |
| contacts / `collapsed_planar_spans_keep_parameter_components` | 0.527555 | 0.519533 | 0.984794 | 1879 | 1879 | 163084 | 163084 |
| contacts / `finite_cone_boundary_contacts_are_not_claimed_as_equation_roots` | 0.026695 | 0.027205 | 1.019130 | 111 | 111 | 10440 | 10440 |
| procedural / `selected_profile_domains_retain_endpoints_and_projection` | 0.243621 | 0.234336 | 0.961889 | 740.667 | 740.667 | 43813.3 | 43813.3 |
| procedural / `selected_profile_domains_reverse_transform_and_replay` | 1.715826 | 1.738899 | 1.013447 | 4402 | 4410 | 407310 | 407326 |
| procedural / `full_clipped_parallel_cap_constructs_and_replays` | 434.919723 | 463.261117 | 1.065165 | 3.56316e+06 | 3.62224e+06 | 3.01634e+08 | 3.04891e+08 |
| procedural / `selected_chord_charts_keep_original_boundary` | 17.758822 | 18.070183 | 1.017533 | 166323 | 166323 | 7.58225e+06 | 7.58225e+06 |
| procedural / `selected_origin_lines_retain_source_and_replay` | 1.117524 | 1.133757 | 1.014526 | 5327 | 5331 | 439918 | 439926 |
| procedural / `selected_profile_solids_split_both_edge_directions` | 3384.675448 | 3432.384658 | 1.014096 | 2.61514e+07 | 2.63929e+07 | 2.64262e+09 | 2.65631e+09 |
| procedural / `selected_profile_solids_reflect_and_replay` | 2519.023304 | 2509.862240 | 0.996363 | 2.11098e+07 | 2.12278e+07 | 2.13726e+09 | 2.14385e+09 |
| procedural / `selected_profile_solids_continue_slab_booleans` | 23189.805311 | 23554.473190 | 1.015725 | 1.93573e+08 | 1.94144e+08 | 2.4724e+10 | 2.4756e+10 |
| procedural / `selected_profile_archives_reject_forged_proofs_and_recover` | 4133.711556 | 4437.315271 | 1.073446 | 3.28614e+07 | 3.36139e+07 | 2.85288e+09 | 2.90551e+09 |
| procedural / `selected_profiles_keep_holes_components_and_reversal` | 6335.304063 | 6434.607895 | 1.015675 | 5.47204e+07 | 5.50914e+07 | 6.64399e+09 | 6.66546e+09 |
| procedural / `selected_profiles_preserve_certainty_and_budget_recovery` | 1530.621740 | 1582.118497 | 1.033644 | 1.20861e+07 | 1.23232e+07 | 1.04113e+09 | 1.05451e+09 |
| procedural / `selected_procedural_profiles_fail_step_with_attribution_and_native_recovery` | 1147.864338 | 1181.630751 | 1.029417 | 9.1224e+06 | 9.29739e+06 | 7.85996e+08 | 7.95863e+08 |

## New groups, absolute costs

| Case | ms | Allocations | Cumulative requested bytes |
| --- | ---: | ---: | ---: |
| `selected_extrusion_patch_builds_and_replays` | 2.445517 | 8502 | 1.11246e+06 |
| `selected_planar_face_builds_and_replays` | 115.706901 | 933004 | 4.73097e+07 |
| `selected_patches_reverse_transform_and_split` | 236.824020 | 2.03755e+06 | 1.22418e+08 |
| `selected_planar_faces_keep_holes_frames_and_orientation` | 592.724963 | 4.57141e+06 | 3.05489e+08 |
| `selected_planar_patches_keep_holes_and_contact_edits` | 2737.931824 | 2.14142e+07 | 1.62097e+09 |
| `selected_patch_archives_reject_wrong_images_and_recover` | 19.500591 | 74470 | 9.96762e+06 |
| `selected_patches_keep_failure_certainty_and_budget_contracts` | 16.574865 | 59161 | 7.88068e+06 |

## Process and executable observations

Process RSS includes warmup, all cases and runtime overhead; requested bytes are cumulative, not retained heap. Native binary sizes include the consumer and dependencies. These finite observations do not bound coefficient growth, total work, retained memory or cancellation.

| Cohort / side | Median process wall seconds | Median peak RSS KiB | Native bytes |
| --- | ---: | ---: | ---: |
| images / baseline | 0.487970 | 17460 | 27947896 |
| images / candidate | 0.489236 | 17672 | 27940536 |
| spline / baseline | 1.575652 | 19952 | 27933264 |
| spline / candidate | 1.412251 | 19980 | 27921920 |
| measurement / baseline | 6.826551 | 21264 | 28321712 |
| measurement / candidate | 6.766668 | 21100 | 28314592 |
| selected / baseline | 37.461141 | 25884 | 27603024 |
| selected / candidate | 120.212944 | 28776 | 27594984 |
| parallel / baseline | 0.175496 | 14228 | 23763584 |
| parallel / candidate | 0.174333 | 14168 | 23748544 |
| planar / baseline | 7.310571 | 21804 | 27517880 |
| planar / candidate | 6.894506 | 21452 | 27510040 |
| selected_planar / baseline | 5.173373 | 21452 | 26908544 |
| selected_planar / candidate | 5.065051 | 21444 | 26896144 |
| contacts / baseline | 1.582574 | 20796 | 27386976 |
| contacts / candidate | 1.466144 | 20784 | 27374720 |
| procedural / baseline | 169.888848 | 25708 | 27371112 |
| procedural / candidate | 173.199052 | 28476 | 27359056 |
| patches / candidate | 14.539403 | 20180 | 25360784 |

See [complete data](consumer-costs.json), [summary and adverse rows](cost-summary.json), [archive sizes](artifact-size-summary.json), and the lossless raw-data bundle for every trial/log/resource record.
