#[path = "/home/tim/Documents/GitHub/workspace/csgrs/crates/hyperbrep/tests/support/stationary_straight_sweeps.rs"]
mod brep;
mod solver_acceptance;
#[unsafe(no_mangle)]
pub extern "C" fn brep_0() -> u32 { brep::stationary_straight_images_construct_the_same_exact_prism(); 1 }
#[unsafe(no_mangle)]
pub extern "C" fn brep_1() -> u32 { brep::stationary_straight_images_continue_through_cuts_replay_and_reunion(); 1 }
#[unsafe(no_mangle)]
pub extern "C" fn brep_2() -> u32 { brep::stationary_straight_images_reject_backtracking_and_lateral_stops(); 1 }
#[unsafe(no_mangle)]
pub extern "C" fn brep_3() -> u32 { brep::stationary_straight_images_preserve_elevation_weights_oblique_frames_and_reversal(); 1 }
#[unsafe(no_mangle)]
pub extern "C" fn brep_4() -> u32 { brep::stationary_straight_images_keep_holes_and_tiny_material(); 1 }
#[unsafe(no_mangle)]
pub extern "C" fn brep_5() -> u32 { brep::stationary_plane_correspondence_rejects_changed_whole_image_and_backtracking(); 1 }
#[unsafe(no_mangle)]
pub extern "C" fn brep_6() -> u32 { brep::stationary_straight_images_continue_through_reflection_and_fixed_frame_entry(); 1 }
#[unsafe(no_mangle)]
pub extern "C" fn brep_7() -> u32 { brep::stationary_straight_images_have_exact_planar_triangulations(); 1 }
#[unsafe(no_mangle)]
pub extern "C" fn solver_acceptance_0() -> u32 { solver_acceptance::nonnegative_certificate_distinguishes_zeros_and_sign_changes(); 1 }
#[unsafe(no_mangle)]
pub extern "C" fn solver_acceptance_1() -> u32 { solver_acceptance::nonnegative_certificate_separates_multiple_algebraic_and_nearby_roots(); 1 }
#[unsafe(no_mangle)]
pub extern "C" fn solver_acceptance_2() -> u32 { solver_acceptance::nonnegative_certificate_matches_complete_rational_root_sign_cells(); 1 }
#[unsafe(no_mangle)]
pub extern "C" fn solver_acceptance_3() -> u32 { solver_acceptance::nonnegative_certificate_keeps_unknown_after_a_terminal_policy_query(); 1 }
