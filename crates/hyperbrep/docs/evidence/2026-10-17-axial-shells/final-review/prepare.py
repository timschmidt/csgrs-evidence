from pathlib import Path
import hashlib,json,shutil,subprocess,sys
ROOT=Path('/mnt/development/csgrs'); OUT=ROOT/'crates/hyperbrep/docs/evidence/2026-10-17-axial-shells'; OLD=OUT.parent/'2026-10-17-partial-prism'
# Final review recipes are retained alongside this file. Recreating the two
# external projects must not overwrite those expanded readers and assertions
# with their predecessor versions.
# External complete consumer.
P=Path('/tmp/hyperbrep-axial-shell-consumer');(P/'src').mkdir(parents=True,exist_ok=True);(OUT/'consumer-project').mkdir(exist_ok=True)
manifest=(OLD/'consumer-project/Cargo.toml').read_text().replace('hyperbrep-axial-consumer','hyperbrep-axial-shell-consumer')
main='''#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/axial_shells.rs"]
mod acceptance;
fn main() {
    let args=std::env::args().collect::<Vec<_>>();
    let directory=std::path::PathBuf::from(&args[1]);
    let kind=args[2].parse().unwrap(); let reflected=args[3].parse().unwrap();
    let (step,native)=acceptance::round_trip(kind,reflected).unwrap();
    let name=format!("axial-shell-{kind}-reflected-{reflected}");
    std::fs::create_dir_all(&directory).unwrap();
    std::fs::write(directory.join(format!("{name}.step")),&step).unwrap();
    std::fs::write(directory.join(format!("{name}.json")),&native).unwrap();
    println!("case={name} outcome=certified step_bytes={} native_bytes={}",step.len(),native.len());
}
'''
for retained,target,text in [('Cargo.toml','Cargo.toml',manifest),('main.rs','src/main.rs',main)]:
 (OUT/'consumer-project'/retained).write_text(text);(P/target).write_text(text)
# Full preceding WASM test groups, plus complete new native/STEP workflows.
W=Path('/tmp/hyperbrep-axial-shell-wasm-probe');(W/'src').mkdir(parents=True,exist_ok=True);(OUT/'wasm-probe').mkdir(exist_ok=True)
for name in ['Cargo.toml','lib.rs','run.py','faceted.rs','native_regions.rs']:
 s=(OLD/'wasm-probe'/name).read_text().replace('hyperbrep-partial-prism-wasm-probe','hyperbrep-axial-shell-wasm-probe').replace('hyperbrep_partial_prism_wasm_probe','hyperbrep_axial_shell_wasm_probe')
 if name=='native_regions.rs':
  s=(ROOT/'crates/hyperbrep/tests/region_extrusion.rs').read_text().replace('#[test]\n','').replace('fn normalized_strokes_','pub fn normalized_strokes_').replace('fn winding_owned_','pub fn winding_owned_').replace('fn empty_material_','pub fn empty_material_').replace('fn extrusion_restores_','pub fn extrusion_restores_')
 if name=='lib.rs':s+='''
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/axial_shells.rs"]
mod axial_shell_exchange;
#[unsafe(no_mangle)]
pub extern "C" fn run_axial_shell_probe() -> u32 {
    axial_shell_exchange::native::periodic_workflow(seam::closed_cylinder::build(hyperbrep::Real::zero(),-100,false).unwrap());
    axial_shell_exchange::native::periodic_workflow(seam::closed_cylinder::build(hyperbrep::Real::zero(),100,true).unwrap());
    axial_shell_exchange::native::scaled_workflow();
    for kind in 0..4 { for reflected in [false,true] {
        let (step,native)=axial_shell_exchange::round_trip(kind,reflected).unwrap();
        assert!(!step.is_empty() && !native.is_empty());
    }}
    11
}
'''
 if name=='run.py':
  s=s.replace('print(json.dumps(dict(\n', '''shell_started=time.perf_counter()
shell_result=instance.exports(store)['run_axial_shell_probe'](store)
shell_elapsed=time.perf_counter()-shell_started
assert shell_result==11,shell_result
print(json.dumps(dict(
    axial_shell_groups=shell_result, axial_shell_elapsed_seconds=shell_elapsed,
''',1).replace('region_result+axial_result,','region_result+axial_result+shell_result,',1).replace('region_elapsed+axial_elapsed,','region_elapsed+axial_elapsed+shell_elapsed,',1)
  a=s.index("    scope='");s=s[:a]+"    scope='138 source-path groups: all preceding 127 groups with explicit native-carrier migrations, plus two distant periodic closed-seam workflows, one scaled continuation and eight complete partial-depth STEP exchanges. Workspace paths; not a shipped JS binding or package consumer.',\n), indent=2))\n"
 target=name if name in ['Cargo.toml','run.py'] else 'src/'+name
 (OUT/'wasm-probe'/name).write_text(s);(W/target).write_text(s)
# Keep all actual compiler inputs reconstructible. This retained recipe is
# authoritative; never replace it with an earlier temporary setup script.
sys.path.insert(0,str(OUT));from check import ENV
for p,subdir in [(P,'consumer-project'),(W,'wasm-probe')]:
 subprocess.run(['cargo','generate-lockfile','--offline','--manifest-path',str(p/'Cargo.toml')],env=ENV,check=True,cwd=ROOT)
 shutil.copy2(p/'Cargo.lock',OUT/subdir/'Cargo.lock')
files=[*P.glob('*'),*P.glob('src/*'),*W.glob('*'),*W.glob('src/*')]
(OUT/'external-inputs.json').write_text(json.dumps({str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in files if p.is_file()},indent=2)+'\n')
print('Prepared external consumer and 138 WASM groups.')
