// Public native continuation probe; serialized growth is not a live-heap bound.
use hyperbrep::*;
use std::{error::Error, path::Path};

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}
fn point(x: i32, y: i32, z: i32) -> Point3 {
    Point3::new(x.into(), y.into(), z.into())
}
fn equal(a: &Real, b: &Real) {
    let direct = hyperlimit::compare_reals(a, b, STRICT_PREDICATES).value();
    if direct.is_none() {
        // Equality is invariant under division of both exact sides by a
        // strictly positive constant. Keep the direct predicate's limitation
        // visible; this is an independent oracle, not a production shortcut.
        let pi = Real::pi();
        assert_eq!(hyperlimit::compare_reals(&pi, &Real::zero(), STRICT_PREDICATES).value(), Some(std::cmp::Ordering::Greater));
        let left = (a / &pi).unwrap();
        let right = (b / &pi).unwrap();
        println!("direct measure comparison undecided; checking exact equality after division by pi");
        assert_eq!(hyperlimit::compare_reals(&left, &right, STRICT_PREDICATES).value(), Some(std::cmp::Ordering::Equal));
        return;
    }
    assert_eq!(
        direct,
        Some(std::cmp::Ordering::Equal)
    );
}
fn main() -> Result<(), Box<dyn Error>> {
    let directory = std::env::args_os()
        .nth(1)
        .ok_or("output directory required")?;
    let directory = Path::new(&directory);
    std::fs::create_dir_all(directory)?;
    let source = builder::torus(10.into(), 5.into())?;
    let cutter = builder::cuboid(point(-40, -40, 3), point(40, 40, 40))?;
    let band = boolean::intersection(&source, &cutter)?;
    let volume = Real::from(20)
        * Real::pi()
        * (Real::from(25) * (Real::pi() * q(1, 2) - q(3, 5).asin()?) - Real::from(12));
    let area = Real::from(100) * Real::pi() * (Real::pi() - Real::from(2) * q(3, 4).atan()?)
        + Real::from(160) * Real::pi();
    let mut model =
        RawModel::from_json(&band.model().to_json()?, &ArchiveLimits::default())?.validate()?;
    for cycle in 0..=4 {
        let json = model.to_json()?;
        let replay = RawModel::from_json(&json, &ArchiveLimits::default())?.validate()?;
        assert_eq!(replay.to_json()?, json);
        let body = replay.solids().next().unwrap();
        println!("cycle {cycle}: checking volume");
        equal(&body.volume()?, &volume);
        println!("cycle {cycle}: checking area");
        equal(
            &replay
                .faces()
                .map(|f| f.area().unwrap())
                .fold(Real::zero(), |a, b| a + b),
            &area,
        );
        assert_eq!(
            body.classify_point(&point(10, 0, 4))?,
            SolidPointLocation::Inside
        );
        assert_eq!(
            body.classify_point(&point(10, 0, 3))?,
            SolidPointLocation::Boundary
        );
        std::fs::write(directory.join(format!("cycle-{cycle}.json")), &json)?;
        let c = model.counts();
        println!(
            "{{\"cycle\":{cycle},\"bytes\":{},\"faces\":{},\"edges\":{},\"vertices\":{},\"outcome\":\"certified\"}}",
            json.len(),
            c.faces,
            c.edges,
            c.vertices
        );
        if cycle < 4 {
            let edge = replay.edges().next().unwrap();
            let (start, end) = edge.domain().try_real_endpoints().unwrap();
            model = edge.split(((start + end) * q(1, 2)).into())?.into_model();
        }
    }
    Ok(())
}
