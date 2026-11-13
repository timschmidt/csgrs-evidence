from pathlib import Path
from fractions import Fraction
s=Path(__file__).parent;p=s/'evolution-cost-project';(p/'src').mkdir(parents=True,exist_ok=True)
(p/'Cargo.toml').write_text((s/'picard-cost-project/Cargo.toml').read_text().replace('picard-step-cost-probe','dyadic-evolution-cost-probe'))
old=(s/'picard-cost-project/src/main.rs').read_text();prefix=old[:old.index('use hyperdynamics::field::picard')]
t=Fraction(1,4);term=total=Fraction(1)
for k in range(1,9):term=term*t/k;total+=term
upper=total+term*t/9/(1-t/10)
body=r'''
use hyperdynamics::field::evolution::*;
fn scaled(a:i64,b:i64,e:i32)->DyadicInterval {DyadicInterval::new(a.into(),b.into(),e).unwrap()}
fn ratio(a:i64,b:i64)->DyadicInterval {d(a,a).div(&d(b,b),-80,&mut hyperinterval::DyadicBudget::new(16384,1_000_000_000_000)).unwrap()}
fn source<const N:usize>(outputs:&[Expr])->FieldDefinition {
 let t=SymbolId(100);let state:Vec<_>=(0..N).map(|i|SymbolId(i as u32)).collect();let mut variables=state.clone();variables.reverse();variables.push(t);
 let source=ExpressionProgram::compile(outputs,&variables,&mut ExpressionBudget::new(1_000_000,100_000_000)).unwrap().definition().clone();FieldDefinition{source,time:t,state}
}
fn run<const N:usize>(name:&str,outputs:&[Expr],request:EvolutionRequest<N>,options:EvolutionOptions,control:BoxN<DyadicInterval,N>,exact:bool) {
 let definition=source::<N>(outputs);let field=ExpressionField::<N>::from_definition(definition.clone(),&mut budget()).unwrap();let mut work=budget();let report=field.integrate(request.clone(),options.clone(),&mut work);
 assert!(report.end_enclosure().is_some(),"{name} {:?}",report.status());let expected=report.end_enclosure().unwrap().clone();
 assert!(control.subset_of(&expected,&mut hyperinterval::DyadicBudget::new(16384,1_000_000_000_000)).unwrap(),"{name}");if exact {assert_eq!(control,expected);}
 let gw=work.policy().graph_work-work.remaining_graph_work();let sw=work.policy().scalar_work-work.remaining_scalar_work();
 println!("RESOURCE {name} graph={gw} scalar={sw} attempts={} segments={}",report.attempts().len(),report.segments().len());
 timed(name,"integrate",||{let r=field.integrate(black_box(&request).clone(),black_box(&options).clone(),&mut budget());assert_eq!(r.end_enclosure(),Some(&expected));r});
 let encoded=serde_json::to_string(&(definition,&request,&options)).unwrap();
 timed(name,"replay",||{let (source,r,o):(FieldDefinition,EvolutionRequest<N>,EvolutionOptions)=serde_json::from_str(black_box(&encoded)).unwrap();let mut work=budget();let field=ExpressionField::<N>::from_definition(source,&mut work).unwrap();let r=field.integrate(r,o,&mut work);assert_eq!(r.end_enclosure(),Some(&expected));r});
 for (label,policy) in [("graph-zero",EnclosurePolicy{graph_work:0,..EnclosurePolicy::default()}),("graph-short",EnclosurePolicy{graph_work:gw-1,..EnclosurePolicy::default()}),("scalar-zero",EnclosurePolicy{scalar_work:0,..EnclosurePolicy::default()}),("scalar-short",EnclosurePolicy{scalar_work:sw-1,..EnclosurePolicy::default()})] {
  print_row(name,label,32,measure(32,||{let r=field.integrate(request.clone(),options.clone(),&mut EnclosureBudget::new(policy));assert!(matches!(r.status(),EvolutionStatus::Stopped(_)));assert!(r.end_enclosure().is_none());r}));
 }
 assert_eq!(field.integrate(request,options,&mut budget()).end_enclosure(),Some(&expected));
}
fn req<const N:usize>(end:DyadicInterval,initial:[DyadicInterval;N])->EvolutionRequest<N> {EvolutionRequest{start:d(0,0),end,initial:BoxN::new(initial).unwrap()}}
fn cap()->EvolutionOptions {EvolutionOptions{maximum_step:Some(scaled(1,1,-2)),..Default::default()}}
fn main(){
 println!("| Case | Operation | allocations/op | frees/op | bytes/op | reallocations/op | peak bytes | live bytes |\n|---|---|---|---|---|---|---|---|");
 let x=Expr::anonymous_symbol(SymbolId(0));let v=Expr::anonymous_symbol(SymbolId(1));let t=Expr::anonymous_symbol(SymbolId(100));
 run("constant",&[Expr::int(2)],req(scaled(5,5,-3),[d(0,1)]),cap(),BoxN::new([scaled(5,9,-2)]).unwrap(),true);
 run("time-affine",&[Expr::int(2)*t+Expr::int(3)],req(scaled(3,3,-2),[d(0,0)]),cap(),BoxN::new([scaled(45,45,-4)]).unwrap(),false);
 run("affine-halving",&[Expr::int(2)*x.clone()],req(scaled(1,1,-1),[d(0,0)]),Default::default(),BoxN::new([d(0,0)]).unwrap(),true);
 let cos=ratio(7,8).hull(&ratio(337,384),&mut hyperinterval::DyadicBudget::new(16384,1_000_000_000)).unwrap();let minus_sin=ratio(-1,2).hull(&ratio(-23,48),&mut hyperinterval::DyadicBudget::new(16384,1_000_000_000)).unwrap();
 run("oscillator",&[v,-x.clone()],req(scaled(1,1,-1),[d(1,1),d(0,0)]),EvolutionOptions{maximum_step:Some(scaled(1,1,-3)),..Default::default()},BoxN::new([cos,minus_sin]).unwrap(),false);
 run("riccati",&[x.clone().powi(2)],req(scaled(1,1,-2),[d(1,1)]),Default::default(),BoxN::new([ratio(4,3)]).unwrap(),false);
 let exp=ratio(EXP_LO_NUM,EXP_LO_DEN).hull(&ratio(EXP_HI_NUM,EXP_HI_DEN),&mut hyperinterval::DyadicBudget::new(16384,1_000_000_000)).unwrap();
 run("exponential",&[x.clone()],req(scaled(1,1,-2),[d(1,1)]),Default::default(),BoxN::new([exp]).unwrap(),false);
 run("unit",&[],req(d(1,1),[]),Default::default(),BoxN::new([]).unwrap(),true);
 run::<1>("empty",&[x.clone()],EvolutionRequest{start:d(0,0),end:d(1,1),initial:BoxN::empty().unwrap()},Default::default(),BoxN::empty().unwrap(),true);
 run("identity",&[x.clone()],req(d(0,0),[d(1,2)]),Default::default(),BoxN::new([d(1,2)]).unwrap(),true);
 for (name,expression,request,options) in [
 ("step-limit",Expr::int(1),req(d(1,1),[d(0,0)]),EvolutionOptions{maximum_steps:1,..cap()}),
 ("halving-limit",Expr::int(1),req(d(1,1),[d(0,0)]),EvolutionOptions{maximum_expansions:0,maximum_halvings:2,..Default::default()}),
 ("pole",Expr::int(1)/x.clone(),req(d(1,1),[d(0,0)]),EvolutionOptions{maximum_halvings:2,..Default::default()}),
 ("riccati-blowup",x.powi(2),req(d(1,1),[d(1,1)]),EvolutionOptions{maximum_steps:24,maximum_halvings:8,..Default::default()})] {
  let field=ExpressionField::<1>::from_definition(source::<1>(&[expression]),&mut budget()).unwrap();
  timed(name,"stopped",||{let r=field.integrate(request.clone(),options.clone(),&mut budget());assert!(matches!(r.status(),EvolutionStatus::Stopped(_)));assert!(r.end_enclosure().is_none());r});
 }
}
'''
for key,value in [('EXP_LO_NUM',total.numerator),('EXP_LO_DEN',total.denominator),('EXP_HI_NUM',upper.numerator),('EXP_HI_DEN',upper.denominator)]:body=body.replace(key,str(value))
(p/'src/main.rs').write_text(prefix+body)
