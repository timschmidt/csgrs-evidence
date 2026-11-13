//! Frozen complete feed/lookahead reports and traces, including geometry receipts.
use super::RouteCertificationError;
use crate::{
    ArcDirection, CubicPythagoreanHodograph, ExplicitCircularArc, FeedPathElement, LinePathSegment,
    QuinticPythagoreanHodograph, TangentSpan,
};
use hyperlimit::{Point2, PredicatePolicy};
use hyperreal::Real;
#[allow(dead_code)] // Complete original reference APIs remain frozen.
mod common;
#[allow(dead_code)]
mod feed;
#[allow(dead_code)]
mod jerk_schedule;
#[allow(dead_code)]
mod lookahead;
use common::{
    AccelerationLimitedFeedTimeReport, ConstantFeedTimeReport,
    acceleration_limited_feed_time_equation, classify_acceleration_limited_profile,
    route_axis_length,
};

struct Fixture {
    route: Vec<FeedPathElement>,
    joins: Vec<TangentSpan>,
    values: [Real; 8], // feed, acceleration, jerk, time, entry, exit, corner cap, radius
    shape: u8,
}
fn fixtures() -> Vec<Fixture> {
    let point = |x, y| Point2::new(Real::from(x), Real::from(y));
    let line = |a, b| LinePathSegment::new(a, b, PredicatePolicy::STRICT).unwrap();
    let make = |lines: Vec<LinePathSegment>| Fixture {
        joins: lines.iter().map(TangentSpan::from_line_segment).collect(),
        route: lines.into_iter().map(FeedPathElement::Line).collect(),
        values: [
            4.into(),
            1.into(),
            2.into(),
            4.into(),
            0.into(),
            0.into(),
            4.into(),
            0.into(),
        ],
        shape: 0,
    };
    let straight = || {
        make(vec![
            line(point(0, 0), point(2, 0)),
            line(point(2, 0), point(4, 0)),
        ])
    };
    let mut fixtures = vec![straight()];
    for length in 1..=12 {
        fixtures.push(make(vec![
            line(point(0, 0), point(length, 0)),
            line(point(length, 0), point(2 * length, 0)),
        ]));
    }
    fixtures.push(make(vec![
        line(point(0, 0), point(2, 0)),
        line(point(2, 0), point(2, 2)),
    ]));
    fixtures.push(make(vec![
        line(point(0, 0), point(2, 0)),
        line(point(2, 0), point(0, 0)),
    ]));
    fixtures.push(make(vec![
        line(point(0, 0), point(2, 0)),
        line(point(3, 0), point(4, 0)),
    ]));
    // The axis-only compatibility API must reject the diagonal while the
    // mixed/native metric source keeps its exact Euclidean length.
    fixtures.push(make(vec![
        line(point(0, 0), point(3, 4)),
        line(point(3, 4), point(6, 8)),
    ]));
    let mut degenerate = straight();
    degenerate.joins[0].end_tangent = point(0, 0);
    fixtures.push(degenerate);
    let arc = ExplicitCircularArc::new(
        point(0, 0),
        1.into(),
        point(1, 0),
        point(-1, 0),
        ArcDirection::Ccw,
        PredicatePolicy::STRICT,
    )
    .unwrap();
    let cubic = CubicPythagoreanHodograph::new(
        point(0, 0),
        1.into(),
        0.into(),
        0.into(),
        1.into(),
        PredicatePolicy::STRICT,
    )
    .unwrap();
    let quintic = QuinticPythagoreanHodograph::new(
        point(0, 0),
        1.into(),
        1.into(),
        0.into(),
        0.into(),
        0.into(),
        0.into(),
        PredicatePolicy::STRICT,
    )
    .unwrap();
    for element in [
        FeedPathElement::ExplicitArc(arc),
        FeedPathElement::CubicPh(cubic),
        FeedPathElement::QuinticPh(quintic),
    ] {
        let mut fixture = straight();
        fixture.route[0] = element;
        fixtures.push(fixture);
    }
    for coordinate in 0..8 {
        for value in [-1, 0] {
            let mut fixture = straight();
            fixture.values[coordinate] = value.into();
            fixtures.push(fixture);
        }
    }
    for shape in 1..=4 {
        let mut fixture = straight();
        fixture.shape = shape;
        fixtures.push(fixture);
    }
    let unresolved = (Real::pi() * Real::e()).ln().unwrap()
        - (Real::pi().ln().unwrap() + Real::e().ln().unwrap());
    for coordinate in [0, 6] {
        let mut fixture = straight();
        fixture.values[coordinate] = unresolved.clone();
        fixtures.push(fixture);
    }
    fixtures
}

