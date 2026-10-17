#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/axial_shells.rs"]
mod acceptance;
fn main() {
    let args=std::env::args().collect::<Vec<_>>();
    let directory=std::path::PathBuf::from(&args[1]);
    let kind=args[2].parse().unwrap(); let reflected=args[3].parse().unwrap();
    let (step,native)=acceptance::round_trip(kind,reflected).unwrap();
    let name=format!("axial-shell-{kind}-reflected-{reflected}");
    std::fs::create_dir_all(&directory).unwrap();
    std::fs::write(directory.join(format!("{name}.step")),&step).unwrap();
    std::fs::write(directory.join(format!("{name}.json")),&native).unwrap();
    println!("case={name} outcome=certified step_bytes={} native_bytes={}",step.len(),native.len());
}
