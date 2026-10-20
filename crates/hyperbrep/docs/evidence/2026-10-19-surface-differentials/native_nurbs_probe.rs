use hyperbrep::*;
use std::cmp::Ordering as CmpOrdering;
fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}
fn selected() -> Parameter {
    let seed = Curve3::rational_bezier(
        [-1, -1, -1, 4]
            .map(|x| Point3::new(x.into(), 0.into(), 0.into()))
            .to_vec(),
        vec![1.into(); 4],
    )
    .unwrap();
    let CurveParameterLocation::Parameters(mut parameters) =
        seed.parameters_of(&Point3::origin()).unwrap()
    else {
        panic!("one selected root")
    };
    assert_eq!(parameters.len(), 1);
    let p = parameters.pop().unwrap();
    assert!(p.try_real().is_none());
    p
}
fn check(
    curve: &Curve3,
    surface: &Surface,
    parameter: &Parameter,
    unit: &GeometricVector3,
    weighted: bool,
    width: &Real,
) {
    let v = curve.derivative_at(parameter, 1).unwrap();
    let a = curve.derivative_at(parameter, 2).unwrap();
    assert!(v.try_coordinates().is_none() && a.try_coordinates().is_none());
    assert!(v.normalized().unwrap().equals(unit).unwrap());
    let cross = v.cross(&a).unwrap();
    assert_eq!(
        cross.compare_dot(&v, &0.into()).unwrap(),
        CmpOrdering::Equal
    );
    assert_eq!(
        cross.compare_dot(&a, &0.into()).unwrap(),
        CmpOrdering::Equal
    );
    assert_eq!(
        cross
            .normalized()
            .unwrap()
            .compare_squared_length(&1.into())
            .unwrap(),
        CmpOrdering::Equal
    );
    let w3 = width * width * width;
    // C=(t,t²,t³)/(1+t) when weighted. (C' x C'')_z is
    // 2/(1+t)^3, otherwise2. The native chart contributes 1/width^3.
    if weighted {
        assert_eq!(
            cross
                .compare_coordinate(Axis::Z, &(q(1, 4) / &w3).unwrap())
                .unwrap(),
            CmpOrdering::Greater
        );
        assert_eq!(
            cross
                .compare_coordinate(Axis::Z, &(Real::one() / &w3).unwrap())
                .unwrap(),
            CmpOrdering::Less
        );
    } else {
        assert_eq!(
            cross
                .compare_coordinate(Axis::Z, &(Real::from(2) / &w3).unwrap())
                .unwrap(),
            CmpOrdering::Equal
        );
    }
    let uv = parameter
        .curve_parameter()
        .affine_point(1.into(), 0.into(), 0.into(), q(1, 3))
        .unwrap();
    assert!(surface.point_at(&uv).is_ok());
    let partials = surface.partials_at(&uv).unwrap();
    assert!(partials.u().equals(&v).unwrap());
    let normal = surface.normal_at(&uv).unwrap();
    assert_eq!(
        normal.compare_dot(&v, &0.into()).unwrap(),
        CmpOrdering::Equal
    );
    assert_eq!(
        normal.compare_dot(partials.v(), &0.into()).unwrap(),
        CmpOrdering::Equal
    );
    assert_eq!(
        normal.compare_squared_length(&1.into()).unwrap(),
        CmpOrdering::Equal
    );
    assert_eq!(
        normal.coordinate_sign(Axis::X).unwrap(),
        hyperreal::RealSign::Positive
    );
    assert_eq!(
        normal.coordinate_sign(Axis::Y).unwrap(),
        hyperreal::RealSign::Negative
    );
    assert_eq!(
        normal.compare_coordinate(Axis::Z, &0.into()).unwrap(),
        CmpOrdering::Equal
    );
}
fn run_native_nurbs_differentials() {
    let t = selected();
    for weighted in [false, true] {
        let weights = if weighted {
            vec![1.into(), q(4, 3), q(5, 3), 2.into()]
        } else {
            vec![1.into(); 4]
        };
        let xyz: [(Real, Real, Real); 4] = [
            (0.into(), 0.into(), 0.into()),
            (q(1, 3), 0.into(), 0.into()),
            (q(2, 3), q(1, 3), 0.into()),
            (1.into(), 1.into(), 1.into()),
        ];
        let controls = xyz
            .into_iter()
            .enumerate()
            .map(|(i, (x, y, z))| {
                Point3::new(
                    (x / &weights[i]).unwrap(),
                    (y / &weights[i]).unwrap(),
                    (z / &weights[i]).unwrap(),
                )
            })
            .collect::<Vec<_>>();
        let bezier = Curve3::rational_bezier(controls.clone(), weights.clone()).unwrap();
        let unit = bezier.derivative_at(&t, 1).unwrap().normalized().unwrap();
        for (index, (start, width)) in [(0.into(), Real::one()), (2.into(), Real::from(3))]
            .into_iter()
            .enumerate()
        {
            let end = &start + &width;
            let curve = Curve3::nurbs(
                3,
                controls.clone(),
                weights.clone(),
                [vec![start.clone(); 4], vec![end; 4]].concat(),
            )
            .unwrap();
            let parameter = t.affine_image(&width, &start).unwrap();
            let surface = Surface::extrusion(curve.clone(), Vector3::z()).unwrap();
            check(&curve, &surface, &parameter, &unit, weighted, &width);
            let middle = &start + &width * q(1, 2);
            let v = curve.derivative_at(&middle.clone().into(), 1).unwrap();
            let a = curve.derivative_at(&middle.into(), 2).unwrap();
            let expected = ((if weighted { q(16, 27) } else { 2.into() })
                / (&width * &width * &width))
                .unwrap();
            assert_eq!(
                v.cross(&a)
                    .unwrap()
                    .compare_coordinate(Axis::Z, &expected)
                    .unwrap(),
                CmpOrdering::Equal
            );
            let mut builder = ModelBuilder::new();
            builder.curve(curve).unwrap();
            builder.surface(surface).unwrap();
            let model = builder.finish().unwrap();
            let json = model.to_json().unwrap();
            #[cfg(not(target_arch = "wasm32"))]
            if let Some(dir) = std::env::var_os("HYPERBREP_SURFACE_DIFFERENTIAL_ARTIFACT_DIR") {
                std::fs::create_dir_all(&dir).unwrap();
                std::fs::write(
                    std::path::Path::new(&dir)
                        .join(format!("native-nurbs-{weighted}-{index}.json")),
                    &json,
                )
                .unwrap();
            }
            let _ = index;
            let cold = RawModel::from_json(&json, &ArchiveLimits::default())
                .unwrap()
                .validate()
                .unwrap();
            assert_eq!(cold.to_json().unwrap(), json);
            check(
                cold.curves().next().unwrap().geometry(),
                cold.surfaces().next().unwrap().geometry(),
                &parameter,
                &unit,
                weighted,
                &width,
            );
        }
    }
}
