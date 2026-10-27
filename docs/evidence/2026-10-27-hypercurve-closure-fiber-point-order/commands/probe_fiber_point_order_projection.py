from pathlib import Path
import hashlib,json,subprocess,time
root=Path(__file__).resolve().parent;checkout=Path('/tmp/hypercurve-closure-fiber-point-order')
source=root/'fiber-point-order-projection-probe.rs';source.write_text((checkout/'crates/hypercurve/tests/fiber_point_incidence.rs').read_text()+'''
#[test]
fn projection_probe() {
    let scale=Real::from(2).sqrt().unwrap();
    let transform=hypercurve::Similarity2::try_from_real_affine(-scale.clone(),0.into(),0.into(),scale,1.into(),4.into()).unwrap();
    let path=circle_path().transform_similarity(&transform).unwrap();
    let encode=|path|export_svg_document(&SvgGeometry2::new(CurveRegion2::empty(),vec![],vec![path])).unwrap();
    let first=encode(path.clone());let repeated=encode(path.clone());
    let replay=import_svg_document(&first).unwrap();let cold=export_svg_document(&replay).unwrap();
    let independent=CurvePointDefinition2::Similarity {source:translate(&center(),q(-7,25),q(24,25)),transform}.into_point().unwrap();
    replay.paths()[0].curves()[0].point_locations(&independent).unwrap();
    let warm=export_svg_document(&replay).unwrap();
    println!("original-repeat={} replay-cold={} cold-warm={}", first==repeated, first==cold, cold==warm);
    for (label,curve) in [("source",&path.curves()[0]),("replay",&replay.paths()[0].curves()[0])] {
        let debug=format!("{curve:?}");
        for (i,_) in debug.match_indices("certified_unit_tangent:") {println!("{label} {}",&debug[i..debug.len().min(i+300)]);}
    }
}
''')
artifacts=[json.loads(line) for line in (root/'fiber-point-order-prototype3-build.jsonl').read_text().splitlines()]
def lib(name):return Path(next(f for a in artifacts if a.get('reason')=='compiler-artifact' and a['target']['name']==name for f in a['filenames'] if f.endswith('.rlib')))
curve=lib('hypercurve');solver=lib('hypersolve');binary=root/'fiber-point-order-projection-probe'
cmd=['rustc','+1.98.1','--edition=2024','--test','--cfg','feature="svg"','-C','opt-level=3',str(source),'--crate-name','fiber_point_projection','-L','dependency='+str(solver.parent),'--extern','hypercurve='+str(curve),'--extern','hypersolve='+str(solver),'-o',str(binary)]
with (root/'fiber-point-order-projection-probe-compile.log').open('w') as log:subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,check=True,timeout=120)
start=time.time()
with (root/'fiber-point-order-projection-probe.log').open('w') as log:result=subprocess.run([str(binary),'projection_probe','--nocapture'],stdout=log,stderr=subprocess.STDOUT,timeout=120)
record={'compile_command':cmd,'run':[str(binary),'projection_probe','--nocapture'],'exit_code':result.returncode,'elapsed_seconds':time.time()-start,'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'library_sha256':hashlib.sha256(curve.read_bytes()).hexdigest()}
(root/'fiber-point-order-projection-probe.json').write_text(json.dumps(record,indent=2)+'\n');print((root/'fiber-point-order-projection-probe.log').read_text()[:5000])