// Supplement the earlier separately supplied metric/tangent fixtures with
// physically connected mixed paths whose tangent data comes from those sources.
fn connected_mixed_fixtures() -> Vec<Fixture> {
    fixtures()
        .into_iter()
        .filter_map(|mut fixture| {
            let first = match fixture.route.first()? {
                FeedPathElement::ExplicitArc(arc) => TangentSpan::from_explicit_arc(arc),
                FeedPathElement::CubicPh(curve) => TangentSpan {
                    start: curve.start().clone(),
                    end: curve.end().clone(),
                    // Authored hodographs (u,v)=(1,0) and (0,1) give
                    // (u*u-v*v,2*u*v)=(1,0) and (-1,0) exactly.
                    start_tangent: Point2::new(1.into(), 0.into()),
                    end_tangent: Point2::new((-1).into(), 0.into()),
                },
                FeedPathElement::QuinticPh(curve) => TangentSpan {
                    start: curve.start().clone(),
                    end: curve.end().clone(),
                    start_tangent: curve.start_derivative(),
                    end_tangent: curve.end_derivative(),
                },
                FeedPathElement::Line(_) => return None,
            };
            let end = Point2::new(
                &first.end.x + &first.end_tangent.x,
                &first.end.y + &first.end_tangent.y,
            );
            let line =
                LinePathSegment::new(first.end.clone(), end, PredicatePolicy::STRICT).unwrap();
            fixture.joins = vec![first, TangentSpan::from_line_segment(&line)];
            fixture.route[1] = FeedPathElement::Line(line);
            Some(fixture)
        })
        .collect()
}

