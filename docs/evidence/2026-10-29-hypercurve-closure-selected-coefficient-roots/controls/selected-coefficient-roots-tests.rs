
fn independent_coefficient_source() -> CurvePoint2 {
    CurvePointDefinition2::PolynomialFiber {
        equation: p(&[&[-1, 0, 0, 0, 0, 17]]),
        parameter: Real::zero().into(),
        root: IsolatedRootInterval {
            lower: q(1, 2), upper: q(3, 4), exact_root: None, distinct_root_count: 1,
        },
    }.into_point().unwrap()
}

fn coefficient_root() -> (CurvePoint2, CurvePointRationalForm2, CurvePointRationalForm2) {
    let first = source();
    let second = independent_coefficient_source();
    let a = form(&first, x());
    let b = form(&second, y());
    // The independent positive selections satisfy 8a²=1 and 17b⁵=1.
    // z³+a z-b is strictly increasing, negative at 1/2 and positive at 3/4.
    let point = CurvePointDefinition2::SelectedPolynomialRoot {
        coefficients: vec![
            b.scaled(&Real::from(-1)).unwrap(), a.clone(),
            form(&Point2::new(0.into(), 0.into()).into(), p(&[&[0]])),
            form(&Point2::new(0.into(), 0.into()).into(), p(&[&[1]])),
        ],
        root: IsolatedRootInterval {
            lower: q(1, 2), upper: q(3, 4), exact_root: None,
            // A supplied count is not a selection proof.
            distinct_root_count: 999,
        },
    }.into_point().expect("a root over independent selected coefficient queries is exact geometry");
    (point, a, b)
}

#[test]
fn selected_coefficient_root_preserves_its_equation_and_feeds_geometry() {
    let (point, a, b) = coefficient_root();
    let z = form(&point, x());
    zero(&point, y());
    let residual = z.multiply(&z).unwrap().multiply(&z).unwrap()
        .add(&a.multiply(&z).unwrap()).unwrap().subtract(&b).unwrap();
    assert_eq!(residual.compare_to_real(&Real::zero()).unwrap(), Ordering::Equal);
    assert_eq!(z.compare_to_real(&q(1, 2)).unwrap(), Ordering::Greater);
    assert_eq!(z.compare_to_real(&q(3, 4)).unwrap(), Ordering::Less);
    let replay = point.definition().unwrap().into_point().unwrap();
    assert!(replay.coincides_with(&point).unwrap());
    let parabola = curves(p(&[&[0, 0, 1], &[-1]]));
    let lifted = parabola.curves()[1].point_at(&form(&replay, x()).parameter().unwrap()).unwrap();
    zero(&lifted, p(&[&[0, 0, 1], &[-1]]));
    assert_eq!(form(&lifted, x()).compare(&z).unwrap(), Ordering::Equal);
    let square = curves(p(&[&[0, 1], &[], &[-1]]));
    let returned = square.curves()[0].point_at(&form(&lifted, y()).parameter().unwrap()).unwrap();
    assert_eq!(form(&returned, y()).compare(&z).unwrap(), Ordering::Equal);
}
