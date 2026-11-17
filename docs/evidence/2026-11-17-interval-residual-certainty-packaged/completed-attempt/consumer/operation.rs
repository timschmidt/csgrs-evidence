struct Input {
    case: usize,
    policy: PredicatePolicy,
    reused: Option<Fixture>,
    generation: Option<u64>,
}
struct Output {
    report: Report,
    all_valid: bool,
    has_invalid: bool,
    trace: Trace,
    owned: Option<Fixture>,
}
fn operation(input: &Input) -> (Report, Option<Fixture>) {
    let owned = input.reused.is_none().then(|| fixture::fixture(input.case));
    let f = input.reused.as_ref().or(owned.as_ref()).unwrap();
    (fixture::operation(input.case, f, input.policy), owned)
}
fn run<const RECORD: bool>(input: &Input) -> Output {
    #[cfg(feature = "trace")]
    hyperreal::dispatch_trace::reset();
    #[cfg(feature = "trace")]
    let (report, owned) = if RECORD {
        hyperreal::dispatch_trace::with_recording(|| operation(input))
    } else {
        operation(input)
    };
    #[cfg(not(feature = "trace"))]
    let (report, owned) = {
        assert!(!RECORD);
        operation(input)
    };
    let all_valid = report.all_satisfied();
    let has_invalid = report.has_violation();
    #[cfg(feature = "trace")]
    let trace = hyperreal::dispatch_trace::take_trace();
    #[cfg(not(feature = "trace"))]
    let trace = ();
    Output {
        report,
        all_valid,
        has_invalid,
        trace,
        owned,
    }
}
fn validate(input: &Input, output: &Output) {
    fixture::validate(input.case, input.policy, &output.report);
    assert_eq!(output.all_valid, output.report.all_satisfied());
    assert_eq!(output.has_invalid, output.report.has_violation());
    if let Some(f) = &input.reused {
        assert_eq!(Some(f.context.generation()), input.generation);
    }
    assert_eq!(output.owned.is_none(), input.reused.is_some());
}
