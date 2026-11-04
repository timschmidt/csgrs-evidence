include!("/tmp/csgrs-r06-cost-allocator.rs");
pub mod cases;
use std::time::Instant;
fn main(){let cases:&[(&str,fn())]=&[
("selected_quintic_coefficients_feed_elimination_and_another_selection",cases::selected_quintic_coefficients_feed_elimination_and_another_selection),
("factored_systems_keep_exact_scales_and_dependent_coefficient_fields",cases::factored_systems_keep_exact_scales_and_dependent_coefficient_fields),
("degree_seventeen_supports_do_not_require_scalar_projection",cases::degree_seventeen_supports_do_not_require_scalar_projection),
("zero_constants_common_components_and_cancelled_leading_terms_are_exact",cases::zero_constants_common_components_and_cancelled_leading_terms_are_exact),
("cancellation_during_the_last_zero_construction_does_not_publish_success",cases::cancellation_during_the_last_zero_construction_does_not_publish_success),
("actual_entry_denial_mid_computation_cancellation_and_retry",cases::actual_entry_denial_mid_computation_cancellation_and_retry),
("an_empty_operand_does_not_hide_an_invalid_coefficient_field",cases::an_empty_operand_does_not_hide_an_invalid_coefficient_field),
("repeated_selected_definitions_trim_zero_leading_coefficients_by_value",cases::repeated_selected_definitions_trim_zero_leading_coefficients_by_value),
("zero_resultants_do_not_assert_real_components_or_finite_root_sets",cases::zero_resultants_do_not_assert_real_components_or_finite_root_sets),
("independent_coefficient_fields_join_without_coordinate_materialization",cases::independent_coefficient_fields_join_without_coordinate_materialization),
("constant_eliminated_polynomials_keep_high_degree_completion_compact",cases::constant_eliminated_polynomials_keep_high_degree_completion_compact),
("ragged_storage_is_not_expanded_to_its_bounding_rectangle",cases::ragged_storage_is_not_expanded_to_its_bounding_rectangle),
("constant_in_the_eliminated_axis_preserves_the_full_retained_polynomial_power",cases::constant_in_the_eliminated_axis_preserves_the_full_retained_polynomial_power),
];
for (name,run) in cases {
 run();
 for i in 0..5 {
 let a=ALLOCATED.load(Ordering::Relaxed);let c=CALLS.load(Ordering::Relaxed);let live=LIVE.load(Ordering::Relaxed);PEAK.store(live,Ordering::Relaxed);
 let t=Instant::now();run();let ns=t.elapsed().as_nanos();let bytes=ALLOCATED.load(Ordering::Relaxed)-a;let calls=CALLS.load(Ordering::Relaxed)-c;let peak=PEAK.load(Ordering::Relaxed).saturating_sub(live);let delta=LIVE.load(Ordering::Relaxed)as i128-live as i128;
 println!("{name}\t{i}\t{ns}\t{bytes}\t{calls}\t{peak}\t{delta}");
 }
}}
