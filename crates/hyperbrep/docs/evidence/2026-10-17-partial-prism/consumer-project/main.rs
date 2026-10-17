#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/axial_cuts.rs"]
mod acceptance;
fn main() {
    let directory = std::path::PathBuf::from(std::env::args().nth(1).expect("output directory"));
    let disjoint = std::env::args().nth(2).expect("disjoint flag").parse::<bool>().unwrap();
    let reflected = std::env::args().nth(3).expect("reflection flag").parse::<bool>().unwrap();
    let (step, native) = acceptance::round_trip(disjoint, reflected).unwrap();
    let name = format!("axial-disjoint-{disjoint}-reflected-{reflected}");
    std::fs::create_dir_all(&directory).unwrap();
    std::fs::write(directory.join(format!("{name}.step")), &step).unwrap();
    std::fs::write(directory.join(format!("{name}.json")), &native).unwrap();
    println!("case={name} outcome=certified step_bytes={} native_bytes={}", step.len(), native.len());
}
