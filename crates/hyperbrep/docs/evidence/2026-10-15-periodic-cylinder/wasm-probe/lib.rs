use hyperbrep::{BuildError, GeometryError, Curve3Kind, Matrix4, Real, builder, boolean};
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/periodic_cylinder.rs"]
mod fixture;
#[path = "/mnt/development/csgrs/crates/hyperbrep/src/topology/validation/rectangular_cover.rs"]
mod rectangular_cover;

#[unsafe(no_mangle)]
pub extern "C" fn run_probe() -> u32 {
    let one=fixture::build(&[[0,4,0,1]],1,2).unwrap();
    fixture::check(&fixture::replay(&one));
    fixture::check(&one);
    for (rectangles,levels) in [(vec![[0,1,0,1],[1,4,0,1]],1),(vec![[0,1,0,2],[1,4,0,1],[1,4,1,2]],2)] {
        fixture::check(&fixture::replay(&fixture::build(&rectangles,levels,0).unwrap()));
    }
    let split=one.edges().find(|e|e.curve().kind()==Curve3Kind::Line).unwrap().split((Real::one()/Real::from(2)).unwrap().into()).unwrap().into_model();
    fixture::check(&fixture::replay(&split));
    fixture::check(&fixture::replay(&split.transformed(&Matrix4::affine_nonuniform_scale([-Real::one(),Real::one(),Real::one()])).unwrap()));
    let native=builder::cylinder(Real::from(2),Real::from(4)).unwrap();
    let a=one.solids().next().unwrap();let b=native.bodies().next().unwrap();
    fixture::check(boolean::union(a,b).unwrap().model());
    fixture::check(boolean::intersection(a,b).unwrap().model());
    assert_eq!(boolean::difference(a,b).unwrap().bodies().count(),0);
    let n=10_000;let mut rectangles=Vec::new();
    for i in 0..n {rectangles.push([i,n,i,i+1]);if i+1<n{rectangles.push([i,i+1,i+1,n]);}}
    assert!(rectangular_cover::exactly_covers(n,n,&rectangles).unwrap());
    rectangles.pop();assert!(!rectangular_cover::exactly_covers(n,n,&rectangles).unwrap());
    assert!(matches!(rectangular_cover::exactly_covers(usize::MAX,1,&[[0,usize::MAX,0,1]]),Err(BuildError::Geometry(GeometryError::Numeric(hyperreal::Problem::OutOfRange)))));
    assert!(fixture::build(&[[0,4,0,1],[0,4,0,1]],1,0).is_err());
    5
}
