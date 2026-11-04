#[path="/home/tim/Documents/GitHub/workspace/csgrs/crates/hypersolve/tests/support/bivariate_vertical_components.rs"]
mod solver;
mod curve;
#[unsafe(no_mangle)]
pub extern "C" fn solver_0() -> u32 { solver::pure_vertical_components_keep_closed_bounds_and_powers(); 1 }
#[unsafe(no_mangle)]
pub extern "C" fn solver_1() -> u32 { solver::vertical_crossings_split_regular_residual_branches(); 1 }
#[unsafe(no_mangle)]
pub extern "C" fn solver_2() -> u32 { solver::vertical_singular_and_boundary_contacts_retain_all_half_branches(); 1 }
#[unsafe(no_mangle)]
pub extern "C" fn solver_3() -> u32 { solver::selected_vertical_roots_keep_algebraic_coordinates_and_nearby_columns(); 1 }
#[unsafe(no_mangle)]
pub extern "C" fn solver_4() -> u32 { solver::vertical_limits_invalid_inputs_and_budget_retry_remain_explicit(); 1 }
#[unsafe(no_mangle)]
pub extern "C" fn solver_5() -> u32 { solver::content_scalars_and_unsupported_algebraic_bounds_remain_explicit(); 1 }
#[unsafe(no_mangle)]
pub extern "C" fn curve_0() -> u32 { curve::empty_axis_topology_enters_the_native_curve_set(); 1 }
#[unsafe(no_mangle)]
pub extern "C" fn curve_1() -> u32 { curve::whole_vertical_topology_never_publishes_a_partial_curve_collection(); 1 }
