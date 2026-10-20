use hyperbrep::{ArchiveLimits,OperationContext,Point3,RawModel,Real,SolidPointLocation,WorkBudget};
use hyperbrep_io::step::{ErrorKind,ImportLimits,Resource,StepFile,StepReadOptions};
#[path="/mnt/development/csgrs/crates/hyperbrep-io/tests/support/mod.rs"]mod support;

#[unsafe(no_mangle)]
pub extern "C" fn run_probe()->u32 {
    let context=OperationContext::strict(WorkBudget{refinements:10_000,promotions:1000});
    let ratio=|n,d| (Real::from(n)/Real::from(d)).unwrap();
    for (source,bodies,vertices,edges,faces,volume) in [
        (include_str!("/mnt/development/csgrs/crates/hyperbrep-io/tests/fixtures/faceted-box.step"),1,8,12,6,24),
        (include_str!("/mnt/development/csgrs/crates/hyperbrep-io/tests/fixtures/faceted-two-boxes.step"),2,8,12,6,24),
        (include_str!("/mnt/development/csgrs/crates/hyperbrep-io/tests/fixtures/faceted-through-hole.step"),1,16,24,10,20),
        (include_str!("/mnt/development/csgrs/crates/hyperbrep-io/tests/fixtures/faceted-tetrahedron.step"),1,4,6,4,12),
    ] {
        let file=StepFile::read(source.as_bytes(),&StepReadOptions::default()).unwrap();
        let imported=file.import_faceted_representation(502,&ImportLimits::default(),&context).result.unwrap().unwrap();
        assert_eq!(imported.bodies().len(),bodies);
        assert_eq!(imported.units().length.scale_to_si,ratio(1,1000));
        assert_eq!(imported.interpreted_entities().len()+imported.retained_entities().len(),file.syntax().entities().len());
        for body in imported.bodies() {
            let counts=body.model().counts();
            assert_eq!((counts.vertices,counts.edges,counts.faces,counts.edge_uses),(vertices,edges,faces,2*edges));
            assert_eq!(body.edge_uses().count(),2*edges);
            assert_eq!(body.solid().volume().unwrap(),ratio(volume,1_000_000_000));
            let json=body.model().to_json().unwrap();
            let restored=RawModel::from_json(&json,&ArchiveLimits::default()).unwrap().validate().unwrap();
            assert_eq!(restored.to_json().unwrap(),json);
            if faces==10 {
                assert_eq!(body.solid().classify_point(&Point3::new(ratio(1,1000),ratio(3,2000),ratio(2,1000))).unwrap(),SolidPointLocation::Outside);
            }
        }
    }
    let source=support::unit_chain(20_000,"1.");
    let file=StepFile::read(source.as_bytes(),&StepReadOptions::default()).unwrap();
    assert_eq!(file.context_units(1,&ImportLimits::default()).unwrap().length.scale_to_si,Real::one());
    assert!(matches!(file.context_units(1,&ImportLimits{entity_visits:100,..ImportLimits::default()}).unwrap_err().kind,ErrorKind::Limit{resource:Resource::EntityVisits,..}));
    let cyclic=source.replace("LENGTH_MEASURE(1.),#3);","LENGTH_MEASURE(1.),#100);");
    let cyclic=StepFile::read(cyclic.as_bytes(),&StepReadOptions::default()).unwrap();
    assert!(matches!(cyclic.context_units(1,&ImportLimits::default()).unwrap_err().kind,ErrorKind::UnitCycle(100)));
    let large=support::unit_chain(4,"2.");
    let file=StepFile::read(large.as_bytes(),&StepReadOptions::default()).unwrap();
    assert!(matches!(file.context_units(1,&ImportLimits{unit_scale_bits:5,..ImportLimits::default()}).unwrap_err().kind,ErrorKind::Limit{resource:Resource::UnitScaleBits,..}));
    let token=r"\X2\03A9\X0\\N\\F\".chars().map(|character|format!("{character}\r\n\t")).collect::<String>();
    let source=include_str!("/mnt/development/csgrs/crates/hyperbrep-io/tests/fixtures/faceted-box.step").replace("'boxes.step'",&format!("'{token}'"));
    assert_eq!(StepFile::read(source.as_bytes(),&StepReadOptions::default()).unwrap().header().name,"Ω");
    9
}
