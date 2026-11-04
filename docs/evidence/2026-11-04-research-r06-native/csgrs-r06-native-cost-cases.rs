use hypercurve::{CurvePath2, CurveRegion2, PolynomialCurveSet2, SvgGeometry2, export_svg_document, import_svg_document};
use hypersolve::bivariate_topology::{BivariateCurveDomain, BivariateCurveTopology, decompose_bivariate_curve};
use hypersolve::bivariate_arithmetic::bivariate_multiply;
use hypersolve::BivariatePolynomial;
use hyperreal::Real;
use serde_json::{Value,json};
fn p(rows: &[&[i32]]) -> BivariatePolynomial { BivariatePolynomial::new(rows.iter().map(|r| r.iter().copied().map(Real::from).collect()).collect()) }
pub struct Case { pub name:&'static str, equation:BivariatePolynomial,domain:BivariateCurveDomain,pub vertical:bool }
pub fn cases()->Vec<Case>{
 let rows=[("line",p(&[&[0,1]])),("parabola",p(&[&[0,1],&[],&[-1]])),("circle",p(&[&[-1,0,1],&[],&[1]])),("node",p(&[&[0,0,1],&[],&[-1]])),("cusp",p(&[&[0,0,1],&[],&[],&[-1]])),("repeated-horizontal",p(&[&[0,0,1]])),("quintic-ordinate",p(&[&[-1,5,0,0,0,1]])),("boundary",p(&[&[-2,1]])),("empty-axis",p(&[&[1],&[],&[1]]))];
 let mut cases=rows.into_iter().map(|(name,equation)|Case{name,equation,domain:BivariateCurveDomain{first:[(-2).into(),2.into()],second:[(-2).into(),2.into()]},vertical:false}).collect::<Vec<_>>();
 let x=p(&[&[0],&[1]]);let irrational=p(&[&[-2],&[],&[1]]);
 for (name,equation) in [("vertical-line",x.clone()),("crossing-powers",bivariate_multiply(&bivariate_multiply(&x,&x),&p(&[&[0,0,0,1]]))),("circle-algebraic-columns",bivariate_multiply(&irrational,&p(&[&[-3,0,1],&[],&[1]]))),("node-column",bivariate_multiply(&x,&p(&[&[0,0,1],&[],&[-1]])))] {
  cases.push(Case{name,equation,domain:BivariateCurveDomain{first:[(-2).into(),2.into()],second:[(-2).into(),2.into()]},vertical:true});
 }
 cases
}
fn real(x:&Real)->String{x.exact_rational_normal_form().unwrap().to_string()}
fn poly(p:&BivariatePolynomial)->Value{json!(p.coefficients.iter().map(|r|r.iter().map(real).collect::<Vec<_>>()).collect::<Vec<_>>())}
fn interval(r:&hypersolve::IsolatedRootInterval)->Value{json!({"lo":real(&r.lower),"hi":real(&r.upper),"exact":r.exact_root.as_ref().map(real),"count":r.distinct_root_count})}
fn topology_row(t:&BivariateCurveTopology)->Value{
 json!({"equation":poly(t.equation()),"geometric":poly(t.geometric_equation()),"domain":[t.domain().first.iter().map(real).collect::<Vec<_>>(),t.domain().second.iter().map(real).collect::<Vec<_>>()],"projection":t.projection().iter().map(real).collect::<Vec<_>>(),"empty":t.is_empty(),"events":t.events().iter().map(|e|json!({"base":e.parameter().polynomial_coefficients.iter().map(real).collect::<Vec<_>>(),"index":e.parameter().interval_index,"selector":interval(&e.parameter().interval),"roots":e.roots().iter().map(interval).collect::<Vec<_>>(),"factors":e.repeated_factor_indices()})).collect::<Vec<_>>(),"slabs":t.slabs().iter().map(|s|json!({"sample":real(s.sample()),"roots":s.roots().iter().map(interval).collect::<Vec<_>>(),"arcs":s.arcs().iter().map(|a|(a.left_root(),a.right_root(),a.repeated_factor_index())).collect::<Vec<_>>(),"strips":s.connections().iter().map(|p|p.as_ref().map(|p|json!({"sample":real(p.sample()),"separators":p.separators().iter().map(real).collect::<Vec<_>>(),"counts":p.root_counts()}))).collect::<Vec<_>>() })).collect::<Vec<_>>(),"repeated":t.repeated_factorization().map(|r|json!({"scale":real(r.scale()),"support":poly(r.support()),"factors":r.factors().iter().map(|f|json!({"equation":poly(f.equation()),"exponent":f.exponent()})).collect::<Vec<_>>()}))})
}
pub struct Receipt {pub row:Value,_topology:BivariateCurveTopology,_set:Option<PolynomialCurveSet2>,_doc:Option<SvgGeometry2>,_replay:Option<SvgGeometry2>}
pub fn run(c:&Case)->Receipt{
 let t=decompose_bivariate_curve(&c.equation,&c.domain,Default::default()).unwrap();
 let mut row=json!({"case":c.name,"topology":topology_row(&t)});
 if c.vertical {
  #[cfg(feature="candidate")]{
   assert!(!t.vertical_components().is_empty());row["vertical"]=json!({"factor":t.vertical_content().unwrap().factor().iter().map(real).collect::<Vec<_>>(),"residual":poly(t.vertical_content().unwrap().residual_equation()),"components":t.vertical_components().iter().map(|v|(v.event_index(),v.defining_exponent())).collect::<Vec<_>>()});
   let set=PolynomialCurveSet2::from_topology(t.clone(),Default::default()).unwrap();
   for curve in set.curves() {
    let branch=curve.polynomial_branch().unwrap(); assert!(branch.certifies_polynomial_identity(&c.equation));
    let sample:hypercurve::CurveParameter2=branch.topology().slabs()[branch.slab_index()].sample().clone().into();
    let point=curve.point_at(&sample).unwrap();
    assert!(point.rational_form(c.equation.clone(),p(&[&[1]])).unwrap().compare_to_real(&Real::zero()).unwrap().is_eq());
    assert!(matches!(curve.point_locations(&point).unwrap(),hypercurve::CurvePointLocations2::Locations(locations) if locations.len()==1));
    let (left,right)=curve.split_at(sample).unwrap();
    assert!(left.end().coincides_with(&right.start()).unwrap());
    black_box_curve(left.reversed().unwrap()); black_box_curve(right);
   }
   row["curve_admission"]=json!({"status":"exact_success","curves":set.curves().len(),"isolated":set.isolated_points().len()});
   return Receipt{row,_topology:t,_set:Some(set),_doc:None,_replay:None};
  }
  #[cfg(not(feature="candidate"))]panic!("new-domain costs have no successful baseline");
 }
 let set=PolynomialCurveSet2::from_topology(t.clone(),Default::default()).unwrap();assert!(set.isolated_points().is_empty());
 let mut paths=Vec::new();
 for curve in set.curves(){let branch=curve.polynomial_branch().unwrap();let sample:hypercurve::CurveParameter2=t.slabs()[branch.slab_index()].sample().clone().into();let point=curve.point_at(&sample).unwrap();let hypercurve::CurvePointLocations2::Locations(locations)=curve.point_locations(&point).unwrap() else { panic!("expected one exact source preimage") }; assert_eq!(locations.len(),1);let curve=curve.reversed().unwrap();paths.push(CurvePath2::try_new(vec![curve]).unwrap());}
 let doc=SvgGeometry2::new(CurveRegion2::empty(),vec![],paths);
 let text=match export_svg_document(&doc) { Ok(text)=>text, Err(error)=>{
 assert!(matches!(&error,hypercurve::SvgError::Exact(hypercurve::ExactCurveError::Blocked(b)) if b.reason()==hypercurve::UncertaintyReason::BudgetExhausted),"unexpected SVG failure: {error:?}");
 row["svg_outcome"]=json!({"status":"exhausted","error":format!("{error:?}")});
 return Receipt{row,_topology:t,_set:Some(set),_doc:Some(doc),_replay:None};
 }};row["svg_outcome"]=json!({"status":"exact_success"});let replay=import_svg_document(&text).unwrap();assert_eq!(export_svg_document(&replay).unwrap(),text);
 assert_eq!(doc.paths().len(),replay.paths().len());
 for (a,b) in doc.paths().iter().zip(replay.paths()){assert!(a.curves()[0].start().coincides_with(&b.curves()[0].start()).unwrap());assert!(a.curves()[0].end().coincides_with(&b.curves()[0].end()).unwrap());}
 row["svg"]=json!(text);
 Receipt{row,_topology:t,_set:Some(set),_doc:Some(doc),_replay:Some(replay)}
}

fn black_box_curve(curve:hypercurve::Curve2){std::hint::black_box(curve);}
