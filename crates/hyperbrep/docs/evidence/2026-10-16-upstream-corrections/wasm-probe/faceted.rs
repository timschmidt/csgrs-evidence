use hyperbrep::{Matrix4,OperationContext,Point2,Point3,Real,WorkBudget,builder};
use hyperbrep_io::step::{StepBody,ImportLimits,StepFile,StepReadOptions,StepWriteOptions,WriteErrorKind,WriteResource,write_faceted};

pub fn run_probe()->u32 {
    let cx=OperationContext::strict(WorkBudget{refinements:10_000,promotions:1000});
    let ratio=|n,d|(Real::from(n)/Real::from(d)).unwrap();
    let profile=|points:&[(i32,i32)]| points.iter().map(|&(x,y)|Point2::new(x.into(),y.into())).collect::<Vec<_>>();
    let hole=builder::extrude_region(&profile(&[(0,0),(4,0),(4,3),(0,3)]),&[profile(&[(1,1),(3,1),(3,2),(1,2)])],Real::zero(),Real::from(2)).unwrap();
    let hole=hole.transformed(&Matrix4::affine_nonuniform_scale([-Real::one(),Real::one(),Real::one()])).unwrap();
    let input=StepBody{solid:hole.bodies().next().unwrap(),name:"hole Ω🙂'\\"};
    let options=StepWriteOptions::new("wasm.step","2026-10-15T00:00:00");
    let out=write_faceted(&[input,input],&options,&cx).result.unwrap().unwrap();
    assert_eq!(out.bodies().len(),2);
    assert_eq!(out.bodies()[0].edge_uses().len(),48);
    assert_eq!(out.bodies()[0].wires().len(),12);
    assert_ne!(out.bodies()[0].vertices()[0].entity,out.bodies()[1].vertices()[0].entity);
    assert_eq!(write_faceted(&[input,input],&options,&cx).result.unwrap().unwrap().text(),out.text());
    let file=StepFile::read(out.text().as_bytes(),&StepReadOptions::default()).unwrap();
    let imported=file.import_representation(out.representation(),&ImportLimits::default(),&cx).result.unwrap().unwrap();
    assert_eq!(imported.bodies().len(),2);
    for body in imported.bodies(){assert_eq!(body.solid().volume().unwrap(),Real::from(20));assert_eq!(body.name(),input.name);}
    let mut small=options.clone();small.limits.edge_uses=47;
    assert!(matches!(write_faceted(&[input],&small,&cx).result.unwrap().unwrap_err().kind,WriteErrorKind::Limit{resource:WriteResource::EdgeUses,..}));
    let third=builder::cuboid(Point3::origin(),Point3::new(ratio(1,3),Real::one(),Real::one())).unwrap();
    assert!(matches!(write_faceted(&[StepBody{solid:third.bodies().next().unwrap(),name:"third"}],&options,&cx).result.unwrap().unwrap_err().kind,WriteErrorKind::NonTerminatingDecimal));
    let sphere=builder::sphere(Real::one()).unwrap();
    assert!(matches!(write_faceted(&[StepBody{solid:sphere.bodies().next().unwrap(),name:"sphere"}],&options,&cx).result.unwrap().unwrap_err().kind,WriteErrorKind::UnsupportedSurface(_)));
    let independent={
        let cube=builder::cuboid(Point3::origin(),Point3::new(ratio(1,8),Real::one(),Real::one())).unwrap();
        write_faceted(&[StepBody{solid:cube.bodies().next().unwrap(),name:"independent"}],&options,&cx).result.unwrap().unwrap().into_text()
    };
    assert!(StepFile::read(independent.as_bytes(),&StepReadOptions::default()).is_ok());
    5
}
