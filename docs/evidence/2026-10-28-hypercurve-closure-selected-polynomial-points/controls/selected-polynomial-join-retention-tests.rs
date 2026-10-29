#[path = "/home/tim/Documents/GitHub/workspace/csgrs-closure-work/selected-polynomial-points/crates/hypersolve/tests/support/recursive_quadratic.rs"]
#[allow(dead_code)]
mod support;
use support::*;
use hypersolve::selected_polynomial_field::*;
use hypersolve::recursive_quadratic_field::RecursiveQuadraticField;
use hypersolve::classification::Classification;
fn value<T>(v: Classification<T>) -> T { match v { Classification::Decided(v) => v, _ => panic!("exact") } }
fn root(n: i64) -> SelectedPolynomialField {
    let field = SelectedPolynomialField::from_recursive(RecursiveQuadraticField::base(vec![], constant_tensor(0,real(1)), constant_tensor(0,real(1))).unwrap());
    let coeff = [(-n),0,0,1].into_iter().map(|x|field.constant(real(x)).unwrap()).collect();
    value(field.select(coeff,real(1),real(2),&TestContext::strict()).unwrap())
}
fn depth(field: &SelectedPolynomialField) -> usize { let mut f=field; let mut n=0; while let Some(p)=f.parent() { n+=1; f=p; } n }
#[test]
fn a_native_base_already_containing_all_sources_keeps_polynomial_ancestry() {
    let a=root(2);let b=root(3);let c=root(2);
    let ab=value(a.joined_with(&b,&TestContext::strict()).unwrap());
    assert_eq!(depth(ab.field()),2);
    let abc=value(ab.field().joined_with(&c,&TestContext::strict()).unwrap());
    assert_eq!(depth(abc.field()),3);
    assert!(abc.field().parent().unwrap().shares_authority(ab.field()),"a native base with every required source must retain its already admitted polynomial ancestors");
    let reused=value(abc.field().joined_with(ab.field(),&TestContext::strict()).unwrap());
    assert_eq!(depth(reused.field()),3,"reconsuming the original shared operand must not append its generators again");
    assert!(reused.field().shares_authority(abc.field()));
}