#[test]
#[allow(deprecated)] // Explicit one-release compatibility qualification.
fn reports_and_counts_match_in_fresh_processes() {
    const CHILD: &str = "HYPERDYNAMICS_FEED_JOIN_DIFFERENTIAL";
    if let Ok(mode) = std::env::var(CHILD) {
        let policy = if mode.ends_with("approximate") {
            PredicatePolicy::APPROXIMATE_512
        } else {
            PredicatePolicy::STRICT
        };
        for (index, mut fixture) in fixtures()
            .into_iter()
            .chain(std::iter::once_with(connected_mixed_fixtures).flatten())
            .enumerate()
        {
            if fixture.shape == 1 {
                fixture.route.clear();
            }
            if fixture.shape == 2 {
                fixture.joins.clear();
            }
            let lines: Vec<_> = fixture
                .route
                .iter()
                .filter_map(|span| match span {
                    FeedPathElement::Line(line) => Some(line.clone()),
                    _ => None,
                })
                .collect();
            let Fixture {
                route,
                joins,
                values: [max_feed, accel, jerk, time, entry, exit, corner, radius],
                shape,
            } = fixture;
            hyperreal::dispatch_trace::reset();
            let _recording = hyperreal::dispatch_trace::recording_scope();
            macro_rules! schedule {
                ($module:path,$route:expr) => {{
                    use $module as implementation;
                    let limits = implementation::LookaheadFeedPlanningLimits {
                        maximum_entry_feed: entry.clone(),
                        maximum_exit_feed: exit.clone(),
                        maximum_corner_feeds: if shape == 3 {
                            vec![]
                        } else {
                            vec![corner.clone()]
                        },
                        corner_radii: if shape == 4 {
                            vec![]
                        } else {
                            vec![radius.clone()]
                        },
                    };
                    let proposal = implementation::LookaheadFeedSchedule {
                        entry_feed: entry.clone(),
                        exit_feed: exit.clone(),
                        corner_feeds: limits.maximum_corner_feeds.clone(),
                        corner_radii: limits.corner_radii.clone(),
                    };
                    let planned = implementation::plan_lookahead_feed_schedule(
                        $route,
                        &joins,
                        &limits,
                        max_feed.clone(),
                        accel.clone(),
                        policy,
                    );
                    let replay = implementation::certify_lookahead_feed_schedule(
                        $route,
                        &joins,
                        &proposal,
                        max_feed.clone(),
                        accel.clone(),
                        policy,
                    );
                    let refined = implementation::plan_jerk_feasible_lookahead_schedule(
                        $route,
                        &joins,
                        &limits,
                        max_feed.clone(),
                        accel.clone(),
                        jerk.clone(),
                        4,
                        policy,
                    );
                    format!("{planned:?}|{replay:?}|{refined:?}")
                }};
            }
            macro_rules! feeds {
                ($module:path,$constant:ident,$acceleration:ident,$symmetric:ident,$route:expr) => {{
                    use $module as implementation;
                    let constant =
                        implementation::$constant($route, max_feed.clone(), time.clone(), policy);
                    let acceleration = implementation::$acceleration(
                        $route,
                        max_feed.clone(),
                        accel.clone(),
                        time.clone(),
                        policy,
                    );
                    let symmetric = implementation::$symmetric(
                        $route,
                        max_feed.clone(),
                        accel.clone(),
                        jerk.clone(),
                        time.clone(),
                        policy,
                    );
                    let corners = implementation::certify_corner_lookahead_limits(
                        &joins,
                        corner.clone(),
                        max_feed.clone(),
                        accel.clone(),
                        radius.clone(),
                        policy,
                    );
                    format!("{constant:?}|{acceleration:?}|{symmetric:?}|{corners:?}")
                }};
            }
            let (feed_output, schedule_output, axis_output) = if mode.starts_with("legacy") {
                let route: Vec<_> = route
                    .into_iter()
                    .map(|span| match span {
                        FeedPathElement::Line(x) => feed::FeedPathElement::Line(x),
                        FeedPathElement::ExplicitArc(x) => feed::FeedPathElement::ExplicitArc(x),
                        FeedPathElement::CubicPh(x) => feed::FeedPathElement::CubicPh(x),
                        FeedPathElement::QuinticPh(x) => feed::FeedPathElement::QuinticPh(x),
                    })
                    .collect();
                let f = feeds!(
                    feed,
                    certify_constant_feed_time_for_path,
                    certify_acceleration_limited_feed_time_for_path,
                    certify_symmetric_jerk_limited_feed_time_for_path,
                    &route
                );
                let s = schedule!(lookahead, &route);
                let c = common::certify_constant_feed_time(
                    &lines,
                    max_feed.clone(),
                    time.clone(),
                    policy,
                );
                let a = common::certify_acceleration_limited_feed_time(
                    &lines,
                    max_feed.clone(),
                    accel.clone(),
                    time.clone(),
                    policy,
                );
                let j = feed::certify_symmetric_jerk_limited_feed_time(
                    &lines,
                    max_feed.clone(),
                    accel.clone(),
                    jerk.clone(),
                    time.clone(),
                    policy,
                );
                (f, s, format!("{c:?}|{a:?}|{j:?}"))
            } else {
                let (f, s) = if mode.starts_with("compat") {
                    (
                        feeds!(
                            crate,
                            certify_constant_feed_time_for_path,
                            certify_acceleration_limited_feed_time_for_path,
                            certify_symmetric_jerk_limited_feed_time_for_path,
                            &route
                        ),
                        schedule!(crate, &route),
                    )
                } else {
                    (
                        feeds!(
                            hyperdynamics,
                            certify_constant_feed_time,
                            certify_acceleration_limited_feed_time,
                            certify_symmetric_jerk_limited_feed_time,
                            &route
                        ),
                        schedule!(hyperdynamics, &route),
                    )
                };
                // The legacy axis-only API is qualified in both new modes.
                let c = super::certify_constant_feed_time(
                    &lines,
                    max_feed.clone(),
                    time.clone(),
                    policy,
                );
                let a = super::certify_acceleration_limited_feed_time(
                    &lines,
                    max_feed.clone(),
                    accel.clone(),
                    time.clone(),
                    policy,
                );
                let j = super::feed::certify_symmetric_jerk_limited_feed_time(
                    &lines,
                    max_feed.clone(),
                    accel.clone(),
                    jerk.clone(),
                    time.clone(),
                    policy,
                );
                (f, s, format!("{c:?}|{a:?}|{j:?}"))
            };
            println!("ROW|{index}|{feed_output}|{schedule_output}|{axis_output}");
            let trace = hyperreal::dispatch_trace::take_trace();
            if index == 0 {
                assert_eq!(
                    trace.path_count(
                        "hyperlimit",
                        "resolve_real_sign_direct",
                        "structural-real-facts"
                    ),
                    161
                );
                assert_eq!(
                    trace.dispatch.iter().map(|entry| entry.count).sum::<u64>(),
                    16930
                );
                assert_eq!(trace.rational.gcds, 0);
            }
            println!("TRACE|{index}|{trace:?}");
        }
        return;
    }
    let run = |mode: &str| {
        let output = std::process::Command::new(std::env::current_exe().unwrap())
            .args([
                "--exact",
                "routing::feed_join_migration::reports_and_counts_match_in_fresh_processes",
                "--nocapture",
            ])
            .env(CHILD, mode)
            .output()
            .unwrap();
        assert!(
            output.status.success(),
            "{}\n{}",
            String::from_utf8_lossy(&output.stdout),
            String::from_utf8_lossy(&output.stderr)
        );
        String::from_utf8(output.stdout)
            .unwrap()
            .lines()
            .filter(|l| l.starts_with("ROW|") || l.starts_with("TRACE|"))
            .map(str::to_owned)
            .collect::<Vec<_>>()
    };
    for policy in ["strict", "approximate"] {
        let expected = run(&format!("legacy-{policy}"));
        assert_eq!(expected.len(), 92);
        assert_eq!(run(&format!("direct-{policy}")), expected);
        assert_eq!(run(&format!("compat-{policy}")), expected);
    }
}

