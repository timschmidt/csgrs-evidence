// Other fixture helpers remain uncalled in this shared-recipe probe.
#[allow(dead_code)]
#[path="/home/tim/Documents/GitHub/workspace/csgrs/crates/hyperbrep/tests/support/selected_planar_images.rs"] mod brep_cases;
#[unsafe(no_mangle)] pub extern "C" fn fidelity_5(){brep_cases::parallel_fidelity_survives_spatial_restriction_and_native_replay();}
mod cases;
#[unsafe(no_mangle)] pub extern "C" fn fidelity_0(){cases::restriction_reversal_and_scale_preserve_the_pointwise_source_map();}
#[unsafe(no_mangle)] pub extern "C" fn fidelity_1(){cases::selected_restrictions_keep_the_selected_parameter_without_projection();}
#[unsafe(no_mangle)] pub extern "C" fn fidelity_2(){cases::zero_distance_keeps_inherited_fidelity_and_unverified_geometry_stays_unverified();}
#[unsafe(no_mangle)] pub extern "C" fn fidelity_3(){cases::extracted_parallel_curves_keep_their_individual_source_and_metric();}
#[unsafe(no_mangle)] pub extern "C" fn fidelity_4(){cases::repeated_exact_edits_keep_a_compact_replay_and_the_pointwise_bound();}
