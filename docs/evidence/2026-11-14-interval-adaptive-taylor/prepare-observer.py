from pathlib import Path
import shutil
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-adaptive-taylor');dest=s/'allocation';(dest/'src').mkdir(parents=True)
body=(r/'crates/hyperdynamics/benches/adaptive_taylor.rs').read_text().replace('use std::{hint::black_box, time::Instant};','use std::hint::black_box;').replace('let started = Instant::now();','let guard = CountingGuard::start();')
a=body.index('            let elapsed = started.elapsed();');b=body.index('\n        }\n    }\n}',a)
body=body[:a]+'''            let stats = AllocationStats::snapshot();drop(guard);print_row(name,mode,iterations as usize,stats);'''+body[b:]
point=body.rfind('\n    }\n}')
extra='''
        for mode in ["fixed3", "adaptive"] {
            let mut work=budget();let graph=work.remaining_graph_work();let scalar=work.remaining_scalar_work();
            let guard=CountingGuard::start();
            let retained;
            if mode=="fixed3" {
                let report=f.flow_taylor(3,&mut work).unwrap().integrate(request.clone(),native.clone(),&mut work);
                retained=AllocationStats::snapshot();drop(report);
            } else {
                let report=controller.integrate(request.clone(),&mut work);
                retained=AllocationStats::snapshot();drop(report);
            }
            let after=AllocationStats::snapshot();drop(guard);assert_eq!(after.live_bytes,0);
            println!("RESOURCE {name}/{mode} graph={} scalar={} retained={} peak={} after_drop={}",graph-work.remaining_graph_work(),scalar-work.remaining_scalar_work(),retained.live_bytes,retained.peak_live_bytes,after.live_bytes);
        }
'''
body=body[:point]+extra+body[point:]
previous=Path('/tmp/interval-refactor/taylor-model-composition/allocation/src/main.rs').read_text();allocator=previous[previous.index('use std::alloc::'):previous.index('struct Criterion;')];allocator=allocator[:allocator.index('fn measure<T>')]+allocator[allocator.index('fn print_row'):]
(dest/'src/main.rs').write_text(body+'\n'+allocator)
(dest/'Cargo.toml').write_text(f'''[package]
name="adaptive-taylor-allocation"
version="0.0.0"
edition="2024"
[workspace]
[dependencies]
hyperdynamics={{path="{r}/crates/hyperdynamics",features=["adaptive-taylor","taylor-evolution"]}}
hyperreal={{path="{r}/crates/hyperreal"}}
hypersolve={{path="{r}/crates/hypersolve"}}
hyperinterval={{path="{r}/crates/hyperinterval",features=["dyadic"]}}
hyperlattice-interval={{path="{r}/crates/hyperlattice-interval",features=["dyadic"]}}
''');shutil.copy2(r/'Cargo.lock',dest/'Cargo.lock')
