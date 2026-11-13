use hyperdynamics::{DynamicsError, MetricSpan, SpanDynamicsClass, plan_monotonic_jerk_transition};
use hyperlimit::PredicatePolicy;
use hyperreal::Real;
struct Span(Real);
impl MetricSpan for Span {
    type Error = DynamicsError;
    fn exact_length(&self, _: PredicatePolicy) -> Result<Real, DynamicsError> {
        Ok(self.0.clone())
    }
    fn dynamics_class(&self) -> SpanDynamicsClass {
        SpanDynamicsClass::Affine
    }
}
#[test]
fn a_metric_source_needs_no_geometry_dependency() {
    let plan = plan_monotonic_jerk_transition(
        &Span(6.into()),
        1.into(),
        2.into(),
        10.into(),
        10.into(),
        10.into(),
        PredicatePolicy::STRICT,
    )
    .unwrap();
    assert!(plan.all_satisfied());
    assert_eq!(plan.phases[0].ramp.traversal_time, Real::from(2));
}

use hyperdynamics::{
    JerkRampPhaseProposal, JerkRampSpanProposal, certify_jerk_ramp_feed_schedule,
    certify_multi_phase_jerk_ramp_feed_schedule,
};
use hyperreal::Rational;
use std::cell::RefCell;

fn q(n: i64, d: i64) -> Real {
    Real::new(Rational::new(n) / Rational::new(d))
}

#[test]
fn exact_two_phase_identities_and_unsafe_candidates() {
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
        for (start, end) in [(1, 2), (2, 1), (0, 3), (3, 0), (2, 2)] {
            let span = Span(12.into());
            let plan = plan_monotonic_jerk_transition(
                &span,
                start.into(),
                end.into(),
                10.into(),
                10.into(),
                10.into(),
                policy,
            )
            .unwrap();
            assert!(plan.all_satisfied());
            assert_eq!(plan.phases.len(), 2);
            let [first, second] = plan.phases.as_slice() else {
                unreachable!()
            };
            let time = q(12, start + end);
            assert_eq!(first.ramp.traversal_time, time);
            assert_eq!(second.ramp.traversal_time, time);
            assert_eq!(first.ramp.start_acceleration, Real::zero());
            assert_eq!(second.ramp.end_acceleration, Real::zero());
            assert_eq!(
                first.ramp.end_acceleration,
                q((end - start) * (start + end), 12)
            );
            assert_eq!(second.ramp.start_acceleration, first.ramp.end_acceleration);
            assert_eq!(first.ramp.end_feed, q(start + end, 2));
            assert_eq!(second.ramp.start_feed, first.ramp.end_feed);
            // Independently integrate v(t)=v0+a0*t+j*t^2/2 over each phase.
            for phase in &plan.phases {
                let ramp = &phase.ramp;
                assert_eq!(
                    Real::from(6) * &phase.path_length,
                    Real::from(6) * &ramp.start_feed * &time
                        + (Real::from(2) * &ramp.start_acceleration + &ramp.end_acceleration)
                            * &time
                            * &time
                );
            }
            assert_eq!(&first.path_length + &second.path_length, Real::from(12));
            let mut bad = plan.phases.clone();
            bad[1].ramp.start_feed += Real::one();
            let rejected = certify_multi_phase_jerk_ramp_feed_schedule(
                std::slice::from_ref(&span),
                &[bad],
                10.into(),
                10.into(),
                10.into(),
                policy,
            )
            .unwrap();
            assert!(!rejected.all_satisfied());
            assert!(rejected.elements[0].continuity[0].has_certified_violation());
            let capped = certify_multi_phase_jerk_ramp_feed_schedule(
                &[span],
                &[plan.phases],
                q(1, 2),
                10.into(),
                10.into(),
                policy,
            )
            .unwrap();
            assert!(!capped.all_satisfied());
            assert_eq!(capped.first_unsatisfied_element(), Some(0));
        }
    }
}

struct ObservedSpan {
    length: RefCell<Result<Real, DynamicsError>>,
    queries: RefCell<Vec<PredicatePolicy>>,
}
impl MetricSpan for ObservedSpan {
    type Error = DynamicsError;
    fn exact_length(&self, policy: PredicatePolicy) -> Result<Real, DynamicsError> {
        self.queries.borrow_mut().push(policy);
        self.length.borrow().clone()
    }
    fn dynamics_class(&self) -> SpanDynamicsClass {
        SpanDynamicsClass::General
    }
}

