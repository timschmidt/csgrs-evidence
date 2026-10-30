#![allow(dead_code)]
#[path = "/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-closure-work/polynomial-chamfer-dispatch/crates/hypersolve/tests/support/recursive_quadratic.rs"] mod support;
#[path = "/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-closure-work/polynomial-chamfer-dispatch/crates/hypersolve/tests/support/selected_polynomial_replay.rs"] mod codec;
use hypersolve::classification::Classification;
use hyperreal::{Real,RealSign};
fn decided<T: std::fmt::Debug>(value: Classification<T>) -> T {
    match value { Classification::Decided(value) => value, other => panic!("expected exact completion: {other:?}") }
}
fn main() {
    let started = std::time::Instant::now();
    let input = std::fs::read_to_string(std::env::args_os().nth(1).unwrap()).unwrap();
    let graph = codec::decode(&input);
    eprintln!("decoded {} nodes at {:?}", graph.nodes.len(),started.elapsed());
    let policy = support::TestContext::strict();
    let values = decided(graph.replay(10000,&policy).unwrap());
    eprintln!("replayed at {:?}",started.elapsed());
    assert_eq!(values.len(),1);
    let value = &values[0];
    let enclosure = decided(value.enclosed(&policy).unwrap());
    eprintln!("enclosed at {:?}: {:?}",started.elapsed(),enclosure.interval());
    assert_eq!(enclosure.interval().lower,Real::from(-1));
    assert_eq!(enclosure.interval().upper,Real::zero());
    let near = decided(enclosure.refined(4,&policy).unwrap());
    eprintln!("refined at {:?}: {:?}",started.elapsed(),near.interval());
    assert!(near.value().field().shares_authority(value.field()));
    assert_eq!(decided(value.sign(&policy).unwrap()),RealSign::Negative);
    assert_eq!(decided(value.add(&value.field().constant(Real::one()).unwrap()).unwrap().sign(&policy).unwrap()),RealSign::Positive);
    assert_eq!(policy.approximations(),0);
}
