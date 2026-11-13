//! Source failures survive native scheduling without requiring Clone or flattening.
use hyperdynamics::{
    ClassifiedJoin, CornerLookaheadJoinClass, DynamicsError, JoinSpan, LookaheadFeedPlanningLimits,
    MetricSpan, SpanDynamicsClass, certify_constant_feed_time, certify_corner_lookahead_limits,
    certify_lookahead_feed_schedule, plan_jerk_feasible_lookahead_schedule,
    plan_lookahead_feed_schedule, plan_monotonic_jerk_transition,
};
use hyperlimit::PredicatePolicy;
use hyperreal::Real;
use std::{error::Error, fmt, sync::Arc};

#[derive(Debug)]
struct Cause(u64);
impl fmt::Display for Cause {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "source {}", self.0)
    }
}
impl Error for Cause {}

#[derive(Debug)]
enum JoinFailure {
    Native(DynamicsError),
    Source(Arc<Cause>),
}
impl From<DynamicsError> for JoinFailure {
    fn from(error: DynamicsError) -> Self {
        Self::Native(error)
    }
}
impl fmt::Display for JoinFailure {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{self:?}")
    }
}
impl Error for JoinFailure {
    fn source(&self) -> Option<&(dyn Error + 'static)> {
        Some(match self {
            Self::Native(error) => error,
            Self::Source(cause) => cause.as_ref(),
        })
    }
}

#[derive(Debug)]
enum ProviderFailure {
    Native(DynamicsError),
    Metric(Arc<Cause>),
    Join(JoinFailure),
}
impl From<DynamicsError> for ProviderFailure {
    fn from(error: DynamicsError) -> Self {
        Self::Native(error)
    }
}
impl From<JoinFailure> for ProviderFailure {
    fn from(error: JoinFailure) -> Self {
        Self::Join(error)
    }
}
impl PartialEq<DynamicsError> for ProviderFailure {
    fn eq(&self, other: &DynamicsError) -> bool {
        match self {
            Self::Native(error) | Self::Join(JoinFailure::Native(error)) => error == other,
            Self::Metric(_) | Self::Join(JoinFailure::Source(_)) => false,
        }
    }
}
impl fmt::Display for ProviderFailure {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{self:?}")
    }
}
impl Error for ProviderFailure {
    fn source(&self) -> Option<&(dyn Error + 'static)> {
        Some(match self {
            Self::Native(error) => error,
            Self::Metric(cause) => cause.as_ref(),
            Self::Join(error) => error,
        })
    }
}

struct Span {
    length: Real,
    failure: Option<Arc<Cause>>,
}
impl MetricSpan for Span {
    type Error = ProviderFailure;
    fn exact_length(&self, _: PredicatePolicy) -> Result<Real, Self::Error> {
        match &self.failure {
            Some(cause) => Err(ProviderFailure::Metric(Arc::clone(cause))),
            None => Ok(self.length.clone()),
        }
    }
    fn dynamics_class(&self) -> SpanDynamicsClass {
        SpanDynamicsClass::Affine
    }
}
struct Join {
    identity: u32,
    failure: Option<Arc<Cause>>,
}
impl JoinSpan for Join {
    type Error = JoinFailure;
    type Receipt = (u32, u32);
    fn classify_join(
        &self,
        outgoing: &Self,
        _: PredicatePolicy,
    ) -> ClassifiedJoin<Self::Receipt, Self::Error> {
        ClassifiedJoin {
            classification: match &self.failure {
                Some(cause) => Err(JoinFailure::Source(Arc::clone(cause))),
                None => Ok(CornerLookaheadJoinClass::StraightThrough),
            },
            receipt: (self.identity, outgoing.identity),
        }
    }
}

