use hypercurve::{BezierParameter2, Curve2, CurveGeometry2, CurveParameter2, CurveParameterRange2, CurvePoint2, CurvePointDefinition2, LineSeg2, Point2, PolynomialCurveSet2, Real};
use hypersolve::{AlgebraicFiberRootIsolationConfig, BivariatePolynomial};
use hypersolve::bivariate_topology::{BivariateCurveDomain, BivariateTopologyConfig, decompose_bivariate_curve};
use serde_json::{json,Value};
use std::alloc::{GlobalAlloc, Layout, System};
use std::sync::atomic::{AtomicUsize, Ordering};
use std::time::Instant;
use std::io::Write;

struct CountingAllocator;
static ALLOCATED: AtomicUsize = AtomicUsize::new(0);
static LIVE: AtomicUsize = AtomicUsize::new(0);
static PEAK: AtomicUsize = AtomicUsize::new(0);
static CALLS: AtomicUsize = AtomicUsize::new(0);

fn grow(size: usize) {
    CALLS.fetch_add(1, Ordering::Relaxed);
    ALLOCATED.fetch_add(size, Ordering::Relaxed);
    let live = LIVE.fetch_add(size, Ordering::Relaxed) + size;
    PEAK.fetch_max(live, Ordering::Relaxed);
}

// SAFETY: The original pointers and layouts pass unchanged to System; the
// counters neither inspect allocations nor change their lifetime.
unsafe impl GlobalAlloc for CountingAllocator {
    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
        grow(layout.size());
        unsafe { System.alloc(layout) }
    }
    unsafe fn alloc_zeroed(&self, layout: Layout) -> *mut u8 {
        grow(layout.size());
        unsafe { System.alloc_zeroed(layout) }
    }
    unsafe fn realloc(&self, ptr: *mut u8, layout: Layout, size: usize) -> *mut u8 {
        CALLS.fetch_add(1, Ordering::Relaxed);
        ALLOCATED.fetch_add(size, Ordering::Relaxed);
        if size >= layout.size() {
            let live = LIVE.fetch_add(size - layout.size(), Ordering::Relaxed) + size - layout.size();
            PEAK.fetch_max(live, Ordering::Relaxed);
        } else {
            LIVE.fetch_sub(layout.size() - size, Ordering::Relaxed);
        }
        unsafe { System.realloc(ptr, layout, size) }
    }
    unsafe fn dealloc(&self, ptr: *mut u8, layout: Layout) {
        LIVE.fetch_sub(layout.size(), Ordering::Relaxed);
        unsafe { System.dealloc(ptr, layout) }
    }
}

#[global_allocator]
static GLOBAL: CountingAllocator = CountingAllocator;







