//! Review boundary: retaining an exact source is not a finite-loop certificate.
use hyperbrep::*;
use hypercurve::{Curve2, CurvePath2, LineSeg2, Point2 as Uv, RationalBezier2};

fn source(weight: i32) -> Curve2 {
    RationalBezier2::try_new(
        vec![
            Uv::from_values(0, 0),
            Uv::from_values(1, 1),
            Uv::from_values(2, 0),
        ],
        vec![Real::one(), weight.into(), Real::one()],
    )
    .unwrap()
    .into()
}

fn image(source: Curve2) -> Curve3 {
    Curve3::planar_image(source, Point3::origin(), Vector3::x(), Vector3::y()).unwrap()
}

fn face(source: Curve2) -> Result<(), BuildError> {
    let points = [
        Uv::from_values(0, 0),
        Uv::from_values(2, 0),
        Uv::from_values(2, 3),
        Uv::from_values(0, 3),
    ];
    let mut curves = vec![source];
    for index in 1..4 {
        curves.push(
            LineSeg2::try_new(points[index].clone(), points[(index + 1) % 4].clone())
                .unwrap()
                .into(),
        );
    }
    let mut builder = ModelBuilder::new();
    let vertices = points
        .iter()
        .map(|point| {
            builder
                .vertex(Point3::new(point.x().clone(), point.y().clone(), Real::zero()).into())
                .unwrap()
        })
        .collect::<Vec<_>>();
    let surface = builder
        .surface(Surface::plane(Point3::origin(), Vector3::x(), Vector3::y()).unwrap())
        .unwrap();
    let mut uses = vec![];
    for (index, source) in curves.into_iter().enumerate() {
        let curve = builder.curve(image(source.clone()))?;
        let edge = builder.edge(
            &vertices[index],
            &vertices[(index + 1) % 4],
            &curve,
            ParameterRange::unit(),
        )?;
        let pcurve = builder.pcurve(Pcurve::new(source))?;
        uses.push(builder.edge_use(
            &edge,
            Direction::Forward,
            &pcurve,
            ParameterCorrespondence::affine(Real::one(), Real::zero()).unwrap(),
        )?);
    }
    let wire = builder.wire(&uses)?;
    builder.face(&surface, Orientation::Forward, &wire, &[])?;
    Ok(())
}

fn main() {
    let half = (Real::one() / Real::from(2)).unwrap();
    // W(t)=(1-2t)^2 has an authored pole at 1/2; its endpoints are finite.
    let source = source(-1);
    assert!(source.point_at(&half.clone().into()).is_err());
    let curve = image(source.clone());
    let mut builder = ModelBuilder::new();
    builder.curve(curve.clone()).unwrap();
    let model = builder.finish().unwrap();
    let json = model.to_json().unwrap();
    let cold = RawModel::from_json(&json, &ArchiveLimits::default())
        .unwrap()
        .validate()
        .unwrap();
    assert_eq!(cold.to_json().unwrap(), json);
    for curve in [&curve, cold.curves().next().unwrap().geometry()] {
        curve.point_at(&Real::zero().into()).unwrap();
        curve.point_at(&Real::one().into()).unwrap();
        println!(
            "pole_evaluation={:?}",
            curve.point_at(&half.clone().into()).unwrap_err()
        );
        println!("pole_bounds={:?}", curve.bounds().unwrap_err());
    }
    let path = CurvePath2::try_new(vec![
        source.clone(),
        LineSeg2::try_new(Uv::from_values(2, 0), Uv::from_values(0, 0))
            .unwrap()
            .into(),
    ])
    .unwrap();
    println!(
        "pole_loop={:?}",
        path.simple_loop_orientation().unwrap_err()
    );
    println!("pole_face={:?}", face(source).unwrap_err());
    face(self::source(1)).unwrap();
    println!("recovery_face=admitted");
}
