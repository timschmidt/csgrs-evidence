mod allocation;
use hyperreal::dispatch_trace::{self as trace, DispatchCount};

fn record(labels: &[&'static str]) {
    trace::reset();
    trace::with_recording(|| {
        for (i, path) in labels.iter().enumerate() {
            for _ in 0..1 + i % 3 {
                trace::record("pilot", "count", path);
            }
        }
    });
}
fn collect(mode: &str) -> Vec<DispatchCount> {
    match mode {
        "snapshot" => trace::snapshot(),
        "take" => trace::take(),
        _ => panic!("mode"),
    }
}
fn main() {
    let args: Vec<_> = std::env::args().skip(1).collect();
    assert_eq!(args.len(), 4);
    let n: usize = args[0].parse().unwrap();
    let groups: usize = args[1].parse().unwrap();
    let mode = &args[2];
    let warm: usize = args[3].parse().unwrap();
    assert!(n <= 4096 && groups <= n && (n == 0 || groups > 0));
    assert!(warm == 0 || warm == 8);
    let (labels, setup) = allocation::observe(|| {
        (0..n)
            .map(|i| {
                let text = format!("p{:04}", i % groups);
                &*Box::leak(text.into_boxed_str())
            })
            .collect::<Vec<&'static str>>()
    });
    for pair in labels.windows(2) {
        assert!(!std::ptr::eq(pair[0], pair[1]));
    }
    let mut expected = vec![0u64; groups];
    for i in 0..n {
        expected[i % groups] += 1 + (i % 3) as u64;
    }
    for _ in 0..warm {
        record(&labels);
        drop(std::hint::black_box(collect(mode)));
    }
    let (_, recording) = allocation::observe(|| record(&labels));
    let (output, materialization) = allocation::observe(|| collect(mode));
    assert_eq!(output.len(), groups);
    for (group, (row, count)) in output.iter().zip(&expected).enumerate() {
        assert_eq!(row.layer, "pilot");
        assert_eq!(row.operation, "count");
        assert_eq!(row.path, format!("p{group:04}"));
        assert_eq!(row.count, *count);
    }
    if mode == "snapshot" {
        assert_eq!(trace::snapshot(), output);
        assert_eq!(trace::take(), output);
    } else {
        assert!(trace::snapshot().is_empty());
    }
    assert!(trace::take().is_empty());
    println!("OUTPUT {output:?}");
    let capacity = output.capacity();
    let (_, cleanup) = allocation::observe(|| drop(output));
    let (_, label_cleanup) = allocation::observe(|| drop(labels));
    println!("CAPACITY {capacity}");
    for (name, stats) in [
        ("SETUP", setup),
        ("RECORDING", recording),
        ("MATERIALIZATION", materialization),
        ("CLEANUP", cleanup),
        ("LABEL_CLEANUP", label_cleanup),
    ] {
        println!("{name} {:?}", stats.values());
        println!("{name}_USABLE {:?}", stats.usable());
    }
}
