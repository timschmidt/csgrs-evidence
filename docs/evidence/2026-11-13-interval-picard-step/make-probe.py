from pathlib import Path
out=Path(__file__).parent;p=out/'picard-cost-project';(p/'src').mkdir(parents=True,exist_ok=True)
manifest=(out/'field-cost-project/Cargo.toml').read_text().replace('expression-field-cost-probe','picard-step-cost-probe');(p/'Cargo.toml').write_text(manifest)
old=(out/'field-cost-project/src/main.rs').read_text();prefix=old[:old.index('fn run<const N:usize>')].replace('EnclosedVectorField,','').replace('BoxN,IntervalMatrix,IntervalVector','BoxN')
(p/'src/main.rs').write_text(prefix+'''
use hyperdynamics::field::picard::{PicardProposal,PicardStatus,PicardReport};
fn compile(outputs:&[Expr],variables:&[SymbolId])->hypersolve::expression_program::ExpressionDefinition {
 ExpressionProgram::compile(outputs,variables,&mut ExpressionBudget::new(1_000_000,100_000_000)).unwrap().definition().clone()
}
fn scaled(a:i64,b:i64,e:i32)->DyadicInterval {DyadicInterval::new(a.into(),b.into(),e).unwrap()}
fn run<const N:usize>(name:&str,outputs:&[Expr],proposal:PicardProposal<N>,expected:BoxN<DyadicInterval,N>,empty:bool) {
 let t=SymbolId(100);let states:Vec<_>=(0..N).map(|i|SymbolId(i as u32)).collect();let mut variables=states.clone();variables.reverse();variables.push(t);
 let source=FieldDefinition{source:compile(outputs,&variables),time:t,state:states};
 let field=ExpressionField::<N>::from_definition(source.clone(),&mut budget()).unwrap();
 let validate=|r:&PicardReport<N>|{assert!(if empty {matches!(r.status(),PicardStatus::Empty)}else{matches!(r.status(),PicardStatus::Certified)},"{:?}",r.status());assert_eq!(r.end_enclosure(),Some(&expected));};
 let mut work=budget();let r=field.certify_step(proposal.clone(),&mut work);validate(&r);
 println!("RESOURCE {name} graph={} scalar={}",work.policy().graph_work-work.remaining_graph_work(),work.policy().scalar_work-work.remaining_scalar_work());
 timed(name,"verify",||{let r=field.certify_step(black_box(&proposal).clone(),&mut budget());validate(&r);r});
 let encoded=serde_json::to_string(&(source,&proposal)).unwrap();
 timed(name,"replay",||{let (source,p):(FieldDefinition,PicardProposal<N>)=serde_json::from_str(black_box(&encoded)).unwrap();let mut work=budget();let f=ExpressionField::<N>::from_definition(source,&mut work).unwrap();let r=f.certify_step(p,&mut work);validate(&r);r});
 for limit in [0,1,work.policy().scalar_work-work.remaining_scalar_work()-1] {let policy=EnclosurePolicy{scalar_work:limit,..EnclosurePolicy::default()};print_row(name,&format!("exhaust-{limit}"),32,measure(32,||{let r=field.certify_step(proposal.clone(),&mut EnclosureBudget::new(policy));assert!(matches!(r.status(),PicardStatus::Rejected(_)));assert!(r.end_enclosure().is_none());r}));}
 let label=if work.policy().scalar_work-work.remaining_scalar_work()<=16 {"budget-16-completed"}else{"budget-16-exhausted"};
 print_row(name,label,32,measure(32,||{let r=field.certify_step(proposal.clone(),&mut EnclosureBudget::new(EnclosurePolicy{scalar_work:16,..EnclosurePolicy::default()}));if label=="budget-16-completed" {validate(&r);}else{assert!(matches!(r.status(),PicardStatus::Rejected(_)));assert!(r.end_enclosure().is_none());}r}));
 validate(&field.certify_step(proposal,&mut budget()));
}
fn main(){
 println!("| Case | Operation | allocations/op | frees/op | bytes/op | reallocations/op | peak bytes | live bytes |\\n|---|---|---|---|---|---|---|---|");
 let x=Expr::anonymous_symbol(SymbolId(0));let y=Expr::anonymous_symbol(SymbolId(1));let t=Expr::anonymous_symbol(SymbolId(100));
 run("constant",&[Expr::int(2)],PicardProposal{start:d(0,0),end:scaled(1,1,-2),initial:BoxN::new([d(0,1)]).unwrap(),candidate:BoxN::new([d(0,2)]).unwrap()},BoxN::new([scaled(1,3,-1)]).unwrap(),false);
 run("time-affine",&[Expr::int(2)*t.clone()+Expr::int(3)],PicardProposal{start:d(0,0),end:scaled(1,1,-1),initial:BoxN::new([d(0,0)]).unwrap(),candidate:BoxN::new([d(0,2)]).unwrap()},BoxN::new([scaled(3,4,-1)]).unwrap(),false);
 run("oscillator",&[y,-x.clone()],PicardProposal{start:d(0,0),end:scaled(1,1,-2),initial:BoxN::new([d(1,1),d(0,0)]).unwrap(),candidate:BoxN::new([d(0,2),d(-1,1)]).unwrap()},BoxN::new([scaled(3,5,-2),scaled(-1,0,-1)]).unwrap(),false);
 run("riccati",&[x.clone().powi(2)],PicardProposal{start:d(0,0),end:scaled(1,1,-3),initial:BoxN::new([d(1,1)]).unwrap(),candidate:BoxN::new([d(1,2)]).unwrap()},BoxN::new([scaled(9,12,-3)]).unwrap(),false);
 run("temporal-root",&[t.sqrt()],PicardProposal{start:d(0,0),end:d(1,1),initial:BoxN::new([d(0,0)]).unwrap(),candidate:BoxN::new([d(0,1)]).unwrap()},BoxN::new([d(0,1)]).unwrap(),false);
 run("unit",&[],PicardProposal{start:d(0,0),end:d(1,1),initial:BoxN::new([]).unwrap(),candidate:BoxN::new([]).unwrap()},BoxN::new([]).unwrap(),false);
 run::<1>("empty",&[x.clone()],PicardProposal{start:d(0,0),end:d(1,1),initial:BoxN::empty().unwrap(),candidate:BoxN::empty().unwrap()},BoxN::empty().unwrap(),true);
 let time=SymbolId(100);let state=SymbolId(0);
 for (name,expression,candidate) in [("self-map",Expr::int(1),d(0,0)),("contraction",x.clone(),d(-1,1)),("regularity",x.sqrt(),d(0,1))] {
  let field=ExpressionField::<1>::from_definition(FieldDefinition{source:compile(&[expression],&[state,time]),time,state:vec![state]},&mut budget()).unwrap();
  let p=PicardProposal{start:d(0,0),end:d(1,1),initial:BoxN::new([d(0,0)]).unwrap(),candidate:BoxN::new([candidate]).unwrap()};
  timed(name,"rejected",||{let r=field.certify_step(p.clone(),&mut budget());assert!(matches!(r.status(),PicardStatus::Rejected(_)));assert!(r.end_enclosure().is_none());r});
 }
 let field=ExpressionField::<1>::from_definition(FieldDefinition{source:compile(&[Expr::int(2)],&[state,time]),time,state:vec![state]},&mut budget()).unwrap();
 timed("constant","two-step",||{let mut work=budget();let first=field.certify_step(PicardProposal{start:d(0,0),end:scaled(1,1,-2),initial:BoxN::new([d(0,1)]).unwrap(),candidate:BoxN::new([d(0,2)]).unwrap()},&mut work);let second=field.certify_step(PicardProposal{start:scaled(1,1,-2),end:scaled(1,1,-1),initial:first.end_enclosure().unwrap().clone(),candidate:BoxN::new([d(0,2)]).unwrap()},&mut work);assert_eq!(second.end_enclosure().unwrap().lanes(),Some(&[d(1,2)]));(first,second)});
}
''')
