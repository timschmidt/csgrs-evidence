#[allow(dead_code)]
#[path = "../crates/hyperbrep-io/tests/support/prism_export.rs"]
mod acceptance;
static NEXT: std::sync::atomic::AtomicUsize = std::sync::atomic::AtomicUsize::new(0);
fn capture(text: &str) {
    let n = NEXT.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let dir = std::path::PathBuf::from(std::env::args().nth(1).unwrap());
    std::fs::write(dir.join(format!("{n}.step")), text).unwrap();
}
fn main() {
    let half = acceptance::same_height();
    let annulus = acceptance::holes();
    assert_eq!(NEXT.load(std::sync::atomic::Ordering::Relaxed), 4);
    println!("half_cylinder={half}");
    println!("annular_prism={annulus}");
}
