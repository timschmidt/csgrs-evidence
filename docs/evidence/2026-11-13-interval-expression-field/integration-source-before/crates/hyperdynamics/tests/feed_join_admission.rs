use hyperdynamics::{
    AccelerationLimitedFeedProfileClass, ClassifiedJoin, CornerLookaheadJoinClass, DynamicsError,
    JoinSpan, LookaheadFeedPlanningLimits, MetricSpan, SpanDynamicsClass,
    certify_acceleration_limited_feed_time, certify_constant_feed_time,
    certify_symmetric_jerk_limited_feed_time, plan_jerk_feasible_lookahead_schedule,
    plan_lookahead_feed_schedule,
};
use hyperlimit::PredicatePolicy;
use hyperreal::Real;

struct Span(Real);
impl MetricSpan for Span {
    fn exact_length(&self, _: PredicatePolicy) -> Result<Real, DynamicsError> {
        Ok(self.0.clone())
    }
    fn dynamics_class(&self) -> SpanDynamicsClass {
        SpanDynamicsClass::Affine
    }
}
#[derive(Clone, Debug, PartialEq)]
struct Receipt {
    incoming: u32,
    outgoing: u32,
}
struct Join(u32);
impl JoinSpan for Join {
    type Receipt = Receipt;
    fn classify_join(&self, outgoing: &Self, _: PredicatePolicy) -> ClassifiedJoin<Receipt> {
        ClassifiedJoin {
            classification: Ok(CornerLookaheadJoinClass::StraightThrough),
            receipt: Receipt {
                incoming: self.0,
                outgoing: outgoing.0,
            },
        }
    }
}

#[test]
fn independent_feed_equations_need_no_geometry_dependency() {
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
        let route = [Span(2.into()), Span(2.into())];
        let constant = certify_constant_feed_time(&route, 2.into(), 2.into(), policy).unwrap();
        assert_eq!(constant.path_length, Real::from(4));
        assert!(constant.certification.all_satisfied());
        let acceleration =
            certify_acceleration_limited_feed_time(&route, 10.into(), 1.into(), 4.into(), policy)
                .unwrap();
        assert_eq!(
            acceleration.profile,
            AccelerationLimitedFeedProfileClass::Triangular
        );
        assert!(acceleration.certification.all_satisfied());
        let jerk = certify_symmetric_jerk_limited_feed_time(
            &route,
            4.into(),
            2.into(),
            2.into(),
            4.into(),
            policy,
        )
        .unwrap();
        assert_eq!(jerk.peak_feed_rate, Real::from(2));
        assert_eq!(jerk.peak_acceleration, Real::from(2));
        assert!(jerk.certification.all_satisfied());
    }
}

#[test]
fn independent_reachability_halving_and_receipt_transport() {
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
        let route = [Span(2.into()), Span(2.into())];
        let joins = [Join(17), Join(29)];
        let limits = LookaheadFeedPlanningLimits {
            maximum_entry_feed: 0.into(),
            maximum_corner_feeds: vec![10.into()],
            corner_radii: vec![0.into()],
            maximum_exit_feed: 0.into(),
        };
        let acceleration =
            plan_lookahead_feed_schedule(&route, &joins, &limits, 10.into(), 1.into(), policy)
                .unwrap();
        assert!(acceleration.all_satisfied());
        assert_eq!(acceleration.schedule.corner_feeds, vec![Real::from(2)]);
        assert_eq!(
            acceleration.certification.corners.joins[0].tangent_join,
            Receipt {
                incoming: 17,
                outgoing: 29
            }
        );
        let jerk = plan_jerk_feasible_lookahead_schedule(
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
        assert!(jerk.all_satisfied());
        assert_eq!(jerk.schedule.corner_feeds, vec![Real::from(1)]);
        assert_eq!(jerk.positive_node_components[0].uniform_halvings, 1);
        assert_eq!(
            jerk.lookahead_certification.corners.joins[0].tangent_join,
            Receipt {
                incoming: 17,
                outgoing: 29
            }
        );
    }
}

