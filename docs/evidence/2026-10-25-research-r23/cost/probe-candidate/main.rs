use hypercurve::{
    Aabb2, Axis2, BezierParameter2, BezierParameterPolynomial, BezierParameterRange2, BoxBoundary2,
    CubicBezier2, Curve2, CurveBoxContainment2, CurveCertainty, CurveParameter2, CurvePoint2,
    CurvePointDefinition2, LineSeg2, Point2, PredicatePolicy, RationalBezier2, Real,
    evaluate_under,
};
use serde_json::{Value, json};
use std::{
    alloc::{GlobalAlloc, Layout, System},
    io::Write,
    sync::atomic::{AtomicUsize, Ordering},
    time::Instant,
};
struct CountingAllocator;
static LIVE: AtomicUsize = AtomicUsize::new(0);
static BYTES: AtomicUsize = AtomicUsize::new(0);
static CALLS: AtomicUsize = AtomicUsize::new(0);
static PEAK: AtomicUsize = AtomicUsize::new(0);
fn grow(n: usize) {
    CALLS.fetch_add(1, Ordering::Relaxed);
    BYTES.fetch_add(n, Ordering::Relaxed);
    let live = LIVE.fetch_add(n, Ordering::Relaxed) + n;
    PEAK.fetch_max(live, Ordering::Relaxed);
}
// SAFETY: All pointers and layouts pass unchanged to System. Counters never
// inspect allocations or alter ownership. Realloc traffic counts full requests.
unsafe impl GlobalAlloc for CountingAllocator {
    unsafe fn alloc(&self, l: Layout) -> *mut u8 {
        let p = unsafe { System.alloc(l) };
        if !p.is_null() {
            grow(l.size());
        }
        p
    }
    unsafe fn alloc_zeroed(&self, l: Layout) -> *mut u8 {
        let p = unsafe { System.alloc_zeroed(l) };
        if !p.is_null() {
            grow(l.size());
        }
        p
    }
    unsafe fn realloc(&self, p: *mut u8, l: Layout, n: usize) -> *mut u8 {
        let result = unsafe { System.realloc(p, l, n) };
        if !result.is_null() {
            CALLS.fetch_add(1, Ordering::Relaxed);
            BYTES.fetch_add(n, Ordering::Relaxed);
            if n >= l.size() {
                let live = LIVE.fetch_add(n - l.size(), Ordering::Relaxed) + n - l.size();
                PEAK.fetch_max(live, Ordering::Relaxed);
            } else {
                LIVE.fetch_sub(l.size() - n, Ordering::Relaxed);
            }
        }
        result
    }
    unsafe fn dealloc(&self, p: *mut u8, l: Layout) {
        LIVE.fetch_sub(l.size(), Ordering::Relaxed);
        unsafe {
            System.dealloc(p, l);
        }
    }
}
#[global_allocator]
static ALLOCATOR: CountingAllocator = CountingAllocator;
fn counts() -> (usize, usize, usize) {
    (
        LIVE.load(Ordering::Relaxed),
        BYTES.load(Ordering::Relaxed),
        CALLS.load(Ordering::Relaxed),
    )
}
fn q(n: i64, d: i64) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}
fn p(x: i64, y: i64) -> Point2 {
    Point2::from_values(x, y)
}
fn below(y: Real) -> Aabb2 {
    Aabb2::new_unchecked(p(-10, -10), Point2::new(10.into(), y))
}
fn selected(d: i64) -> CurveParameter2 {
    BezierParameterPolynomial::try_new_power_basis(vec![-Real::one(), Real::zero(), d.into()])
        .unwrap()
        .isolate_unit_interval_roots()
        .unwrap()
        .remove(0)
        .into()
}
fn cubic() -> CubicBezier2 {
    CubicBezier2::new(p(0, 0), p(1, 3), p(2, 3), p(3, 0))
}
fn rational() -> Curve2 {
    RationalBezier2::try_new(
        vec![p(0, 0), p(1, 3), p(2, 3), p(3, 0)],
        [1, 2, 2, 1].map(Real::from).to_vec(),
    )
    .unwrap()
    .into()
}
fn pole() -> Curve2 {
    RationalBezier2::try_new(
        vec![p(0, 0), p(1, 1), p(0, 1), p(1, 2)],
        vec![Real::one(), q(1, 3), q(-1, 3), -Real::one()],
    )
    .unwrap()
    .into()
}
struct Fixture {
    curve: Curve2,
    envelope: Aabb2,
    contained: Option<bool>,
    peak: Option<Point2>,
    new_domain: bool,
}
fn fixture(kind: usize) -> Fixture {
    let (curve, envelope, contained, peak, new_domain) = match kind {
        0 => (
            LineSeg2::try_new(p(0, 0), p(3, 0)).unwrap().into(),
            below(Real::one()),
            Some(true),
            None,
            false,
        ),
        1 => (cubic().into(), below(4.into()), Some(true), None, false),
        2 => (cubic().into(), below(q(9, 4)), Some(true), None, false),
        3 => (
            cubic().into(),
            below(2.into()),
            Some(false),
            Some(Point2::new(q(3, 2), q(9, 4))),
            false,
        ),
        4 => (rational(), below(4.into()), Some(true), None, false),
        5 => {
            // y'= (t-4/5)^2 >=0, although the control hull exceeds the last value.
            let c = RationalBezier2::try_new(
                vec![
                    p(0, 0),
                    Point2::new(1.into(), q(16, 75)),
                    Point2::new(2.into(), q(4, 25)),
                    Point2::new(3.into(), q(13, 75)),
                ],
                vec![Real::one(); 4],
            )
            .unwrap();
            (c.into(), below(q(13, 75)), Some(true), None, false)
        }
        6 => (rational(), below(q(18, 7)), Some(true), None, true),
        7 => (
            rational(),
            below(2.into()),
            Some(false),
            Some(Point2::new(q(3, 2), q(18, 7))),
            true,
        ),
        8 => (
            rational()
                .subcurve(
                    selected(32),
                    BezierParameterPolynomial::try_new_power_basis(vec![
                        (-3).into(),
                        Real::zero(),
                        4.into(),
                    ])
                    .unwrap()
                    .isolate_unit_interval_roots()
                    .unwrap()
                    .remove(0)
                    .into(),
                )
                .unwrap(),
            below(q(18, 7)),
            Some(true),
            None,
            true,
        ),
        9 => {
            // x=t,y=(t-t^3)/(1+t^2); maximum at sqrt(sqrt(5)-2).
            let c = RationalBezier2::try_new(
                vec![
                    p(0, 0),
                    Point2::new(q(1, 4), q(1, 4)),
                    Point2::new(q(3, 7), q(3, 7)),
                    Point2::new(q(2, 3), q(1, 3)),
                    p(1, 0),
                ],
                [6, 6, 7, 9, 12].map(Real::from).to_vec(),
            )
            .unwrap();
            let t2 = Real::from(5).sqrt().unwrap() - Real::from(2);
            let t = t2.clone().sqrt().unwrap();
            let y = (&t * (Real::one() - &t2) / (Real::one() + t2)).unwrap();
            (
                c.into(),
                below(q(3, 10)),
                Some(false),
                Some(Point2::new(t, y)),
                true,
            )
        }
        10 => {
            let sqrt3 = Real::from(3).sqrt().unwrap();
            (
                pole().subcurve(selected(128), selected(8)).unwrap(),
                below(Real::one() - (sqrt3 / Real::from(2)).unwrap()),
                Some(true),
                None,
                true,
            )
        }
        11 => (
            Curve2::try_analytic_parallel(
                cubic().parallel_left(Real::zero()).unwrap(),
                BezierParameterRange2::try_new(
                    BezierParameter2::Exact(Real::zero()),
                    BezierParameter2::Exact(Real::one()),
                )
                .unwrap(),
            )
            .unwrap(),
            below(2.into()),
            None,
            None,
            false,
        ),
        12 => (
            Curve2::try_periodic_nurbs(
                3,
                vec![p(1, 0), p(0, 1), p(-1, 0), p(0, -1)],
                [1, 2, 1, 2].map(Real::from).to_vec(),
                [2, 3, 4, 5, 6].map(Real::from).to_vec(),
            )
            .unwrap(),
            Aabb2::new_unchecked(
                Point2::new(q(-1, 2), q(-4, 5)),
                Point2::new(q(1, 2), q(4, 5)),
            ),
            Some(true),
            None,
            false,
        ),
        13 => (pole(), below(100.into()), None, None, false),
        _ => panic!("unknown fixture"),
    };
    Fixture {
        curve,
        envelope,
        contained,
        peak,
        new_domain,
    }
}
fn parameter(p: &CurveParameter2) -> Value {
    match p.as_bezier_parameter().unwrap() {
        BezierParameter2::Exact(value) => json!({"exact":value}),
        BezierParameter2::Algebraic(root) => {
            json!({"polynomial":root.polynomial().coefficients(),"interval":[root.interval().start(),root.interval().end()],"root_count":root.root_count()})
        }
    }
}
fn point(p: &CurvePoint2) -> Value {
    match p.definition().unwrap() {
        CurvePointDefinition2::Coordinates(p) => json!({"coordinates":[p.x(),p.y()]}),
        CurvePointDefinition2::Rational {
            source,
            parameter: p,
        } => {
            json!({"homogeneous":source.homogeneous_controls().iter().map(|h|json!([h.x(),h.y(),h.weight()])).collect::<Vec<_>>(),"parameter":parameter(&p)})
        }
        other => panic!("unexpected witness definition {other:?}"),
    }
}
fn main() {
    let args: Vec<String> = std::env::args().collect();
    let kind: usize = args[1].parse().unwrap();
    let reversed = args[2] == "reverse";
    let policy = if args[3] == "strict" {
        PredicatePolicy::STRICT
    } else {
        PredicatePolicy::APPROXIMATE_512
    };
    let candidate = args[4] == "candidate";
    let mut fixture = fixture(kind);
    if reversed {
        fixture.curve = fixture.curve.reversed().unwrap();
    }
    for sample in 0..20 {
        let before = counts();
        PEAK.store(before.0, Ordering::Relaxed);
        let start = Instant::now();
        let outcome = evaluate_under(policy, || fixture.curve.box_containment(&fixture.envelope));
        let ns = start.elapsed().as_nanos();
        let after = counts();
        let peak = PEAK.load(Ordering::Relaxed).saturating_sub(before.0);
        assert_eq!(outcome.certainty(), CurveCertainty::Certified);
        let validation = Instant::now();
        let result = outcome.into_unverified();
        let (status, artifact) = match &result {
            Ok(CurveBoxContainment2::Contained) => {
                assert_eq!(fixture.contained, Some(true));
                (
                    "contained",
                    json!({"contained":true,"certainty":"Certified"}),
                )
            }
            Ok(CurveBoxContainment2::Escapes(escape)) => {
                assert_eq!(fixture.contained, Some(false));
                assert_eq!(escape.curve_index(), 0);
                assert_eq!(
                    (escape.axis(), escape.boundary()),
                    (Axis2::Y, BoxBoundary2::Maximum)
                );
                assert!(
                    escape
                        .point()
                        .coincides_with(&fixture.peak.clone().unwrap().into())
                        .unwrap()
                );
                assert_eq!(
                    escape
                        .point()
                        .compare_coordinate(&fixture.envelope.max().clone().into(), Axis2::Y)
                        .unwrap(),
                    std::cmp::Ordering::Greater
                );
                let cold = escape.point().definition().unwrap().into_point().unwrap();
                assert!(cold.coincides_with(escape.point()).unwrap());
                (
                    "escapes",
                    json!({"curve_index":escape.curve_index(),"axis":"Y","boundary":"Maximum","witness":point(escape.point()),"certainty":"Certified"}),
                )
            }
            Err(error) => {
                assert!(
                    fixture.contained.is_none() || (fixture.new_domain && !candidate),
                    "new completion missing: {kind}: {error:?}"
                );
                (
                    "blocked",
                    json!({"error":format!("{error:?}"),"certainty":"Certified"}),
                )
            }
        };
        let exact = serde_json::to_vec(&artifact).unwrap();
        let checksum = exact.iter().fold(14695981039346656037u64, |h, b| {
            (h ^ u64::from(*b)).wrapping_mul(1099511628211)
        });
        let bytes = exact.len();
        let continuation_ns = validation.elapsed().as_nanos();
        let checked = counts();
        if sample == 0 {
            std::fs::write(&args[5], &exact).unwrap();
        }
        drop(artifact);
        drop(exact);
        let drop_start = Instant::now();
        drop(result);
        let drop_ns = drop_start.elapsed().as_nanos();
        let dropped = counts();
        println!(
            "{}",
            json!({"kind":kind,"reversed":reversed,"policy":args[3],"sample":sample,"status":status,"new_domain":fixture.new_domain,"certainty":"Certified","ns":ns,"bytes":after.1-before.1,"calls":after.2-before.2,"peak_live_growth":peak,"result_live_delta":after.0 as i128-before.0 as i128,"continuation_ns":continuation_ns,"continuation_bytes":checked.1-after.1,"continuation_calls":checked.2-after.2,"drop_ns":drop_ns,"retained_after_drop":dropped.0 as i128-before.0 as i128,"checksum":checksum.to_string(),"output_size":bytes})
        );
        std::io::stdout().flush().unwrap();
    }
}
