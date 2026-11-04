#[allow(dead_code)]
#[path = "/home/tim/Documents/GitHub/workspace/csgrs/crates/hyperbrep/tests/support/plane_tensor_sections.rs"]
mod sections;
#[unsafe(no_mangle)]
pub extern "C" fn vertical_brep() -> u32 {
    sections::empty_contained_boundary_and_solver_frontier();
    1
}
