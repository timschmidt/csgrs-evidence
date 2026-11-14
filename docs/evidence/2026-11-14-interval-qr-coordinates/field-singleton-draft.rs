use super::*;
use hyperdynamics::field::coordinates::{QrFieldError,QrCoordinateField};
use hyperreal::Real;
fn basis()->Vec<Vec<Real>> {vec![vec![3.into(),(-4).into()],vec![4.into(),3.into()]]}
fn ratio(n:i64,d:i64)->Real {(Real::from(n)/Real::from(d)).unwrap()}
fn rotated()->ExpressionField<2> {
    let x=Expr::anonymous_symbol(X);let y=Expr::anonymous_symbol(Y);
    field(&[Expr::real(ratio(-7,25))*x.clone()+Expr::real(ratio(24,25))*y.clone(),Expr::real(ratio(24,25))*x+Expr::real(ratio(7,25))*y],vec![X,Y])
}
#[test]
fn qr_frame_derivatives_follow_independent_exact_diagonalization() {
    let f=rotated();let qr=f.in_qr_coordinates(basis(),vec![0.into(),0.into()],&mut budget()).unwrap();
    for x in -3..=3 {for y in -3..=3 {
        let values=qr.chart().transformed_field().image(&d(0,0),&BoxN::new([d(x,x),d(y,y)]).unwrap(),&mut budget()).unwrap();
        assert_eq!(values.lanes(),Some(&[d(x,x),d(-y,-y)]));
    }}
    assert_eq!(qr.chart().transformed_field().jacobian(&d(0,0),&BoxN::new([d(-1,1),d(-1,1)]).unwrap(),&mut budget()).unwrap().rows(),Some(&[[d(1,1),d(0,0)],[d(0,0),d(-1,-1)]]));
    assert_eq!(qr.factorization().coordinates().program().definition(),qr.chart().transformation().program().definition());
    assert_eq!(qr.chart().original_field().identity(),f.identity());
}
#[test]
fn qr_frame_certifies_a_long_step_and_its_endpoint_is_transported() {
    use hyperdynamics::field::picard::PicardFailure;
    let f=rotated();let qr=f.in_qr_coordinates(basis(),vec![0.into(),0.into()],&mut budget()).unwrap();
    let end=DyadicInterval::point(7.into(),-3).unwrap();
    // Both attempts start from exactly the same singleton zero; no changed
    // input-set/width contract accounts for the contraction difference.
    let input=BoxN::new([d(0,0),d(0,0)]).unwrap();
    let proposal=PicardProposal{start:d(0,0),end:end.clone(),initial:input.clone(),candidate:input};
    let old=f.certify_step(proposal.clone(),&mut budget());
    assert!(matches!(old.status(),PicardStatus::Rejected(PicardFailure::ContractionNotCertified)));
    let step=qr.chart().certify_step(proposal,&mut budget());assert!(matches!(step.status(),CoordinateStatus::Certified),"{:?}",step.status());
    assert_eq!(step.source_end_enclosure().unwrap().lanes(),Some(&[d(0,0),d(0,0)]));
    assert_eq!(step.native().evidence().contraction(),Some(&end));
    let other=f.in_qr_coordinates(vec![vec![1.into(),0.into()],vec![0.into(),1.into()]],vec![1.into(),(-2).into()],&mut budget()).unwrap();
    let transported=qr.chart().transition_to(other.chart(),&mut budget()).unwrap().enclose(step.native().end_enclosure().unwrap().clone(),&mut budget()).unwrap();
    assert_eq!(transported.enclosure().lanes(),Some(&[d(-1,-1),d(2,2)]));
    let next=other.chart().certify_step(PicardProposal{start:end,end:d(1,1),initial:transported.enclosure().clone(),candidate:transported.enclosure().clone()},&mut budget());
    assert!(matches!(next.status(),CoordinateStatus::Certified));assert_eq!(next.source_end_enclosure().unwrap().lanes(),Some(&[d(0,0),d(0,0)]));
}
fn constant_chart()->QrCoordinateField<2> {
    field(&[Expr::int(2),Expr::int(1)],vec![X,Y]).in_qr_coordinates(basis(),vec![10.into(),(-3).into()],&mut budget()).unwrap()
}
#[test]
fn uncertain_initial_set_empty_unit_and_taylor_composition() {
    let qr=constant_chart();
    let step=qr.chart().certify_step(PicardProposal{start:d(0,0),end:d(1,1),initial:BoxN::new([d(-1,1),d(-1,1)]).unwrap(),candidate:BoxN::new([d(-1,3),d(-2,1)]).unwrap()},&mut budget());
    assert!(matches!(step.status(),CoordinateStatus::Certified),"{:?}",step.status());
    // Source x(1)=12+(3a-4b)/5, y(1)=-2+(4a+3b)/5 for a,b in [-1,1].
    let expected=[(53,67),(-17,-3)].map(|(l,u)|(hyperreal::Rational::from(l)/hyperreal::Rational::from(5),hyperreal::Rational::from(u)/hyperreal::Rational::from(5)));
    for (lane,(low,high)) in step.source_end_enclosure().unwrap().lanes().unwrap().iter().zip(expected) {
        let mut scalar=hyperinterval::DyadicBudget::new(16384,1_000_000_000);let bounds=lane.to_rational(&mut scalar).unwrap();
        assert!(bounds.contains_point(&low));assert!(bounds.contains_point(&high));
    }
    let empty=qr.chart().certify_step(PicardProposal{initial:BoxN::empty().unwrap(),..proposal()},&mut budget());assert!(matches!(empty.status(),CoordinateStatus::Empty));
    let unit=field::<0>(&[],vec![]).in_qr_coordinates(vec![],vec![],&mut budget()).unwrap();
    let step=unit.chart().certify_step(PicardProposal{start:d(0,0),end:d(1,1),initial:BoxN::new([]).unwrap(),candidate:BoxN::new([]).unwrap()},&mut budget());assert!(matches!(step.status(),CoordinateStatus::Certified));assert!(!step.source_end_enclosure().unwrap().is_empty());
}
#[test]
fn field_construction_final_cutoff_and_original_errors_are_preserved() {
    let f=field::<2>(&[Expr::int(2),Expr::int(1)],vec![X,Y]);
    let mut full=budget();f.in_qr_coordinates(basis(),vec![10.into(),(-3).into()],&mut full).unwrap();let used=EnclosurePolicy::default().graph_work-full.remaining_graph_work();
    let mut short=EnclosureBudget::new(EnclosurePolicy{graph_work:used-1,..EnclosurePolicy::default()});
    assert!(matches!(f.in_qr_coordinates(basis(),vec![10.into(),(-3).into()],&mut short),Err(QrFieldError::Field(hyperdynamics::field::FieldError::Expression(hypersolve::expression_program::ExpressionError::WorkExhausted)))));
    let mut exact=EnclosureBudget::new(EnclosurePolicy{graph_work:used,..EnclosurePolicy::default()});f.in_qr_coordinates(basis(),vec![10.into(),(-3).into()],&mut exact).unwrap();assert_eq!(exact.remaining_graph_work(),0);
    assert!(matches!(f.in_qr_coordinates(vec![vec![0.into(),0.into()],vec![0.into(),0.into()]],vec![0.into(),0.into()],&mut budget()),Err(QrFieldError::Qr(hypersolve::expression_program::QrCoordinateError::DependentColumn{..}))));
    let token=hypersolve::work_budget::CancellationToken::new();token.cancel();let mut b=budget();b.set_cancellation(Some(token));assert!(f.in_qr_coordinates(basis(),vec![0.into(),0.into()],&mut b).is_err());
    f.in_qr_coordinates(basis(),vec![0.into(),0.into()],&mut budget()).unwrap();
}
