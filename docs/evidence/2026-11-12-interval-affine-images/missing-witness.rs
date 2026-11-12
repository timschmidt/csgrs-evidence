use hyperlattice_interval::{AffineMap,IntervalMatrix,IntervalVector};
use hyperlattice_interval::hyperinterval::FixedInterval;
#[test]
fn affine_output_retains_shared_parameter() {
 type I=FixedInterval<i32,0>;
 let point=|n| I::point(n).unwrap();
 let source=IntervalVector::new([I::new(-1,1).unwrap()]).unwrap();
 let duplicate=AffineMap::new(IntervalMatrix::new([[point(1)],[point(1)]]).unwrap(),IntervalVector::new([point(0),point(0)]).unwrap()).unwrap();
 let difference=AffineMap::new(IntervalMatrix::new([[point(1),point(-1)]]).unwrap(),IntervalVector::new([point(0)]).unwrap()).unwrap();
 let image=difference.image(duplicate.image(source));
 assert_eq!(image.enclosure(&mut ()).unwrap().lanes(),Some(&[point(0)]));
}
