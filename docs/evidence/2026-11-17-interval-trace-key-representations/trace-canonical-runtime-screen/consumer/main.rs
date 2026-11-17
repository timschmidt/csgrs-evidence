use hyperreal::dispatch_trace as trace;
use std::fmt::Write;
use std::hint::black_box;
use std::time::Instant;

fn cpu_ns(resolution: bool) -> u128 {
    let mut value = std::mem::MaybeUninit::<libc::timespec>::uninit();
    // SAFETY: both clock calls initialize value on successful return.
    let status = unsafe {
        if resolution {
            libc::clock_getres(libc::CLOCK_PROCESS_CPUTIME_ID, value.as_mut_ptr())
        } else {
            libc::clock_gettime(libc::CLOCK_PROCESS_CPUTIME_ID, value.as_mut_ptr())
        }
    };
    assert_eq!(status, 0);
    // SAFETY: the successful clock call initialized value.
    let value = unsafe { value.assume_init() };
    u128::try_from(value.tv_sec).unwrap() * 1_000_000_000 + u128::try_from(value.tv_nsec).unwrap()
}

fn main() {
    let args: Vec<_> = std::env::args().collect();
    assert_eq!(args.len(), 4);
    let length: usize = args[1].parse().unwrap();
    let identities: usize = args[2].parse().unwrap();
    let active = match args[3].as_str() {
        "active" => true,
        "passive" => false,
        _ => panic!("mode"),
    };
    assert!([5, 64, 4096, 32768].contains(&length));
    assert!([1, 2].contains(&identities));
    let paths: Vec<&'static str> = (0..identities)
        .map(|_| &*Box::leak("x".repeat(length).into_boxed_str()))
        .collect();
    if identities == 2 {
        assert_eq!(paths[0], paths[1]);
        assert_ne!(paths[0].as_ptr(), paths[1].as_ptr());
    }
    let resolution = cpu_ns(true);
    let wall_start = Instant::now();
    let start = cpu_ns(false);
    let mut output = String::new();
    for round in 0..4 {
        trace::reset();
        let guard = active.then(trace::recording_scope);
        for index in 0..4096 {
            trace::record(
                black_box("layer"),
                black_box("operation"),
                black_box(paths[index % identities]),
            );
        }
        let report = trace::take();
        assert_eq!(report.len(), usize::from(active));
        for entry in &report {
            assert_eq!(entry.layer, "layer");
            assert_eq!(entry.operation, "operation");
            assert_eq!(entry.path, paths[0]);
            assert_eq!(entry.count, 4096);
            writeln!(
                output,
                "ROW {round} {}|{}|{}|{}",
                entry.layer, entry.operation, entry.path, entry.count
            )
            .unwrap();
        }
        assert!(trace::snapshot().is_empty());
        drop(report);
        drop(guard);
    }
    trace::reset();
    let elapsed = cpu_ns(false) - start;
    let wall = wall_start.elapsed().as_nanos();
    println!("CONFIG {length} {identities} {} 4 4096", args[3]);
    println!("CPU_NS {elapsed}");
    println!("WALL_NS {wall}");
    println!("CLOCK_RESOLUTION_NS {resolution}");
    print!("{output}");
    println!("COMPLETE");
}
