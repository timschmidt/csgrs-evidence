mod shipped_example;
#[unsafe(no_mangle)]
pub extern "C" fn exercise_surface_ranges() -> u32 {
    shipped_example::run().expect("all sixteen archived example cells complete");
    16
}
