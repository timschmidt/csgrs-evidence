use hypercurve::*;
fn main(){ println!("{} {} {} {} {} {}",std::mem::size_of::<Curve2>(),std::mem::size_of::<CurveParameter2>(),std::mem::size_of::<CurveIntersectionResult2>(),std::mem::size_of::<CurveIntersectionOverlap2>(),std::mem::size_of::<PolynomialCurveBranch2>(),std::mem::size_of::<CurveRegion2>());}
