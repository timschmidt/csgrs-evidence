fn mark(text: &str) {
    static START: std::sync::OnceLock<std::time::Instant> = std::sync::OnceLock::new();
    eprintln!("{:.3}s {}", START.get_or_init(std::time::Instant::now).elapsed().as_secs_f64(), text);
}
use hypercurve::*;
use hypersolve::bivariate_topology::{
    BivariateCurveDomain, BivariateTopologyConfig, decompose_bivariate_curve,
};
use hypersolve::{AlgebraicFiberRootIsolationConfig, BivariatePolynomial, IsolatedRootInterval};
use std::cmp::Ordering;

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}
fn p(rows: &[&[i32]]) -> BivariatePolynomial {
    BivariatePolynomial::new(
        rows.iter()
            .map(|row| row.iter().copied().map(Real::from).collect())
            .collect(),
    )
}
fn x() -> BivariatePolynomial {
    p(&[&[], &[1]])
}
fn y() -> BivariatePolynomial {
    p(&[&[0, 1]])
}
fn form(point: &CurvePoint2, numerator: BivariatePolynomial) -> CurvePointRationalForm2 {
    point.rational_form(numerator, p(&[&[1]])).unwrap()
}
fn zero(point: &CurvePoint2, equation: BivariatePolynomial) {
    assert_eq!(
        form(point, equation)
            .compare_to_real(&Real::zero())
            .unwrap(),
        Ordering::Equal
    );
}
fn source() -> CurvePoint2 {
    let parameter = BezierParameter2::Algebraic(
        BezierAlgebraicParameter2::try_isolate(
            BezierParameterPolynomial::try_new_power_basis(vec![q(-1, 8), 0.into(), 1.into()])
                .unwrap(),
            BezierParameterInterval::try_new(q(1, 3), q(1, 2)).unwrap(),
        )
        .unwrap(),
    );
    CurvePointDefinition2::PolynomialFiber {
        equation: p(&[&[0, 0, 0, 16], &[-1]]),
        parameter: parameter.into(),
        root: IsolatedRootInterval {
            lower: q(1, 4),
            upper: q(3, 8),
            exact_root: None,
            distinct_root_count: 1,
        },
    }
    .into_point()
    .unwrap()
}
fn curves(equation: BivariatePolynomial) -> PolynomialCurveSet2 {
    curves_with_config(equation, AlgebraicFiberRootIsolationConfig::default())
}
fn curves_with_config(
    equation: BivariatePolynomial,
    config: AlgebraicFiberRootIsolationConfig,
) -> PolynomialCurveSet2 {
    let topology = decompose_bivariate_curve(
        &equation,
        &BivariateCurveDomain {
            first: [(-1).into(), 1.into()],
            second: [(-2).into(), 2.into()],
        },
        BivariateTopologyConfig::default(),
    )
    .unwrap();
    PolynomialCurveSet2::from_topology(topology, config).unwrap()
}

fn independent_coefficient_source() -> CurvePoint2 {
    CurvePointDefinition2::PolynomialFiber {
        equation: p(&[&[-1, 0, 0, 0, 0, 17]]),
        parameter: Real::zero().into(),
        root: IsolatedRootInterval {
            lower: q(1, 2),
            upper: q(3, 4),
            exact_root: None,
            distinct_root_count: 1,
        },
    }
    .into_point()
    .unwrap()
}

fn coefficient_root() -> (
    CurvePoint2,
    CurvePointRationalForm2,
    CurvePointRationalForm2,
) {
    mark("STAGE first start");
    let first = source();
    mark("STAGE first done");
    let second = independent_coefficient_source();
    mark("STAGE second done");
    let a = form(&first, x());
    let b = form(&second, y());
    // The independent positive selections satisfy 8a²=1 and 17b⁵=1.
    // z³+a z-b is strictly increasing, negative at 1/2 and positive at 3/4.
    mark("STAGE root construction start");
    let point = CurvePointDefinition2::SelectedPolynomialRoot {
        coefficients: vec![
            b.scaled(&Real::from(-1)).unwrap(),
            a.clone(),
            form(&Point2::new(0.into(), 0.into()).into(), p(&[&[0]])),
            form(&Point2::new(0.into(), 0.into()).into(), p(&[&[1]])),
        ],
        root: IsolatedRootInterval {
            lower: q(1, 2),
            upper: q(3, 4),
            exact_root: None,
            // A supplied count is not a selection proof.
            distinct_root_count: 999,
        },
    }
    .into_point()
    .expect("a root over independent selected coefficient queries is exact geometry");
    mark("STAGE root construction done");
    (point, a, b)
}

#[test]
fn selected_coefficient_root_preserves_its_equation_and_feeds_geometry() {
    let (point, a, b) = coefficient_root();
    let z = form(&point, x());
    zero(&point, y());
    mark("STAGE residual start");
    let residual = z
        .multiply(&z)
        .unwrap()
        .multiply(&z)
        .unwrap()
        .add(&a.multiply(&z).unwrap())
        .unwrap()
        .subtract(&b)
        .unwrap();
    assert_eq!(
        residual.compare_to_real(&Real::zero()).unwrap(),
        Ordering::Equal
    );
    assert_eq!(z.compare_to_real(&q(1, 2)).unwrap(), Ordering::Greater);
    assert_eq!(z.compare_to_real(&q(3, 4)).unwrap(), Ordering::Less);
    mark("STAGE residual and bounds done");
    let replay = point.definition().unwrap().into_point().unwrap();
    mark("STAGE replay done coincidence start");
    assert!(replay.coincides_with(&point).unwrap());
    mark("STAGE coincidence done");
    let parabola = curves(p(&[&[0, 0, 1], &[-1]]));
    mark("STAGE parabola lift start");
    let lifted = parabola.curves()[1]
        .point_at(&form(&replay, x()).parameter().unwrap())
        .unwrap();
    mark("STAGE parabola lift done");
    zero(&lifted, p(&[&[0, 0, 1], &[-1]]));
    mark("STAGE parabola equation done");
    assert_eq!(form(&lifted, x()).compare(&z).unwrap(), Ordering::Equal);
    mark("STAGE parabola residual done");
    let square = curves(p(&[&[0, 1], &[], &[-1]]));
    mark("STAGE square lift start");
    let final_parameter = form(&lifted, y()).parameter().unwrap();
    mark("STAGE square parameter done");
    let returned = square.curves()[0].point_at(&final_parameter).unwrap();
    mark("STAGE square lift done");
    assert_eq!(form(&returned, y()).compare(&z).unwrap(), Ordering::Equal);
}
