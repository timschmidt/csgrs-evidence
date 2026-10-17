// Original full-size rationally rotated sector fixtures, with independent set expectations.
use hyperbrep::*;
use std::{error::Error, path::Path};

fn q(n: i32, d: i32) -> Real { (Real::from(n) / Real::from(d)).unwrap() }
fn p(x: i32, y: i32, z: i32) -> Point3 { Point3::new(x.into(), y.into(), z.into()) }
fn equal(a: &Real, b: &Real) {
    assert_eq!(hyperlimit::compare_reals(a, b, STRICT_PREDICATES).value(), Some(std::cmp::Ordering::Equal));
}
fn verify(model: &Model, volume: &Real, area: &Real, points: &[(Point3, SolidPointLocation)]) {
    assert_eq!(model.solids().count(), 1);
    let body = model.solids().next().unwrap();
    equal(&body.volume().unwrap(), volume);
    equal(&model.faces().map(|f| f.area().unwrap()).fold(Real::zero(), |a,b| a+b), area);
    for (point, expected) in points {
        assert_eq!(body.classify_point(point).unwrap(), *expected);
    }
    for edge in model.edges() {
        let uses = edge.uses().collect::<Vec<_>>();
        assert_eq!(uses.len(), 2);
        assert_ne!(uses[0].direction(), uses[1].direction());
    }
}
fn main() -> Result<(), Box<dyn Error>> {
    use SolidPointLocation::{Inside as I, Outside as O, Boundary as B};
    let output = std::env::args_os().nth(1).ok_or("output directory required")?;
    let output = Path::new(&output);
    std::fs::create_dir_all(output)?;
    let map = Matrix4::from_row_major([
        q(3,5),q(-4,5),0.into(),0.into(),q(4,5),q(3,5),0.into(),0.into(),
        0.into(),0.into(),1.into(),0.into(),0.into(),0.into(),0.into(),1.into(),
    ]);
    let first_cut = builder::cuboid(p(0,-20,-20),p(20,20,20))?.transformed(&map)?;
    let cross = builder::cuboid(p(-20,0,-20),p(20,20,20))?;
    // 3*x+4*y >= 0 and y >= 0 retain polar angles [0, pi/2+atan(4/3)].
    let phi = Real::pi()*q(1,2) + q(4,3).atan()?;
    let tiny = q(1,1_000_000)*q(1,1_000_000);
    for torus in [false,true] {
        let (name, source, volume, area, mut points, boundary) = if torus {
            ("torus", builder::torus(5.into(),2.into())?,
                Real::from(20)*Real::pi()*&phi,
                Real::from(20)*Real::pi()*&phi + Real::from(8)*Real::pi(),
                vec![(p(3,4,0),I),(p(-3,4,0),I),(p(4,-3,0),O),(p(-5,0,0),O),
                     (p(0,0,0),O),(p(5,0,0),B),(p(-4,3,0),B),(p(3,4,2),B),
                     (Point3::new(3.into(),4.into(),Real::from(2)+&tiny),O)],
                p(-4,3,0))
        } else {
            ("cone", builder::cone_frustum(5.into(),2.into(),6.into())?,
                Real::from(39)*&phi,
                (Real::from(29)+Real::from(21)*Real::from(5).sqrt()?)*&phi*q(1,2)+Real::from(42),
                vec![(p(1,1,3),I),(p(-1,1,3),I),(p(-3,1,3),O),(p(1,-1,3),O),
                     (p(1,0,3),B),(p(0,0,3),B),(p(1,1,0),B),(p(1,1,6),B)],
                Point3::new((-2).into(),q(3,2),3.into()))
        };
        let normal = Vector3::new([q(3,5),q(4,5),Real::zero()]);
        points.push((boundary.clone() + normal.clone()*&tiny,I));
        points.push((boundary - normal*&tiny,O));
        let half = boolean::intersection(&source,&first_cut)?;
        let result = boolean::intersection(&half,&cross)?;
        verify(result.model(),&volume,&area,&points);
        let archive = result.model().to_json()?;
        let replay = RawModel::from_json(&archive,&ArchiveLimits::default())?.validate()?;
        assert_eq!(archive,replay.to_json()?);
        verify(&replay,&volume,&area,&points);
        std::fs::write(output.join(format!("{name}.json")),archive)?;
        let edge = replay.edges().next().unwrap();
        let (a,b) = edge.domain().try_real_endpoints().unwrap();
        let split = edge.split(((a+b)*q(1,2)).into())?.into_model();
        let split = RawModel::from_json(&split.to_json()?,&ArchiveLimits::default())?.validate()?;
        verify(&split,&volume,&area,&points);
        let split = BodySet::from_solid(split.solids().next().unwrap());
        verify(boolean::intersection(&split,&cross)?.model(),&volume,&area,&points);
        let empty = boolean::difference(&split,&cross)?;
        assert_eq!(empty.model().to_json()?,BodySet::empty().model().to_json()?);
        verify(boolean::union(&empty,&split)?.model(),&volume,&area,&points);
        println!("{name}: independent measures, points, topology, replay, split, recut, clear and empty recovery passed");
    }
    Ok(())
}
