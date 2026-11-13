use super::RouteCertificationError;
use crate::segment::LinePathSegment;
use hyperlimit::{PredicatePolicy, Sign, classify_real_sign, compare_reals};
use hyperreal::Real;
use hypersolve::{
    CandidateCertificationReport, Constraint, Expr, Problem, VariableId, certify_candidate,
    context_from_problem,
};
use std::cmp::Ordering;

/// Exact constant-feed time certification report.
///
/// This is the first `hyperpath` feed/speed bridge: retained path geometry
/// supplies an exact axis-aligned length, while `hypersolve` replays the
/// affine residual `path_length - feed_rate * time = 0`. Rich acceleration,
/// jerk, controller blending, and material-process policies remain separate
/// machine-domain models rather than hidden tolerances in path geometry.
#[derive(Clone, Debug)]
pub struct ConstantFeedTimeReport {
    /// Exact retained route length.
    pub path_length: Real,
    /// Exact feed rate supplied to the replay model.
    pub feed_rate: Real,
    /// Exact candidate traversal time.
    pub target_time: Real,
    /// Exact solver replay report for `path_length - feed_rate * time = 0`.
    pub certification: CandidateCertificationReport,
}

/// Exact acceleration-limited feed profile class.
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub enum AccelerationLimitedFeedProfileClass {
    /// The move is too short to reach the requested maximum feed rate.
    Triangular,
    /// The move reaches maximum feed rate for a positive-length cruise span.
    Trapezoidal,
    /// The move reaches maximum feed rate exactly at the accel/decel switch.
    Boundary,
    /// Exact comparison could not choose a retained profile equation.
    Unknown,
}

/// Exact acceleration-limited traversal time certification report.
///
/// This report models a symmetric rest-to-rest speed profile over retained
/// axis-aligned path geometry. It classifies the profile by the exact
/// comparison `acceleration * path_length` against `max_feed^2`; then it
/// replays a denominator-free residual through `hypersolve`. For a triangular
/// profile the residual is `a*t^2 - 4L = 0`; for a trapezoidal profile it is
/// `a*v*t - a*L - v^2 = 0`. Keeping the profile equation explicit separates
/// proposed process parameters from certified path facts. The rest-to-rest speed model is the
/// CAM/feed-rate counterpart of the hodograph-first view in Farouki,
/// *Pythagorean Hodograph Curves* (2008): speed laws are certified algebraic
/// objects, not sampled controller traces.
#[derive(Clone, Debug)]
pub struct AccelerationLimitedFeedTimeReport {
    /// Exact retained route length.
    pub path_length: Real,
    /// Exact maximum feed rate.
    pub max_feed_rate: Real,
    /// Exact positive acceleration limit.
    pub acceleration: Real,
    /// Exact candidate traversal time.
    pub target_time: Real,
    /// Certified profile class used to build the replay residual.
    pub profile: AccelerationLimitedFeedProfileClass,
    /// Exact solver replay report for the selected feed profile equation.
    pub certification: CandidateCertificationReport,
}

pub(super) fn route_axis_length(
    segments: &[LinePathSegment],
    policy: PredicatePolicy,
) -> Option<Real> {
    segments
        .iter()
        .map(|segment| segment.axis_length(policy))
        .try_fold(Real::zero(), |sum, length| {
            length.map(|length| sum + length)
        })
}

pub(super) fn classify_acceleration_limited_profile(
    path_length: &Real,
    max_feed_rate: &Real,
    acceleration: &Real,
    policy: PredicatePolicy,
) -> Option<AccelerationLimitedFeedProfileClass> {
    let accel_distance_product = acceleration.clone() * path_length.clone();
    let feed_squared = max_feed_rate.clone() * max_feed_rate.clone();
    match compare_reals(&accel_distance_product, &feed_squared, policy).value()? {
        Ordering::Less => Some(AccelerationLimitedFeedProfileClass::Triangular),
        Ordering::Equal => Some(AccelerationLimitedFeedProfileClass::Boundary),
        Ordering::Greater => Some(AccelerationLimitedFeedProfileClass::Trapezoidal),
    }
}

pub(super) fn acceleration_limited_feed_time_equation(
    name: impl Into<String>,
    path_length: Real,
    max_feed_rate: Real,
    acceleration: Real,
    time: VariableId,
    profile: AccelerationLimitedFeedProfileClass,
) -> Constraint {
    let time_expr = Expr::symbol(time.into(), "time");
    match profile {
        AccelerationLimitedFeedProfileClass::Triangular => Constraint::equality(
            name,
            Expr::real(acceleration) * time_expr.clone() * time_expr
                - Expr::real(Real::from(4) * path_length),
        ),
        AccelerationLimitedFeedProfileClass::Boundary
        | AccelerationLimitedFeedProfileClass::Trapezoidal => Constraint::equality(
            name,
            Expr::real(acceleration.clone()) * Expr::real(max_feed_rate.clone()) * time_expr
                - Expr::real(acceleration * path_length)
                - Expr::real(max_feed_rate.clone() * max_feed_rate),
        ),
        AccelerationLimitedFeedProfileClass::Unknown => {
            Constraint::equality(name, Expr::real(Real::zero()))
        }
    }
}

