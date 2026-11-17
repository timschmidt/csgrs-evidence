mod allocation;
mod fixture;

use hyperlimit::PredicatePolicy;

#[cfg(feature = "trace")]
type Trace = hyperreal::dispatch_trace::TraceSnapshot;
#[cfg(not(feature = "trace"))]
type Trace = ();

fn run<const RECORD: bool>(
    input: &fixture::Fixture,
    policy: PredicatePolicy,
) -> (fixture::ChainOutput, Trace) {
    #[cfg(feature = "trace")]
    hyperreal::dispatch_trace::reset();
    let operation = || fixture::operation(input, policy);
    #[cfg(feature = "trace")]
    let output = if RECORD {
        hyperreal::dispatch_trace::with_recording(operation)
    } else {
        operation()
    };
    #[cfg(not(feature = "trace"))]
    let output = {
        assert!(!RECORD);
        operation()
    };
    #[cfg(feature = "trace")]
    let trace = hyperreal::dispatch_trace::take_trace();
    #[cfg(not(feature = "trace"))]
    let trace = ();
    (output, trace)
}

fn measure<const RECORD: bool>(case: usize, policy: PredicatePolicy, cycles: usize) {
    let (input, setup) = allocation::observe(|| fixture::fixture(case));
    let generation = input.context.generation();
    println!("SETUP {:?} {:?}", setup.values(), setup.usable());
    for cycle in 0..cycles {
        let ((output, trace), stats) = allocation::observe(|| run::<RECORD>(&input, policy));
        fixture::validate(case, policy, &output);
        assert_eq!(input.context.generation(), generation);
        println!("OUTPUT {cycle} {output:?}");
        println!("TRACE {cycle} {trace:?}");
        let (_, cleanup) = allocation::observe(|| drop((output, trace)));
        println!(
            "CYCLE {cycle} {:?} {:?} {:?} {:?}",
            stats.values(),
            stats.usable(),
            cleanup.values(),
            cleanup.usable()
        );
    }
    let (_, teardown) = allocation::observe(|| drop(input));
    println!("TEARDOWN {:?} {:?}", teardown.values(), teardown.usable());
}

fn main() {
    let args: Vec<_> = std::env::args().skip(1).collect();
    assert_eq!(args.len(), 4);
    let case = args[0].parse().unwrap();
    let policy = match args[1].as_str() {
        "strict" => PredicatePolicy::STRICT,
        "approx" => PredicatePolicy::APPROXIMATE_512,
        _ => panic!("policy"),
    };
    let cycles: usize = args[3].parse().unwrap();
    assert_eq!(cycles, 32);
    match args[2].as_str() {
        #[cfg(feature = "trace")]
        "active" => measure::<true>(case, policy, cycles),
        "passive" => measure::<false>(case, policy, cycles),
        _ => panic!("trace"),
    }
}
