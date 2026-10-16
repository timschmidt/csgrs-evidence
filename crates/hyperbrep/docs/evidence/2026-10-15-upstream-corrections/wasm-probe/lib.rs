#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/analytic_cylinder.rs"]
mod fixture;

#[unsafe(no_mangle)]
pub extern "C" fn run_probe() -> u32 {
    fixture::closed_circle();
    fixture::parameters();
    fixture::representations();
    fixture::oblique_frames();
    fixture::units();
    fixture::composition();
    fixture::failures();
    fixture::admission();
    8
}