#[test]
fn metric_queries_stay_lazy_and_failed_sources_can_retry() {
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
        let source = ObservedSpan {
            length: RefCell::new(Err(DynamicsError::UnsupportedRouteGeometry)),
            queries: RefCell::new(vec![]),
        };
        let invalid = JerkRampSpanProposal {
            start_feed: 1.into(),
            end_feed: 2.into(),
            start_acceleration: 0.into(),
            end_acceleration: 1.into(),
            traversal_time: 0.into(),
        };
        let single = |proposal| {
            certify_jerk_ramp_feed_schedule(
                std::slice::from_ref(&source),
                &[proposal],
                10.into(),
                10.into(),
                10.into(),
                policy,
            )
        };
        assert_eq!(
            single(invalid.clone()).unwrap_err(),
            DynamicsError::ZeroTime
        );
        assert!(source.queries.borrow().is_empty()); // Single-phase validation precedes the source.
        let multi = certify_multi_phase_jerk_ramp_feed_schedule(
            std::slice::from_ref(&source),
            &[vec![JerkRampPhaseProposal {
                path_length: 6.into(),
                ramp: invalid,
            }]],
            10.into(),
            10.into(),
            10.into(),
            policy,
        );
        assert_eq!(multi.unwrap_err(), DynamicsError::UnsupportedRouteGeometry);
        assert_eq!(*source.queries.borrow(), vec![policy]); // Multi-phase source precedes phase validation.
        source.queries.borrow_mut().clear();
        let plan = |start| {
            plan_monotonic_jerk_transition(
                &source,
                start,
                2.into(),
                10.into(),
                10.into(),
                10.into(),
                policy,
            )
        };
        assert_eq!(
            plan((-1).into()).unwrap_err(),
            DynamicsError::NegativeFeedRate
        );
        assert!(source.queries.borrow().is_empty());
        assert_eq!(
            plan(1.into()).unwrap_err(),
            DynamicsError::UnsupportedRouteGeometry
        );
        assert_eq!(source.queries.borrow().len(), 1);
        *source.length.borrow_mut() = Ok(6.into());
        source.queries.borrow_mut().clear();
        assert!(plan(1.into()).unwrap().all_satisfied());
        assert_eq!(*source.queries.borrow(), vec![policy, policy]); // Construction and independent replay.
    }
}

#[test]
fn public_checks_retain_decision_metadata_on_success_failure_and_unknown() {
    use hyperdynamics::{
        check_nonnegative_feed, check_positive_acceleration, check_positive_feed,
        check_positive_jerk,
    };
    use hyperlimit::{PredicateOutcome, Sign, classify_real_sign};
    let unresolved = (Real::pi() * Real::e()).ln().unwrap()
        - (Real::pi().ln().unwrap() + Real::e().ln().unwrap());
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
        for value in [
            (-1).into(),
            0.into(),
            1.into(),
            Real::from(2).sqrt().unwrap(),
            unresolved.clone(),
        ] {
            for (check, negative, zero) in [
                (
                    check_nonnegative_feed
                        as fn(
                            &Real,
                            PredicatePolicy,
                        )
                            -> PredicateOutcome<Result<(), DynamicsError>>,
                    DynamicsError::NegativeFeedRate,
                    Ok(()),
                ),
                (
                    check_positive_feed,
                    DynamicsError::NegativeFeedRate,
                    Err(DynamicsError::ZeroFeedRate),
                ),
                (
                    check_positive_acceleration,
                    DynamicsError::NegativeAcceleration,
                    Err(DynamicsError::ZeroAcceleration),
                ),
                (
                    check_positive_jerk,
                    DynamicsError::NegativeJerk,
                    Err(DynamicsError::ZeroJerk),
                ),
            ] {
                let expected = match classify_real_sign(&value, policy) {
                    PredicateOutcome::Decided {
                        value: sign,
                        certainty,
                        stage,
                    } => PredicateOutcome::Decided {
                        value: match sign {
                            Sign::Negative => Err(negative),
                            Sign::Zero => zero,
                            Sign::Positive => Ok(()),
                        },
                        certainty,
                        stage,
                    },
                    PredicateOutcome::Unknown { needed, stage } => {
                        PredicateOutcome::Unknown { needed, stage }
                    }
                };
                assert_eq!(check(&value, policy), expected);
            }
        }
    }
}
