use hypercurve::{
    BezierFitBoundKind, BezierLineImageFitRelation, BooleanOp, BulgeVertex2,
    CircularArc2, Contour2, CurveCertainty, CurveFamily2, CurveGeometry2,
    CurveOperation2, CurveRegion2, ExactCurveError, Point2, PredicatePolicy,
    RationalBezier2, RationalQuadraticBezier2, Real, UncertaintyReason, evaluate_under,
};
use serde_json::json;
use std::hint::black_box;

fn p(x: i32, y: i32) -> Point2 { Point2::from_values(x,y) }
fn q(n: i32, d: i32) -> Real { (Real::from(n)/Real::from(d)).unwrap() }

enum Fixture {
    Native(RationalQuadraticBezier2),
    General(RationalBezier2),
}

fn quarter() -> RationalQuadraticBezier2 {
    CircularArc2::try_from_center(p(1,0),p(0,1),p(0,0),false).unwrap()
        .rational_bezier_decomposition().unwrap().spans()[0].curve().clone()
}

fn selected_output() -> RationalQuadraticBezier2 {
    let circle=|x| {
        let contour=Contour2::from_bulge_vertices(&[
            BulgeVertex2::new(p(x-2,0),Real::one()),
            BulgeVertex2::new(p(x+2,0),Real::one()),
        ]).unwrap();
        CurveRegion2::try_from_native_material_contours(vec![contour]).unwrap()
    };
    let output=circle(0).boolean_region(&circle(1),BooleanOp::Union).unwrap();
    for boundary in output.boundary_loops() {
        for curve in boundary.curves() {
            if let Some(CurveGeometry2::RationalQuadraticBezier(curve))=curve.geometry() {
                return curve.clone();
            }
        }
    }
    panic!("actual circle output must expose its retained rational quadratic");
}

fn fixture(kind: usize) -> Fixture {
    let native=match kind {
        0|2 => quarter(),
        1|3 => selected_output(),
        4|5 => RationalQuadraticBezier2::try_new(p(0,0),p(0,0),p(0,0),Real::one(),Real::one(),Real::one()).unwrap(),
        6|7 => RationalQuadraticBezier2::try_new(p(0,0),p(1,0),p(2,0),Real::one(),Real::from(2),Real::one()).unwrap(),
        8|9 => RationalQuadraticBezier2::try_new(p(0,0),p(1,1),p(2,0),Real::one(),Real::from(2),Real::one()).unwrap(),
        10|11 => RationalQuadraticBezier2::try_new(p(1,0),p(1,-3),Point2::new(q(-4,5),q(-3,5)),Real::one(),-Real::one(),Real::from(10)).unwrap(),
        _=>panic!("unknown fixture"),
    };
    if [2,3,5,7,9,11].contains(&kind) {
        let general=RationalBezier2::from(native);
        Fixture::General(if kind==2 {general.elevated_to_degree(5).unwrap()} else {general})
    } else {Fixture::Native(native)}
}

fn query(input: &Fixture, kind: usize, policy: PredicatePolicy) -> u64 {
    let result=evaluate_under(policy,||match input {
        Fixture::Native(curve)=>curve.fit_exact_line_image(),
        Fixture::General(curve)=>curve.fit_exact_line_image(),
    });
    assert_eq!(result.certainty(),CurveCertainty::Certified);
    match result.certified().unwrap() {
        Ok(BezierLineImageFitRelation::NotLine)=>{
            assert!(![6,7,10,11].contains(&kind));1
        }
        Ok(BezierLineImageFitRelation::Fit(fit))=>{
            assert!([6,7].contains(&kind));
            assert_eq!(fit.line().start(),&p(0,0));
            assert_eq!(fit.line().end(),&p(2,0));
            assert_eq!(fit.control_point_count(),3);
            assert_eq!(fit.fit_certificate().source_start(),0);
            assert_eq!(fit.fit_certificate().source_end(),3);
            assert_eq!(fit.fit_certificate().fit_error_bound(),&Real::zero());
            assert_eq!(fit.fit_certificate().bound_kind(),BezierFitBoundKind::ProvenExact);
            2
        }
        Err(ExactCurveError::Blocked(blocker))=>{
            assert!([10,11].contains(&kind));
            assert_eq!(blocker.reason(),UncertaintyReason::Unsupported);
            assert_eq!(blocker.operation(),CurveOperation2::Classification);
            assert_eq!(blocker.family(),Some(if kind==10 {CurveFamily2::RationalQuadraticBezier} else {CurveFamily2::RationalBezier}));
            3
        }
        other=>panic!("unexpected fit outcome {other:?}"),
    }
}

fn main() {
    let args=std::env::args().collect::<Vec<_>>();
    let kind=args[1].parse::<usize>().unwrap();
    let policy=match args[2].as_str() {"strict"=>PredicatePolicy::STRICT,"approximate"=>PredicatePolicy::APPROXIMATE_512,_=>panic!("policy")};
    let batch=args[3].parse::<usize>().unwrap();assert!(batch>0);
    let input=fixture(kind);
    let mut out=std::io::BufWriter::new(std::io::stdout());
    for sample in 0..8 {
        let iterations=if sample==0 {1} else {batch};
        let before=counts();PEAK.store(before.0,Ordering::Relaxed);
        let start=Instant::now();let mut checksum=14695981039346656037_u64;
        for _ in 0..iterations {
            let value=query(black_box(&input),kind,policy);
            checksum=checksum.wrapping_mul(1099511628211)^black_box(value);
        }
        let ns=start.elapsed().as_nanos();let after=counts();
        let row=json!({"kind":kind,"policy":args[2],"sample":sample,"iterations":iterations,
            "ns":ns,"certainty":"Certified","expected_outcome":if kind>=10 {"Unsupported"} else if [6,7].contains(&kind) {"Fit"} else {"NotLine"},
            "checksum":checksum.to_string(),"allocation_instrumented":cfg!(feature="allocations"),
            "bytes":after.1-before.1,"calls":after.2-before.2,"live_delta":after.0 as i128-before.0 as i128,
            "peak_live_growth":PEAK.load(Ordering::Relaxed).saturating_sub(before.0)});
        writeln!(out,"{row}").unwrap();
    }
    out.flush().unwrap();
}
