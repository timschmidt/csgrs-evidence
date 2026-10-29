#[test]
fn selected_query_restriction_reconstruction_and_native_replay() {
    let point = joint();
    let end = point.affine_form(q(1,4),q(1,4),0.into()).parameter().unwrap();
    let source: Curve2 = RationalBezier2::try_new(vec![Point2::new(0.into(),0.into()),Point2::new(q(1,2),0.into()),Point2::new(1.into(),1.into())],vec![Real::one();3]).unwrap().into();
    let range = CurveParameterRange2::try_new(CurveParameter2::from(Real::zero()),end.clone()).unwrap();
    let restriction=source.restrict_source(range).unwrap();
    assert_relation(&restriction.end(),polynomial(&[&[0,-1],&[],&[1]]));
    assert!(restriction.end().coincides_with(&source.point_at(&end).unwrap()).unwrap());
    let path=CurvePath2::try_new(vec![restriction]).unwrap();
    let text=export_svg_document(&SvgGeometry2::new(CurveRegion2::empty(),vec![],vec![path])).unwrap();
    let replay=import_svg_document(&text).unwrap();
    let curve=&replay.paths()[0].curves()[0];
    assert_eq!(curve.parameter_domain().end().compare(&end).unwrap(),Ordering::Equal);
    let reversed=curve.reversed().unwrap();
    assert!(reversed.start().coincides_with(&source.point_at(&end).unwrap()).unwrap());
    let halfway=end.affine_image(&q(1,2),&Real::zero()).unwrap();
    let (first,second)=curve.split_at(halfway.clone()).unwrap();
    assert!(first.end().coincides_with(&source.point_at(&halfway).unwrap()).unwrap());
    assert!(second.start().coincides_with(&first.end()).unwrap());
    let again=CurvePath2::try_new(vec![first,second]).unwrap();
    let text=export_svg_document(&SvgGeometry2::new(CurveRegion2::empty(),vec![],vec![again])).unwrap();
    let replay=import_svg_document(&text).unwrap();
    assert!(replay.paths()[0].end().coincides_with(&source.point_at(&end).unwrap()).unwrap());
}
