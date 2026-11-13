//! Exact feed-profile and corner-speed replay over retained metric inputs.
use crate::guards::{
    require_nonnegative_feed, require_positive_acceleration, require_positive_feed,
    require_positive_jerk,
};
use crate::{DynamicsError, JoinSpan, MetricPath};
use hyperlimit::{PredicatePolicy, Sign, classify_real_sign, compare_reals};
use hyperreal::Real;
use hypersolve::{
    CandidateCertificationReport, Constraint, ConstraintKind, Expr, Problem, VariableId,
    certify_candidate, context_from_problem,
};
use std::cmp::Ordering;

/// Exact constant-feed time certification report.
///
/// A retained metric provider supplies the exact path length, while
/// `hypersolve` replays the
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
/// This report models a symmetric rest-to-rest speed profile over an exact
/// retained metric path. It classifies the profile by the exact
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

/// Exact symmetric jerk-limited traversal time certification report.
///
/// The retained profile has four equal-duration jerk phases with signs
/// `+j, -j, -j, +j`, starting and ending at rest. Exact integration gives:
///
/// - path length: `L = j*T^3/32`
/// - peak feed: `v_peak = j*T^2/16`
/// - peak acceleration: `a_peak = j*T/4`
///
/// The report replays the length equality plus denominator-free peak-limit
/// inequalities through `hypersolve`. It does not certify lookahead blending,
/// segment-corner dynamics, cutter engagement, machine envelopes, or material
/// process constraints; those remain separate exact reports before CAM output.
#[derive(Clone, Debug)]
pub struct JerkLimitedFeedTimeReport {
    /// Exact retained route length.
    pub path_length: Real,
    /// Exact maximum allowed feed rate.
    pub max_feed_rate: Real,
    /// Exact maximum allowed acceleration.
    pub max_acceleration: Real,
    /// Exact jerk magnitude used by the replay profile.
    pub jerk: Real,
    /// Exact candidate traversal time.
    pub target_time: Real,
    /// Exact peak feed implied by `jerk` and `target_time`.
    pub peak_feed_rate: Real,
    /// Exact peak acceleration implied by `jerk` and `target_time`.
    pub peak_acceleration: Real,
    /// Exact solver replay report for length and peak-limit constraints.
    pub certification: CandidateCertificationReport,
}

/// Exact lookahead classification for one retained path join.
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub enum CornerLookaheadJoinClass {
    /// The join is G1-continuous, so this report only certifies the feed cap.
    StraightThrough,
    /// The join is a true corner and must respect the retained corner radius.
    RadiusLimitedCorner,
    /// The join reverses direction and requires a zero corner speed.
    ReversalStop,
}

/// Exact corner-speed replay report for one adjacent tangent-span join.
///
/// The report carries the tangent predicate result and a solver replay of the
/// process limit applied to the candidate junction feed. For corners, the
/// replay row is the squared-speed form of the centripetal bound `v^2 <= a*r`
/// for a caller-retained blend radius. This is the path-parameterization view
/// used by Bobrow, Dubowsky, and Gibson (1985): the geometric path is retained,
/// while dynamic limits are algebraic constraints on motion along that path.
/// Yap's exact-computation discipline is preserved by accepting no numeric
/// controller proposal until those inequalities are certified exactly.
#[derive(Clone, Debug)]
pub struct CornerLookaheadJoinReport<E> {
    /// Zero-based adjacent-span join index.
    pub index: u64,
    /// Exact endpoint/tangent predicate report used to choose the limit class.
    pub tangent_join: E,
    /// Lookahead class selected from the tangent predicate report.
    pub class: CornerLookaheadJoinClass,
    /// Exact candidate feed rate at the join.
    pub candidate_corner_feed: Real,
    /// Exact maximum feed-rate cap.
    pub max_feed_rate: Real,
    /// Exact maximum centripetal acceleration cap.
    pub max_acceleration: Real,
    /// Exact retained corner/blend radius used for true corners.
    pub corner_radius: Real,
    /// Exact replay report for the feed cap, corner bound, and reversal stop.
    pub certification: CandidateCertificationReport,
}