#[test]
fn metric_and_join_causes_survive_without_clone_or_flattening() {
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
        let cause = Arc::new(Cause(37));
        let failed = [Span {
            length: 2.into(),
            failure: Some(Arc::clone(&cause)),
        }];
        let limits = LookaheadFeedPlanningLimits {
            maximum_entry_feed: 1.into(),
            maximum_corner_feeds: vec![],
            corner_radii: vec![],
            maximum_exit_feed: 1.into(),
        };
        let joins = [Join {
            identity: 17,
            failure: None,
        }];
        let errors = [
            certify_constant_feed_time(&failed, 1.into(), 2.into(), policy).unwrap_err(),
            plan_monotonic_jerk_transition(
                &failed[0],
                1.into(),
                2.into(),
                10.into(),
                10.into(),
                10.into(),
                policy,
            )
            .unwrap_err(),
            plan_lookahead_feed_schedule(&failed, &joins, &limits, 10.into(), 1.into(), policy)
                .unwrap_err(),
            plan_jerk_feasible_lookahead_schedule(
                &failed,
                &joins,
                &limits,
                10.into(),
                1.into(),
                10.into(),
                4,
                policy,
            )
            .unwrap_err(),
        ];
        for error in errors {
            assert!(error != DynamicsError::JerkProposalUncertified);
            assert_eq!(error.source().unwrap().to_string(), "source 37");
            let ProviderFailure::Metric(actual) = error else {
                panic!("metric cause flattened")
            };
            assert!(Arc::ptr_eq(&actual, &cause));
        }
        let route = [
            Span {
                length: 2.into(),
                failure: None,
            },
            Span {
                length: 2.into(),
                failure: None,
            },
        ];
        let joins = [
            Join {
                identity: 17,
                failure: Some(Arc::clone(&cause)),
            },
            Join {
                identity: 29,
                failure: None,
            },
        ];
        let limits = LookaheadFeedPlanningLimits {
            maximum_entry_feed: 0.into(),
            maximum_corner_feeds: vec![10.into()],
            corner_radii: vec![0.into()],
            maximum_exit_feed: 0.into(),
        };
        let error =
            plan_lookahead_feed_schedule(&route, &joins, &limits, 10.into(), 1.into(), policy)
                .unwrap_err();
        assert!(error != DynamicsError::JerkProposalUncertified);
        assert_eq!(
            error.source().unwrap().source().unwrap().to_string(),
            "source 37"
        );
        let ProviderFailure::Join(JoinFailure::Source(actual)) = error else {
            panic!("join cause flattened")
        };
        assert!(Arc::ptr_eq(&actual, &cause));
        let error = certify_corner_lookahead_limits(
            &joins,
            1.into(),
            10.into(),
            1.into(),
            1.into(),
            policy,
        )
        .unwrap_err();
        let JoinFailure::Source(actual) = error else {
            panic!("direct join cause flattened")
        };
        assert!(Arc::ptr_eq(&actual, &cause));
    }
}

#[test]
fn wrapped_native_failures_preserve_halving_retry_and_replay() {
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
        let route = [
            Span {
                length: 2.into(),
                failure: None,
            },
            Span {
                length: 2.into(),
                failure: None,
            },
        ];
        let joins = [
            Join {
                identity: 17,
                failure: None,
            },
            Join {
                identity: 29,
                failure: None,
            },
        ];
        let limits = LookaheadFeedPlanningLimits {
            maximum_entry_feed: 0.into(),
            maximum_corner_feeds: vec![10.into()],
            corner_radii: vec![0.into()],
            maximum_exit_feed: 0.into(),
        };
        let error = plan_jerk_feasible_lookahead_schedule(
            &route,
            &joins,
            &limits,
            10.into(),
            1.into(),
            10.into(),
            0,
            policy,
        )
        .unwrap_err();
        assert!(error == DynamicsError::JerkRefinementBudgetExceeded);
        assert!(error != DynamicsError::JerkProposalUncertified);
        let plan = plan_jerk_feasible_lookahead_schedule(
            &route,
            &joins,
            &limits,
            10.into(),
            1.into(),
            10.into(),
            4,
            policy,
        )
        .unwrap();
        assert!(plan.all_satisfied());
        assert_eq!(plan.schedule.corner_feeds, vec![Real::one()]);
        assert_eq!(plan.positive_node_components[0].uniform_halvings, 1);
        assert_eq!(
            plan.lookahead_certification.corners.joins[0].tangent_join,
            (17, 29)
        );
        let replay = certify_lookahead_feed_schedule(
            &route,
            &joins,
            &plan.schedule,
            10.into(),
            1.into(),
            policy,
        )
        .unwrap();
        assert!(replay.all_satisfied());
        assert_eq!(replay.corners.joins[0].tangent_join, (17, 29));
    }
}
