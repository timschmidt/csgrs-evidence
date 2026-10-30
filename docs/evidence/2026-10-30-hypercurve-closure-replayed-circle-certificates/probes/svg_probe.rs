// TEMPORARY replay probe (not for commit).
use super::*;
use crate::OffsetCornerStyle2;

fn p(x: i64, y: i64) -> Point2 { Point2::new(Real::from(x), Real::from(y)) }
fn polygon(points: &[(i64, i64)]) -> CurvePath2 {
    CurvePath2::try_new((0..points.len()).map(|i| {
        let (a, b) = (points[i], points[(i + 1) % points.len()]);
        Curve2::from(LineSeg2::try_new(p(a.0, a.1), p(b.0, b.1)).unwrap())
    }).collect()).unwrap()
}
fn region(paths: &[CurvePath2]) -> CurveRegion2 {
    CurveRegion2::try_from_boundary_paths_with_policy(paths, FillRule::NonZero, &CurveContext::STRICT).unwrap().into_value()
}
fn further(label: &str, region: &CurveRegion2) {
    let d = (Real::from(1) / Real::from(2)).unwrap();
    let r = region.offset_with_policy(d, &OffsetCornerStyle2::Round, &CurveContext::STRICT);
    eprintln!("PROBE {label} further: {:?}", r.map(|o| o.into_value().boundary_loops().len()));
}
fn lens(label: &str, paths: &[CurvePath2]) {
    for c in paths[1].curves() {
        if let Some(CurveGeometry2::RationalQuadraticBezier(q)) = c.geometry() {
            eprintln!("PROBE conic {label}: circle {} tangent-contacts {:?} implicit {}", q.retained_circular_conic().is_some(), q.retained_circular_conic().and_then(|c| c.tangent_contacts.as_ref().map(|t| t.len())), q.retained_implicit_quadratic_conic().is_some());
        }
        let d = |q: crate::CurvePoint2| format!("{:?}", q.definition()).len();
        eprintln!("PROBE {label} {:?}: start {} end {}", c.family(), d(c.start()), d(c.end()));
    }
}

fn ends(c: &Curve2) -> (&Point2, &Point2) {
    match c.geometry().unwrap() {
        CurveGeometry2::Line(l) => (l.start(), l.end()),
        CurveGeometry2::RationalQuadraticBezier(q) => (&q.control_points()[0], &q.control_points()[2]),
        _ => panic!(),
    }
}