/// Exact lookahead replay report for a retained tangent-span chain.
#[derive(Clone, Debug)]
pub struct CornerLookaheadLimitReport<E> {
    /// Per-adjacent-join reports in traversal order.
    pub joins: Vec<CornerLookaheadJoinReport<E>>,
}

impl<E> CornerLookaheadLimitReport<E> {
    /// Return whether every join's candidate corner feed was certified.
    #[inline]
    pub fn all_satisfied(&self) -> bool {
        self.joins
            .iter()
            .all(|join| join.certification.all_satisfied())
    }

    /// Return the first join with a certified violation or undecided row.
    #[inline]
    pub fn first_unsatisfied_join(&self) -> Option<usize> {
        self.joins
            .iter()
            .position(|join| !join.certification.all_satisfied())
    }
}

/// Certify constant-feed traversal time for a retained exact metric path.
///
/// The route length is obtained lazily from the retained metric provider.
/// Geometry adapters may supply Euclidean line lengths or certified symbolic
/// arc lengths without turning curves into chords. The feed residual remains
/// `length - feed * time = 0`, so invalid process parameters and unsupported
/// geometry are reported before solver replay.
#[inline]
pub fn certify_constant_feed_time<P: MetricPath + ?Sized>(
    route: &P,
    feed_rate: Real,
    target_time: Real,
    policy: PredicatePolicy,
) -> Result<ConstantFeedTimeReport, DynamicsError> {
    if route.is_empty() {
        return Err(DynamicsError::EmptyRoute);
    }
    require_positive_feed(&feed_rate, policy)?;
    match classify_real_sign(&target_time, policy).value() {
        Some(Sign::Negative) => return Err(DynamicsError::NegativeTime),
        Some(Sign::Zero | Sign::Positive) => {}
        None => return Err(DynamicsError::PredicateUnresolved),
    }
    let path_length = route.exact_length(policy)?;
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

/// Certify symmetric acceleration-limited traversal for a mixed line/arc route.
///
/// The profile classification is still the exact comparison
/// `acceleration * length` versus `max_feed^2`; the only change from the
/// line-only API is that `length` may include certified circular-arc sweep
/// terms. No sampling, chord approximation, or controller lookahead is
/// introduced.
#[inline]
pub fn certify_acceleration_limited_feed_time<P: MetricPath + ?Sized>(
    route: &P,
    max_feed_rate: Real,
    acceleration: Real,
    target_time: Real,
    policy: PredicatePolicy,
) -> Result<AccelerationLimitedFeedTimeReport, DynamicsError> {
    if route.is_empty() {
        return Err(DynamicsError::EmptyRoute);
    }
    require_positive_feed(&max_feed_rate, policy)?;
    require_positive_acceleration(&acceleration, policy)?;
    match classify_real_sign(&target_time, policy).value() {
        Some(Sign::Negative) => return Err(DynamicsError::NegativeTime),
        Some(Sign::Zero | Sign::Positive) => {}
        None => return Err(DynamicsError::PredicateUnresolved),
    }
    let path_length = route.exact_length(policy)?;
    let profile =
        classify_acceleration_limited_profile(&path_length, &max_feed_rate, &acceleration, policy)
            .ok_or(DynamicsError::UnknownFeedProfile)?;
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

/// Certify a symmetric four-phase jerk-limited feed profile for a mixed route.
///
/// The S-curve equations are identical to
/// [`certify_symmetric_jerk_limited_feed_time`], but retained explicit arcs may
/// contribute exact symbolic sweep length. This directly addresses curved
/// route feed replay without converting arcs to polylines.
#[inline]
pub fn certify_symmetric_jerk_limited_feed_time<P: MetricPath + ?Sized>(
    route: &P,
    max_feed_rate: Real,
    max_acceleration: Real,
    jerk: Real,
    target_time: Real,
    policy: PredicatePolicy,
) -> Result<JerkLimitedFeedTimeReport, DynamicsError> {
    if route.is_empty() {
        return Err(DynamicsError::EmptyRoute);
    }
    require_positive_feed(&max_feed_rate, policy)?;
    require_positive_acceleration(&max_acceleration, policy)?;
    require_positive_jerk(&jerk, policy)?;
    match classify_real_sign(&target_time, policy).value() {
        Some(Sign::Negative) => return Err(DynamicsError::NegativeTime),
        Some(Sign::Zero | Sign::Positive) => {}
        None => return Err(DynamicsError::PredicateUnresolved),
    }

    let path_length = route.exact_length(policy)?;
    build_jerk_limited_report(
        path_length,
        max_feed_rate,
        max_acceleration,
        jerk,
        target_time,
    )
}

/// Certify exact lookahead corner-speed limits for retained tangent spans.
///
/// This is a process-constraint report for a path chain, not a mesh or stock
/// boolean. Adjacent [`JoinSpan`] values are classified by exact endpoint
/// and tangent predicates. G1 joins replay only the global feed cap; true
/// corners additionally replay `a_max * r_corner - v_corner^2 >= 0`; reversed
/// tangents replay an exact stop row `v_corner = 0`. The constraints are kept
/// denominator-free and algebraic so `hypersolve` can audit the caller's
/// candidate speed under Yap's "construct then certify" model.
///
/// The caller supplies one retained corner radius for this chain. A future
/// richer scheduler can call this function per corner with locally selected
/// radii, but the certification model remains the same: geometry decides the
/// join class, and exact replay decides whether the proposed process speed is
/// admissible.
#[inline]
pub fn certify_corner_lookahead_limits<J: JoinSpan>(
    spans: &[J],
    candidate_corner_feed: Real,
    max_feed_rate: Real,
    max_acceleration: Real,
    corner_radius: Real,
    policy: PredicatePolicy,
) -> Result<CornerLookaheadLimitReport<J::Receipt>, DynamicsError> {
    if spans.len() < 2 {
        return Err(DynamicsError::EmptyRoute);
    }
    require_nonnegative_feed(&candidate_corner_feed, policy)?;
    require_positive_feed(&max_feed_rate, policy)?;
    require_positive_acceleration(&max_acceleration, policy)?;
    require_positive_corner_radius(&corner_radius, policy)?;

    let mut joins = Vec::with_capacity(spans.len().saturating_sub(1));
    for (index, pair) in spans.windows(2).enumerate() {
        let classified = pair[0].classify_join(&pair[1], policy);
        let class = classified.classification?;
        let tangent_join = classified.receipt;
        let certification = certify_corner_lookahead_join_candidate(
            class,
            candidate_corner_feed.clone(),
            max_feed_rate.clone(),
            max_acceleration.clone(),
            corner_radius.clone(),
        );
        joins.push(CornerLookaheadJoinReport {
            index: index as u64,
            tangent_join,
            class,
            candidate_corner_feed: candidate_corner_feed.clone(),
            max_feed_rate: max_feed_rate.clone(),
            max_acceleration: max_acceleration.clone(),
            corner_radius: corner_radius.clone(),
            certification,
        });
    }

    Ok(CornerLookaheadLimitReport { joins })
}

#[inline]
fn build_jerk_limited_report(
    path_length: Real,
    max_feed_rate: Real,
    max_acceleration: Real,
    jerk: Real,
    target_time: Real,
) -> Result<JerkLimitedFeedTimeReport, DynamicsError> {
    let peak_feed_rate = (jerk.clone() * target_time.clone() * target_time.clone()
        / Real::from(16))
    .map_err(|_| DynamicsError::UnsupportedDivision)?;
    let peak_acceleration = (jerk.clone() * target_time.clone() / Real::from(4))
        .map_err(|_| DynamicsError::UnsupportedDivision)?;

    let mut problem = Problem::default();
    let time = problem.add_variable("time", target_time.clone());
    problem.add_constraint(symmetric_jerk_limited_feed_time_equation(
        "symmetric jerk limited feed time",
        path_length.clone(),
        jerk.clone(),
        time,
    ));
    problem.add_constraint(peak_feed_limit_constraint(
        "symmetric jerk peak feed limit",
        max_feed_rate.clone(),
        jerk.clone(),
        time,
    ));
    problem.add_constraint(peak_acceleration_limit_constraint(
        "symmetric jerk peak acceleration limit",
        max_acceleration.clone(),
        jerk.clone(),
        time,
    ));
    let analysis = problem.analyze();
    let context = context_from_problem(&problem);

    Ok(JerkLimitedFeedTimeReport {
        path_length,
        max_feed_rate,
        max_acceleration,
        jerk,
        target_time,
        peak_feed_rate,
        peak_acceleration,
        certification: certify_candidate(&analysis, &context),
    })
}

#[inline]
fn certify_corner_lookahead_join_candidate(
    class: CornerLookaheadJoinClass,
    candidate_corner_feed: Real,
    max_feed_rate: Real,
    max_acceleration: Real,
    corner_radius: Real,
) -> CandidateCertificationReport {
    let mut problem = Problem::default();
    let feed = problem.add_variable("corner_feed", candidate_corner_feed);
    problem.add_constraint(corner_feed_cap_constraint(
        "lookahead corner feed cap",
        max_feed_rate,
        feed,
    ));
    match class {
        CornerLookaheadJoinClass::StraightThrough => {}
        CornerLookaheadJoinClass::RadiusLimitedCorner => {
            problem.add_constraint(corner_centripetal_limit_constraint(
                "lookahead corner centripetal limit",
                max_acceleration,
                corner_radius,
                feed,
            ));
        }
        CornerLookaheadJoinClass::ReversalStop => {
            problem.add_constraint(Constraint::equality(
                "lookahead reversal stop",
                Expr::symbol(feed.into(), "corner_feed"),
            ));
        }
    }
    let analysis = problem.analyze();
    let context = context_from_problem(&problem);
    certify_candidate(&analysis, &context)
}

#[inline]
fn peak_feed_limit_constraint(
    name: impl Into<String>,
    max_feed_rate: Real,
    jerk: Real,
    time: hypersolve::VariableId,
) -> Constraint {
    let time_expr = Expr::symbol(time.into(), "time");
    Constraint {
        name: name.into(),
        kind: ConstraintKind::GreaterOrEqual,
        residual: Expr::real(Real::from(16) * max_feed_rate)
            - Expr::real(jerk) * time_expr.clone() * time_expr,
        weight: Real::one(),
        active: true,
    }
}

#[inline]
fn peak_acceleration_limit_constraint(
    name: impl Into<String>,
    max_acceleration: Real,
    jerk: Real,
    time: hypersolve::VariableId,
) -> Constraint {
    Constraint {
        name: name.into(),
        kind: ConstraintKind::GreaterOrEqual,
        residual: Expr::real(Real::from(4) * max_acceleration)
            - Expr::real(jerk) * Expr::symbol(time.into(), "time"),
        weight: Real::one(),
        active: true,
    }
}

#[inline]
fn corner_feed_cap_constraint(
    name: impl Into<String>,
    max_feed_rate: Real,
    feed: hypersolve::VariableId,
) -> Constraint {
    Constraint {
        name: name.into(),
        kind: ConstraintKind::GreaterOrEqual,
        residual: Expr::real(max_feed_rate) - Expr::symbol(feed.into(), "corner_feed"),
        weight: Real::one(),
        active: true,
    }
}

#[inline]
fn corner_centripetal_limit_constraint(
    name: impl Into<String>,
    max_acceleration: Real,
    corner_radius: Real,
    feed: hypersolve::VariableId,
) -> Constraint {
    let feed_expr = Expr::symbol(feed.into(), "corner_feed");
    Constraint {
        name: name.into(),
        kind: ConstraintKind::GreaterOrEqual,
        residual: Expr::real(max_acceleration * corner_radius) - feed_expr.clone() * feed_expr,
        weight: Real::one(),
        active: true,
    }
}

#[inline]
fn require_positive_corner_radius(
    value: &Real,
    policy: PredicatePolicy,
) -> Result<(), DynamicsError> {
    match classify_real_sign(value, policy).value() {
        Some(Sign::Negative) => Err(DynamicsError::NegativeCornerRadius),
        Some(Sign::Zero) => Err(DynamicsError::ZeroCornerRadius),
        Some(Sign::Positive) => Ok(()),
        None => Err(DynamicsError::PredicateUnresolved),
    }
}

#[inline]
fn classify_acceleration_limited_profile(
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

#[inline]
fn acceleration_limited_feed_time_equation(
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

/// Build a linear feed/time residual `path_length - feed_rate * time = 0`.
#[inline]
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
#[inline]
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
