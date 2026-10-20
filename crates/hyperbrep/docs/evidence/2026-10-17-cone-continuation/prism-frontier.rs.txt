use hyperbrep::{ArchiveLimits, BodySet, Matrix4, Model, Point2, Point3, RawModel, Real, boolean, builder};
use hyperbrep_io::step::{StepBody, StepWriteOptions, write_advanced};

fn q(n: i32, d: i32) -> Real { (Real::from(n) / Real::from(d)).unwrap() }
fn p(x: i32, y: i32, z: i32) -> Point3 { Point3::new(x.into(), y.into(), z.into()) }
fn square(r: i32) -> Vec<Point2> {
    [(-r, -r), (r, -r), (r, r), (-r, r)].map(|(x, y)| Point2::new(x.into(), y.into())).to_vec()
}
fn main() {
    let args: Vec<_> = std::env::args().collect();
    let family = &args[1];
    let slab = &args[2];
    let rotation = &args[3];
    let operation = &args[4];
    let source = match family.as_str() {
        "cylinder" | "bore" | "coaxial_bore" => builder::cylinder(5.into(), 6.into()).unwrap(),
        "box" | "strip" => builder::cuboid(p(-5, -5, 0), p(5, 5, 6)).unwrap(),
        "ring" => builder::extrude_region(&square(5), &[square(2)], 0.into(), 6.into()).unwrap(),
        "annulus" => {
            let outer = builder::cylinder(5.into(), 6.into()).unwrap();
            let inner = builder::cylinder(2.into(), 6.into()).unwrap();
            boolean::difference(&outer, &inner).unwrap()
        }
        _ => panic!("unknown family"),
    };
    let delta = q(1, 1_000_000) * q(1, 1_000_000);
    let (z_min, z_max) = match slab.as_str() {
        "cover" => ((-20).into(), 20.into()),
        "same" => (0.into(), 6.into()),
        "lower_equal" => (0.into(), 20.into()),
        "upper_equal" => ((-20).into(), 6.into()),
        "tiny_cover" => (-&delta, Real::from(6) + &delta),
        "tiny_upper_gap" => ((-20).into(), Real::from(6) - &delta),
        "tiny_lower_gap" => (delta.clone(), 20.into()),
        "interior" => (2.into(), 4.into()),
        "touch" => (6.into(), 20.into()),
        "disjoint" => (Real::from(6) + &delta, 20.into()),
        _ => panic!("unknown slab"),
    };
    let (c, s) = match rotation.as_str() {
        "identity" => (Real::one(), Real::zero()),
        "diagonal" => { let r = (Real::from(2).sqrt().unwrap() / Real::from(2)).unwrap(); (r.clone(), r) }
        "rational" => (q(3, 5), q(4, 5)),
        _ => panic!("unknown rotation"),
    };
    let map = Matrix4::from_row_major([
        c.clone(), -&s, 0.into(), 0.into(), s, c, 0.into(), 0.into(),
        0.into(), 0.into(), 1.into(), 0.into(), 0.into(), 0.into(), 0.into(), 1.into(),
    ]);
    let (x0, x1) = if family == "strip" { (-1, 1) } else { (0, 20) };
    let cutter = if matches!(family.as_str(), "bore" | "coaxial_bore") {
        let offset = i32::from(family == "bore");
        builder::cylinder(2.into(), &z_max - &z_min).unwrap()
            .transformed(&Matrix4::affine_translation([offset.into(), 0.into(), z_min])).unwrap()
    } else {
        builder::cuboid(
            Point3::new(x0.into(), (-20).into(), z_min),
            Point3::new(x1.into(), 20.into(), z_max),
        ).unwrap()
    }.transformed(&map).unwrap();
    println!("fixture={family}/{slab}/{rotation}/{operation}");
    let result = match operation.as_str() {
        "difference" => boolean::difference(&source, &cutter),
        "intersection" => boolean::intersection(&source, &cutter),
        "reverse" => boolean::difference(&cutter, &source),
        "union" => boolean::union(&source, &cutter),
        "clear" => boolean::intersection(&source, &cutter).and_then(|half| boolean::difference(&half, &cutter)),
        _ => panic!("unknown operation"),
    };
    match result {
        Err(error) => println!("error={error:?}"),
        Ok(result) => {
            println!("bodies={}", result.len());
            println!("counts={:?}", result.model().counts());
            println!("surfaces={:?}", result.model().faces().map(|face| face.surface().kind()).collect::<Vec<_>>());
            println!("curves={:?}", result.model().edges().map(|edge| edge.curve().kind()).collect::<Vec<_>>());
            for (index, face) in result.model().faces().enumerate() {
                println!("face_area={index} {:?}: {:?}", face.surface().kind(), face.area());
            }
            for body in result.bodies() {
                println!("volume={:?}", body.volume());
                for point in [p(-1, 0, 3), p(1, 0, 3), p(0, 0, 3), p(-3, 0, 3), p(3, 0, 3),
                    Point3::new(1.into(), 0.into(), Real::from(6) - &delta * q(1, 2))] {
                    println!("sample={point:?}: {:?}", body.classify_point(&point));
                }
            }
            let area = result.model().faces().try_fold(Real::zero(), |sum, face| face.area().map(|area| sum + area));
            println!("area={area:?}");
            let json = result.model().to_json().unwrap();
            let replay = RawModel::from_json(&json, &ArchiveLimits::default()).unwrap().validate();
            println!("replay={:?}", replay.as_ref().map(Model::counts));
            if let Some(directory) = args.get(5) {
                let path = std::path::Path::new(directory).join(format!("{family}-{slab}-{rotation}-{operation}.json"));
                std::fs::write(path, &json).unwrap();
            }
            let hash = json.bytes().fold(0xcbf29ce484222325_u64, |h, b| (h ^ u64::from(b)).wrapping_mul(0x100000001b3));
            println!("archive_bytes={} receipt={hash}", json.len());
            if !result.is_empty() {
                let inputs = result.bodies().map(|solid| StepBody { solid, name: "prism diagnostic" }).collect::<Vec<_>>();
                let context = hyperbrep::OperationContext::strict(hyperbrep::WorkBudget { refinements: 10_000, promotions: 1000 });
                let options = StepWriteOptions::new("prism.step", "2026-10-16T00:00:00");
                match write_advanced(&inputs, &options, &context).result {
                    Err(error) => println!("step_context={error:?}"),
                    Ok(Err(error)) => println!("step_error={error:?}"),
                    Ok(Ok(output)) => {
                        println!("step_bytes={}", output.text().len());
                        if let Some(directory) = args.get(5) {
                            let path = std::path::Path::new(directory).join(format!("{family}-{slab}-{rotation}-{operation}.step"));
                            std::fs::write(path, output.text()).unwrap();
                        }
                    }
                }
            }
            if result.is_empty() {
                assert_eq!(json, BodySet::empty().model().to_json().unwrap());
            }
        }
    }
}
