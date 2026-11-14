from pathlib import Path
import shutil, json
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-qr-evolution');p=s/'observer';(p/'src').mkdir(parents=True,exist_ok=True)
source=(r/'crates/hyperdynamics/benches/qr_evolution.rs').read_text().replace('use criterion::{Criterion, black_box, criterion_group, criterion_main};','use criterion::{Criterion, black_box};').replace('#[path = "../tests/support/flow_oracles.rs"]','#[path = "flow_oracles.rs"]').replace('fn run(c: &mut Criterion) {','fn main() {\n    let mut c=Criterion::default();')
source=source[:source.index('criterion_group!(benches, run);')]
needle='        if let Ok(iterations) = std::env::var("QR_EVOLUTION_ITERATIONS") {'
addition='''        if std::env::var_os("QR_EVOLUTION_ALLOC").is_some() {
            for mode in ["fixed","qr"] {
                for _ in 0..4 { if mode=="fixed" {drop(black_box(fixed(&f)));} else {drop(black_box(selected(&f)));} }
                let guard=CountingGuard::start();
                for _ in 0..16 {
                    if mode=="fixed" { let r=fixed(&f); check(&f,&r.source.last().unwrap().1);drop(black_box(r)); }
                    else {let r=selected(&f);check(&f,r.source_end_enclosure().unwrap());drop(black_box(r));}
                }
                let stats=AllocationStats::snapshot();drop(guard);print_row(f.name,mode,16,stats);
                let guard=CountingGuard::start();
                let held=if mode=="fixed" {
                    let r=fixed(&f);let held=AllocationStats::snapshot();drop(black_box(r));held
                } else {
                    let r=selected(&f);let held=AllocationStats::snapshot();drop(black_box(r));held
                };
                let after=AllocationStats::snapshot();drop(guard);assert_eq!(after.live_bytes,0);
                println!("RETAINED {} {mode} bytes={} peak={} after_drop={}",f.name,held.live_bytes,held.peak_live_bytes,after.live_bytes);
            }
            let mut work=budget();let proof=f.chart.integrate_qr(f.request.clone(),f.options.clone(),&mut work);
            assert!(matches!(proof.status(),QrEvolutionStatus::Completed));
            println!("WORK {} graph={} scalar={} choices={:?}",f.name,work.policy().graph_work-work.remaining_graph_work(),work.policy().scalar_work-work.remaining_scalar_work(),proof.windows().iter().map(|w|w.comparison().unwrap().choice()).collect::<Vec<_>>());
            continue;
        }
'''
assert source.count(needle)==1;source=source.replace(needle,addition+needle)
old=(Path('/tmp/interval-refactor/interface-validation/probe-candidate/src/main.rs')).read_text();allocator=old[old.index('use std::alloc::{GlobalAlloc,Layout,System};'):]
(p/'src/main.rs').write_text(source+'\n'+allocator)
shutil.copy2(r/'crates/hyperdynamics/tests/support/flow_oracles.rs',p/'src/flow_oracles.rs')
(p/'Cargo.toml').write_text('''[package]
name = "qr-evolution-allocation-observer"
version = "0.0.0"
edition = "2024"
[workspace]
[dependencies]
criterion = "0.5"
hyperdynamics = { path = "/mnt/development/csgrs-qr-evolution/crates/hyperdynamics", features = ["qr-evolution"] }
hyperinterval = { path = "/mnt/development/csgrs-qr-evolution/crates/hyperinterval", features = ["hyperreal"] }
hyperlattice-interval = { path = "/mnt/development/csgrs-qr-evolution/crates/hyperlattice-interval", features = ["dyadic"] }
hyperreal = { path = "/mnt/development/csgrs-qr-evolution/crates/hyperreal" }
hypersolve = { path = "/mnt/development/csgrs-qr-evolution/crates/hypersolve" }
''')
shutil.copy2(r/'Cargo.lock',p/'Cargo.lock')
print('observer prepared from complete maintained benchmark and shared exact oracle')