fn q(n:i32,d:i32)->Real {(Real::from(n)/Real::from(d)).unwrap()}
fn param(p:&CurveParameter2)->Value {
 if let Some(p)=p.as_bezier_parameter(){return match p {
  BezierParameter2::Exact(x)=>json!({"exact":x}),
  BezierParameter2::Algebraic(x)=>json!({"polynomial":x.polynomial().coefficients(),"interval":[x.interval().start(),x.interval().end()],"root_count":x.root_count()}),
 };}
 if let Some(p)=p.affine_form_source(){return json!({"affine":p.coefficients(),"point":point(p.source())});}
 panic!("probe parameter has no admitted exact encoding")
}
fn map(m:&hypercurve::RationalMap2)->Value {json!({"x":m.numerators()[0].coefficients,"y":m.numerators()[1].coefficients,"w":m.denominator().coefficients})}
fn point(p:&CurvePoint2)->Value {
 match p.definition().unwrap(){
  CurvePointDefinition2::Coordinates(p)=>json!({"coordinates":[p.x(),p.y()]}),
  CurvePointDefinition2::PolynomialFiber{equation,parameter,root}=>json!({"fiber":equation.coefficients,"parameter":param(&parameter.into()),"root":[root.lower,root.upper],"exact_root":root.exact_root,"root_count":root.distinct_root_count}),
  CurvePointDefinition2::Similarity{source,transform}=>json!({"source":point(&source),"similarity":transform.affine_components()}),
  CurvePointDefinition2::RationalImage{source,map:m}=>json!({"source":point(&source),"map":map(&m)}),
  other=>panic!("unexpected point definition {other:?}"),
 }
}
fn curve(c:&Curve2)->Value {
 let domain=c.parameter_domain();
 let geometry=if let Some(b)=c.polynomial_branch(){
  json!({"equation":b.topology().equation().coefficients,"slab":b.slab_index(),"root":b.root_index(),"maps":b.rational_maps().iter().map(map).collect::<Vec<_>>(),"similarity":b.image_transform().map(|t|t.affine_components())})
 }else if c.geometry().is_none() {
  assert_eq!(c.family(),hypercurve::CurveFamily2::Line);json!({"retained_line":true})
 }else {match c.geometry().unwrap(){
  CurveGeometry2::Line(l)=>json!({"line":[[l.start().x(),l.start().y()],[l.end().x(),l.end().y()]]}),
  CurveGeometry2::QuadraticBezier(b)=>json!({"quadratic":b.control_points().into_iter().map(|p|json!([p.x(),p.y()])).collect::<Vec<_>>()}),
  other=>panic!("unexpected geometry {other:?}"),
 }};
 json!({"geometry":geometry,"start":point(&c.start()),"end":point(&c.end()),"range":[param(domain.start()),param(domain.end())]})
}
fn contact(c:&hypercurve::CurveIntersectionContact2)->Value {
 json!({"point":point(c.point()),"first_span":c.first().span_index(),"second_span":c.second().span_index(),"first_parameter":param(&c.first().parameter().unwrap()),"second_parameter":param(&c.second().parameter().unwrap()),"cross":format!("{:?}",c.tangent_cross_sign())})
}
enum Output {Split((Curve2,Curve2)), Restriction(Curve2), Section(hypercurve::CurveIntersectionResult2), Topology(hypercurve::CurveIntersectionTopology2)}
impl Output {
 fn bytes(&self)->Vec<u8>{let value=match self {
  Self::Split((a,b))=>json!({"pieces":[curve(a),curve(b)]}),
  Self::Restriction(c)=>json!({"restriction":curve(c)}),
  Self::Section(s)=>{assert!(s.is_complete());json!({"contacts":s.contacts().iter().map(contact).collect::<Vec<_>>(),"overlap_count":s.overlaps().len()})},
  Self::Topology(t)=>json!({"first":t.first().iter().map(curve).collect::<Vec<_>>(),"second":t.second().iter().map(curve).collect::<Vec<_>>(),"contacts":t.result().contacts().iter().map(contact).collect::<Vec<_>>()}),
 };serde_json::to_vec(&value).unwrap()}
}
fn counters()->(usize,usize,usize){(LIVE.load(Ordering::Relaxed),ALLOCATED.load(Ordering::Relaxed),CALLS.load(Ordering::Relaxed))}
fn main(){
 let args:Vec<_>=std::env::args().collect();let case=args[1].as_str();
 let equation=BivariatePolynomial::new(vec![vec![5.into(),5.into(),0.into(),0.into(),0.into(),1.into()],vec![(-1).into()]]);
 let topology=decompose_bivariate_curve(&equation,&BivariateCurveDomain{first:[(-1).into(),1.into()],second:[(-2).into(),2.into()]},BivariateTopologyConfig::default()).unwrap();
 let set=PolynomialCurveSet2::from_topology(topology,AlgebraicFiberRootIsolationConfig::default()).unwrap();
 let mut source=set.curves()[0].clone();drop(set);
 let mut cut:CurveParameter2=Real::zero().into();
 match case {
  "reversed"=>source=source.reversed().unwrap(),
  "selected"=>{let polynomial=hypercurve::BezierParameterPolynomial::try_new_power_basis(vec![(-1).into(),0.into(),2.into()]).unwrap();let interval=hypercurve::BezierParameterInterval::try_new(0.into(),1.into()).unwrap();cut=BezierParameter2::Algebraic(hypercurve::BezierAlgebraicParameter2::try_isolate(polynomial,interval).unwrap()).into();},
  "translated"=>{let t=hypercurve::Similarity2::try_from_real_affine(1.into(),0.into(),0.into(),1.into(),3.into(),4.into()).unwrap();source=source.transform_similarity(&t).unwrap();},
  "mapped"=>{let m=hypercurve::RationalMap2::new([BivariatePolynomial::new(vec![vec![],vec![1.into()]]),BivariatePolynomial::new(vec![vec![0.into(),1.into()]])],BivariatePolynomial::new(vec![vec![2.into()],vec![1.into()]]));source=source.rational_image(&m).unwrap();},
  "line"=>{source=LineSeg2::try_new(Point2::from_values(0,0),Point2::from_values(2,2)).unwrap().into();cut=q(1,2).into();},
  "quadratic"=>{source=hypercurve::QuadraticBezier2::new(Point2::from_values(0,0),Point2::from_values(1,2),Point2::from_values(2,0)).into();cut=q(1,2).into();},
  "split"|"section"|"topology"|"restrict"=>(),
  _=>panic!("unknown probe case"),
 }
 let line:Curve2=LineSeg2::try_new(Point2::new(Real::zero(),(-3).into()),Point2::new(Real::zero(),3.into())).unwrap().into();
 for sample in 0..20 {
  let (live,bytes,calls)=counters();PEAK.store(live,Ordering::Relaxed);let start=Instant::now();
  let outcome=hypercurve::evaluate_under(hyperlimit::PredicatePolicy::STRICT,||match case {
   "section"=>source.intersect_curve(&line).map(Output::Section),
   "topology"=>source.intersection_topology(&line).map(Output::Topology),
   "restrict"=>source.restrict_source(CurveParameterRange2::try_new(q(-1,2).into(),q(1,2).into()).unwrap()).map(Output::Restriction),
   _=>source.split_at(cut.clone()).map(Output::Split),
  });let ns=start.elapsed().as_nanos();assert!(outcome.is_certified());let result=outcome.into_unverified().unwrap();let after=counters();let peak=PEAK.load(Ordering::Relaxed).saturating_sub(live);
  let exact=result.bytes();let checksum=exact.iter().fold(14695981039346656037u64,|hash,b|(hash^u64::from(*b)).wrapping_mul(1099511628211));
  if sample==0 {std::fs::write(&args[2],&exact).unwrap();}let output_size=exact.len();drop(exact);drop(result);let dropped=counters();
  println!("{}",json!({"case":case,"sample":sample,"status":"completed","certainty":"Certified","ns":ns,"bytes":after.1-bytes,"calls":after.2-calls,"peak_live_growth":peak,"result_live_growth":after.0.saturating_sub(live),"retained_after_drop":dropped.0 as i128-live as i128,"checksum":checksum.to_string(),"output_size":output_size}));std::io::stdout().flush().unwrap();
 }
}
