//! Exact old/new reports and complete dispatch snapshots in fresh processes.
#![cfg(feature = "dispatch-trace")]
use hyperlimit::PredicatePolicy;
use hyperpath::RouteCertificationError;
use hyperreal::{Rational, Real};
#[path = "support/legacy_axis_projection.rs"]
mod legacy;

type Fixture = (Vec<Vec<Real>>, Vec<[Real; 3]>);

fn fixtures() -> Vec<Fixture> {
    let mut fixtures = Vec::new();
    for seed in 1..=40 {
        let r = |n: i64| Real::new(Rational::new(n) / Rational::new(seed % 7 + 1));
        fixtures.push((
            vec![vec![r(seed % 3), r(seed % 5 + 1)], vec![r(2), r(1)]],
            vec![[r(7), r(11), r(13)], [r(17), r(19), r(23)]],
        ));
    }
    let one = Real::one();
    let zero = Real::zero();
    let axes = vec![[one.clone(), one.clone(), one.clone()]];
    fixtures.push((vec![], axes.clone()));
    fixtures.push((vec![vec![one.clone()]], vec![]));
    fixtures.push((vec![vec![]], axes.clone()));
    fixtures.push((vec![vec![zero.clone()]], axes.clone()));
    fixtures.push((vec![vec![-one.clone()]], axes.clone()));
    for axis in 0..3 {
        for value in [zero.clone(), -one.clone()] {
            let mut bad = axes.clone();
            bad[0][axis] = value;
            fixtures.push((vec![vec![one.clone()]], bad));
        }
    }
    fixtures.push((vec![vec![Real::from(2).sqrt().unwrap()]], axes.clone()));
    fixtures.push((vec![vec![one.clone()], vec![one]], axes));
    let left = (Real::pi() * Real::e()).ln().unwrap();
    let right = Real::pi().ln().unwrap() + Real::e().ln().unwrap();
    let unresolved_zero = &left - &right;
    fixtures.push((
        vec![vec![unresolved_zero.clone()]],
        vec![[1.into(), 2.into(), 3.into()]],
    ));
    fixtures.push((
        vec![vec![1.into()]],
        vec![[unresolved_zero, 2.into(), 3.into()]],
    ));
    fixtures.push((
        vec![vec![1.into(), 1.into()]],
        vec![[left, 2.into(), 3.into()], [right, 2.into(), 3.into()]],
    ));
    fixtures
}

#[test]
#[allow(deprecated)] // Explicit one-release compatibility contract.
fn reports_and_counts_match_in_fresh_processes() {
    const CHILD: &str = "HYPERDYNAMICS_AXIS_DIFFERENTIAL";
    if let Ok(mode) = std::env::var(CHILD) {
        let policy = if mode.ends_with("approximate") {
            PredicatePolicy::APPROXIMATE_512
        } else {
            PredicatePolicy::STRICT
        };
        for (index, (projections, limits)) in fixtures().into_iter().enumerate() {
            hyperreal::dispatch_trace::reset();
            let _recording = hyperreal::dispatch_trace::recording_scope();
            let output = if mode.starts_with("legacy") {
                let p: Vec<_> = projections
                    .into_iter()
                    .map(
                        |absolute_axis_derivatives| legacy::AffineSpanAxisProjection {
                            absolute_axis_derivatives,
                        },
                    )
                    .collect();
                let a: Vec<_> = limits
                    .into_iter()
                    .map(|[maximum_velocity, maximum_acceleration, maximum_jerk]| {
                        legacy::AxisMotionLimits {
                            maximum_velocity,
                            maximum_acceleration,
                            maximum_jerk,
                        }
                    })
                    .collect();
                let planned = legacy::plan_axis_projected_motion_limits(&p, &a, policy);
                if let Ok(report) = &planned {
                    assert!(report.all_satisfied());
                }
                let replay = legacy::certify_axis_projected_motion_limits(
                    &p,
                    &a,
                    Real::from(2),
                    Real::from(3),
                    Real::from(5),
                    policy,
                );
                format!("{planned:?}|{replay:?}")
            } else {
                let p: Vec<_> = projections
                    .into_iter()
                    .map(
                        |absolute_axis_derivatives| hyperdynamics::AffineSpanAxisProjection {
                            absolute_axis_derivatives,
                        },
                    )
                    .collect();
                let a: Vec<_> = limits
                    .into_iter()
                    .map(|[maximum_velocity, maximum_acceleration, maximum_jerk]| {
                        hyperdynamics::AxisMotionLimits {
                            maximum_velocity,
                            maximum_acceleration,
                            maximum_jerk,
                        }
                    })
                    .collect();
                let (planned, replay) = if mode.starts_with("compat") {
                    (
                        hyperpath::plan_axis_projected_motion_limits(&p, &a, policy),
                        hyperpath::certify_axis_projected_motion_limits(
                            &p,
                            &a,
                            Real::from(2),
                            Real::from(3),
                            Real::from(5),
                            policy,
                        ),
                    )
                } else {
                    (
                        hyperdynamics::plan_axis_projected_motion_limits(&p, &a, policy)
                            .map_err(RouteCertificationError::from),
                        hyperdynamics::certify_axis_projected_motion_limits(
                            &p,
                            &a,
                            Real::from(2),
                            Real::from(3),
                            Real::from(5),
                            policy,
                        )
                        .map_err(RouteCertificationError::from),
                    )
                };
                format!("{planned:?}|{replay:?}")
            };
            println!("ROW|{index}|{output}");
            let trace = hyperreal::dispatch_trace::take_trace();
            if index == 0 {
                assert_eq!(
                    trace.path_count("hyperlimit", "compare_reals", "exact-rational"),
                    9
                );
                assert_eq!(
                    trace.path_count(
                        "hyperlimit",
                        "resolve_real_sign_direct",
                        "structural-real-facts"
                    ),
                    40
                );
                assert_eq!(
                    trace.dispatch.iter().map(|entry| entry.count).sum::<u64>(),
                    1220
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
                "reports_and_counts_match_in_fresh_processes",
                "--nocapture",
            ])
            .env(CHILD, mode)
            .output()
            .unwrap();
        assert!(
            output.status.success(),
            "{}",
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
        assert_eq!(expected.len(), 112);
        assert_eq!(run(&format!("direct-{policy}")), expected);
        assert_eq!(run(&format!("compat-{policy}")), expected);
    }
}