use std::{cell::RefCell, rc::Rc};
type Queries = Rc<RefCell<Vec<(&'static str, PredicatePolicy)>>>;
struct ObservedSpan {
    name: &'static str,
    length: Result<Real, DynamicsError>,
    queries: Queries,
}
impl MetricSpan for ObservedSpan {
    fn exact_length(&self, policy: PredicatePolicy) -> Result<Real, DynamicsError> {
        self.queries.borrow_mut().push((self.name, policy));
        self.length.clone()
    }
    fn dynamics_class(&self) -> SpanDynamicsClass {
        SpanDynamicsClass::General
    }
}
struct ObservedJoin {
    queries: Queries,
    invalid: bool,
}
impl JoinSpan for ObservedJoin {
    type Receipt = Receipt;
    fn classify_join(&self, _: &Self, policy: PredicatePolicy) -> ClassifiedJoin<Receipt> {
        self.queries.borrow_mut().push(("join", policy));
        ClassifiedJoin {
            classification: if self.invalid {
                Err(DynamicsError::UnsupportedRouteGeometry)
            } else {
                Ok(CornerLookaheadJoinClass::StraightThrough)
            },
            receipt: Receipt {
                incoming: 17,
                outgoing: 29,
            },
        }
    }
}

#[test]
fn metric_and_join_queries_preserve_guard_replay_and_failure_order() {
    use hyperdynamics::{LookaheadFeedSchedule, certify_lookahead_feed_schedule};
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
        let queries: Queries = Rc::default();
        let mut route = [
            ObservedSpan {
                name: "length0",
                length: Ok(2.into()),
                queries: queries.clone(),
            },
            ObservedSpan {
                name: "length1",
                length: Ok(2.into()),
                queries: queries.clone(),
            },
        ];
        let mut joins = [
            ObservedJoin {
                queries: queries.clone(),
                invalid: false,
            },
            ObservedJoin {
                queries: queries.clone(),
                invalid: false,
            },
        ];
        let limits = LookaheadFeedPlanningLimits {
            maximum_entry_feed: 0.into(),
            maximum_corner_feeds: vec![10.into()],
            corner_radii: vec![0.into()],
            maximum_exit_feed: 0.into(),
        };
        assert_eq!(
            certify_constant_feed_time(&route, (-1).into(), 1.into(), policy).unwrap_err(),
            DynamicsError::NegativeFeedRate
        );
        assert!(queries.borrow().is_empty());
        assert!(
            plan_lookahead_feed_schedule(&route, &joins, &limits, 10.into(), 1.into(), policy)
                .unwrap()
                .all_satisfied()
        );
        assert_eq!(
            *queries.borrow(),
            ["length0", "length1", "join", "join", "length0", "length1"].map(|name| (name, policy))
        );
        queries.borrow_mut().clear();
        joins[0].invalid = true;
        assert_eq!(
            plan_lookahead_feed_schedule(&route, &joins, &limits, 10.into(), 1.into(), policy)
                .unwrap_err(),
            DynamicsError::UnsupportedRouteGeometry
        );
        assert_eq!(
            *queries.borrow(),
            ["length0", "length1", "join"].map(|name| (name, policy))
        );
        queries.borrow_mut().clear();
        let schedule = LookaheadFeedSchedule {
            entry_feed: 0.into(),
            corner_feeds: vec![1.into()],
            corner_radii: vec![0.into()],
            exit_feed: 0.into(),
        };
        assert_eq!(
            certify_lookahead_feed_schedule(&route, &joins, &schedule, 10.into(), 1.into(), policy)
                .unwrap_err(),
            DynamicsError::UnsupportedRouteGeometry
        );
        assert_eq!(*queries.borrow(), vec![("join", policy)]);
        queries.borrow_mut().clear();
        route[0].length = Err(DynamicsError::UnsupportedRouteGeometry);
        assert_eq!(
            certify_constant_feed_time(&route, 1.into(), 4.into(), policy).unwrap_err(),
            DynamicsError::UnsupportedRouteGeometry
        );
        assert_eq!(*queries.borrow(), vec![("length0", policy)]);
    }
}

#[test]
fn empty_shape_and_explicit_component_bound_remain_distinct_failures() {
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
        let empty: [Span; 0] = [];
        let no_joins: [Join; 0] = [];
        let empty_limits = LookaheadFeedPlanningLimits {
            maximum_entry_feed: 0.into(),
            maximum_corner_feeds: vec![],
            corner_radii: vec![],
            maximum_exit_feed: 0.into(),
        };
        assert_eq!(
            plan_lookahead_feed_schedule(
                &empty,
                &no_joins,
                &empty_limits,
                (-1).into(),
                1.into(),
                policy
            )
            .unwrap_err(),
            DynamicsError::EmptyRoute
        );
        assert_eq!(
            plan_jerk_feasible_lookahead_schedule(
                &empty,
                &no_joins,
                &empty_limits,
                1.into(),
                1.into(),
                0.into(),
                0,
                policy
            )
            .unwrap_err(),
            DynamicsError::ZeroJerk
        );

        assert_eq!(
            certify_constant_feed_time(&empty, (-1).into(), (-1).into(), policy).unwrap_err(),
            DynamicsError::EmptyRoute
        );
        let route = [Span(2.into()), Span(2.into())];
        let joins = [Join(17), Join(29)];
        let limits = LookaheadFeedPlanningLimits {
            maximum_entry_feed: 0.into(),
            maximum_corner_feeds: vec![10.into()],
            corner_radii: vec![0.into()],
            maximum_exit_feed: 0.into(),
        };
        assert_eq!(
            plan_jerk_feasible_lookahead_schedule(
                &route,
                &joins,
                &limits,
                10.into(),
                1.into(),
                10.into(),
                0,
                policy
            )
            .unwrap_err(),
            DynamicsError::JerkRefinementBudgetExceeded
        );
        assert!(
            plan_jerk_feasible_lookahead_schedule(
                &route,
                &joins,
                &limits,
                10.into(),
                1.into(),
                10.into(),
                1,
                policy
            )
            .unwrap()
            .all_satisfied()
        );
    }
}
