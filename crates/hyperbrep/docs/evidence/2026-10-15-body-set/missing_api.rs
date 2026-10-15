use hyperbrep::{boolean, builder, Point3, Real};

fn main() {
    let a = builder::cuboid(Point3::origin(), Point3::new(Real::one(), Real::one(), Real::one())).unwrap();
    let solid = a.bodies().next().unwrap();
    let empty = boolean::difference(solid, solid).unwrap();
    let _ = boolean::union(&empty, &a);
}
