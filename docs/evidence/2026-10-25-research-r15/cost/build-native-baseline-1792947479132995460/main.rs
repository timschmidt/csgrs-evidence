use hypercurve::{
    BezierParameter2, BezierParameterPolynomial, Curve2, CurveCertainty, CurvePath2, CurvePoint2,
    CurveRegion2, CurveRegionTrimFragment2, FillRule, LineSeg2, Point2, PredicatePolicy,
    RationalBezier2, Real, evaluate_under,
};
use serde_json::{Value, json};
use std::{
    io::Write,
    sync::atomic::{AtomicUsize, Ordering},
    time::Instant,
};
#[cfg(feature = "allocations")]
use std::alloc::{GlobalAlloc, Layout, System};
#[cfg(feature = "allocations")]
struct CountingAllocator;
static LIVE: AtomicUsize = AtomicUsize::new(0);
static BYTES: AtomicUsize = AtomicUsize::new(0);
static CALLS: AtomicUsize = AtomicUsize::new(0);
static PEAK: AtomicUsize = AtomicUsize::new(0);
#[cfg(feature = "allocations")]
fn grow(n: usize) {
    CALLS.fetch_add(1, Ordering::Relaxed);
    BYTES.fetch_add(n, Ordering::Relaxed);
    let live = LIVE.fetch_add(n, Ordering::Relaxed) + n;
    PEAK.fetch_max(live, Ordering::Relaxed);
}
// SAFETY: All pointers and layouts pass unchanged to System. Counters never
// inspect allocations or alter ownership. Realloc traffic counts full requests.
#[cfg(feature = "allocations")]
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
#[cfg(feature = "allocations")]
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
struct Fixture {
    region: CurveRegion2,
    source: Curve2,
    width: Real,
    height: Real,
    vertical: bool,
    empty: bool,
}
fn fixture(kind: usize, reversed: bool) -> Fixture {
    let selected = kind < 4 || kind == 6;
    let half = q(1, 2);
    let width = if selected {
        half.clone().sqrt().unwrap()
    } else {
        half.clone()
    };
    let alpha = BezierParameterPolynomial::try_new_power_basis(vec![
        -Real::one(),
        Real::zero(),
        Real::from(2),
    ])
    .unwrap()
    .isolate_unit_interval_roots()
    .unwrap()
    .remove(0);
    let point = |positive: bool, height: i64| -> CurvePoint2 {
        if selected {
            let curve = Curve2::from(
                RationalBezier2::try_new(
                    vec![p(0, height), p(if positive { 1 } else { -1 }, height)],
                    vec![Real::one(); 2],
                )
                .unwrap(),
            );
            curve.point_at(&alpha.clone().into()).unwrap()
        } else {
            Point2::new(
                if positive {
                    half.clone()
                } else {
                    -half.clone()
                },
                Real::from(height),
            )
            .into()
        }
    };
    let points = [
        point(false, 0),
        point(true, 0),
        point(true, 1),
        point(false, 1),
    ];
    let path = CurvePath2::try_new(
        (0..4)
            .map(|i| Curve2::try_line(points[i].clone(), points[(i + 1) % 4].clone()).unwrap())
            .collect(),
    )
    .unwrap();
    let region = CurveRegion2::try_from_boundary_paths(&[path], FillRule::NonZero).unwrap();
    let height = match kind {
        1 => Real::one(),
        2 | 5 => half,
        6 => Real::from(2),
        _ => Real::zero(),
    };
    let vertical = kind == 3;
    let source = if vertical {
        Curve2::from(LineSeg2::try_new(p(0, -1), p(0, 2)).unwrap())
    } else {
        Curve2::from(
            LineSeg2::try_new(
                Point2::new(-Real::one(), height.clone()),
                Point2::new(Real::one(), height.clone()),
            )
            .unwrap(),
        )
    };
    Fixture {
        region,
        source: if reversed {
            source.reversed().unwrap()
        } else {
            source
        },
        width,
        height,
        vertical,
        empty: kind == 6,
    }
}
fn expected(fixture: &Fixture, reversed: bool) -> ([Point2; 2], [Real; 2]) {
    let (mut points, parameters) = if fixture.vertical {
        ([p(0, 0), p(0, 1)], [q(1, 3), q(2, 3)])
    } else {
        (
            [
                Point2::new(-fixture.width.clone(), fixture.height.clone()),
                Point2::new(fixture.width.clone(), fixture.height.clone()),
            ],
            [
                (Real::one() - &fixture.width) / Real::from(2),
                (Real::one() + &fixture.width) / Real::from(2),
            ]
            .map(Result::unwrap),
        )
    };
    if reversed {
        points.reverse();
    }
    (points, parameters)
}
fn point_row(point: &Point2) -> Value {
    json!([point.x(), point.y()])
}
fn validate(fixture: &Fixture, reversed: bool, fragments: &[CurveRegionTrimFragment2]) -> Value {
    if fixture.empty {
        assert!(fragments.is_empty());
        return json!({"fragments":[],"certainty":"Certified"});
    }
    let [fragment] = fragments else {
        panic!("one exact retained interval")
    };
    let (points, parameters) = expected(fixture, reversed);
    assert_eq!(fragment.span_index(), 0);
    let mut rows = Vec::new();
    for (i, (location, endpoint, contacts)) in [
        (
            fragment.start_location(),
            fragment.curve().start(),
            fragment.start_boundary_contacts(),
        ),
        (
            fragment.end_location(),
            fragment.curve().end(),
            fragment.end_boundary_contacts(),
        ),
    ]
    .into_iter()
    .enumerate()
    {
        let expected_point: CurvePoint2 = points[i].clone().into();
        assert!(endpoint.coincides_with(&expected_point).unwrap());
        let parameter = location.parameter().unwrap();
        let expected_parameter = if reversed {
            Real::one() - &parameters[1 - i]
        } else {
            parameters[i].clone()
        };
        assert_eq!(
            parameter
                .compare(&BezierParameter2::Exact(expected_parameter.clone()).into())
                .unwrap(),
            std::cmp::Ordering::Equal
        );
        assert!(
            fixture
                .source
                .point_at(&parameter)
                .unwrap()
                .coincides_with(&endpoint)
                .unwrap()
        );
        let definition = endpoint.definition().unwrap();
        let rebuilt = definition.into_point().unwrap();
        assert!(rebuilt.coincides_with(&endpoint).unwrap());
        assert!(!contacts.is_empty());
        let mut contact_rows = Vec::new();
        for contact in contacts {
            let carrier = contact.carrier();
            let replay = carrier
                .curve()
                .point_at(contact.boundary_parameter())
                .unwrap();
            assert!(replay.coincides_with(&endpoint).unwrap());
            if let Some(point) = contact.point() {
                assert!(point.coincides_with(&endpoint).unwrap());
            }
            contact_rows.push(json!({"kind":format!("{:?}",contact.kind()),"contour_index":contact.contour_index(),"carrier_index":carrier.carrier_index(),"operand":format!("{:?}",carrier.operand()),"loop_index":carrier.loop_index(),"fragment_index":carrier.fragment_index(),"family":format!("{:?}",carrier.curve().family()),"materialized_point":contact.point().is_some(),"point":point_row(&points[i])}));
        }
        rows.push(json!({"parameter":expected_parameter,"point":point_row(&points[i]),"contacts":contact_rows}));
    }
    let reversed_curve = fragment.curve().reversed().unwrap();
    assert!(
        reversed_curve
            .start()
            .coincides_with(&points[1].clone().into())
            .unwrap()
    );
    assert!(
        reversed_curve
            .end()
            .coincides_with(&points[0].clone().into())
            .unwrap()
    );
    let roundtrip = reversed_curve.reversed().unwrap();
    assert!(
        roundtrip
            .start()
            .coincides_with(&fragment.curve().start())
            .unwrap()
    );
    assert!(
        roundtrip
            .end()
            .coincides_with(&fragment.curve().end())
            .unwrap()
    );
    json!({"fragments":[{"span_index":fragment.span_index(),"span":[fragment.span_range().endpoints().0,fragment.span_range().endpoints().1],"endpoints":rows}],"certainty":"Certified"})
}
fn main() {
    let args: Vec<_> = std::env::args().collect();
    let kind: usize = args[1].parse().unwrap();
    assert!(kind < 7);
    let reversed = args[2] == "reverse";
    let policy = if args[3] == "strict" {
        PredicatePolicy::STRICT
    } else {
        PredicatePolicy::APPROXIMATE_512
    };
    let samples: usize = args[4].parse().unwrap();
    let fixture = fixture(kind, reversed);
    for sample in 0..samples {
        let before = counts();
        PEAK.store(before.0, Ordering::Relaxed);
        let start = Instant::now();
        let outcome = evaluate_under(policy, || {
            fixture
                .source
                .trim_inside_region_with_parameters(&fixture.region)
        });
        let ns = start.elapsed().as_nanos();
        let after = counts();
        let peak = PEAK.load(Ordering::Relaxed).saturating_sub(before.0);
        assert_eq!(outcome.certainty(), CurveCertainty::Certified);
        let result = outcome.certified().unwrap().unwrap();
        let validation = Instant::now();
        let checked = evaluate_under(policy, || validate(&fixture, reversed, &result));
        assert_eq!(checked.certainty(), CurveCertainty::Certified);
        let artifact = checked.certified().unwrap();
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
            json!({"kind":kind,"reversed":reversed,"policy":args[3],"sample":sample,"ns":ns,"certainty":"Certified","status":"complete","allocation_counters":cfg!(feature="allocations"),"bytes":after.1-before.1,"calls":after.2-before.2,"peak_live_growth":peak,"result_live_delta":after.0 as i128-before.0 as i128,"continuation_ns":continuation_ns,"continuation_bytes":checked.1-after.1,"continuation_calls":checked.2-after.2,"drop_ns":drop_ns,"retained_after_drop":dropped.0 as i128-before.0 as i128,"checksum":checksum.to_string(),"output_size":bytes})
        );
        std::io::stdout().flush().unwrap();
    }
    let retained = evaluate_under(policy, || {
        fixture
            .source
            .trim_inside_region_with_parameters(&fixture.region)
    })
    .certified()
    .unwrap()
    .unwrap();
    let points = expected(&fixture, reversed).0;
    let empty = fixture.empty;
    drop(fixture);
    if empty {
        assert!(retained.is_empty());
    } else {
        assert!(
            retained[0]
                .curve()
                .start()
                .coincides_with(&points[0].clone().into())
                .unwrap()
        );
        assert!(
            retained[0]
                .curve()
                .end()
                .coincides_with(&points[1].clone().into())
                .unwrap()
        );
    }
}
