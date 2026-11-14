from pathlib import Path
import shutil
s=Path(__file__).parent;p=s/'cold-warm';(p/'src').mkdir(parents=True)
t=Path('/mnt/development/csgrs-qr-evolution/crates/hyperdynamics/benches/qr_evolution.rs').read_text();t=t[:t.index('fn run(c: &mut Criterion)')].replace('use criterion::{Criterion, black_box, criterion_group, criterion_main};','use std::hint::black_box;').replace('#[path = "../tests/support/flow_oracles.rs"]','#[path = "flow_oracles.rs"]')
t+='''
fn main() {
    let args: Vec<_> = std::env::args().collect();
    let f=fixtures().into_iter().find(|f|f.name==args[1]).unwrap();
    let mode=&args[2];let warm:usize=args[3].parse().unwrap();let count:usize=args[4].parse().unwrap();
    let run=|| {
        if mode=="fixed" {let r=fixed(&f);assert_eq!(r.native.reached_time(),&f.request.end);assert_eq!(r.initial,f.request.initial);let widths=check(&f,&r.source.last().unwrap().1);drop(black_box((r,widths)));}
        else {assert_eq!(mode,"qr");let r=selected(&f);assert_eq!(r.reached_time(),&f.request.end);let widths=check(&f,r.source_end_enclosure().unwrap());drop(black_box((r,widths)));}
    };
    for _ in 0..warm {run();}
    let start=std::time::Instant::now();for _ in 0..count {run();}
    println!("TIME {} {mode} warmup={warm} iterations={count} ns_per_operation={}",f.name,start.elapsed().as_nanos()/count as u128);
}
'''
(p/'src/main.rs').write_text(t);shutil.copy2(s/'observer/src/flow_oracles.rs',p/'src/flow_oracles.rs');shutil.copy2(s/'observer/Cargo.toml',p/'Cargo.toml');shutil.copy2(s/'observer/Cargo.lock',p/'Cargo.lock')
