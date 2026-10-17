use hyperbrep::{
    ArchiveLimits, BodySet, Matrix4, OperationContext, Point3, RawModel, Real, WorkBudget,
    boolean, builder,
};
use hyperbrep_io::step::{
    ImportLimits, StepBody, StepFile, StepReadOptions, StepWriteOptions, write_advanced,
};
use std::path::Path;

fn p(x: i32, y: i32, z: i32) -> Point3 {
    Point3::new(x.into(), y.into(), z.into())
}
fn q(x: i32, y: i32) -> Real {
    (Real::from(x) / Real::from(y)).unwrap()
}
fn record(name: &str, body: &BodySet, out: &Path) {
    let archive = body.model().to_json().unwrap();
    let replay = RawModel::from_json(&archive, &ArchiveLimits::default())
        .unwrap()
        .validate()
        .unwrap();
    assert_eq!(replay.to_json().unwrap(), archive);
    std::fs::write(out.join(format!("{name}.json")), archive).unwrap();
    let context = OperationContext::strict(WorkBudget {
        refinements: 10_000,
        promotions: 1000,
    });
    let options = StepWriteOptions::new("cone.step", "2026-10-17T00:00:00");
    let output = write_advanced(
        &[StepBody {
            solid: replay.solids().next().unwrap(),
            name,
        }],
        &options,
        &context,
    );
    let result = match output.result {
        Ok(Ok(step)) => {
            std::fs::write(out.join(format!("{name}.step")), step.text()).unwrap();
            "success".to_owned()
        }
        other => format!("{other:?}"),
    };
    println!("{}", serde_json::json!({"case":name,"outcome":result}));
}
fn main() {
    let args: Vec<_> = std::env::args().collect();
    let out = Path::new(&args[1]);
    std::fs::create_dir_all(out).unwrap();
    let source = builder::cone_frustum(5.into(), 2.into(), 6.into()).unwrap();
    let rotation = Matrix4::from_row_major([
        q(3, 5), -q(4, 5), 0.into(), 0.into(),
        q(4, 5), q(3, 5), 0.into(), 0.into(),
        0.into(), 0.into(), 1.into(), 0.into(),
        0.into(), 0.into(), 0.into(), 1.into(),
    ]);
    let cutter = builder::cuboid(p(0, -20, -20), p(20, 20, 20))
        .unwrap().transformed(&rotation).unwrap();
    let half = boolean::intersection(&source, &cutter).unwrap();
    let other = boolean::difference(&source, &cutter).unwrap();
    let axial = builder::cuboid(p(-20, -20, 1), p(20, 20, 20)).unwrap();
    let band = boolean::intersection(&half, &axial).unwrap();
    let lower = boolean::difference(&half, &axial).unwrap();
    for (name, body) in [
        ("whole", &source), ("positive", &half), ("negative", &other),
        ("band", &band), ("lower", &lower),
    ] {
        record(name, body, out);
    }
    for (name, body) in [
        ("reunion-first", boolean::union(&half, &other).unwrap()),
        ("reunion-second", boolean::union(&other, &half).unwrap()),
        ("band-reunion-first", boolean::union(&band, &lower).unwrap()),
        ("band-reunion-second", boolean::union(&lower, &band).unwrap()),
        ("shifted-apex", builder::cone_frustum(5.into(), 2.into(), 7.into()).unwrap()),
    ] {
        record(name, &body, out);
    }
    for name in ["unit-line", "shifted-unit-line", "finite-bspline"] {
        let input = std::fs::read(Path::new(&args[2]).join(format!("{name}.step"))).unwrap();
        let file = StepFile::read(&input, &StepReadOptions::default()).unwrap();
        let context = OperationContext::strict(WorkBudget {
            refinements: 10_000,
            promotions: 1000,
        });
        let output = file.import_representation(60, &ImportLimits::default(), &context);
        let result = match output.result {
            Ok(Ok(_)) => "success".to_owned(),
            other => format!("{other:?}"),
        };
        println!("{}", serde_json::json!({"import":name,"outcome":result}));
    }
}
