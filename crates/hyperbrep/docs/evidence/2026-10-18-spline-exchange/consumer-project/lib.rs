include!("cases.rs");
#[unsafe(no_mangle)]
pub extern "C" fn run_probe() -> u32 {
    for (_, case) in cases() {
        case();
    }
    9
}
