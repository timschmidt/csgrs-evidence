use hyperbrep::{Curve3, CurveParameterLocation, Point3, Real, Vector3};
use hypercurve::{BezierParameter2, BezierParameterRange2, Curve2, Point2, QuadraticBezier2};

fn main() {
    let axis = Curve3::rational_bezier(
        [-1, -1, -1, 1]
            .map(|x| Point3::new(x.into(), 0.into(), 0.into()))
            .to_vec(),
        vec![Real::one(); 4],
    )
    .unwrap();
    let CurveParameterLocation::Parameters(parameters) =
        axis.parameters_of(&Point3::origin()).unwrap()
    else {
        panic!("selected root required")
    };
    assert_eq!(parameters.len(), 1);
    assert!(parameters[0].try_real().is_none());
    let parallel = QuadraticBezier2::new(
        Point2::from_values(0, 0),
        Point2::from_values(2, 2),
        Point2::from_values(4, 0),
    )
    .parallel_left(Real::one())
    .unwrap();
    let source = Curve2::try_analytic_parallel(
        parallel,
        BezierParameterRange2::try_new(
            BezierParameter2::Exact(Real::zero()),
            BezierParameter2::Exact(Real::one()),
        )
        .unwrap(),
    )
    .unwrap();
    let lifted =
        Curve3::planar_image(source, Point3::origin(), Vector3::x(), Vector3::y()).unwrap();
    let point = lifted.point_at(&parameters[0]).unwrap();
    assert!(point.try_coordinates().is_none());
    println!("selected_planar_point=retained");
}
