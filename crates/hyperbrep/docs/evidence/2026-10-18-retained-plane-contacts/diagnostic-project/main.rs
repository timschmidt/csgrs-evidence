use hyperbrep::*;
use hypercurve::{BezierParameter2, BezierParameterRange2, Curve2, Point2 as Uv, QuadraticBezier2};

fn main() {
    let mode = std::env::args().nth(1).expect("diagnostic mode");
    let controls = (0_i32..4)
        .zip([-1, -1, -1, 1])
        .map(|(i, z)| Point3::new(Real::from(i), 0.into(), z.into()))
        .collect::<Vec<_>>();
    let (curve, plane) = match mode.as_str() {
        "cubic" => (
            Curve3::rational_bezier(controls, vec![Real::one(); 4]).unwrap(),
            Surface::plane(Point3::origin(), Vector3::x(), Vector3::y()).unwrap(),
        ),
        "nurbs" => (
            Curve3::nurbs(
                3,
                controls,
                vec![Real::one(); 4],
                [2, 2, 2, 2, 5, 5, 5, 5].map(Real::from).to_vec(),
            )
            .unwrap(),
            Surface::plane(Point3::origin(), Vector3::x(), Vector3::y()).unwrap(),
        ),
        "parallel" => {
            let parallel = QuadraticBezier2::new(
                Uv::from_values(0, 0),
                Uv::from_values(2, 2),
                Uv::from_values(4, 0),
            )
            .parallel_left(Real::one())
            .unwrap();
            let source = Curve2::try_analytic_parallel(
                parallel,
                BezierParameterRange2::try_new(
                    BezierParameter2::Exact(0.into()),
                    BezierParameter2::Exact(1.into()),
                )
                .unwrap(),
            )
            .unwrap();
            (
                Curve3::planar_image(source, Point3::origin(), Vector3::x(), Vector3::y())
                    .unwrap(),
                Surface::plane(
                    Point3::new(1.into(), 0.into(), 0.into()),
                    Vector3::y(),
                    Vector3::z(),
                )
                .unwrap(),
            )
        }
        _ => panic!("unknown mode"),
    };
    let result = plane.intersect_curve(&curve);
    if let Err(error) = &result {
        println!("case={mode} error={error:?}");
    }
    let CurveSurfaceIntersection::Points(points) = result.unwrap() else {
        panic!("one exact contact required")
    };
    assert_eq!(points.len(), 1);
    println!("case={mode} outcome=exact_contact");
}
