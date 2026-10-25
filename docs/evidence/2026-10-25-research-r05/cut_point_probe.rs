use hypercurve::{Curve2,LineSeg2,Point2,PolynomialCurveSet2,Real};
use hypersolve::{AlgebraicFiberRootIsolationConfig,BivariatePolynomial};
use hypersolve::bivariate_topology::{BivariateCurveDomain,BivariateTopologyConfig,decompose_bivariate_curve};
fn main(){
 let equation=BivariatePolynomial::new(vec![vec![5.into(),5.into(),0.into(),0.into(),0.into(),1.into()],vec![(-1).into()]]);
 let topology=decompose_bivariate_curve(&equation,&BivariateCurveDomain{first:[(-1).into(),1.into()],second:[(-2).into(),2.into()]},BivariateTopologyConfig::default()).unwrap();
 let set=PolynomialCurveSet2::from_topology(topology,AlgebraicFiberRootIsolationConfig::default()).unwrap();
 let curve=&set.curves()[0];
 let line:Curve2=LineSeg2::try_new(Point2::new(Real::zero(),(-3).into()),Point2::new(Real::zero(),3.into())).unwrap().into();
 hyperreal::dispatch_trace::reset();
 let section=hyperreal::dispatch_trace::with_recording(||curve.intersect_curve(&line)).unwrap();
 println!("section contacts={} trace={:?}",section.contacts().len(),hyperreal::dispatch_trace::take().into_iter().filter(|r|r.operation=="r05-probe").collect::<Vec<_>>());
 hyperreal::dispatch_trace::reset();
 let topology=hyperreal::dispatch_trace::with_recording(||curve.intersection_topology(&line)).unwrap();
 println!("topology pieces={:?} trace={:?}",(topology.first().len(),topology.second().len()),hyperreal::dispatch_trace::take().into_iter().filter(|r|r.operation=="r05-probe").collect::<Vec<_>>());
 for piece in topology.first(){assert!(piece.start().definition().is_ok());assert!(piece.end().definition().is_ok());}
}
