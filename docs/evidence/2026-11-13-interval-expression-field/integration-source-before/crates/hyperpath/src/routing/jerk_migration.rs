//! Frozen scheduler comparison: geometry and original guards stay independent.
use super::{RouteCertificationError, feed};
use crate::{
    ArcDirection, CubicPythagoreanHodograph, ExplicitCircularArc, LinePathSegment,
    QuinticPythagoreanHodograph,
};
use feed::FeedPathElement;
use hyperlimit::{Point2, PredicatePolicy};
use hyperreal::Real;
#[allow(dead_code)] // Preserve the complete original report API in this frozen reference.
mod legacy;
mod legacy_guards;

fn fixtures() -> Vec<(Vec<FeedPathElement>, [Real; 5], i32)> {
    let point = |x, y| Point2::new(Real::from(x), Real::from(y));
    let line = |length| {
        FeedPathElement::Line(
            LinePathSegment::new(point(0, 0), point(length, 0), PredicatePolicy::STRICT).unwrap(),
        )
    };
    let mut fixtures = Vec::new();
    for n in 1..=24 {
        fixtures.push((
            vec![line(n)],
            [1.into(), (n % 4).into(), 20.into(), 20.into(), 20.into()],
            0,
        ));
    }
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
    let mixed = vec![
        line(6),
        FeedPathElement::ExplicitArc(arc),
        FeedPathElement::CubicPh(cubic),
        FeedPathElement::QuinticPh(quintic),
    ];
    fixtures.push((
        mixed,
        [1.into(), 2.into(), 20.into(), 20.into(), 20.into()],
        0,
    ));
    for coordinate in 0..5 {
        for bad in [-1, 0] {
            let mut inputs = [1.into(), 2.into(), 20.into(), 20.into(), 20.into()];
            inputs[coordinate] = bad.into();
            fixtures.push((vec![line(6)], inputs, 0));
        }
    }
    fixtures.push((
        vec![line(6)],
        [0.into(), 0.into(), 20.into(), 20.into(), 20.into()],
        0,
    ));
    fixtures.push((
        vec![],
        [1.into(), 2.into(), 20.into(), 20.into(), 20.into()],
        0,
    ));
    // Invalid candidate time, empty phase list, mismatched proposal count, and
    // disconnected phase states exercise different guard/replay paths.
    for mode in 1..=5 {
        fixtures.push((
            vec![line(6)],
            [1.into(), 2.into(), 20.into(), 20.into(), 20.into()],
            mode,
        ));
    }
    let unresolved = (Real::pi() * Real::e()).ln().unwrap()
        - (Real::pi().ln().unwrap() + Real::e().ln().unwrap());
    fixtures.push((
        vec![line(6)],
        [unresolved, 2.into(), 20.into(), 20.into(), 20.into()],
        0,
    ));
    fixtures
}

#[test]
#[allow(deprecated)] // Intentional one-release compatibility witness.
fn reports_and_counts_match_in_fresh_processes() {
    const CHILD: &str = "HYPERDYNAMICS_JERK_DIFFERENTIAL";
    if let Ok(mode) = std::env::var(CHILD) {
        let policy = if mode.ends_with("approximate") {
            PredicatePolicy::APPROXIMATE_512
        } else {
            PredicatePolicy::STRICT
        };
        for (index, (route, [start, end, feed, accel, jerk], case)) in
            fixtures().into_iter().enumerate()
        {
            hyperreal::dispatch_trace::reset();
            let _recording = hyperreal::dispatch_trace::recording_scope();
            macro_rules! replay {
                ($module:path) => {{
                    use $module as implementation;
                    let ramp = implementation::JerkRampSpanProposal {
                        start_feed: start.clone(),
                        end_feed: end.clone(),
                        start_acceleration: 0.into(),
                        end_acceleration: 1.into(),
                        traversal_time: match case {
                            1 => (-1).into(),
                            2 => 0.into(),
                            _ => 2.into(),
                        },
                    };
                    let planned = route.first().map(|element| {
                        implementation::plan_monotonic_jerk_transition(
                            element,
                            start.clone(),
                            end.clone(),
                            feed.clone(),
                            accel.clone(),
                            jerk.clone(),
                            policy,
                        )
                    });
                    let proposals = if case == 4 {
                        vec![]
                    } else {
                        vec![ramp.clone(); route.len()]
                    };
                    let single = implementation::certify_jerk_ramp_feed_schedule(
                        &route,
                        &proposals,
                        feed.clone(),
                        accel.clone(),
                        jerk.clone(),
                        policy,
                    );
                    let mut phases = vec![
                        vec![
                            implementation::JerkRampPhaseProposal {
                                path_length: 3.into(),
                                ramp: ramp.clone()
                            },
                            implementation::JerkRampPhaseProposal {
                                path_length: 3.into(),
                                ramp
                            }
                        ];
                        route.len()
                    ];
                    if case == 3 {
                        phases[0].clear();
                    }
                    if case == 5 {
                        phases[0][1].ramp.start_feed = 7.into();
                    }
                    let multi = implementation::certify_multi_phase_jerk_ramp_feed_schedule(
                        &route,
                        &phases,
                        feed.clone(),
                        accel.clone(),
                        jerk.clone(),
                        policy,
                    );
                    format!("{planned:?}|{single:?}|{multi:?}")
                }};
            }
            let output = if mode.starts_with("legacy") {
                replay!(legacy)
            } else if mode.starts_with("compat") {
                replay!(super::jerk_schedule)
            } else {
                replay!(hyperdynamics)
            };
            println!("ROW|{index}|{output}");
            let trace = hyperreal::dispatch_trace::take_trace();
            if index == 0 {
                assert_eq!(
                    trace.path_count(
                        "hyperlimit",
                        "resolve_real_sign_direct",
                        "structural-real-facts"
                    ),
                    35
                );
                assert_eq!(
                    trace.dispatch.iter().map(|entry| entry.count).sum::<u64>(),
                    5287
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
                "routing::jerk_migration::reports_and_counts_match_in_fresh_processes",
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
            .filter(|line| line.starts_with("ROW|") || line.starts_with("TRACE|"))
            .map(str::to_owned)
            .collect::<Vec<_>>()
    };
    for policy in ["strict", "approximate"] {
        let expected = run(&format!("legacy-{policy}"));
        assert_eq!(expected.len(), 86);
        assert_eq!(run(&format!("direct-{policy}")), expected);
        assert_eq!(run(&format!("compat-{policy}")), expected);
    }
}
