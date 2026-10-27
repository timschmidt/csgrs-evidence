from pathlib import Path
import hashlib,json,subprocess,time
root=Path(__file__).resolve().parent;checkout=Path('/tmp/hypercurve-closure-fiber-point-order')
source=root/'fiber-point-order-budget-probe.rs';source.write_text((checkout/'crates/hypercurve/tests/fiber_point_incidence.rs').read_text()+'''
#[test]
fn budget_probe() {
    let center = center(); let path = circle_path(); let midpoint = translate(&center, q(3,5), q(4,5));
    for count in [0,1,32,512,4096] {
        let outcome = hypersolve::work_budget::with_budget(hypersolve::work_budget::WorkBudget {refinements:count,promotions:count}, || path.curves()[0].point_locations(&midpoint).map(|locations| matches!(locations, CurvePointLocations2::Locations(points) if points.len()==1)));
        println!("budget={count} result={:?}", outcome);
    }
}
''')
artifacts=[json.loads(line) for line in (root/'fiber-point-order-prototype2-build.jsonl').read_text().splitlines()]
def lib(name):return Path(next(f for a in artifacts if a.get('reason')=='compiler-artifact' and a['target']['name']==name for f in a['filenames'] if f.endswith('.rlib')))
curve=lib('hypercurve');solver=lib('hypersolve');binary=root/'fiber-point-order-budget-probe'
cmd=['rustc','+1.98.1','--edition=2024','--test','--cfg','feature="svg"','-C','opt-level=3',str(source),'--crate-name','fiber_point_budget','-L','dependency='+str(solver.parent),'--extern','hypercurve='+str(curve),'--extern','hypersolve='+str(solver),'-o',str(binary)]
with (root/'fiber-point-order-budget-probe-compile.log').open('w') as log:subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,check=True,timeout=120)
start=time.time()
with (root/'fiber-point-order-budget-probe.log').open('w') as log:result=subprocess.run([str(binary),'budget_probe','--nocapture'],stdout=log,stderr=subprocess.STDOUT,timeout=120)
record={'compile_command':cmd,'run':[str(binary),'budget_probe','--nocapture'],'exit_code':result.returncode,'elapsed_seconds':time.time()-start,'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'library_sha256':hashlib.sha256(curve.read_bytes()).hexdigest()}
(root/'fiber-point-order-budget-probe.json').write_text(json.dumps(record,indent=2)+'\n');print((root/'fiber-point-order-budget-probe.log').read_text())
