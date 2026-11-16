#![cfg(feature = "adaptive-taylor")]
use hyperdynamics::field::{
    EnclosedVectorField, EnclosureBudget, EnclosurePolicy, ExpressionField, FieldDefinition,
    FieldError,
    evolution::{EvolutionFailure, EvolutionOptions, EvolutionRequest},
    taylor_flow::{
        FlowTaylorError,
        adaptive::{
            AdaptiveTaylorFailure as Failure, AdaptiveTaylorOptions, AdaptiveTaylorStatus as Status,
        },
    },
};
use hyperinterval::DyadicInterval;
use hyperlattice_interval::BoxN;
use hypersolve::{
    Expr, SymbolId,
    expression_program::{ExpressionBudget, ExpressionError, ExpressionProgram},
};
const T: SymbolId = SymbolId(10);
const X: SymbolId = SymbolId(20);
fn d(l: i64, u: i64, e: i32) -> DyadicInterval {
    DyadicInterval::new(l.into(), u.into(), e).unwrap()
}
fn budget() -> EnclosureBudget {
    EnclosureBudget::new(EnclosurePolicy::default())
}
fn field<const N: usize>(outputs: &[Expr], state: &[SymbolId]) -> ExpressionField<N> {
    let bindings: Vec<_> = state.iter().rev().copied().chain([T]).collect();
    let p = ExpressionProgram::compile(
        outputs,
        &bindings,
        &mut ExpressionBudget::new(1_000_000, 100_000_000),
    )
    .unwrap();
    ExpressionField::from_definition(
        FieldDefinition {
            source: p.definition().clone(),
            time: T,
            state: state.to_vec(),
        },
        &mut budget(),
    )
    .unwrap()
}
fn request<const N: usize>(initial: [DyadicInterval; N]) -> EvolutionRequest<N> {
    EvolutionRequest {
        start: d(0, 0, 0),
        end: d(1, 1, -2),
        initial: BoxN::new(initial).unwrap(),
    }
}
fn options<const N: usize>() -> AdaptiveTaylorOptions<N> {
    AdaptiveTaylorOptions {
        maximum_order: 3,
        remainder_limits: std::array::from_fn(|_| d(1, 1, -10)),
        native: EvolutionOptions {
            maximum_step: Some(d(1, 1, -3)),
            ..Default::default()
        },
        ..Default::default()
    }
}
fn extension<const N: usize>(f: &ExpressionField<N>) {
    for start in 0..=2 {
        let p = f.flow_taylor(start, &mut budget()).unwrap();
        for additional in 0..=2 {
            let extended = p.extend_order(additional, &mut budget()).unwrap();
            let fresh = f.flow_taylor(start + additional, &mut budget()).unwrap();
            assert_eq!(format!("{extended:?}"), format!("{fresh:?}"));
            for (a, b) in p.stages().iter().zip(extended.stages()) {
                assert!(std::ptr::eq(
                    a.program().definition(),
                    b.program().definition()
                ));
            }
            for (a, b) in p.stages().iter().zip(extended.stages()).skip(1) {
                assert!(std::ptr::eq(
                    a.derivatives().unwrap(),
                    b.derivatives().unwrap()
                ));
            }
            if additional == 0 {
                assert!(std::ptr::eq(
                    p.stages().as_ptr(),
                    extended.stages().as_ptr()
                ));
            }
            let lower = extended.restrict_order(start, &mut budget()).unwrap();
            assert_eq!(format!("{lower:?}"), format!("{p:?}"));
        }
    }
}
#[test]
fn incremental_recurrence_equals_fresh_for_all_prefixes_and_dimensions() {
    extension(&field::<1>(&[Expr::int(2)], &[X]));
    let x = Expr::anonymous_symbol(X);
    extension(&field::<1>(&[x.clone() * x], &[X]));
    extension(&field::<1>(
        &[Expr::real(hyperreal::Real::from(2).sqrt().unwrap())],
        &[X],
    ));
    const Y: SymbolId = SymbolId(30);
    extension(&field::<2>(
        &[Expr::anonymous_symbol(Y), -Expr::anonymous_symbol(X)],
        &[X, Y],
    ));
    extension(&field::<0>(&[], &[]));
}
#[test]
fn full_adaptive_proof_histories_match_and_generated_prefixes_share() {
    for rhs in [
        Expr::int(2),
        Expr::anonymous_symbol(X),
        Expr::anonymous_symbol(X).powi(2),
    ] {
        let f = field::<1>(&[rhs], &[X]);
        let c = f.adaptive_taylor(options());
        let req = request([d(1, 1, 0)]);
        let mut independent = budget();
        let expected = c.integrate(req.clone(), &mut independent);
        let mut shared = budget();
        let actual = c.clone().share_preparation().integrate(req, &mut shared);
        let r = actual.report();
        assert!(matches!(r.status(), Status::Completed), "{:?}", r.status());
        assert_eq!(format!("{r:?}"), format!("{expected:?}"));
        assert_eq!(
            independent.remaining_scalar_work(),
            shared.remaining_scalar_work()
        );
        for pair in r.programs().windows(2) {
            for (a, b) in pair[0].stages().iter().zip(pair[1].stages()) {
                assert!(std::ptr::eq(
                    a.program().definition(),
                    b.program().definition()
                ));
                if let (Some(a), Some(b)) = (a.derivatives(), b.derivatives()) {
                    assert!(std::ptr::eq(
                        a.program().definition(),
                        b.program().definition()
                    ));
                }
            }
        }
        if r.programs().len() > 2 {
            assert!(shared.remaining_graph_work() > independent.remaining_graph_work());
        }
    }
}
#[test]
fn lazy_orders_do_not_build_unrequested_maximum() {
    let f = field::<1>(&[Expr::int(0)], &[X]);
    let c = f
        .adaptive_taylor(AdaptiveTaylorOptions {
            maximum_order: usize::MAX - 1,
            ..options()
        })
        .share_preparation();
    let r = c.integrate(request([d(3, 4, 0)]), &mut budget());
    assert!(matches!(r.report().status(), Status::Completed));
    assert_eq!(r.report().programs().len(), 1);
    assert_eq!(r.report().programs()[0].stages().len(), 1);
    assert_eq!(
        r.report().end_enclosure().unwrap().lanes(),
        Some(&[d(3, 4, 0)])
    );
}
#[test]
fn independent_exact_polynomial_endpoints_continue_with_shared_controller() {
    let f = field::<1>(&[Expr::int(2) * Expr::anonymous_symbol(T)], &[X]);
    let c = f
        .adaptive_taylor(AdaptiveTaylorOptions {
            remainder_limits: [d(0, 0, 0)],
            ..options()
        })
        .share_preparation();
    let r = c.integrate(request([d(3, 4, 0)]), &mut budget());
    assert!(matches!(r.report().status(), Status::Completed));
    assert_eq!(
        r.report().end_enclosure().unwrap().lanes(),
        Some(&[d(49, 65, -4)])
    );
    let next = c.integrate(
        EvolutionRequest {
            start: d(1, 1, -2),
            end: d(1, 1, -1),
            initial: r.report().end_enclosure().unwrap().clone(),
        },
        &mut budget(),
    );
    assert!(matches!(next.report().status(), Status::Completed));
    assert_eq!(
        next.report().end_enclosure().unwrap().lanes(),
        Some(&[d(13, 17, -2)])
    );
}
#[test]
fn resource_limits_all_graph_cutoffs_and_retry_preserve_valid_prefixes() {
    let f = field::<1>(&[Expr::int(2)], &[X]);
    let c = f.adaptive_taylor(options()).share_preparation();
    let req = request([d(0, 0, 0)]);
    let mut b = budget();
    let full = c.integrate(req.clone(), &mut b);
    assert!(matches!(full.report().status(), Status::Completed));
    let work = b.policy().graph_work - b.remaining_graph_work();
    let scalar = b.policy().scalar_work - b.remaining_scalar_work();
    let mut exact = EnclosureBudget::new(EnclosurePolicy {
        graph_work: work,
        scalar_work: scalar,
        ..Default::default()
    });
    let r = c.integrate(req.clone(), &mut exact);
    assert!(matches!(r.report().status(), Status::Completed));
    assert_eq!(exact.remaining_graph_work(), 0);
    assert_eq!(exact.remaining_scalar_work(), 0);
    for graph_work in 0..work {
        let r = c.integrate(
            req.clone(),
            &mut EnclosureBudget::new(EnclosurePolicy {
                graph_work,
                ..Default::default()
            }),
        );
        assert!(
            matches!(r.report().status(), Status::Stopped(_)),
            "cutoff{graph_work}"
        );
        assert!(r.report().end_enclosure().is_none());
        for p in r.report().programs() {
            assert_eq!(p.stages().len(), p.order() + 1);
            assert_eq!(p.identity(), f.identity());
        }
    }
    for p in [
        EnclosurePolicy {
            scalar_work: scalar - 1,
            ..Default::default()
        },
        EnclosurePolicy {
            graph_entries: 1,
            ..Default::default()
        },
    ] {
        let r = c.integrate(req.clone(), &mut EnclosureBudget::new(p));
        assert!(matches!(r.report().status(), Status::Stopped(_)));
        assert!(r.report().end_enclosure().is_none());
    }
    let token = hypersolve::work_budget::CancellationToken::new();
    token.cancel();
    let mut stopped = budget();
    stopped.set_cancellation(Some(token));
    let r = c.integrate(req.clone(), &mut stopped);
    assert!(matches!(
        r.report().status(),
        Status::Stopped(Failure::Search(EvolutionFailure::Field(
            FieldError::Expression(ExpressionError::Cancelled)
        )))
    ));
    let retry = c.integrate(req, &mut budget());
    assert_eq!(
        format!("{:?}", retry.report()),
        format!("{:?}", full.report())
    );
}
#[test]
fn extension_overflow_limits_and_failed_attempt_do_not_mutate_input() {
    let p = field::<1>(&[Expr::anonymous_symbol(X)], &[X])
        .flow_taylor(1, &mut budget())
        .unwrap();
    let before = format!("{p:?}");
    let mut b = budget();
    let extended = p.extend_order(2, &mut b).unwrap();
    let work = b.policy().graph_work - b.remaining_graph_work();
    let mut exact = EnclosureBudget::new(EnclosurePolicy {
        graph_work: work,
        ..Default::default()
    });
    assert_eq!(
        format!("{:?}", p.extend_order(2, &mut exact).unwrap()),
        format!("{extended:?}")
    );
    assert_eq!(exact.remaining_graph_work(), 0);
    assert!(matches!(
        p.extend_order(usize::MAX, &mut budget()),
        Err(FlowTaylorError::OrderOverflow)
    ));
    for graph_work in 0..work {
        assert!(
            p.extend_order(
                2,
                &mut EnclosureBudget::new(EnclosurePolicy {
                    graph_work,
                    ..Default::default()
                })
            )
            .is_err()
        );
    }
    let token = hypersolve::work_budget::CancellationToken::new();
    token.cancel();
    let mut b = budget();
    b.set_cancellation(Some(token));
    assert!(matches!(
        p.extend_order(2, &mut b),
        Err(FlowTaylorError::Field(FieldError::Expression(
            ExpressionError::Cancelled
        )))
    ));
    assert_eq!(format!("{p:?}"), before);
    assert_eq!(p.extend_order(2, &mut budget()).unwrap().order(), 3);
}
#[test]
fn quality_domain_invalid_and_empty_outcomes_match_independent() {
    let f = field::<1>(&[Expr::int(2)], &[X]);
    for (o, req) in [
        (
            AdaptiveTaylorOptions {
                maximum_order: 0,
                maximum_quality_halvings: 0,
                remainder_limits: [d(0, 0, 0)],
                ..options()
            },
            request([d(0, 0, 0)]),
        ),
        (
            AdaptiveTaylorOptions {
                minimum_order: 4,
                ..options()
            },
            request([d(0, 0, 0)]),
        ),
        (
            options(),
            EvolutionRequest {
                end: d(-1, -1, 0),
                initial: BoxN::empty().unwrap(),
                ..request([d(0, 0, 0)])
            },
        ),
        (
            options(),
            EvolutionRequest {
                initial: BoxN::empty().unwrap(),
                ..request([d(0, 0, 0)])
            },
        ),
        (
            options(),
            EvolutionRequest {
                end: d(0, 0, 0),
                ..request([d(0, 0, 0)])
            },
        ),
    ] {
        let c = f.adaptive_taylor(o);
        let expected = c.integrate(req.clone(), &mut budget());
        let actual = c.share_preparation().integrate(req, &mut budget());
        assert_eq!(format!("{:?}", actual.report()), format!("{expected:?}"));
    }
    let f = field::<1>(&[Expr::int(0) / Expr::anonymous_symbol(X)], &[X]);
    let c = f.adaptive_taylor(options());
    let req = request([d(0, 0, 0)]);
    let expected = c.integrate(req.clone(), &mut budget());
    let actual = c.share_preparation().integrate(req, &mut budget());
    assert!(matches!(actual.report().status(), Status::Stopped(_)));
    assert_eq!(format!("{:?}", actual.report()), format!("{expected:?}"));
    let c = field::<0>(&[], &[])
        .adaptive_taylor(options())
        .share_preparation();
    let r = c.integrate(request([]), &mut budget());
    assert!(matches!(r.report().status(), Status::Completed));
    assert_eq!(r.report().end_enclosure().unwrap().lanes(), Some(&[]));
}
#[cfg(feature = "serde")]
#[test]
fn fresh_process_replay_retains_shared_strategy() {
    const KEY: &str = "HYPERDYNAMICS_SHARED_PREPARATION_REPLAY";
    if let Ok(encoded) = std::env::var(KEY) {
        let (definition, req): (FieldDefinition, EvolutionRequest<1>) =
            serde_json::from_str(&encoded).unwrap();
        let c = ExpressionField::<1>::from_definition(definition, &mut budget())
            .unwrap()
            .adaptive_taylor(options())
            .share_preparation();
        let mut b = budget();
        let r = c.integrate(req, &mut b);
        assert!(matches!(r.report().status(), Status::Completed));
        println!("REPLAY={r:?}");
        println!(
            "WORK={}:{}",
            b.remaining_graph_work(),
            b.remaining_scalar_work()
        );
        return;
    }
    let f = field::<1>(&[Expr::anonymous_symbol(X)], &[X]);
    let id = f.identity();
    let definition = FieldDefinition {
        source: id.source().clone(),
        time: id.time(),
        state: id.state().to_vec(),
    };
    let encoded = serde_json::to_string(&(definition, request([d(1, 1, 0)]))).unwrap();
    let mut previous = None;
    for _ in 0..3 {
        let out = std::process::Command::new(std::env::current_exe().unwrap())
            .args([
                "--exact",
                "fresh_process_replay_retains_shared_strategy",
                "--nocapture",
            ])
            .env(KEY, &encoded)
            .output()
            .unwrap();
        assert!(out.status.success());
        let text = String::from_utf8(out.stdout).unwrap();
        let value: Vec<_> = text
            .lines()
            .filter(|s| s.starts_with("REPLAY=") || s.starts_with("WORK="))
            .map(str::to_owned)
            .collect();
        assert_eq!(value.len(), 2);
        if let Some(p) = previous.as_ref() {
            assert_eq!(&value, p);
        }
        previous = Some(value);
    }
}
#[path = "../examples/adaptive_shared.rs"]
mod consumer;
#[test]
fn actual_shared_controller_example() {
    consumer::run().unwrap();
}

