use hyperbrep::*;
use hyperbrep_io::step::*;

fn p(x:i32,y:i32,z:i32)->Point3 { Point3::new(x.into(),y.into(),z.into()) }
fn q(x:i32,y:i32)->Real { (Real::from(x)/Real::from(y)).unwrap() }
fn cutter()->BodySet {
    let rotation=Matrix4::from_row_major([q(3,5),-q(4,5),0.into(),0.into(),q(4,5),q(3,5),0.into(),0.into(),0.into(),0.into(),1.into(),0.into(),0.into(),0.into(),0.into(),1.into()]);
    builder::cuboid(p(0,-20,-20),p(20,20,20)).unwrap().transformed(&rotation).unwrap()
}

fn exchange(body: &BodySet, name: &str, out: &std::path::Path) -> BodySet {
    let context=OperationContext::strict(WorkBudget {refinements:10_000,promotions:1000});
    let output=write_advanced(&[StepBody {solid:body.bodies().next().unwrap(),name}],&StepWriteOptions::new("cone.step","2026-10-17T00:00:00"),&context).result.unwrap().unwrap();
    let file=StepFile::read(output.text().as_bytes(),&StepReadOptions::default()).unwrap();
    let imported=file.import_representation(output.representation(),&ImportLimits::default(),&context).result.unwrap().unwrap();
    let json=imported.bodies()[0].model().to_json().unwrap();
    let replay=RawModel::from_json(&json,&ArchiveLimits::default()).unwrap().validate().unwrap();
    let body=BodySet::from_solid(replay.solids().next().unwrap());
    let text=output.into_text();
    std::fs::write(out.join(format!("{name}.step")),text).unwrap();
    std::fs::write(out.join(format!("{name}.json")),body.model().to_json().unwrap()).unwrap();
    for (i,face) in body.model().faces().enumerate() {
        if face.surface().kind()!=SurfaceKind::Cone {continue}
        let values=face.outer().unwrap().edge_uses().map(|edge_use| {
            let pc=edge_use.pcurve();
            let point=pc.point_at(&pc.domain_start().unwrap()).unwrap();
            let uv=point.coordinates().unwrap();
            // Named display-only boundary; exact archives above are authoritative.
            [uv.x().to_f64_lossy().unwrap(),uv.y().to_f64_lossy().unwrap()]
        }).collect::<Vec<_>>();
        println!("{name} face {i} diagnostic UV {values:?}");
    }
    body
}
fn main() {
    let path=std::env::args().nth(1).unwrap();
    let out=std::path::Path::new(&path);
    std::fs::create_dir_all(out).unwrap();
    let source=exchange(&builder::cone_frustum(5.into(),2.into(),6.into()).unwrap(),"whole",out);
    let cutter=cutter();
    let half=exchange(&boolean::intersection(&source,&cutter).unwrap(),"positive",out);
    let other=exchange(&boolean::difference(&source,&cutter).unwrap(),"negative",out);
    let axial=builder::cuboid(p(-20,-20,1),p(20,20,20)).unwrap();
    let band=exchange(&boolean::intersection(&half,&axial).unwrap(),"band",out);
    let lower=exchange(&boolean::difference(&half,&axial).unwrap(),"lower",out);
    for (a,b,name) in [(&half,&other,"reunion-first"),(&other,&half,"reunion-second"),(&band,&lower,"band-reunion-first"),(&lower,&band,"band-reunion-second")] {
        let result=boolean::union(a,b);
        match result {
            Ok(body)=>{ println!("{name}: success"); exchange(&body,name,out); },
            Err(error)=>println!("{name}: {error:?}"),
        }
    }
}
