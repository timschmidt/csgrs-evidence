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
    let args: Vec<_> = std::env::args().skip(1).collect();
    assert_eq!(args.len(), 6);
    let n: usize = args[0].parse().unwrap();
    let groups: usize = args[1].parse().unwrap();
    let length: usize = args[2].parse().unwrap();
    let mode = args[3].as_str();
    let active = match args[4].as_str() {
        "active" => true,
        "passive" => false,
        _ => panic!("trace"),
    };
    let rounds: usize = args[5].parse().unwrap();
    assert!([1, 12, 65, 256, 4096].contains(&n));
    assert!(groups > 0 && groups <= n);
    assert!([5, 256].contains(&length));
    assert!(["snapshot", "take"].contains(&mode));
    assert_eq!(rounds, 1_048_576_usize.div_ceil(n));
    let labels: Vec<&'static str> = (0..n)
        .map(|i| {
            let text = format!("p{:04}{}", i % groups, "x".repeat(length - 5));
            &*Box::leak(text.into_boxed_str())
        })
        .collect();
    for pair in labels.windows(2) {
        assert_ne!(pair[0].as_ptr(), pair[1].as_ptr());
    }
    let expected: Vec<_> = (0..groups)
        .map(|i| (labels[i], (i..n).step_by(groups).count() as u64))
        .collect();
    let resolution = cpu_ns(true);
    let wall_start = Instant::now();
    let start = cpu_ns(false);
    let mut output = String::new();
    for _ in 0..rounds {
        trace::reset();
        let guard = active.then(trace::recording_scope);
        for path in &labels {
            trace::record(black_box("pilot"), black_box("count"), black_box(path));
        }
        let report = match mode {
            "snapshot" => trace::snapshot(),
            "take" => trace::take(),
            _ => unreachable!(),
        };
        output.clear();
        assert_eq!(report.len(), if active { groups } else { 0 });
        for (row, (path, count)) in report.iter().zip(&expected) {
            assert_eq!(row.layer, "pilot");
            assert_eq!(row.operation, "count");
            assert_eq!(row.path, *path);
            assert_eq!(row.count, *count);
            writeln!(
                output,
                "ROW {}|{}|{}|{}",
                row.layer, row.operation, row.path, row.count
            )
            .unwrap();
        }
        if mode == "take" {
            assert!(trace::snapshot().is_empty());
        }
        drop(report);
        trace::reset();
        assert!(trace::snapshot().is_empty());
        drop(guard);
    }
    let elapsed = cpu_ns(false) - start;
    let wall = wall_start.elapsed().as_nanos();
    println!("CONFIG {}", args.join(" "));
    println!("CPU_NS {elapsed}");
    println!("WALL_NS {wall}");
    println!("CLOCK_RESOLUTION_NS {resolution}");
    print!("{output}");
    println!("COMPLETE {rounds}");
}
