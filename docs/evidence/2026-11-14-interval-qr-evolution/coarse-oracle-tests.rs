#![cfg(feature = "qr-evolution")]
use hyperdynamics::field::{
    EnclosedVectorField, EnclosureBudget, EnclosurePolicy, ExpressionField, FieldDefinition,
    coordinates::{CoordinateField, QrFieldError, qr_evolution::{QrEvolution, QrEvolutionOptions, QrEvolutionStatus as Status, QrEvolutionFailure as Failure}},
    evolution::{EvolutionRequest, EvolutionOptions, EvolutionFailure},
};
use hyperinterval::{DyadicBudget, DyadicInterval};
use hyperlattice_interval::BoxN;
use hyperreal::{Rational, Real};
use hypersolve::{Expr, SymbolId, expression_program::{CoordinateChange, ExpressionBudget, ExpressionProgram, QrCoordinateError}};
const T: SymbolId = SymbolId(9);
const X: SymbolId = SymbolId(0);
const Y: SymbolId = SymbolId(1);
fn d(a:i64,b:i64,e:i32)->DyadicInterval { DyadicInterval::new(a.into(),b.into(),e).unwrap() }
fn budget()->EnclosureBudget { EnclosureBudget::new(EnclosurePolicy::default()) }
fn arithmetic()->DyadicBudget { DyadicBudget::new(16384,1_000_000_000_000) }
fn field<const N:usize>(outputs:&[Expr],state:&[SymbolId])->ExpressionField<N> {
    let mut bindings=state.to_vec();bindings.reverse();bindings.push(T);
    let source=ExpressionProgram::compile(outputs,&bindings,&mut ExpressionBudget::new(1_000_000,100_000_000)).unwrap();
    ExpressionField::from_definition(FieldDefinition {source:source.definition().clone(),time:T,state:state.to_vec()},&mut budget()).unwrap()
}
fn identity<const N:usize>(f:&ExpressionField<N>)->CoordinateField<N> {
    let a:Vec<Vec<Real>>=(0..N).map(|i|(0..N).map(|j|u8::from(i==j).into()).collect()).collect();
    f.in_coordinates(CoordinateChange{variables:f.identity().state().to_vec(),to_source:a.clone(),from_source:a,origin:vec![Real::zero();N]},&mut budget()).unwrap()
}
fn request<const N:usize>(initial:[DyadicInterval;N],end:DyadicInterval)->EvolutionRequest<N> {
    EvolutionRequest{start:d(0,0,0),end,initial:BoxN::new(initial).unwrap()}
}
fn options(window:DyadicInterval)->QrEvolutionOptions {
    QrEvolutionOptions{window,maximum_windows:8,taylor_order:Some(3),native:EvolutionOptions{maximum_step:Some(d(1,1,-4)),..Default::default()}}
}
fn completed<const N:usize>(r:&QrEvolution<N>) {
    assert!(matches!(r.status(),Status::Completed),"{:?}",r.status());
    assert_eq!(r.reached_time(),&r.request().end);
    assert_eq!(r.completed_windows().len(),r.windows().len());
    assert!(r.source_end_enclosure().is_some());
    for w in r.completed_windows() {
        assert_eq!(w.frame().unwrap().chart().original_field().identity(),r.chart().original_field().identity());
        assert_eq!(w.transport().unwrap().initial(),w.selection().initial());
        assert_eq!(&w.evolution().unwrap().request().initial,w.transport().unwrap().enclosure());
        assert_eq!(w.frame().unwrap().factorization().request().basis,w.selection().basis());
        assert_eq!(w.frame().unwrap().factorization().request().origin,w.selection().origin());
    }
    for pair in r.completed_windows().windows(2) {
        assert_eq!(pair[1].selection().initial(),pair[0].evolution().unwrap().end_enclosure().unwrap());
        let a=pair[1].selection().chart().transformation().change(); let b=pair[0].frame().unwrap().chart().transformation().change();
        assert_eq!(a.variables,b.variables); assert_eq!(a.to_source,b.to_source); assert_eq!(a.from_source,b.from_source); assert_eq!(a.origin,b.origin);
    }
}
#[test]
fn constant_flow_recenters_and_caps_final_window_then_consumes_output() {
    let f=field::<1>(&[Expr::int(2)],&[X]);let chart=identity(&f);
    let r=chart.integrate_qr(request([d(-1,1,0)],d(5,5,-2)),options(d(1,1,-1)),&mut budget());completed(&r);
    assert_eq!(r.windows().len(),3);
    assert_eq!(r.source_end_enclosure().unwrap().lanes(),Some(&[d(3,7,-1)]));
    for (w,(origin,duration)) in r.windows().iter().zip([(0,d(1,1,-1)),(1,d(1,1,-1)),(2,d(1,1,-2))]) {
        assert_eq!(w.selection().basis(),&[vec![Real::one()]]);
        assert_eq!(w.selection().origin(),&[Real::from(origin)]);
        assert_eq!(w.selection().duration(),&duration);
    }
    let last=r.windows().last().unwrap();
    let second=last.frame().unwrap().chart().integrate_qr(EvolutionRequest{start:r.reached_time().clone(),end:d(3,3,-1),initial:last.evolution().unwrap().end_enclosure().unwrap().clone()},options(d(1,1,-2)),&mut budget());completed(&second);
    assert_eq!(second.source_end_enclosure().unwrap().lanes(),Some(&[d(2,4,0)]));
}
#[test]
fn correlated_authored_chart_keeps_original_image_and_transport_proof() {
    let f=field::<2>(&[Expr::int(2),Expr::int(1)],&[X,Y]);
    let chart=f.in_coordinates(CoordinateChange{variables:vec![X,Y],to_source:vec![vec![1.into(),1.into()],vec![0.into(),1.into()]],from_source:vec![vec![1.into(),(-1).into()],vec![0.into(),1.into()]],origin:vec![10.into(),(-3).into()]},&mut budget()).unwrap();
    let r=chart.integrate_qr(request([d(0,0,0),d(-1,1,0)],d(1,1,0)),options(d(1,1,-1)),&mut budget());completed(&r);
    // Original correlated source is (10+b,-3+b), -1<=b<=1; flow is (2t,t).
    assert_eq!(r.source_end_enclosure().unwrap().lanes(),Some(&[d(11,13,0),d(-3,-1,0)]));
    assert_eq!(r.windows()[0].selection().basis(),&[vec![Real::one(),Real::one()],vec![Real::zero(),Real::one()]]);
    assert_ne!(r.windows()[0].transport().unwrap().initial(),r.windows()[0].transport().unwrap().enclosure());
}
#[test]
fn rotation_frames_follow_exact_basis_relations_and_independent_trigonometric_bounds() {
    let f=field::<2>(&[-Expr::anonymous_symbol(Y),Expr::anonymous_symbol(X)],&[X,Y]);let chart=identity(&f);
    for (horizon,window,expect) in [(d(3,3,-1),d(3,3,-2),[(7073,7074),(99749,99750)]),(d(1,1,-1),d(1,1,-2),[(87758,87759),(47942,47943)])] {
        let r=chart.integrate_qr(request([d(1,1,0),d(0,0,0)],horizon),options(window),&mut budget());completed(&r);
        // Alternating Taylor series give these independent rational brackets for cos/sin.
        for (lane,(l,u)) in r.source_end_enclosure().unwrap().lanes().unwrap().iter().zip(expect) {
            let interval=lane.to_rational(&mut arithmetic()).unwrap();
            assert!(interval.contains_point(&(Rational::from(l)/Rational::from(100000))));
            assert!(interval.contains_point(&(Rational::from(u)/Rational::from(100000))));
            eprintln!("ROTATION width {:?} steps {:?}",interval.width().unwrap().to_f64_enclosure(),r.windows().iter().map(|w|w.source_segments().len()).collect::<Vec<_>>());
            assert!(interval.width().unwrap()<Rational::one());
        }
        assert_eq!(r.windows().len(),2);
        let first=r.windows()[0].selection();let h=first.duration().to_rational(&mut arithmetic()).unwrap().lower().unwrap().clone();
        assert_eq!(first.basis(),&[vec![Real::one(),Real::from(-&h)],vec![Real::from(h),Real::one()]]);
    }
}
#[test]
fn singular_frame_and_original_domain_failure_are_not_identity_fallbacks() {
    let f=field::<1>(&[-Expr::anonymous_symbol(X)],&[X]);
    let r=identity(&f).integrate_qr(request([d(1,1,0)],d(1,1,0)),options(d(1,1,0)),&mut budget());
    assert!(matches!(r.status(),Status::Stopped(Failure::Qr(QrFieldError::Qr(QrCoordinateError::DependentColumn{..})))));
    assert_eq!(r.windows().len(),1);assert_eq!(r.windows()[0].selection().basis(),&[vec![Real::zero()]]);
    assert!(r.windows()[0].frame().is_none());assert!(r.source_end_enclosure().is_none());
    let f=field::<1>(&[Expr::int(1)/Expr::anonymous_symbol(X)],&[X]);
    let r=identity(&f).integrate_qr(request([d(-1,1,0)],d(1,1,0)),options(d(1,1,-2)),&mut budget());
    assert!(matches!(r.status(),Status::Stopped(Failure::Native(EvolutionFailure::Field(_)))));
    assert!(r.windows().is_empty());assert!(r.source_end_enclosure().is_none());
}
#[test]
fn empty_unit_identity_invalid_inputs_and_limits_stay_distinct() {
    let f=field::<1>(&[Expr::int(2)],&[X]);let chart=identity(&f);let o=options(d(1,1,-1));
    let mut input=request([d(0,0,0)],d(1,1,0));input.initial=BoxN::empty().unwrap();
    let r=chart.integrate_qr(input.clone(),o.clone(),&mut budget());assert!(matches!(r.status(),Status::Empty));assert_eq!(r.reached_time(),&d(1,1,0));assert!(r.source_end_enclosure().unwrap().is_empty());
    let mut bad=o.clone();bad.window=d(0,0,0);assert!(matches!(chart.integrate_qr(input.clone(),bad,&mut budget()).status(),Status::Stopped(Failure::InvalidWindow)));
    input.start=d(2,2,0);assert!(matches!(chart.integrate_qr(input,o.clone(),&mut budget()).status(),Status::Stopped(Failure::Native(EvolutionFailure::ReversedTime))));
    let r=chart.integrate_qr(request([d(-1,1,0)],d(0,0,0)),o.clone(),&mut budget());assert!(matches!(r.status(),Status::Identity));assert_eq!(r.source_end_enclosure().unwrap().lanes(),Some(&[d(-1,1,0)]));
    let f=field::<0>(&[],&[]);let r=identity(&f).integrate_qr(request([],d(1,1,0)),o.clone(),&mut budget());completed(&r);assert!(r.source_end_enclosure().unwrap().lanes().unwrap().is_empty());
    let mut limited=o.clone();limited.maximum_windows=1;let r=chart.integrate_qr(request([d(0,0,0)],d(1,1,0)),limited,&mut budget());assert!(matches!(r.status(),Status::Stopped(Failure::WindowLimit{limit:1})));assert_eq!(r.completed_windows().len(),1);assert_eq!(r.reached_time(),&d(1,1,-1));assert_eq!(r.prefix_source_end_enclosure().unwrap().lanes(),Some(&[d(1,1,0)]));assert!(r.source_end_enclosure().is_none());
    let mut limited=o;limited.taylor_order=None;limited.native.maximum_steps=0;let r=chart.integrate_qr(request([d(0,0,0)],d(1,1,0)),limited,&mut budget());assert!(matches!(r.status(),Status::Stopped(Failure::Native(EvolutionFailure::StepLimit{limit:0}))));assert!(r.windows()[0].evolution().is_some());assert!(r.completed_windows().is_empty());assert!(r.source_end_enclosure().is_none());
}
