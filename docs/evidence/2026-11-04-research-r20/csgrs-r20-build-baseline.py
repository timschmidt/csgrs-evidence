from pathlib import Path
import itertools,subprocess
source=Path('tests/exact_profile_sweeps.rs').read_text().replace('#![cfg(feature = "curve")]','')
source+='''
fn main() {
 let right=rectangle(&int(1),&int(0),&int(3),&int(2));
 let left=rectangle(&int(-2),&int(1),&int(-1),&int(3));
 let both=region(&[right,left],&[],false);
 let result=curve::revolve(&both,int(270),4,GeometryContext::STRICT).unwrap();
 let witness=Point3::new(int(1),int(1),q(1,2));
 eprintln!("legacy partial certainty={:?} six_volume={:?} winding={:?}",result.certainty,six_volume(&result.value).to_f64_lossy(),vertical_prism_winding(&result.value,&witness));
 assert_eq!(vertical_prism_winding(&result.value,&witness),Some(2));
 let crossing=region(&[rectangle(&int(-2),&int(0),&int(3),&int(2))],&[],false);
 let error=curve::revolve(&crossing,int(270),3,GeometryContext::STRICT).unwrap_err();
 eprintln!("crossing partial kind={:?} error={error}",error.kind());
 assert_eq!(error.kind(),ValidationErrorKind::InvalidInput);
}
'''
Path('/tmp/csgrs-r20-baseline-probe.rs').write_text(source)
root=Path('/tmp/csgrs-research-target/release/deps');names=['hypercurve','hyperlattice','hyperlimit','hypermesh'];choices=[list(root.glob('lib'+name+'-*.rlib')) for name in names]
for combo in itertools.product(*choices):
 args=['rustc','--edition=2024','-O','--cap-lints','allow','/tmp/csgrs-r20-baseline-probe.rs','-L','dependency='+str(root),'-o','/tmp/csgrs-r20-baseline-probe','--extern','csgrs='+str(root/'libcsgrs.rlib')]
 for name,path in zip(names,combo):args+=['--extern',name+'='+str(path)]
 result=subprocess.run(args,capture_output=True,text=True)
 if result.returncode==0:
  print('Matched',*(path.name for path in combo));break
else:raise RuntimeError(result.stderr)
