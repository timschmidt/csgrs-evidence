from pathlib import Path
import hashlib,importlib.util,json,subprocess,sys,time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent;checkout=Path('/tmp/hypercurve-closure-fiber-point-order')
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source_state,files,_=e.source_snapshot();assert source_state==json.loads((root/'fiber-point-order-final-source-before.json').read_text())
source=root/'fiber-point-order-nonconstant-angular-frontier.rs';source.write_text((checkout/'crates/hypercurve/tests/fiber_point_incidence.rs').read_text()+'''
#[test]
fn nonconstant_angular_point_reenters_selected_circle() {
    let center=center();
    // u=beta in the rational half-circle chart, D=1-2u+2u^2.
    // N=(-4/5,3/5), T=(3/5,4/5), n=(1-2u)/D,
    // b=2u(1-u)/D, so P=C+nN+bT is independently on the unit circle.
    let point=center.rational_image(&RationalMap2::new([
        BivariatePolynomial::new(vec![vec![q(-4,5)],vec![q(19,5)],vec![q(-16,5)],vec![2.into()]]),
        BivariatePolynomial::new(vec![vec![q(3,5),1.into()],vec![q(2,5),(-2).into()],vec![q(-8,5),2.into()]]),
    ],polynomial(&[&[1],&[-2],&[2]]))).unwrap();
    assert!(point.coordinates().is_none());
    let coordinate=|p:&CurvePoint2,axis|p.rational_form(if axis==0 {polynomial(&[&[0],&[1]])} else {polynomial(&[&[0,1]])},polynomial(&[&[1]])).unwrap();
    let dx=coordinate(&point,0).subtract(&coordinate(&center,0)).unwrap();
    let dy=coordinate(&point,1).subtract(&coordinate(&center,1)).unwrap();
    assert_eq!(dx.multiply(&dx).unwrap().add(&dy.multiply(&dy).unwrap()).unwrap().compare_to_real(&Real::one()).unwrap(),Ordering::Equal);
    let path=circle_path();let curve=&path.curves()[0];
    let CurvePointLocations2::Locations(locations)=curve.point_locations(&point).unwrap() else {panic!("one selected algebraic angular point")};
    assert_eq!(locations.len(),1);
    let parameter=locations[0].parameter().unwrap();
    assert!(curve.point_at(&parameter).unwrap().coincides_with(&point).unwrap());
    let (first,second)=curve.split_at(parameter).unwrap();
    let reversed=hypercurve::CurvePath2::try_new(vec![second.reversed().unwrap(),first.reversed().unwrap()]).unwrap();
    let svg=export_svg_document(&SvgGeometry2::new(CurveRegion2::empty(),vec![],vec![reversed])).unwrap();
    assert_eq!(export_svg_document(&import_svg_document(&svg).unwrap()).unwrap(),svg);
}
''')
artifacts=[json.loads(line) for line in (root/'fiber-point-order-prototype4-build.jsonl').read_text().splitlines()]
def lib(name):return Path(next(f for a in artifacts if a.get('reason')=='compiler-artifact' and a['target']['name']==name for f in a['filenames'] if f.endswith('.rlib')))
curve=lib('hypercurve');solver=lib('hypersolve');library_hash=hashlib.sha256(curve.read_bytes()).hexdigest();binary=root/'fiber-point-order-nonconstant-angular-frontier'
cmd=['rustc','+1.98.1','--edition=2024','--test','--cfg','feature="svg"','-C','opt-level=3',str(source),'--crate-name','fiber_point_nonconstant_frontier','-L','dependency='+str(solver.parent),'--extern','hypercurve='+str(curve),'--extern','hypersolve='+str(solver),'-o',str(binary)]
with (root/'fiber-point-order-nonconstant-angular-frontier-compile.log').open('w') as log:subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,check=True,timeout=120)
start=time.time()
with (root/'fiber-point-order-nonconstant-angular-frontier.log').open('w') as log:result=subprocess.run([str(binary),'nonconstant_angular_point_reenters_selected_circle','--nocapture'],stdout=log,stderr=subprocess.STDOUT,timeout=120)
after,afterfiles,_=e.source_snapshot();assert after==source_state and afterfiles==files;assert hashlib.sha256(curve.read_bytes()).hexdigest()==library_hash
record={'compile_command':cmd,'run':[str(binary),'nonconstant_angular_point_reenters_selected_circle','--nocapture'],'exit_code':result.returncode,'elapsed_seconds':time.time()-start,'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'library_sha256':library_hash,'source':source_state,'source_stable':True,'qualified_scope':'Additional positive frontier probe, not a completed conformance fixture.'}
(root/'fiber-point-order-nonconstant-angular-frontier.json').write_text(json.dumps(record,indent=2)+'\n');print((root/'fiber-point-order-nonconstant-angular-frontier.log').read_text()[:5000]);print(json.dumps({'exit_code':result.returncode,'elapsed_seconds':record['elapsed_seconds'],'source_stable':True}))
