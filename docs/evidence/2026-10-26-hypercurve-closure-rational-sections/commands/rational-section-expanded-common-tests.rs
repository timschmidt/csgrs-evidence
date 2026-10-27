
#[test]
fn rational_cusp_component_keeps_one_overlap_without_duplicate_contact() {
    let equation = polynomial(&[&[0,0,1], &[], &[], &[-1]]);
    let set = curves(equation.clone());
    assert_eq!(set.curves().len(),2);
    // With t=2u-1, C(u)=(t^2,t^3); the two visits meet at the cusp.
    let cusp = Curve2::from(hypercurve::CubicBezier2::new(
        Point2::from_values(1,-1), Point2::new(q(-1,3),1.into()),
        Point2::new(q(-1,3),(-1).into()), Point2::from_values(1,1),
    ));
    for branch in set.curves() {
        for (a,b) in [(branch,&cusp),(&cusp,branch)] {
            let topology = a.intersection_topology(b).unwrap();
            assert_eq!(topology.result().overlaps().len(),1);
            assert!(topology.result().contacts().is_empty());
            let overlap = &topology.result().overlaps()[0];
            for (s,t) in [(overlap.first_range().start(),overlap.second_range().start()),(overlap.first_range().end(),overlap.second_range().end())] {
                let s = a.parameter_from_span(overlap.first_span_index(),s).unwrap();
                let t = b.parameter_from_span(overlap.second_span_index(),t).unwrap();
                let point = a.point_at(&s).unwrap();on(&point,equation.clone());
                assert!(point.coincides_with(&b.point_at(&t).unwrap()).unwrap());
            }
        }
    }
}

#[test]
fn rational_common_components_keep_transforms_and_traversal() {
    let set=curves(polynomial(&[&[0,1],&[],&[-1]]));
    let source=Curve2::from(QuadraticBezier2::new(Point2::from_values(-1,1),Point2::from_values(0,-1),Point2::from_values(1,1)));
    for (transform,equation) in [
        (hypercurve::Similarity2::try_from_real_affine(0.into(),(-1).into(),1.into(),0.into(),3.into(),4.into()).unwrap(),polynomial(&[&[13,-8,1],&[1]])),
        (hypercurve::Similarity2::try_from_real_affine((-1).into(),0.into(),0.into(),1.into(),2.into(),(-3).into()).unwrap(),polynomial(&[&[-1,1],&[4],&[-1]])),
    ] {
        for ar in [false,true] {
            for br in [false,true] {
                let mut branch=set.curves()[0].transform_similarity(&transform).unwrap();
                let mut rational=source.transform_similarity(&transform).unwrap();
                if ar {branch=branch.reversed().unwrap();}
                if br {rational=rational.reversed().unwrap();}
                for (a,b) in [(&branch,&rational),(&rational,&branch)] {
                    let topology=a.intersection_topology(b).unwrap();
                    assert!(topology.result().contacts().is_empty()); assert_eq!(topology.result().overlaps().len(),1);
                    let overlap=&topology.result().overlaps()[0];
                    assert_eq!(overlap.orientation(),if ar^br {hypercurve::CurveOverlapOrientation2::Reversed} else {hypercurve::CurveOverlapOrientation2::Same});
                    for (s,t) in [(overlap.first_range().start(),overlap.second_range().start()),(overlap.first_range().end(),overlap.second_range().end())] {
                        let point=a.point_at(s).unwrap(); on(&point,equation.clone());
                        assert!(point.coincides_with(&b.point_at(t).unwrap()).unwrap());
                    }
                }
            }
        }
    }
}
