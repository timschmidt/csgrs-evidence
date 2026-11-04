from pathlib import Path
import shutil,json
root=Path('/home/tim/Documents/GitHub/workspace/csgrs');out=Path('/tmp/csgrs-r06-field-workflow-cost');(out/'src/support').mkdir(parents=True)
manifest=Path('/tmp/csgrs-r06-field-wasm/Cargo.toml').read_text().replace('csgrs-r06-field-wasm','csgrs-r06-field-workflow-cost').replace('[lib]\ncrate-type=["cdylib"]\n','').replace('hyperreal={path="/home/tim/Documents/GitHub/workspace/csgrs/crates/hyperreal"}','hyperreal={path="/home/tim/Documents/GitHub/workspace/csgrs/crates/hyperreal",features=["serde"]}')
manifest+='serde_json="1.0.149"\n' if '[profile.release]' not in manifest else ''
manifest=manifest.replace('[profile.release]','serde_json="1.0.149"\n[profile.release]')
(out/'Cargo.toml').write_text(manifest)
lock=Path('Cargo.lock').read_text()+'''\n[[package]]
name = "csgrs-r06-field-workflow-cost"
version = "0.0.0"
dependencies = [
 "hyperlimit",
 "hyperreal",
 "hypersolve",
 "serde_json",
]
''';(out/'Cargo.lock').write_text(lock)
shutil.copyfile('/tmp/csgrs-r06-field-wasm/src/cases.rs',out/'src/cases.rs')
for file in ['recursive_quadratic.rs','selected_polynomial_replay.rs']:shutil.copyfile(root/'crates/hypersolve/tests/support'/file,out/'src/support'/file)
exports=json.loads(Path('/tmp/csgrs-r06-field-wasm/exports.json').read_text())
main='''include!("/tmp/csgrs-r06-cost-allocator.rs");
pub mod cases;
use std::time::Instant;
fn main(){let cases:&[(&str,fn())]=&[\n'''+''.join('("'+e['recipe']+'",cases::'+e['recipe']+'),\n' for e in exports)+'''];
for (name,run) in cases {
 run();
 for i in 0..5 {
 let a=ALLOCATED.load(Ordering::Relaxed);let c=CALLS.load(Ordering::Relaxed);let live=LIVE.load(Ordering::Relaxed);PEAK.store(live,Ordering::Relaxed);
 let t=Instant::now();run();let ns=t.elapsed().as_nanos();let bytes=ALLOCATED.load(Ordering::Relaxed)-a;let calls=CALLS.load(Ordering::Relaxed)-c;let peak=PEAK.load(Ordering::Relaxed).saturating_sub(live);let delta=LIVE.load(Ordering::Relaxed)as i128-live as i128;
 println!("{name}\\t{i}\\t{ns}\\t{bytes}\\t{calls}\\t{peak}\\t{delta}");
 }
}}
''';(out/'src/main.rs').write_text(main)
