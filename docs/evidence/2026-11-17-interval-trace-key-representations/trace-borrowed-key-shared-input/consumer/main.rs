mod allocation;
use trace_shared_input::{candidate, control};

macro_rules! exercise {
    ($module:ident, $name:expr, $labels:expr, $layer:expr, $operation:expr, $groups:expr, $mode:expr, $warm:expr) => {{
        let record = || {
            $module::reset();
            $module::with_recording(|| {
                for (i, path) in $labels.iter().enumerate() {
                    for _ in 0..1 + i % 3 {
                        $module::record($layer, $operation, path);
                    }
                }
            });
        };
        let collect = || match $mode {
            "snapshot" => $module::snapshot(),
            "take" => $module::take(),
            _ => panic!("mode"),
        };
        for _ in 0..$warm {
            record();
            drop(std::hint::black_box(collect()));
        }
        let (_, recording) = allocation::observe(record);
        let iteration = $module::diagnostic_active_iteration();
        let (output, materialization) = allocation::observe(collect);
        assert_eq!(output.len(), $groups);
        for (group, row) in output.iter().enumerate() {
            assert_eq!(row.layer, $layer);
            assert_eq!(row.operation, $operation);
            assert_eq!(row.path, format!("p{group:04}"));
            let count: u64 = (group..$labels.len())
                .step_by($groups)
                .map(|i| 1 + (i % 3) as u64)
                .sum();
            assert_eq!(row.count, count);
        }
        if $mode == "snapshot" {
            assert_eq!($module::snapshot(), output);
            assert_eq!($module::take(), output);
        } else {
            assert!($module::snapshot().is_empty());
        }
        assert!($module::take().is_empty());
        println!("BEGIN {}", $name);
        println!("ITERATION {iteration:?}");
        println!("OUTPUT {output:?}");
        println!("CAPACITY {}", output.capacity());
        let (_, cleanup) = allocation::observe(|| drop(output));
        for (name, stats) in [
            ("RECORDING", recording),
            ("MATERIALIZATION", materialization),
            ("CLEANUP", cleanup),
        ] {
            println!("{name} {:?}", stats.values());
            println!("{name}_USABLE {:?}", stats.usable());
        }
        iteration
    }};
}

fn main() {
    let args: Vec<_> = std::env::args().skip(1).collect();
    assert_eq!(args.len(), 5);
    let n: usize = args[0].parse().unwrap();
    let groups: usize = args[1].parse().unwrap();
    let mode = args[2].as_str();
    let warm: usize = args[3].parse().unwrap();
    assert!(n <= 4096 && groups <= n && (n == 0 || groups > 0));
    assert!(warm == 0 || warm == 8);
    let labels: Vec<&'static str> = (0..n)
        .map(|i| &*Box::leak(format!("p{:04}", i % groups).into_boxed_str()))
        .collect();
    let layer: &'static str = Box::leak("pilot".to_owned().into_boxed_str());
    let operation: &'static str = Box::leak("count".to_owned().into_boxed_str());
    let (left, right) = match args[4].as_str() {
        "control-first" => (
            exercise!(
                control, "control", labels, layer, operation, groups, mode, warm
            ),
            exercise!(
                candidate,
                "candidate",
                labels,
                layer,
                operation,
                groups,
                mode,
                warm
            ),
        ),
        "candidate-first" => (
            exercise!(
                candidate,
                "candidate",
                labels,
                layer,
                operation,
                groups,
                mode,
                warm
            ),
            exercise!(
                control, "control", labels, layer, operation, groups, mode, warm
            ),
        ),
        _ => panic!("order"),
    };
    assert_eq!(left, right);
    assert_eq!(left.len(), n);
    println!("IDENTICAL_ITERATION {n}");
    println!("COMPLETE");
}