/// Certify a constant-feed traversal time for retained axis-aligned geometry.
///
/// The route is measured exactly from retained segment structure, then replayed
/// through [`crate::constant_feed_time_equation`]. This follows Yap's
/// exact-geometric-computation boundary: path objects provide exact facts,
/// solver rows certify continuous parameters, and downstream CAM/export code
/// still owns process-specific feed, acceleration, and controller constraints.
pub fn certify_constant_feed_time(
    route: &[LinePathSegment],
    feed_rate: Real,
    target_time: Real,
    policy: PredicatePolicy,
) -> Result<ConstantFeedTimeReport, RouteCertificationError> {
    if route.is_empty() {
        return Err(RouteCertificationError::EmptyRoute);
    }
    match classify_real_sign(&feed_rate, policy).value() {
        Some(Sign::Negative) => {
            return Err(RouteCertificationError::NegativeFeedRate);
        }
        Some(Sign::Zero) => return Err(RouteCertificationError::ZeroFeedRate),
        Some(Sign::Positive) => {}
        None => return Err(RouteCertificationError::PredicateUnresolved),
    }
    match classify_real_sign(&target_time, policy).value() {
        Some(Sign::Negative) => return Err(RouteCertificationError::NegativeTime),
        Some(Sign::Zero | Sign::Positive) => {}
        None => return Err(RouteCertificationError::PredicateUnresolved),
    }
    let path_length = route_axis_length(route, policy)
        .ok_or(RouteCertificationError::UnsupportedRouteGeometry)?;
    let mut problem = Problem::default();
    let time = problem.add_variable("time", target_time.clone());
    problem.add_constraint(constant_feed_time_equation(
        "constant feed time",
        path_length.clone(),
        feed_rate.clone(),
        time,
    ));
    let analysis = problem.analyze();
    let context = context_from_problem(&problem);
    Ok(ConstantFeedTimeReport {
        path_length,
        feed_rate,
        target_time,
        certification: certify_candidate(&analysis, &context),
    })
}

/// Certify a symmetric acceleration-limited feed traversal time.
///
/// The retained route is measured as exact axis-aligned length. The profile
/// starts and ends at rest and uses a single exact acceleration limit in both
/// directions. If `acceleration * path_length < max_feed_rate^2`, the move is
/// triangular and never cruises. If the comparison is greater, the move has a
/// trapezoidal cruise plateau. Equality is retained as an explicit boundary
/// class. This is process-parameter replay only: controller blending,
/// lookahead, jerk limits, cutter engagement, and material constraints remain
/// separate exact reports before any CAM output is accepted.
pub fn certify_acceleration_limited_feed_time(
    route: &[LinePathSegment],
    max_feed_rate: Real,
    acceleration: Real,
    target_time: Real,
    policy: PredicatePolicy,
) -> Result<AccelerationLimitedFeedTimeReport, RouteCertificationError> {
    if route.is_empty() {
        return Err(RouteCertificationError::EmptyRoute);
    }
    match classify_real_sign(&max_feed_rate, policy).value() {
        Some(Sign::Negative) => {
            return Err(RouteCertificationError::NegativeFeedRate);
        }
        Some(Sign::Zero) => return Err(RouteCertificationError::ZeroFeedRate),
        Some(Sign::Positive) => {}
        None => return Err(RouteCertificationError::PredicateUnresolved),
    }
    match classify_real_sign(&acceleration, policy).value() {
        Some(Sign::Negative) => {
            return Err(RouteCertificationError::NegativeAcceleration);
        }
        Some(Sign::Zero) => {
            return Err(RouteCertificationError::ZeroAcceleration);
        }
        Some(Sign::Positive) => {}
        None => return Err(RouteCertificationError::PredicateUnresolved),
    }
    match classify_real_sign(&target_time, policy).value() {
        Some(Sign::Negative) => return Err(RouteCertificationError::NegativeTime),
        Some(Sign::Zero | Sign::Positive) => {}
        None => return Err(RouteCertificationError::PredicateUnresolved),
    }
    let path_length = route_axis_length(route, policy)
        .ok_or(RouteCertificationError::UnsupportedRouteGeometry)?;
    let profile =
        classify_acceleration_limited_profile(&path_length, &max_feed_rate, &acceleration, policy)
            .ok_or(RouteCertificationError::UnknownFeedProfile)?;
    let mut problem = Problem::default();
    let time = problem.add_variable("time", target_time.clone());
    problem.add_constraint(acceleration_limited_feed_time_equation(
        "acceleration limited feed time",
        path_length.clone(),
        max_feed_rate.clone(),
        acceleration.clone(),
        time,
        profile,
    ));
    let analysis = problem.analyze();
    let context = context_from_problem(&problem);
    Ok(AccelerationLimitedFeedTimeReport {
        path_length,
        max_feed_rate,
        acceleration,
        target_time,
        profile,
        certification: certify_candidate(&analysis, &context),
    })
}

/// Build a linear feed/time residual `path_length - feed_rate * time = 0`.
pub fn constant_feed_time_equation(
    name: impl Into<String>,
    path_length: Real,
    feed_rate: Real,
    time: VariableId,
) -> Constraint {
    Constraint::equality(
        name,
        Expr::real(path_length) - Expr::real(feed_rate) * Expr::symbol(time.into(), "time"),
    )
}

/// Build the four-phase jerk-limited S-curve residual.
///
/// The retained profile is the symmetric rest-to-rest sequence `+j, -j, -j,
/// +j` with equal quarter-duration phases. For total time `T`, path length
/// `L`, and jerk magnitude `j`, exact integration gives `L = j*T^3/32`.
/// Returning the denominator-free residual `j*T^3 - 32*L = 0` keeps the
/// certification in Yap's exact predicate layer and avoids sampled controller
/// traces.
pub fn symmetric_jerk_limited_feed_time_equation(
    name: impl Into<String>,
    path_length: Real,
    jerk: Real,
    time: VariableId,
) -> Constraint {
    let time_expr = Expr::symbol(time.into(), "time");
    Constraint::equality(
        name,
        Expr::real(jerk) * time_expr.clone() * time_expr.clone() * time_expr
            - Expr::real(Real::from(32) * path_length),
    )
}
