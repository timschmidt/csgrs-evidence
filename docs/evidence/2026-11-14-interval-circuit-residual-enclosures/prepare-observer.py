from pathlib import Path
import shutil
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-circuit-residual-enclosures');dest=s/'allocation';(dest/'src').mkdir(parents=True)
body=(r/'crates/hypercircuit/benches/interval_residuals.rs').read_text().replace('use std::{hint::black_box, time::Instant};','use std::hint::black_box;')
body=body.replace('let start = Instant::now();','let guard = CountingGuard::start();')
a=body.index('        println!(\n            "{mode}: iterations=');b=body.index('\n    }\n}',a)
body=body[:a]+'''        let stats = AllocationStats::snapshot();
        drop(guard);
        print_row("circuit", mode, iterations as usize, stats);'''+body[b:]
end=body.rfind('\n}')
body=body[:end]+'''
    let mut graph=g(); let mut native=a();
    let gb=graph.remaining_work(); let ab=native.remaining_work();
    let guard=CountingGuard::start();
    let report=program.enclose(&arguments,-16,&mut graph,&mut native).unwrap();
    let retained=AllocationStats::snapshot();
    drop(report);
    let after=AllocationStats::snapshot();drop(guard);
    assert_eq!(after.live_bytes,0);
    println!("RESOURCE query graph={} native={} retained={} peak={} after_drop={}",gb-graph.remaining_work(),ab-native.remaining_work(),retained.live_bytes,retained.peak_live_bytes,after.live_bytes);
    let guard=CountingGuard::start();let prepared=prepare();let retained=AllocationStats::snapshot();drop(prepared);let after=AllocationStats::snapshot();drop(guard);assert_eq!(after.live_bytes,0);
    println!("RESOURCE prepare retained={} peak={} after_drop={}",retained.live_bytes,retained.peak_live_bytes,after.live_bytes);
'''+body[end:]
previous=Path('/tmp/interval-refactor/taylor-model-composition/allocation/src/main.rs').read_text();allocator=previous[previous.index('use std::alloc::'):previous.index('struct Criterion;')]
allocator=allocator[:allocator.index('fn measure<T>')]+allocator[allocator.index('fn print_row'):]
(dest/'src/main.rs').write_text(body+'\n'+allocator)
(dest/'Cargo.toml').write_text(f'''[package]
name="circuit-residual-allocation"
version="0.0.0"
edition="2024"
[workspace]
[dependencies]
hypercircuit={{path="{r}/crates/hypercircuit",features=["interval-residuals"]}}
hypersolve={{path="{r}/crates/hypersolve",features=["interval-lattice"]}}
hyperinterval={{path="{r}/crates/hyperinterval",features=["dyadic"]}}
''')
shutil.copy2(r/'Cargo.lock',dest/'Cargo.lock')
