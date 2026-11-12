use alumina_foc::{Q30,Q30Interval as Q,AlphaBeta,Phase3,Rotation};
use hyperlattice_interval::{IntervalMatrix,IntervalVector,hyperinterval::FixedInterval};
type I=FixedInterval<i32,30>;
fn main(){
let rotation=Rotation::new(Q::point(Q30::NEG_ONE),Q::ZERO,Q30::ZERO).unwrap();
let native=alumina_foc::park(AlphaBeta{alpha:Q::point(Q30::from_bits(i32::MIN)),beta:Q::ZERO},rotation);
let p=|x|I::point(x).unwrap();
let dense=IntervalMatrix::new([[p(0),p(-(1<<30))],[p(1<<30),p(0)]]).unwrap().mul_vector(&IntervalVector::new([p(i32::MIN),p(0)]).unwrap(),&mut());
println!("native Park: {native:?}; dense Park: {dense:?}");assert!(native.is_err()&&dense.is_ok());
let native=alumina_foc::clarke(Phase3{a:Q::ONE,b:Q::ZERO,c:Q::point(Q30::NEG_ONE)},Q30::ZERO).unwrap();
let dense=IntervalMatrix::new([[I::from_ratio(2,3).unwrap(),I::from_ratio(-1,3).unwrap(),I::from_ratio(-1,3).unwrap()]]).unwrap().mul_vector(&IntervalVector::new([p(1<<30),p(0),p(-(1<<30))]).unwrap(),&mut()).unwrap();
println!("native Clarke alpha: {:?}; pre-rounded matrix alpha: {:?}",native.alpha,dense);assert_ne!(dense.lanes().unwrap()[0].bounds(),Some((native.alpha.lower().bits(),native.alpha.upper().bits())));
}
