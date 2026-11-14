from pathlib import Path
import shutil
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-physics-flow');dest=s/'allocation';(dest/'src').mkdir(parents=True)
body=(r/'crates/hyperphysics/benches/certified_flow.rs').read_text().replace('use std::{hint::black_box, time::Instant};','use std::hint::black_box;').replace('let started = Instant::now();','let guard = CountingGuard::start();')
a=body.index('        let elapsed = started.elapsed();');b=body.index('\n    }\n}',a)
body=body[:a]+'''        let stats = AllocationStats::snapshot();
        drop(guard);
        print_row("physics", mode, iterations as usize, stats);'''+body[b:]
end=body.rfind('\n}')
body=body[:end]+'''
    let mut budget=b();let gb=budget.remaining_graph_work();let sb=budget.remaining_scalar_work();
    let guard=CountingGuard::start();let report=model.certify_step(proposal.clone(),&mut budget);let retained=AllocationStats::snapshot();drop(report);let after=AllocationStats::snapshot();drop(guard);assert_eq!(after.live_bytes,0);
    println!("RESOURCE query graph={} scalar={} retained={} peak={} after_drop={}",gb-budget.remaining_graph_work(),sb-budget.remaining_scalar_work(),retained.live_bytes,retained.peak_live_bytes,after.live_bytes);
    let mut budget=b();let gb=budget.remaining_graph_work();let sb=budget.remaining_scalar_work();
    let guard=CountingGuard::start();let prepared=forces.dynamics(Real::from(2),&mut budget).unwrap();let retained=AllocationStats::snapshot();drop(prepared);let after=AllocationStats::snapshot();drop(guard);assert_eq!(after.live_bytes,0);
    println!("RESOURCE prepare graph={} scalar={} retained={} peak={} after_drop={}",gb-budget.remaining_graph_work(),sb-budget.remaining_scalar_work(),retained.live_bytes,retained.peak_live_bytes,after.live_bytes);
'''+body[end:]
previous=Path('/tmp/interval-refactor/taylor-model-composition/allocation/src/main.rs').read_text();allocator=previous[previous.index('use std::alloc::'):previous.index('struct Criterion;')];allocator=allocator[:allocator.index('fn measure<T>')]+allocator[allocator.index('fn print_row'):]
(dest/'src/main.rs').write_text(body+'\n'+allocator)
(dest/'Cargo.toml').write_text(f'''[package]
name="physics-flow-allocation"
version="0.0.0"
edition="2024"
[workspace]
[dependencies]
hyperphysics={{path="{r}/crates/hyperphysics",features=["certified-flow"]}}
hyperdynamics={{path="{r}/crates/hyperdynamics",features=["field"]}}
hyperinterval={{path="{r}/crates/hyperinterval",features=["dyadic"]}}
hyperlattice-interval={{path="{r}/crates/hyperlattice-interval",features=["dyadic"]}}
''');shutil.copy2(r/'Cargo.lock',dest/'Cargo.lock')