#[path = "support/flow_oracles.rs"]
mod flow_oracles;
#[test]
fn nonzero_start_order_and_two_state_flow_match_independent_trigonometric_bounds() {
    const Y: SymbolId = SymbolId(30);
    let f = field::<2>(
        &[Expr::anonymous_symbol(Y), -Expr::anonymous_symbol(X)],
        &[X, Y],
    );
    let options = AdaptiveTaylorOptions {
        minimum_order: 1,
        maximum_order: 4,
        remainder_limits: [d(1, 1, -14), d(1, 1, -14)],
        ..options()
    };
    let c = f.adaptive_taylor(options);
    let req = request([d(1, 1, 0), d(0, 0, 0)]);
    let independent = c.integrate(req.clone(), &mut budget());
    let shared = c.share_preparation().integrate(req, &mut budget());
    let r = shared.report();
    assert!(matches!(r.status(), Status::Completed), "{:?}", r.status());
    assert_eq!(format!("{r:?}"), format!("{independent:?}"));
    assert_eq!(r.programs()[0].order(), 1);
    assert!(r.programs().len() > 1);
    let time = hyperreal::Rational::from(1) / hyperreal::Rational::from(4);
    for (lane, sine) in r
        .end_enclosure()
        .unwrap()
        .lanes()
        .unwrap()
        .iter()
        .zip([false, true])
    {
        let (lower, upper) = flow_oracles::alternating_trig(&time, sine);
        let rational = lane
            .to_rational(&mut hyperinterval::DyadicBudget::new(16384, 1_000_000_000))
            .unwrap();
        if sine {
            assert!(rational.contains_point(&(-upper)));
            assert!(rational.contains_point(&(-lower)));
        } else {
            assert!(rational.contains_point(&lower));
            assert!(rational.contains_point(&upper));
        }
    }
}
