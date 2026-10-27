use hypercurve::{
    BezierAlgebraicParameter2, BezierParameter2, BezierParameterInterval,
    BezierParameterPolynomial, Curve2, CurveCornerMode2, CurveFamily2, CurveFillet2,
    CurveParameter2, CurvePath2, CurveRegion2, Real, SvgGeometry2, export_svg_document,
};
fn q(n:i32,d:i32)->Real {(Real::from(n)/Real::from(d)).unwrap()}
struct Limited { text: String, remaining: usize }
impl std::fmt::Write for Limited {
    fn write_str(&mut self, s: &str) -> std::fmt::Result {
        if s.len() <= self.remaining { self.text.push_str(s); self.remaining -= s.len(); Ok(()) }
        else { let end=s.floor_char_boundary(self.remaining); self.text.push_str(&s[..end]); self.remaining=0; Err(std::fmt::Error) }
    }
}
fn bounded(label: &str, value: impl std::fmt::Debug) {
    use std::fmt::Write;
    let mut out=Limited { text: String::new(), remaining: 32000 };
    let _=write!(&mut out,"{value:?}");
    println!("{label}: {}",out.text);
}
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
    bounded("circle", circle);
    bounded("range", circle.parameter_domain());
    let output=encode(filleted);
    println!("selected-circle replay: {:?}",output.as_ref().map(String::len));
    assert!(output.is_ok(),"an exact selected circular fillet must retain its supporting definition through native replay");
}
