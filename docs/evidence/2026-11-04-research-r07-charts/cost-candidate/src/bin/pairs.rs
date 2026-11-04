include!("/tmp/csgrs-r06-cost-allocator.rs");
#[path="../charts.rs"] mod charts;
use std::time::Instant;
fn main() {
 let cases: &[(&str, fn())] = &[
("whole_axes_contact_consumes_the_exchanged_native_chart", charts::whole_axes_contact_consumes_the_exchanged_native_chart),
("exchanged_nonlinear_graphs_keep_both_contact_parameters_and_orientation", charts::exchanged_nonlinear_graphs_keep_both_contact_parameters_and_orientation),
("translated_graphs_use_independent_domains_and_parameters", charts::translated_graphs_use_independent_domains_and_parameters),
("nonlinear_overlap_retains_bidirectional_parameter_transport", charts::nonlinear_overlap_retains_bidirectional_parameter_transport),
("point_incidence_keeps_the_selected_fiber_affine_abscissa", charts::point_incidence_keeps_the_selected_fiber_affine_abscissa),
("rotated_nonlinear_charts_select_the_nonrational_contact_and_requery", charts::rotated_nonlinear_charts_select_the_nonrational_contact_and_requery),
("generated_quintic_column_pair_preserves_defining_power_and_selected_contact", charts::generated_quintic_column_pair_preserves_defining_power_and_selected_contact),
("mixed_common_components_keep_other_crossings_and_endpoint_contacts", charts::mixed_common_components_keep_other_crossings_and_endpoint_contacts),
("degree_seventeen_overlap_keeps_nonmaterialized_inverse_cuts", charts::degree_seventeen_overlap_keeps_nonmaterialized_inverse_cuts),
("independent_quintic_and_septic_supports_keep_the_joint_selected_system", charts::independent_quintic_and_septic_supports_keep_the_joint_selected_system),
("rotated_circle_overlaps_feed_the_same_filled_set_arrangement", charts::rotated_circle_overlaps_feed_the_same_filled_set_arrangement),
("opposite_reducible_roots_and_tiny_distinct_translations_stay_separate", charts::opposite_reducible_roots_and_tiny_distinct_translations_stay_separate),
("separate_chart_resource_denial_cancellation_and_policy_retry", charts::separate_chart_resource_denial_cancellation_and_policy_retry),
];
 for (name, run) in cases {
  run(); run();
  for sample in 0..20 {
   let a=ALLOCATED.load(Ordering::Relaxed); let calls=CALLS.load(Ordering::Relaxed);
   let live=LIVE.load(Ordering::Relaxed); PEAK.store(live,Ordering::Relaxed);
   let now=Instant::now(); run(); let ns=now.elapsed().as_nanos();
   let bytes=ALLOCATED.load(Ordering::Relaxed)-a;let n=CALLS.load(Ordering::Relaxed)-calls;
   let peak=PEAK.load(Ordering::Relaxed).saturating_sub(live);
   let delta=LIVE.load(Ordering::Relaxed)as i128-live as i128;
   println!("{name}\t{sample}\t{ns}\t{bytes}\t{n}\t{peak}\t{delta}");
  }
 }
}
