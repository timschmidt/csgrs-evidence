use hypercurve::{
    BezierAlgebraicParameter2, BezierParameter2, BezierParameterInterval,
    BezierParameterPolynomial, Curve2, CurveCornerMode2, CurveFamily2, CurveFillet2,
    CurveParameter2, CurvePath2, CurveRegion2, Real, SvgGeometry2, export_svg_document,
};
fn q(n:i32,d:i32)->Real {(Real::from(n)/Real::from(d)).unwrap()}
fn main() {
    let mut coefficients=vec![Real::zero();8];coefficients[0]=(-1).into();coefficients[7]=2.into();
    let beta:CurveParameter2=BezierParameter2::Algebraic(BezierAlgebraicParameter2::try_isolate(
        BezierParameterPolynomial::try_new_power_basis(coefficients).unwrap(),
        BezierParameterInterval::try_new(q(3,4),Real::one()).unwrap()).unwrap()).into();
    let at=|x:Real,y:Real| beta.affine_point(Real::one(),x,Real::zero(),y).unwrap();
    let path=CurvePath2::try_new(vec![
        Curve2::try_line(at(0.into(),0.into()),at(1.into(),0.into())).unwrap(),
        Curve2::try_line(at(1.into(),0.into()),at(1.into(),1.into())).unwrap(),
    ]).unwrap();
    let encode=|path| export_svg_document(&SvgGeometry2::new(CurveRegion2::empty(),vec![],vec![path]));
    let control=encode(path.clone()).unwrap();
    println!("selected-chord export control: {} bytes",control.len());
    let result=path.fillet_vertex(1,&CurveFillet2::new(q(1,4)),CurveCornerMode2::TrimOnly);
    if let Err(error)=&result {println!("fillet construction: {error:?}");}
    let mut solutions=result.unwrap().into_solutions();
    assert_eq!(solutions.len(),1,"one trim-only quarter-circle fillet");
    let filleted=solutions.pop().unwrap();
    assert_eq!(filleted.curves().len(),3);
    let circle=&filleted.curves()[1];
    assert_eq!(circle.family(),CurveFamily2::CircularArc);
    assert!(circle.start().coincides_with(&at(q(3,4),0.into())).unwrap());
    assert!(circle.end().coincides_with(&at(1.into(),q(1,4))).unwrap());
    println!("exact selected fillet endpoints pass; circle has authored geometry: {}",circle.geometry().is_some());
    let mut pieces=filleted.curves().to_vec();
    pieces.push(Curve2::try_line(at(1.into(),1.into()),at(0.into(),1.into())).unwrap());
    pieces.push(Curve2::try_line(at(0.into(),1.into()),at(0.into(),0.into())).unwrap());
    let closed=CurvePath2::try_new(pieces).unwrap();
    let closed=if std::env::args().any(|arg| arg=="--replay") {
        let text=encode(closed).unwrap();
        hypercurve::import_svg_document(&text).unwrap().paths()[0].clone()
    } else { closed };
    println!("closed exact boundary constructed");
    let region=CurveRegion2::try_from_boundary_paths(&[closed],hypercurve::FillRule::NonZero).unwrap();
    println!("region admitted");
    assert_eq!(region.loop_role_counts().unwrap(),(1,0));
    for (x,y,expected) in [
        (q(1,2),q(1,2),hypercurve::RegionPointLocation::Inside),
        (q(9,10),q(1,10),hypercurve::RegionPointLocation::Inside),
        (q(99,100),q(1,100),hypercurve::RegionPointLocation::Outside),
        (q(9,10),q(1,20),hypercurve::RegionPointLocation::Boundary),
    ] { assert_eq!(region.classify_point(&at(x,y)).unwrap(),expected); }
    let union=region.boolean_region(&CurveRegion2::empty(),hypercurve::BooleanOp::Union).unwrap();
    assert_eq!(union.loop_role_counts().unwrap(),(1,0));
    assert!(union.boolean_region(&region,hypercurve::BooleanOp::Difference).unwrap().is_empty());
    let boundaries=union.boundary_paths().unwrap();
    assert_eq!(boundaries.len(),1);
    assert!(CurveRegion2::try_from_boundary_paths(&boundaries,hypercurve::FillRule::NonZero).is_ok());
    println!("region queries, empty union, exact difference and boundary reconstruction pass");
}