#[test]
#[ignore]
fn replay_identity_probe() {
    let dumbbell = polygon(&[(-6, 2), (-2, 2), (-2, 1), (2, 1), (2, 2), (6, 2), (6, -2), (2, -2), (2, -1), (-2, -1), (-2, -2), (-6, -2)]);
    let framed = region(&[polygon(&[(-10, -10), (10, -10), (10, 10), (-10, 10)]), dumbbell]);
    let d = (Real::from(3) / Real::from(2)).unwrap();
    let dilated = framed.offset_with_policy(d, &OffsetCornerStyle2::Round, &CurveContext::STRICT).unwrap().into_value();
    let Classification::Decided(paths) = dilated.boundary_paths_with_policy(&CurveContext::STRICT).unwrap().into_value() else { panic!() };
    lens("original", &paths);
    let curves = paths[1].curves();
    for c in curves {
        let f = c.retained_fragment().map(|f| { let s = format!("{f:?}"); s[..s.len().min(60)].to_string() });
        eprintln!("PROBE kind {:?}: fragment {:?} restriction {} parallel {} polynomial {} native {}", c.family(), f, c.source_restriction().is_some(), c.analytic_parallel().is_some(), c.polynomial_branch().is_some(), c.geometry().is_some());
    }
    for k in 0..curves.len() {
        let (a, b) = (ends(&curves[k]).1, ends(&curves[(k + 1) % curves.len()]).0);
        eprintln!("PROBE joint {k}: debug-equal {} x-bytes-equal {} y-bytes-equal {} xbytes {} {} ptr-equal-x {}",
            format!("{a:?}") == format!("{b:?}"), a.x().to_bytes() == b.x().to_bytes(), a.y().to_bytes() == b.y().to_bytes(),
            a.x().to_bytes().len(), b.x().to_bytes().len(), std::ptr::eq(a.x(), b.x()));
        let (c1, c2) = (Real::from_bytes(&a.x().to_bytes()).unwrap(), Real::from_bytes(&a.x().to_bytes()).unwrap());
        let started = std::time::Instant::now();
        eprintln!("PROBE joint {k} decoded twice: zero {:?} cmp {:?} ({:?}); vs original {:?}", (&c1 - &c2).zero_status(), c1.partial_cmp(&c2), started.elapsed(), (&c1 - a.x()).zero_status());
        if k == 0 { eprintln!("PROBE joint0 a.x {:?}", a.x()); eprintln!("PROBE joint0 b.x {:?}", b.x()); }
    }
    unsafe { std::env::set_var("TEMP_TRACE_COMPARE", "orig") };
    further("original", &dilated);
    unsafe { std::env::remove_var("TEMP_TRACE_COMPARE") };
    let replayed_in_process = CurveRegion2::replay_boundary_paths_with_policy(&paths, FillRule::NonZero, &CurveContext::STRICT).unwrap().into_value();
    further("replay-in-process", &replayed_in_process);
    let options = SvgOptions::default();
    let encoded = exact::encode_paths(&paths, options.max_extension_bytes, options.max_point_definition_depth).unwrap();
    unsafe { std::env::set_var("TEMP_INTERN", "1") };
    let interned = exact::decode_paths(&encoded, options.max_extension_bytes, options.max_point_definition_depth).unwrap();
    unsafe { std::env::remove_var("TEMP_INTERN") };
    let interned_curves = interned[1].curves();
    for k in 0..interned_curves.len() {
        let (a, b) = (ends(&interned_curves[k]).1, ends(&interned_curves[(k + 1) % interned_curves.len()]).0);
        eprintln!("PROBE interned joint {k} ptr-equal-x {}", a.shares_storage(b));
    }
    further("interned-try-from", &region(&interned));
    let plain = exact::decode_paths(&encoded, options.max_extension_bytes, options.max_point_definition_depth).unwrap();
    let attach = |keep_contacts: bool, base: &Vec<CurvePath2>| -> Vec<CurvePath2> { base.iter().zip(paths.iter()).map(|(path, source)| CurvePath2::try_new(path.curves().iter().zip(source.curves()).map(|(c, o)| match (c.geometry(), o.geometry()) {
        (Some(CurveGeometry2::RationalQuadraticBezier(q)), Some(CurveGeometry2::RationalQuadraticBezier(oq))) => {
            let circle = oq.retained_circular_conic().unwrap();
            let circle = std::sync::Arc::new(crate::rational_bezier::RationalQuadraticCircle2 { center: circle.center.clone(), radius_squared: circle.radius_squared.clone(), tangent_contacts: if keep_contacts { circle.tangent_contacts.clone() } else { None } });
            Curve2::from(q.clone().with_retained_conic_provenance(Some(circle.implicit_coefficients()), Some(circle)))
        }
        _ => c.clone(),
    }).collect()).unwrap()).collect() };
    let original_certificate = attach(false, &interned);
    let recognized: Vec<CurvePath2> = plain.iter().map(|path| CurvePath2::try_new(path.curves().iter().map(|c| match c.geometry() {
        Some(CurveGeometry2::RationalQuadraticBezier(q)) => {
            let Classification::Decided(Some(support)) = crate::arc_bezier::rational_quadratic_circular_arc(q, &CurveContext::STRICT).unwrap() else { panic!("not a circle") };
            let (implicit, circular) = crate::arc_bezier::circular_conic_provenance(&support);
            eprintln!("PROBE recognized center debug length {}", format!("{:?}", support.center()).len());
            Curve2::from(q.clone().with_retained_conic_provenance(Some(implicit), Some(circular)))
        }
        _ => c.clone(),
    }).collect()).unwrap()).collect();
    further("with-contacts", &region(&attach(true, &interned)));
    further("certificate-without-point-interning", &region(&attach(false, &plain)));
    further("original-certificate-interned-points", &region(&original_certificate));
    further("recognized-from-controls", &region(&recognized));
    let decoded = exact::decode_paths(&encoded, options.max_extension_bytes, options.max_point_definition_depth).unwrap();
    lens("decoded", &decoded);
    let decoded_region = region(&decoded);
    unsafe { std::env::set_var("TEMP_TRACE_COMPARE", "dec") };
    further("decoded-try-from", &decoded_region);
    unsafe { std::env::remove_var("TEMP_TRACE_COMPARE") };
    let replayed = CurveRegion2::replay_boundary_paths_with_policy(&decoded, FillRule::NonZero, &CurveContext::STRICT).unwrap().into_value();
    further("decoded-replay", &replayed);
}
