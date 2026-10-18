use hyperbrep::{builder, ArchiveLimits, RawModel};
use hypercurve::{Curve2, CurvePath2, CurveRegion2, FillRule, LineSeg2, Point2, Real, RationalBezier2};
fn p(x:i32,y:i32)->Point2 { Point2::from_values(x,y) }
fn main() {
    let degree_five=std::env::args().any(|arg|arg=="quintic");
    let width=if degree_five {5} else {4};
    let curve:Curve2=if degree_five { RationalBezier2::try_new(vec![p(0,0),p(1,-1),p(2,-1),p(3,-1),p(4,-1),p(5,0)],vec![1.into(),2.into(),3.into(),4.into(),5.into(),1.into()]).unwrap().into() } else {RationalBezier2::try_new(vec![p(0,0),p(1,-1),p(3,-1),p(width,0)],vec![1.into(),2.into(),3.into(),1.into()]).unwrap().into() };
    let path=CurvePath2::try_new(vec![curve,
        LineSeg2::try_new(p(width,0),p(width,2)).unwrap().into(),
        LineSeg2::try_new(p(width,2),p(0,2)).unwrap().into(),
        LineSeg2::try_new(p(0,2),p(0,0)).unwrap().into(),
    ]).unwrap();
    println!("path area={:?}",path.boundary_loop().unwrap().signed_area().map(|a|a.is_some()));
    let region=CurveRegion2::try_from_boundary_paths(&[path],FillRule::EvenOdd).unwrap();
    println!("region area={:?}",region.signed_area().map(|a|a.is_some()));
    let body=builder::extrude_curve_region(&region,Real::zero(),Real::from(3));
    println!("extrusion={:?}",body.as_ref().map(|m|m.model().counts()));
    if let Ok(body)=body {
        println!("volume={:?}",body.model().solids().next().unwrap().volume().map(|_|"available"));
        let archive=body.model().to_json().unwrap();
        println!("replay={:?}",RawModel::from_json(&archive,&ArchiveLimits::default()).unwrap().validate().map(|m|m.counts()));
    }
}