#[test]
#[allow(deprecated)] // The axis-only legacy contract is intentionally retained.
fn legacy_axis_domain_and_native_euclidean_length_stay_distinct() {
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
        let line = LinePathSegment::new(
            Point2::new(0.into(), 0.into()),
            Point2::new(3.into(), 4.into()),
            policy,
        )
        .unwrap();
        let lines = std::slice::from_ref(&line);
        assert_eq!(
            super::certify_constant_feed_time(lines, 5.into(), 1.into(), policy).unwrap_err(),
            RouteCertificationError::UnsupportedRouteGeometry
        );
        assert_eq!(
            super::certify_acceleration_limited_feed_time(
                lines,
                5.into(),
                1.into(),
                1.into(),
                policy
            )
            .unwrap_err(),
            RouteCertificationError::UnsupportedRouteGeometry
        );
        assert_eq!(
            super::feed::certify_symmetric_jerk_limited_feed_time(
                lines,
                5.into(),
                1.into(),
                1.into(),
                1.into(),
                policy
            )
            .unwrap_err(),
            RouteCertificationError::UnsupportedRouteGeometry
        );
        let native = hyperdynamics::certify_constant_feed_time(
            &[FeedPathElement::Line(line)],
            5.into(),
            1.into(),
            policy,
        )
        .unwrap();
        assert_eq!(native.path_length, Real::from(5));
        assert!(native.certification.all_satisfied());
    }
}
