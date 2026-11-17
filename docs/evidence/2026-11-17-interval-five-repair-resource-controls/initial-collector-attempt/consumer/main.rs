mod allocation;
mod fixture;
use fixture::Fixture;
use fixture::{ChainOutput, operation};
use hyperlimit::PredicatePolicy;
use std::ffi::c_void;

#[cfg(feature = "trace")]
type Trace = hyperreal::dispatch_trace::TraceSnapshot;
#[cfg(not(feature = "trace"))]
type Trace = ();

unsafe extern "C" {
    fn measure_stack(
        callback: unsafe extern "C" fn(*mut c_void),
        context: *mut c_void,
        warm: i32,
        pattern: u8,
    ) -> usize;
}
struct Input {
    case: usize,
    policy: PredicatePolicy,
    reused: Option<Fixture>,
    generation: Option<u64>,
}
struct Output {
    report: ChainOutput,
    trace: Trace,
    owned: Option<Fixture>,
}
fn operation_with_input(input: &Input) -> (ChainOutput, Option<Fixture>) {
    let owned = input.reused.is_none().then(|| fixture::fixture(input.case));
    let f = input.reused.as_ref().or(owned.as_ref()).unwrap();
    (operation(f, input.policy), owned)
}
fn run<const RECORD: bool>(input: &Input) -> Output {
    #[cfg(feature = "trace")]
    hyperreal::dispatch_trace::reset();
    #[cfg(feature = "trace")]
    let (report, owned) = if RECORD {
        hyperreal::dispatch_trace::with_recording(|| operation_with_input(input))
    } else {
        operation_with_input(input)
    };
    #[cfg(not(feature = "trace"))]
    let (report, owned) = {
        assert!(!RECORD);
        operation_with_input(input)
    };
    #[cfg(feature = "trace")]
    let trace = hyperreal::dispatch_trace::take_trace();
    #[cfg(not(feature = "trace"))]
    let trace = ();
    Output {
        report,
        trace,
        owned,
    }
}
fn validate(input: &Input, output: &Output) {
    fixture::validate(input.case, input.policy, &output.report);
    if let Some(f) = &input.reused {
        assert_eq!(Some(f.context.generation()), input.generation);
    }
    assert_eq!(output.owned.is_none(), input.reused.is_some());
}
struct Context {
    input: Input,
    output: Option<Output>,
}
unsafe extern "C" fn callback<const RECORD: bool>(opaque: *mut c_void) {
    let c = unsafe { &mut *opaque.cast::<Context>() };
    drop(c.output.take());
    c.output = Some(run::<RECORD>(&c.input));
}
unsafe extern "C" fn cleanup(opaque: *mut c_void) {
    let c = unsafe { &mut *opaque.cast::<Context>() };
    drop(c.output.take());
    drop(c.input.reused.take());
}
fn print_output(input: &Input, output: &Output) {
    validate(input, output);
    println!("OUTPUT {:?}", output.report);
    println!("TRACE {:?}", output.trace);
}
fn measure<const RECORD: bool>(input: Input, mode: &str, warm: i32, pattern: u8) {
    if mode == "stack" || mode == "stack-drop" {
        let mut c = Context {
            input,
            output: None,
        };
        if mode == "stack-drop" {
            c.output = Some(run::<RECORD>(&c.input));
            print_output(&c.input, c.output.as_ref().unwrap());
        }
        let stack = unsafe {
            measure_stack(
                if mode == "stack" {
                    callback::<RECORD>
                } else {
                    cleanup
                },
                (&mut c as *mut Context).cast(),
                if mode == "stack" { warm } else { 0 },
                pattern,
            )
        };
        println!("STACK {stack}");
        if mode == "stack" {
            print_output(&c.input, c.output.as_ref().unwrap());
        }
    } else {
        assert_eq!(mode, "observe");
        if warm != 0 {
            for _ in 0..8 {
                drop(std::hint::black_box(run::<RECORD>(&input)));
            }
        }
        let (output, stats) = allocation::observe(|| run::<RECORD>(&input));
        print_output(&input, &output);
        println!("ALLOCATION {:?}", stats.values());
        println!("USABLE {:?}", stats.usable());
        let (_, cleanup) = allocation::observe(|| drop(output));
        println!("CLEANUP {:?}", cleanup.values());
        println!("USABLE_CLEANUP {:?}", cleanup.usable());
        let (_, input_cleanup) = allocation::observe(|| drop(input));
        println!("INPUT_CLEANUP {:?}", input_cleanup.values());
        println!("INPUT_USABLE_CLEANUP {:?}", input_cleanup.usable());
    }
}
fn main() {
    let args: Vec<_> = std::env::args().skip(1).collect();
    assert_eq!(args.len(), 7);
    let case: usize = args[0].parse().unwrap();
    let policy = match args[5].as_str() {
        "strict" => PredicatePolicy::STRICT,
        "approx" => PredicatePolicy::APPROXIMATE_512,
        _ => panic!("policy"),
    };
    let reused = match args[6].as_str() {
        "reuse" => Some(fixture::fixture(case)),
        "rebuild" => None,
        _ => panic!("lifetime"),
    };
    let generation = reused.as_ref().map(|f| f.context.generation());
    let input = Input {
        case,
        policy,
        reused,
        generation,
    };
    let warm: i32 = args[2].parse().unwrap();
    assert!((0..=1).contains(&warm));
    let pattern = args[3].parse().unwrap();
    match args[4].as_str() {
        #[cfg(feature = "trace")]
        "active" => measure::<true>(input, &args[1], warm, pattern),
        "passive" => measure::<false>(input, &args[1], warm, pattern),
        _ => panic!("trace mode"),
    }
}
