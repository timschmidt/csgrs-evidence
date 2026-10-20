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
    assert_eq!(
        hyperlimit::compare_reals(a, b, STRICT_PREDICATES).value(),
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
    let mut previous: Option<Vec<Real>> = None;
    for cycle in 0..=4 {
        let json = model.to_json()?;
        let replay = RawModel::from_json(&json, &ArchiveLimits::default())?.validate()?;
        assert_eq!(replay.to_json()?, json);
        let body = replay.solids().next().unwrap();
        equal(&body.volume()?, &volume);
        let areas = replay.faces().map(|f| f.area().unwrap()).collect::<Vec<_>>();
        let total = areas.iter().fold(Real::zero(), |a,b| a+b);
        println!("cycle {cycle}: total={:?}",hyperlimit::compare_reals(&total,&area,STRICT_PREDICATES));
        std::fs::write(directory.join(format!("measure-{cycle}.json")),serde_json::to_vec(&[total.clone(),area.clone()])?)?;
        if let Some(before) = &previous {
            assert_eq!(before.len(),areas.len());
            for (index,(a,b)) in before.iter().zip(&areas).enumerate() {
                let direct = hyperlimit::compare_reals(a,b,STRICT_PREDICATES);
                let left=(a/Real::pi())?; let right=(b/Real::pi())?;
                let scaled=hyperlimit::compare_reals(&left,&right,STRICT_PREDICATES);
                println!("cycle {cycle} face {index}: direct={direct:?}, pi_normalized={scaled:?}");
                if direct.value()!=Some(std::cmp::Ordering::Equal) {
                    std::fs::write(directory.join(format!("face-{cycle}-{index}.json")),serde_json::to_vec(&[a.clone(),b.clone()])?)?;
                    println!("approximate diagnostic only: before={:?}, after={:?}",a.to_f64_lossy(),b.to_f64_lossy());
                }
            }
        }
        previous=Some(areas);
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
            "{{\"cycle\":{cycle},\"bytes\":{},\"faces\":{},\"edges\":{},\"vertices\":{},\"outcome\":\"diagnostic_only\"}}",
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
