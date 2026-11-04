from pathlib import Path
import shutil,re,json,hashlib
root=Path('/home/tim/Documents/GitHub/workspace/csgrs');out=Path('/tmp/csgrs-r06-field-wasm');(out/'src/support').mkdir(parents=True,exist_ok=True)
manifest='''[package]
name="csgrs-r06-field-wasm"
version="0.0.0"
edition="2024"
[workspace]
resolver="3"
[lib]
crate-type=["cdylib"]
[dependencies]
hypersolve={path="/home/tim/Documents/GitHub/workspace/csgrs/crates/hypersolve"}
hyperreal={path="/home/tim/Documents/GitHub/workspace/csgrs/crates/hyperreal"}
hyperlimit={path="/home/tim/Documents/GitHub/workspace/csgrs/crates/hyperlimit"}
[profile.release]
opt-level=3
panic="abort"
'''
(out/'Cargo.toml').write_text(manifest)
s=(root/'Cargo.lock').read_text()+'\n[[package]]\nname = "csgrs-r06-field-wasm"\nversion = "0.0.0"\ndependencies = [\n "hyperlimit",\n "hyperreal",\n "hypersolve",\n]\n';(out/'Cargo.lock').write_text(s)
source=root/'crates/hypersolve/tests/ordered_field_resultant.rs';s=source.read_text();names=re.findall(r'#\[test\]\s*fn (\w+)\(',s);names=[n for n in names if 'replay_cold' not in n]
s=re.sub(r'#\[test\]\s*fn (\w+)\(',r'pub fn \1(',s);(out/'src/cases.rs').write_text(s)
shutil.copyfile(root/'crates/hypersolve/tests/support/recursive_quadratic.rs',out/'src/support/recursive_quadratic.rs')
exports=[dict(export='field_'+str(i),recipe=n) for i,n in enumerate(names)]
(out/'exports.json').write_text(json.dumps(exports,indent=2)+'\n')
(out/'src/lib.rs').write_text('mod cases;\n'+'\n'.join('#[unsafe(no_mangle)]\npub extern "C" fn '+e['export']+'()->u32 {cases::'+e['recipe']+'();1}' for e in exports)+'\n')
(out/'derivation.json').write_text(json.dumps(dict(source=str(source.relative_to(root)),sha256=hashlib.sha256(source.read_bytes()).hexdigest(),edit='Replace test attributes with public functions; cfg(not(wasm32)) excludes fresh child replay and test-only JSON codec.',exports=names,support_sha256=hashlib.sha256((out/'src/support/recursive_quadratic.rs').read_bytes()).hexdigest()),indent=2)+'\n')
s=Path('/tmp/csgrs-r07-wasm-run.cjs').read_text().replace('csgrs_r07_wasm.wasm','csgrs_r06_field_wasm.wasm').replace('/tmp/csgrs-r07-wasm/exports.json','/tmp/csgrs-r06-field-wasm/exports.json');Path('/tmp/csgrs-r06-field-wasm-run.cjs').write_text(s)
