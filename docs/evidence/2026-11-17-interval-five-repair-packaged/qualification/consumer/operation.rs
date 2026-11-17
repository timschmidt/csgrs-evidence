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
