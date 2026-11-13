//! A standalone exact provider: contiguous increasing one-dimensional spans.
use hyperdynamics::{
    ClassifiedJoin, CornerLookaheadJoinClass, DynamicsError, JoinSpan, LookaheadFeedPlanningLimits,
    MetricSpan, SpanDynamicsClass, plan_jerk_feasible_lookahead_schedule,
};
use hyperlimit::{PredicateOutcome, PredicatePolicy, compare_reals};
use hyperreal::Real;
use std::cmp::Ordering;

struct IncreasingLine {
    start: Real,
    end: Real,
}
impl IncreasingLine {
    fn from_integers(start: i64, end: i64) -> Option<Self> {
        (start < end).then(|| Self {
            start: start.into(),
            end: end.into(),
        })
    }
}
impl MetricSpan for IncreasingLine {
    type Error = DynamicsError;
    fn exact_length(&self, _: PredicatePolicy) -> Result<Real, DynamicsError> {
        Ok(&self.end - &self.start)
    }
    fn dynamics_class(&self) -> SpanDynamicsClass {
        SpanDynamicsClass::Affine
    }
}
impl JoinSpan for IncreasingLine {
    type Error = DynamicsError;
    type Receipt = PredicateOutcome<Ordering>;
    fn classify_join(
        &self,
        outgoing: &Self,
        policy: PredicatePolicy,
    ) -> ClassifiedJoin<Self::Receipt> {
        // The constructor establishes increasing direction for both spans.
        // Preserve the entire endpoint decision, including its certainty/stage.
        let receipt = compare_reals(&self.end, &outgoing.start, policy);
        let classification = match receipt.value() {
            Some(Ordering::Equal) => Ok(CornerLookaheadJoinClass::StraightThrough),
            Some(Ordering::Less | Ordering::Greater) => {
                Err(DynamicsError::UnsupportedRouteGeometry)
            }
            None => Err(DynamicsError::PredicateUnresolved),
        };
        ClassifiedJoin {
            classification,
            receipt,
        }
    }
}
fn main() -> Result<(), DynamicsError> {
    let spans = [
        IncreasingLine::from_integers(0, 2).unwrap(),
        IncreasingLine::from_integers(2, 4).unwrap(),
    ];
    let limits = LookaheadFeedPlanningLimits {
        maximum_entry_feed: 0.into(),
        maximum_corner_feeds: vec![10.into()],
        corner_radii: vec![0.into()],
        maximum_exit_feed: 0.into(),
    };
    let plan = plan_jerk_feasible_lookahead_schedule(
        &spans,
        &spans,
        &limits,
        10.into(),
        1.into(),
        10.into(),
        4,
        PredicatePolicy::STRICT,
    )?;
    assert!(plan.all_satisfied());
    assert_eq!(plan.schedule.corner_feeds, vec![Real::one()]);
    println!("{:?}", plan);
    Ok(())
}
