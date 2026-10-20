use hypercurve::*;
fn main() {
    let p=Point2::from_values(2,0);
    let arc=CircularArc2::try_from_center(p.clone(),p,Point2::from_values(0,0),false).unwrap();
    let contour=Contour2::try_new(vec![Segment2::Arc(arc)]);
    println!("full-circle contour: {contour:?}");
    assert!(contour.is_ok(), "a native full circle is not a zero-length line");
}
