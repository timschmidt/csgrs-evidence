#[path = "../consumer-project/acceptance.rs"]
mod acceptance;
#[path = "../consumer-project/images.rs"]
mod images;
#[unsafe(no_mangle)]
pub extern "C" fn run_probe() -> u32 {
    acceptance::run_all();
    images::run_all();
    14
}
