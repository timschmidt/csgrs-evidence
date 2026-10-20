use hyperbrep::{ArchiveLimits,Matrix4,OperationContext,RawModel,Real,WorkBudget};
use hyperbrep_io::step::{ErrorKind,ImportLimits,Resource,StepFile,StepReadOptions};
const BOX:&str=include_str!("/mnt/development/csgrs/crates/hyperbrep-io/tests/fixtures/occt-advanced-box.step");
const DIRECT:&str=include_str!("/mnt/development/csgrs/crates/hyperbrep-io/tests/fixtures/occt-advanced-box-3d.step");
const HOLE:&str=include_str!("/mnt/development/csgrs/crates/hyperbrep-io/tests/fixtures/occt-advanced-hole.step");
fn read(text:&str)->StepFile<'_>{StepFile::read(text.as_bytes(),&StepReadOptions::default()).unwrap()}
fn argument(text:&str,id:u64,index:usize,value:&str)->String {
    let file=read(text);let span=file.syntax().entity(id).unwrap().components().next().unwrap().arguments().nth(index).unwrap().span();
    let mut result=text.to_string();result.replace_range(span.start..span.end,value);result
}
#[unsafe(no_mangle)]
pub extern "C" fn run_probe()->u32 {
    let cx=OperationContext::strict(WorkBudget{refinements:10_000,promotions:1000});
    let ratio=|n,d|(Real::from(n)/Real::from(d)).unwrap();
    for (text,volume,maps) in [(BOX,24,4),(DIRECT,24,1),(HOLE,20,4)] {
        let body=read(text).import_representation(10,&ImportLimits::default(),&cx).result.unwrap().unwrap();
        let body=&body.bodies()[0];assert_eq!(body.solid().volume().unwrap(),ratio(volume,1_000_000_000));
        for edge in body.explicit_edges(){assert_eq!(edge.parameters.len(),maps);}
        let json=body.model().to_json().unwrap();let loaded=RawModel::from_json(&json,&ArchiveLimits::default()).unwrap().validate().unwrap();
        assert_eq!(loaded.to_json().unwrap(),json);
    }
    let imported=read(HOLE).import_representation(10,&ImportLimits::default(),&cx).result.unwrap().unwrap();
    let split=imported.bodies()[0].model().edges().next().unwrap().split(ratio(1,2).into()).unwrap().into_model();
    let moved=split.transformed(&Matrix4::affine_nonuniform_scale([-Real::one(),Real::one(),Real::one()])).unwrap();
    assert_eq!(moved.solids().next().unwrap().volume().unwrap(),ratio(20,1_000_000_000));
    let reparam=argument(&argument(BOX,39,1,"(7.,0.)"),40,2,"2.");
    let imported=read(&reparam).import_representation(10,&ImportLimits::default(),&cx).result.unwrap().unwrap();
    let edge=imported.bodies()[0].explicit_edges().find(|e|e.source==21).unwrap();
    assert_eq!(edge.master,31);assert_eq!(edge.parameters[0].start,ratio(-7,2));assert_eq!(edge.parameters[0].end,ratio(-3,2));
    for bad in [argument(BOX,51,1,"(0.,1.)"),argument(BOX,53,1,"(-1.,0.)")] {
        assert!(matches!(read(&bad).import_representation(10,&ImportLimits::default(),&cx).result.unwrap().unwrap_err().kind,ErrorKind::Invalid(_)));
    }
    let gap=argument(BOX,23,1,"(1.E-12,0.,0.)");
    let ambient=hypercurve::evaluate_under(hypercurve::PredicatePolicy::APPROXIMATE_512,||read(&gap).import_representation(10,&ImportLimits::default(),&cx).result.unwrap().unwrap_err());
    assert!(matches!(ambient.certified().unwrap().kind,ErrorKind::Invalid(_)));
    let limits=ImportLimits{edge_uses:23,..ImportLimits::default()};
    assert!(matches!(read(BOX).import_representation(10,&limits,&cx).result.unwrap().unwrap_err().kind,ErrorKind::Limit{resource:Resource::EdgeUses,..}));
    6
}
