use hypercurve::{
    BezierParameter2, BezierParameterRange2, CubicBezier2, Curve2, CurveParameterRange2,
    CurvePath2, Point2, QuadraticBezier2, RationalQuadraticBezier2, Real,
    
};

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}

fn point(x: i32, y: i32) -> Point2 {
    Point2::new(x.into(), y.into())
}

fn exact(value: Real) -> BezierParameter2 {
    BezierParameter2::Exact(value)
}

fn range(start: BezierParameter2, end: BezierParameter2) -> BezierParameterRange2 {
    BezierParameterRange2::try_new(start, end).unwrap()
}

fn main() {
    let parabola = QuadraticBezier2::new(point(0, 0), Point2::new(q(1, 2), 0.into()), point(1, 1));
    let sqrt2 = Real::from(2).sqrt().unwrap();
    let ellipse = RationalQuadraticBezier2::try_new(
        point(2, 0), point(2, 1), point(0, 1),
        Real::one(), (&sqrt2 / Real::from(2)).unwrap(), Real::one(),
    ).unwrap();
    // C(t)=(t-t^3/3,t^2), speed 1+t^2.
    let ph = CubicBezier2::new(
        point(0, 0), Point2::new(q(1, 3), 0.into()),
        Point2::new(q(2, 3), q(1, 3)), Point2::new(q(2, 3), 1.into()),
    );
    let cusp_parallel = parabola.parallel_left(Real::one()).unwrap();
    let analysis = cusp_parallel.singularity_analysis(&CurveParameterRange2::unit()).unwrap();
    let [cusp] = analysis.parallel_cusps() else { panic!("one parabola parallel cusp expected") };
    let zero = exact(Real::zero());
    let one = exact(Real::one());
    let regular = [
        ("parabola", parabola.parallel_left(q(-1, 4)).unwrap()),
        ("ellipse", ellipse.parallel_left(q(-1, 8)).unwrap()),
        ("ph", ph.parallel_left(q(1, 4)).unwrap()),
        ("stationary-zero", QuadraticBezier2::new(point(0, 0), point(0, 0), point(1, 1)).parallel_left(Real::zero()).unwrap()),
    ];
    for (name, parallel) in regular {
        let curve = Curve2::try_analytic_parallel(parallel, range(zero.clone(), one.clone())).unwrap();
        if name == "ph" {
            assert!(curve.point_at(&q(1, 2).into()).unwrap().coincides_with(
                &Point2::new(q(31, 120), q(2, 5)).into()
            ).unwrap());
        }
        let path = CurvePath2::try_new(vec![curve.clone(), curve.reversed().unwrap()]).unwrap();
        let result = path.project_to_finite_polyline(&hypercurve::FiniteProjectionOptions::try_new(0.01).unwrap()).map(|output| output.points().len());
        println!("{name}: {result:?}");
        assert!(result.is_ok(), "finite projection must consume the exact parallel: {name}");
    }
    let first = Curve2::try_analytic_parallel(cusp_parallel.clone(), range(zero.clone(), cusp.clone())).unwrap();
    let second = Curve2::try_analytic_parallel(cusp_parallel.clone(), range(cusp.clone(), one.clone())).unwrap();
    let path = CurvePath2::try_new(vec![first, second]).unwrap();
    let result = path.project_to_finite_polyline(&hypercurve::FiniteProjectionOptions::try_new(0.01).unwrap()).map(|output| output.points().len());
    println!("cusp-split: {result:?}");
    let unsplit = Curve2::try_analytic_parallel(cusp_parallel, range(zero, one));
    assert!(unsplit.is_err());
    println!("unsplit-cusp: {unsplit:?}");
}
